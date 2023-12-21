Return-Path: <linux-usb+bounces-4500-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DB981BBF4
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 17:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39501C25A25
	for <lists+linux-usb@lfdr.de>; Thu, 21 Dec 2023 16:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4106455E74;
	Thu, 21 Dec 2023 16:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isJbGe7x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE6655E63
	for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 16:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1d40eec5e12so4199565ad.1
        for <linux-usb@vger.kernel.org>; Thu, 21 Dec 2023 08:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703176128; x=1703780928; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQuW+dUZtfufMDxHENrqcpIQTCjVGrrPkS9KoKiop7g=;
        b=isJbGe7xJcRw8FzXZBM3z4Fvu19I7gVBzGXvO6v/21nQb7lxDXN7eudyJPcsonlLAR
         pO0VXYmyF3Nzpc3b5E32GG7gTaHH6A8n6jC62IwqHHMYRqkmd+UXHbFRwI+hk4XYxY0P
         g8oTTpIpcX5qqzl7rRM/3NA0iK+sNLTAkIwUyiYQ30/yv6B2ST/DpbIjA54cxzQMDT+D
         0F7X4MDukgU1cI8sze+NFymFJDv3WDtXpzAypjezNUUOFNdiBj/UckjTZO2hhRBCfWom
         iSyYThuEr/WVELnD1HnDu5BTsQ+Sn36HBOyLjswJ40+h4nF2YR26z68UMPCibHIwTeTR
         rQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703176128; x=1703780928;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQuW+dUZtfufMDxHENrqcpIQTCjVGrrPkS9KoKiop7g=;
        b=dai9djt+XVviwKC7we4/0yokHsiDvr4OJveDkGpofnzssKnlf7MsfMPe91RSyQpl8L
         wOnE3lVHepsa2Rt2QbAzAeIy83CdrxkTVVYD9A6wB0LftWvdLqVM/5EnbvNzaruPjaVp
         4IS3hSH3kxx7wNm8cklfwezAPabUIIrMaq5J6YfXN5W+q5hqhlzZ/AFnopFVACeFSFGK
         xH56/Q5QsX2Qku/lr0J9qqDajmV85EEpPTXwkz8WYR+YLYDPNhXm3X4Kc5ejFhul4T0c
         oorKf33EVYwy0RRmSJ8f2VFKjTbeOWtRF/NeUC15tIedbl0bBwo89BEZEm+RyhSRNr31
         BSNA==
X-Gm-Message-State: AOJu0YwGs6AiNJLav/i6FnL2ofhHVvEboBlC18gNAMiofwV24YNEIJsS
	00NhMeMvbMQJm/3LUeZwOl24VqelikrdsBM0AE4JuM22Png=
X-Google-Smtp-Source: AGHT+IGY8ufgetXF+G3xZCf83N777Oi4KY16dHK2XnhOnvkz6/db8WYhRggd72rzCGpTPGFSwbfgc/+FC5equkToHXc=
X-Received: by 2002:a17:90a:bd04:b0:28b:c05f:f145 with SMTP id
 y4-20020a17090abd0400b0028bc05ff145mr3076069pjr.93.1703176127707; Thu, 21 Dec
 2023 08:28:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230808105158.631761-1-alperyasinak1@gmail.com>
In-Reply-To: <20230808105158.631761-1-alperyasinak1@gmail.com>
From: alper ak <alperyasinak1@gmail.com>
Date: Thu, 21 Dec 2023 19:28:36 +0300
Message-ID: <CAGpma=64Tw0igy8qJSGQ-t974czvJK25GkGB3=8bGCd7f6ZNEw@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: option: add Quectel EG912Y module support
To: johan@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I wanted to write because there was no feedback. I thought, it might
have been overlooked due to the busyness.

Sincerely,
Alper Ak

Alper Ak <alperyasinak1@gmail.com>, 8 A=C4=9Fu 2023 Sal, 13:52 tarihinde =
=C5=9Funu yazd=C4=B1:
>
> Add Quectel EG912Y "DIAG, AT, MODEM"
>
> 0x6001: ECM / RNDIS + DIAG + AT + MODEM
>
> T:  Bus=3D01 Lev=3D02 Prnt=3D02 Port=3D00 Cnt=3D01 Dev#=3D  3 Spd=3D480  =
MxCh=3D 0
> D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D2c7c ProdID=3D6001 Rev=3D 3.18
> S:  Manufacturer=3DAndroid
> S:  Product=3DAndroid
> S:  SerialNumber=3D0000
> C:* #Ifs=3D 5 Cfg#=3D 1 Atr=3De0 MxPwr=3D500mA
> A:  FirstIf#=3D 0 IfCount=3D 2 Cls=3D02(comm.) Sub=3D06 Prot=3D00
> I:* If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D02(comm.) Sub=3D06 Prot=3D00 Driver=
=3Dcdc_ether
> E:  Ad=3D87(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D4096ms
> I:  If#=3D 1 Alt=3D 0 #EPs=3D 0 Cls=3D0a(data ) Sub=3D00 Prot=3D00 Driver=
=3Dcdc_ether
> I:* If#=3D 1 Alt=3D 1 #EPs=3D 2 Cls=3D0a(data ) Sub=3D00 Prot=3D00 Driver=
=3Dcdc_ether
> E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D0c(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 2 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D0b(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> E:  Ad=3D89(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D4096ms
> E:  Ad=3D86(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D0f(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> E:  Ad=3D88(I) Atr=3D03(Int.) MxPS=3D  64 Ivl=3D4096ms
> E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D0a(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 8ac98e60fff5..5a132dd0a9cf 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -274,6 +274,7 @@ static void option_instat_callback(struct urb *urb);
>  #define QUECTEL_PRODUCT_EM061K_LCN             0x6009
>  #define QUECTEL_PRODUCT_EC200T                 0x6026
>  #define QUECTEL_PRODUCT_RM500K                 0x7001
> +#define QUECTEL_PRODUCT_EG912Y                 0x6001
>
>  #define CMOTECH_VENDOR_ID                      0x16d8
>  #define CMOTECH_PRODUCT_6001                   0x6001
> @@ -1235,6 +1236,7 @@ static const struct usb_device_id option_ids[] =3D =
{
>         { USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUC=
T_EC200S_CN, 0xff, 0, 0) },
>         { USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUC=
T_EC200T, 0xff, 0, 0) },
>         { USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUC=
T_RM500K, 0xff, 0x00, 0x00) },
> +       { USB_DEVICE_AND_INTERFACE_INFO(QUECTEL_VENDOR_ID, QUECTEL_PRODUC=
T_EG912Y, 0xff, 0, 0) },
>
>         { USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6001) },
>         { USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_CMU_300) },
> --
> 2.25.1
>

