library(httr)
library(jsonlite)

get_allele_frequency_37 <- function(rsid,effect_allele,other_allele) {
  # 构造 URL
  url <- paste0("https://grch37.rest.ensembl.org/variation/human/", rsid, "?content-type=application/json")
  
  # 发起 GET 请求
  response <- GET(url)
  
  # 检查响应状态码
  if (status_code(response) != 200) {
    stop(paste("Error:", status_code(response)))
  }
  
  # 解析 JSON 响应
  data <- fromJSON(content(response, "text"), flatten = TRUE)
  
  # 打印原始数据以理解其结构
  print(data)
  
  # 提取等位基因频率
  # 确认实际数据结构并调整字段名
  if ("MAF" %in% names(data)) {
    if(data$minor_allele==effect_allele){
      allele_freq <- data$MAF
      return(allele_freq)
    }
    else if(data$minor_allele==other_allele){
      allele_freq <- 1-data$MAF
      return(allele_freq)
    }
    else {
      warning("No frequency information available for this rsID.")
      return(NULL)
    }
  } else {
    warning("No frequency information available for this rsID.")
    return(NULL)
  }
}
get_allele_frequency_38 <- function(rsid,effect_allele,other_allele) {
  # 构造 URL
  url <- paste0("https://rest.ensembl.org/variation/human/", rsid, "?content-type=application/json")
  
  # 发起 GET 请求
  response <- GET(url)
  
  # 检查响应状态码
  if (status_code(response) != 200) {
    stop(paste("Error:", status_code(response)))
  }
  
  # 解析 JSON 响应
  data <- fromJSON(content(response, "text"), flatten = TRUE)
  
  # 打印原始数据以理解其结构
  print(data)
  
  # 提取等位基因频率
  # 确认实际数据结构并调整字段名
  if ("MAF" %in% names(data)) {
    if(data$minor_allele==effect_allele){
      allele_freq <- data$MAF
      return(allele_freq)
    }
    else if(data$minor_allele==other_allele){
      allele_freq <- 1-data$MAF
      return(allele_freq)
    }
    else {
      warning("No frequency information available for this rsID.")
      return(NULL)
    }
  } else {
    warning("No frequency information available for this rsID.")
    return(NULL)
  }
}
