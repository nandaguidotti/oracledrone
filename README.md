# OracleDrone - Uma plataforma para VANT

<p align="center">
  <a href="#">
    <img src="https://img.shields.io/badge/OracleDrone-Plataforma%20para%20VANT-brightgreen" alt="ML">
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/-java-blue">
  </a>
  <a href="#">
    <img src="https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20Windows-orange" alt="platform">
  </a> 
</p>

No contexto de arquitetura de software, descrevemos uma arquitetura base modularizada capaz de se adaptar as exigências de cada aplicação. Os VANTs estão sendo utilizados em aplicações em áreas como agricultura, segurança, monitoramento ambiental, coleta de dados, cidades inteligentes, entre outras. A plataforma web OD agrega diferentes módulos que satisfaz a necessidade de diferentes áreas de aplicações. Dados gerados por aeronaves como imagens, vídeos ou informações do próprio voos são de extrema importância. Elas devem ser acessíveis e  armazenados de forma organizadas e segura.


# Visão Geral

Este projeto foi desenvolvido para validar uma arquitetura base para integração de VANT. Foi utilizado uma metodologia científica para a execução deste projeto.

A seguir temos a arquitetura proposta, que foi base para esta plataforma. 

![arquitetura](https://user-images.githubusercontent.com/29265084/151277394-4151223c-7ba1-4596-b390-1f3baa4bb73d.png)


## O problema

Dificuldade em armazenar e recuperar dados de voo com facilidade. A capacidade computacional limitada e o reduzido recurso de energia dos VANTs apresentam um desafio significativo para o processamento de dados em tempo real. A coleta de dados pode ser seguida por seu processamento e análise, demandando um custo de processamento que nem sempre pode ser executado no sistema embarcado na aeronave.

## Objetivo

O objetivo deste projeto é o desenvolvimento da plataforma de recuperação de informações de voos, processamento, organização e armazenamento de forma a permitir o fácil acesso por parte dos usuários. 

## Modelagem

A plataforma foi desenvolvida utilizando A IDE netbeans, a linguagem Java e JavaScript e tem uma interface responsiva. Para a validação foi implementado dois módulos, o primeiro para acompanhar voos em tempo real e o segundo para previsão de uma colheita de mangas, este segundo módulo foi desenvolvido em python e não está disponibilizado neste git por se tratar de informações proprietárias privada. 

A interface responsiva da plataforma pode-se ser observada abaixo:

![interfaceresp](https://user-images.githubusercontent.com/29265084/151284460-22a12c4d-3cc2-4d94-bbf1-2c7d5b87a44c.png)

![interfmod2](https://user-images.githubusercontent.com/29265084/151284480-9ceb9b82-363c-4c40-be17-310b59cc956a.png)

## Considerações

Este é um projeto resultado da minha dissertação de Mestrado. 

Disponível em: https://doi.org/10.11606/D.55.2019.tde-17072019-085517

Artigo: A method for automatic identification of crop lines in drone images from a mango tree plantation using segmentation over YCrCb color space and Hough transform

Disponível em: https://doi.org/10.1109/STSIVA.2019.8730214

