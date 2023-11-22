Return-Path: <linux-usb+bounces-3159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB77F3BFD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 03:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2ED2B217EC
	for <lists+linux-usb@lfdr.de>; Wed, 22 Nov 2023 02:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A84623DC;
	Wed, 22 Nov 2023 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d7B75+I7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060A9CB;
	Tue, 21 Nov 2023 18:48:49 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5be30d543c4so4229502a12.2;
        Tue, 21 Nov 2023 18:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700621328; x=1701226128; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YQXdjiznNF4jRDvoezXm1Z+5cBuvh8aVcXIUQZ5/mzA=;
        b=d7B75+I7RBOHSYGEkM948QUXA5ERusVEIjmkSKa9JLEE4nPSFzprO4Vblja7zpuJNO
         EBkymwc4agOX+UmwsERuB7ijk7AjIi3nfewzWvjFm/VJMUnHcJWtJdS+jWVC2DaiU6eY
         Jb128i+UryH/IeIXrgpwo6Oavw585o/EWXKhnjuSmYqkS+8SikIAUNnWveppuFlySJf9
         nWNa/AxMLXSsmoqUoTcUAE6mnVoV4qyvL4gNQHZeJVZh/ndg/PuB5aD1RTKRkHUjou0w
         pWYCaX7IH2ZxkgqL+H6XXtCZarNbVodOTpjWfdSFoKVhrdqCr31ki4NBX434gJZrEHLR
         9qQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700621328; x=1701226128;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YQXdjiznNF4jRDvoezXm1Z+5cBuvh8aVcXIUQZ5/mzA=;
        b=mlBPe/PFD+ltgS99j+GT6YxeT7IUp1fT36lf1vGkY4as6wv582SjoLUJT6DXJP9Z9i
         Kw0krh3zQfoR/OeHeAZXIVPYcpIm1i2ozVMpbRqvZyNadoeepN8ueGDzb9bS/rkIk6MW
         pYnOzzcIEc6FS8PMa3EUBV7m5bE8pGCFPF1ThZvI69wsGJwk8pFpudzO76UCZxbu9/nO
         YY/Jz7iNyFs0S/ld8urNhYjPZeiLkDuXy7yvS0z57f8uJOxLTWxMAhMgOIMPIEVBhi2b
         TR6J8LThJkIEkTlADk/Io6AdnF3n6nSPIryYbv17+Cm+dtqy3bvkdGiKKJSGTzjhxD0H
         3jGg==
X-Gm-Message-State: AOJu0YxtivHxtqJgxabJr4Cr0gJHOFxREmrpi8X/1JY9/MvyQh2doI54
	Lbz2hq62TjtELx2v7z/KtpE=
X-Google-Smtp-Source: AGHT+IFtcaheJAf7Ui3rM3KCz3dsrMHw6/WiLkLW8XvnCrt2R5WP7i9V6O/hPMYUj5aIvwv684T4aQ==
X-Received: by 2002:a05:6a20:3ca2:b0:188:40a5:f7d4 with SMTP id b34-20020a056a203ca200b0018840a5f7d4mr919978pzj.47.1700621328304;
        Tue, 21 Nov 2023 18:48:48 -0800 (PST)
Received: from [192.168.1.7] ([159.192.167.104])
        by smtp.googlemail.com with ESMTPSA id 12-20020a17090a004c00b0027782f611d1sm273795pjb.36.2023.11.21.18.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 18:48:47 -0800 (PST)
Message-ID: <77b61923-b0df-4120-be19-4442e84fa118@gmail.com>
Date: Wed, 22 Nov 2023 09:48:43 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] USB: serial: option: add Fibocom L7xx modules
To: Victor Fragoso <victorffs@hotmail.com>,
 "johan@kernel.org" <johan@kernel.org>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <39dd187fe27244f28fa729ce134d9d130147f2e1.camel@hotmail.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <39dd187fe27244f28fa729ce134d9d130147f2e1.camel@hotmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/22/2023 4:05, Victor Fragoso wrote:
> Add support for Fibocom L716-EU module series.
> 
> L716-EU is a Fibocom module based on ZTE's V3E/V3T chipset.
> 
> Device creates multiple interfaces when connected to PC as follows:
>   - Network Interface: ECM or RNDIS (set by FW or AT Command)
>   - ttyUSB0: AT port
>   - ttyUSB1: Modem port
>   - ttyUSB2: AT2 port
>   - ttyUSB3: Trace port for log information
>   - ADB: ADB port for debugging. ("Driver=usbfs" when ADB server enabled)
> 
> Here are the outputs of lsusb and usb-devices:
> $ ls /dev/ttyUSB*
> /dev/ttyUSB0  /dev/ttyUSB1  /dev/ttyUSB2  /dev/ttyUSB3
> 
> usb-devices:
> L716-EU (ECM mode):
> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 51 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2cb7 ProdID=0001 Rev= 1.00
> S:  Manufacturer=Fibocom,Incorporated
> S:  Product=Fibocom Mobile Boardband
> S:  SerialNumber=1234567890ABCDEF
> C:* #Ifs= 7 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=02(comm.) Sub=06 Prot=00
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=06 Prot=00 Driver=cdc_ether
> E:  Ad=87(I) Atr=03(Int.) MxPS=  16 Ivl=32ms
> I:  If#= 1 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> I:* If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=cdc_ether
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> L716-EU (RNDIS mode):
> T:  Bus=03 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 49 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=2cb7 ProdID=0001 Rev= 1.00
> S:  Manufacturer=Fibocom,Incorporated
> S:  Product=Fibocom Mobile Boardband
> S:  SerialNumber=1234567890ABCDEF
> C:* #Ifs= 7 Cfg#= 1 Atr=e0 MxPwr=500mA
> A:  FirstIf#= 0 IfCount= 2 Cls=e0(wlcon) Sub=01 Prot=03
> I:* If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=ff Driver=rndis_host
> E:  Ad=87(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=rndis_host
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 5 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 6 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=06(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Victor Fragoso <victorffs@hotmail.com>
> ---
> Changes since v1:
>   - Removed non-essential VID/PID to work with L716-EU tested module.
>   - Added device entry comment according to tested module/modes.
>   - Added according to VID/PID order
>   - Commit message improved with more information about module ports.
> ---
  @@ -2249,6 +2249,7 @@ static const struct usb_device_id option_ids[] = {
>   	  .driver_info = RSVD(4) | RSVD(5) | RSVD(6) },
>   	{ USB_DEVICE(0x1782, 0x4d10) },						/* Fibocom L610 (AT mode) */
>   	{ USB_DEVICE_INTERFACE_CLASS(0x1782, 0x4d11, 0xff) },			/* Fibocom L610 (ECM/RNDIS mode) */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x2cb7, 0x0001, 0xff, 0xff, 0xff) },	/* Fibocom L716-EU (ECM/RNDIS mode) */
>   	{ USB_DEVICE(0x2cb7, 0x0104),						/* Fibocom NL678 series */
>   	  .driver_info = RSVD(4) | RSVD(5) },
>   	{ USB_DEVICE_INTERFACE_CLASS(0x2cb7, 0x0105, 0xff),			/* Fibocom NL678 series */

thanks, looks much better now

Reviewed-by: Lars Melin <larsm17@gmail.com>

