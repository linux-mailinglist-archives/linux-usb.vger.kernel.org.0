Return-Path: <linux-usb+bounces-6399-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E79FE854780
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 11:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84B7EB28866
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 10:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2EB182A0;
	Wed, 14 Feb 2024 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orexplore-com.20230601.gappssmtp.com header.i=@orexplore-com.20230601.gappssmtp.com header.b="1SrNxuIx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F097218E06
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 10:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707907655; cv=none; b=M4UTXkOriuzOv8Fo+b6R+KZi51LwMno4C3G/837D3XqMrvmxqdxnrFO6HuNq7E1Hd6/H+aG4Gs7x5igXy+urJTHkJE5Bjv40oLLzjn11VGIeI9OU07Qci/2tHxXyxszYE6qmJ5BvlGmZtaAy/igDI8PIEZogVIPT/q+1bcsno/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707907655; c=relaxed/simple;
	bh=MO3JxlrQ/cVmUX7PKXni7ujhJaqoXyJJtpFjOcyfB7A=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=rQXuORD8Sbg6BZrQdZkAGim+V0mN9InsBfadgryy1zORfjS98KX054B1xSZ31kbgaD6WrLcfLMb2uTF4VYJg9GACWx/mtpUKc8eEmqHlMPmcdbaT6htpcG/BJqnGdbTgSUPrAo8n0GDiSb/IEzGPDubPo9k7w7i+7yOW6RbIPLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orexplore.com; spf=pass smtp.mailfrom=orexplore.com; dkim=pass (2048-bit key) header.d=orexplore-com.20230601.gappssmtp.com header.i=@orexplore-com.20230601.gappssmtp.com header.b=1SrNxuIx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orexplore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orexplore.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5116ec49081so5859970e87.2
        for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 02:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orexplore-com.20230601.gappssmtp.com; s=20230601; t=1707907651; x=1708512451; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWaA8J8k9q8zsSb+XvN8old+8VI1DLxksteg4CKxM84=;
        b=1SrNxuIx0xAx3BsBX96wuaN0PtUVU6jucckCq3afaY7ttGbtZw0Re6y0uH0A9ddxe3
         H9ODij7cIiXv6OY74uTPZ7MpaS04rKl22kdDO2g0zQxlqe/p/uOpd9ZzJlwMEu8FCoce
         Ax8mYEW74KAjgBNDDeaNjKtFaZODU3m+Ck4/lXSJCYG4NcxGa7k0ujjElAKlEmGzgHc4
         G6wDs2ZHVyraNWwUsbsmk+9akMBHCP1KWftzzaWzzw+NSzsUZ6ruoPmxX+bZ6tM4vSbh
         YPMlESHxK0ZEOuxBUOHe1+MvS2Y/wzlD9WHFx1UKKQLt76uxTodml8Q1gYma8wE/CRUl
         dOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707907651; x=1708512451;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWaA8J8k9q8zsSb+XvN8old+8VI1DLxksteg4CKxM84=;
        b=AJoZcUYCRmqaaUPXrrfDeTSAowfXTPhHfu30Dj50WZqCCOPEQQ5XVm6LnADuNZI2py
         yJMIBafSr1eawq+1w1WLJMc//ci0LR94fO0GusHy53FWms/lSIuM3W7qJ4FdIzlmaqO7
         KAIdeTIBYwgQ6pb89IhEOTij5lv/6+Nnr9DyJ9jppbM73p62u0Rkflffsm4w2TcrDxu8
         w3sqXQClMzMWWSOtYIo5gQ3ODCmXPAgXsbc98NHfvmBW7HBRyZFDRsSrnIuIhlHjYeaz
         HRgC4rcPTY6G7EEor+aVmgMheveV+QGUloN1/bP/0CQTPQh34izSybUNVf3WTnj3cbgw
         OrFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWLNwF+YkmLvwiKattHdbt1MQTrmPhfMmaP4f5IVz3lGG5DjXxyDvNLjxXcZFL0m9OASAjSzDLTlaluOKprmyMc8uj9xUMVGjT
X-Gm-Message-State: AOJu0Yz/MA8PiS31nc3NLTr3MOZVhz09WxjbWSQy2/DR++NHx1/Jyh0q
	Q5/wTSxbca0DzOfQ/OZ1UcHho2sraXS1cwZd7dsuSYmliEnXFnJAmc/uJMEk8aM=
X-Google-Smtp-Source: AGHT+IHUniIwYuej/N0zibAfgCjbmdu7EJz8sjyemGn4wUOKCM4kVcEVo9sHDtbBBi/eNkwtU/Rjjg==
X-Received: by 2002:a05:6512:110a:b0:511:84fe:8dcd with SMTP id l10-20020a056512110a00b0051184fe8dcdmr2026615lfg.1.1707907650786;
        Wed, 14 Feb 2024 02:47:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIQj84KE0a/LO0SIoych96XLVdiec+QebWdZK2byN13Pi0Km9YXd1QQTh9la7lpO4Pf+5KUzrgad6mw3uUTsK61/X/2vmCv/XAG7ppScVKRNuckGuvKW+zMHr3oYokqwcDOfPCyw/wVAwR22KtSjK+T2TR/1rUWeWgsiMMOUOrZLddLw==
Received: from [192.168.0.212] (h-109-228-184-226.A137.corp.bahnhof.se. [109.228.184.226])
        by smtp.gmail.com with ESMTPSA id fb13-20020a056512124d00b005118d5b3adbsm1185349lfb.98.2024.02.14.02.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:47:30 -0800 (PST)
Message-ID: <18444448-6e04-4d28-b93d-5852958e35c1@orexplore.com>
Date: Wed, 14 Feb 2024 11:47:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?B?Q2hyaXN0aWFuIEjDpGdnc3Ryw7Zt?=
 <christian.haggstrom@orexplore.com>
Subject: [PATCH] USB: serial: cp210x: add ID for MGP Instruments PDS100
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The radiation meter has the text MGP Instruments PDS-100G or PDS-100GN
produced by Mirion Technologies. Tested by forcing the driver
association with

   echo 10c4 863c > /sys/bus/usb-serial/drivers/cp210x/new_id

and then setting the serial port in 115200 8N1 mode. The device
announces ID_USB_VENDOR_ENC=Silicon\x20Labs and ID_USB_MODEL_ENC=PDS100

Signed-off-by: Christian Häggström <christian.haggstrom@orexplore.com>
---
  drivers/usb/serial/cp210x.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index 923e0ed85444..ab725c2c5594 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -144,6 +144,7 @@ static const struct usb_device_id id_table[] = {
  	{ USB_DEVICE(0x10C4, 0x85EA) }, /* AC-Services IBUS-IF */
  	{ USB_DEVICE(0x10C4, 0x85EB) }, /* AC-Services CIS-IBUS */
  	{ USB_DEVICE(0x10C4, 0x85F8) }, /* Virtenio Preon32 */
+	{ USB_DEVICE(0x10C4, 0x863C) }, /* MGP Instruments PDS100 */
  	{ USB_DEVICE(0x10C4, 0x8664) }, /* AC-Services CAN-IF */
  	{ USB_DEVICE(0x10C4, 0x8665) }, /* AC-Services OBD-IF */
  	{ USB_DEVICE(0x10C4, 0x87ED) }, /* IMST USB-Stick for Smart Meter */
-- 
2.43.0

