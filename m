Return-Path: <linux-usb+bounces-18740-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6139FB37D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 18:11:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62067165AB9
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 17:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E6991B6CF9;
	Mon, 23 Dec 2024 17:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DDCrzbdo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB51B412B
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 17:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734973877; cv=none; b=u9RA1nuBerhUzIMwoad6FizBAIU5/yLhU/q8kamXsoiKucPitA/c7V+BBG1D0H71g+5nNOaINE2nV30cWzRbZRfQ3bS5y5bSqiJaAFmgoxZLxBtNPuhp/ZYDPqhpilRKPNt/xO0bUb9xKWYFbGbXuwd1j2LuRJhQE1/yKSV/0eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734973877; c=relaxed/simple;
	bh=EBxYk2c04f3IyIKoFU2XHBukOlnEryZLBDijVBvQIv8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUTqJ60aQVDv78WGV6Iu8UVOBQorTuEoRvKmxJHk+P2Taisin3dtpoXUBJCBBcTJNwmFPtvwCiyvIKPYZQ2x/HI5966Ovq4fCL1QUPgynq7f+qufBBrDw+vA/fmIwdvUpABQ2qGiJvawEQPki7z/kBOz0VpOFEGXW79iKNIosSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DDCrzbdo; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-844cd85f5ebso362070439f.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 09:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1734973873; x=1735578673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfxggPur2l6SxrO4mqcQYaTbsLMvYZFjDnuM92Gu+fc=;
        b=DDCrzbdoZ5HmoEC35CyyUl0VPgCUOcMxFL09/tUb9aiE0D1s01ETmJh7ZoTxfHBEsi
         7gVbq2vm483Q3QcRFlCxRmTzoAff1pQCzuzSusy/9nNPdsehIkvNlN7AQLkKCEgb/E5U
         l/7jCHX8xS/Sf1fgfFaFK6oIqF/E7OL5rLgfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734973873; x=1735578673;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sfxggPur2l6SxrO4mqcQYaTbsLMvYZFjDnuM92Gu+fc=;
        b=P4GIzjJF/GeRQ/lkjXV9LI5TJMypdyO3snb9Wn+zRTO6/6Zrad6xHTWEuc8DLLVEDO
         ISVpZmKPd1vL/BwD4RFPrR0ivZFbmkw2yCLkgXnczTJmkQi6WoKEPjDEGkyl7of0G0ru
         e2ltrtaOv3qF5FL5vdo4po+2ii1+rCIF4Th2rzWwcsa4utQtQkv+cacx8XNX81N2lr2I
         O6L1xIgfhWdcxsfHTokMA8EtMs+t+LS4N0uVfJmFt7mcX7I7CecG+SxJvmjbekWGoovC
         0Pvyuy+i9JVyxo1NNI0DAbeoDyZiTLQb11RvLfHTyfNn2P6jD9Hz95FBHhXhmnNUr7sH
         +0nw==
X-Forwarded-Encrypted: i=1; AJvYcCUGysVwrLtW2xn8qoNNwtqDNGXc/ccKhp4EHwCUkTlhgvs8on1fj6MGXlSzE815v8WwCM/DxdaqNjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YysNW2hd9dJAaLdecS7RR2yb6PlZFhrfXAs0jnVLS8LU1vsYGls
	PkV5/nQOyum3qGj2RttpGYcalAE1lANon9PMASrse1DDsJxj79/guqp4JHeR/88=
X-Gm-Gg: ASbGncvaYsNUAzTlw6INWMz3eTAyL5ps0vVv9Z/UDmDQu4dnfoLX7NjyuWl8X7BoijL
	qvaOxXc9K7JeJNfAmQWGj2DE9HRMicIUV3OFySbnLIUGwFkYp0uB9Djy5X+2OIn1H29IEBcNnSm
	YsvAENGK1EUCTMYT8UcMpYOoi/RtQW+jM7rfrQdjW4D7vJF1xxOn/96HkTem8TysbAAsP9ZfRWz
	tUzm5PGiF4DQ29cHDbooKqIcLtXQyK+XQ7ACvU9aW7BGXeNcp91sCozWREwWDa0M3uu
X-Google-Smtp-Source: AGHT+IE2QhYbNtZhQS04jp2P3EHiTdiHnosLlXPxt52xzzfMD4MejlvRwBrP7n+Y0JgPOcMVC4knpA==
X-Received: by 2002:a05:6e02:34a0:b0:3a7:21ad:72a9 with SMTP id e9e14a558f8ab-3c2d5152acfmr113425865ab.17.1734973873361;
        Mon, 23 Dec 2024 09:11:13 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3c0de0530fasm24141055ab.3.2024.12.23.09.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 09:11:12 -0800 (PST)
Message-ID: <42623280-d7da-4bc9-98a5-65de33d4f6dc@linuxfoundation.org>
Date: Mon, 23 Dec 2024 10:11:11 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Update USB/IP OP_REP_IMPORT documentation.
To: Gordon Ou <gordon.xwj@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241223090417.12614-1-gordon.xwj@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241223090417.12614-1-gordon.xwj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 02:04, Gordon Ou wrote:
> Corrects byte offsets for OP_REP_IMPORT.

Add more information on why this change is needed.

> 
> Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
> ---
>   Documentation/usb/usbip_protocol.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> index adc158967cc6..3da1df3d94f5 100644
> --- a/Documentation/usb/usbip_protocol.rst
> +++ b/Documentation/usb/usbip_protocol.rst
> @@ -285,17 +285,17 @@ OP_REP_IMPORT:
>   +-----------+--------+------------+---------------------------------------------------+
>   | 0x138     | 2      |            | bcdDevice                                         |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x139     | 1      |            | bDeviceClass                                      |
> +| 0x13A     | 1      |            | bDeviceClass                                      |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13A     | 1      |            | bDeviceSubClass                                   |
> +| 0x13B     | 1      |            | bDeviceSubClass                                   |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13B     | 1      |            | bDeviceProtocol                                   |
> +| 0x13C     | 1      |            | bDeviceProtocol                                   |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13C     | 1      |            | bConfigurationValue                               |
> +| 0x13D     | 1      |            | bConfigurationValue                               |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13D     | 1      |            | bNumConfigurations                                |
> +| 0x13E     | 1      |            | bNumConfigurations                                |
>   +-----------+--------+------------+---------------------------------------------------+
> -| 0x13E     | 1      |            | bNumInterfaces                                    |
> +| 0x13F     | 1      |            | bNumInterfaces                                    |
>   +-----------+--------+------------+---------------------------------------------------+
>   
>   The following four commands have a common basic header called

thanks,
-- Shuah

