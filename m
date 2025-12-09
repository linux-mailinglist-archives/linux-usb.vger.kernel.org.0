Return-Path: <linux-usb+bounces-31342-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5C1CB0D86
	for <lists+linux-usb@lfdr.de>; Tue, 09 Dec 2025 19:30:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE45E30C3CBE
	for <lists+linux-usb@lfdr.de>; Tue,  9 Dec 2025 18:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDB03016F3;
	Tue,  9 Dec 2025 18:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DWGE+SJJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F7330147D
	for <linux-usb@vger.kernel.org>; Tue,  9 Dec 2025 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765305007; cv=none; b=Eb344eRz9mMUKwsczvETrLaXA1O4Ca5kdMiDmzqGDz3ioe8grdC+ITGAMdN9bouQ7J0M7Di2JyZtLAlu1A+eVpt/QaX6YrXupJ4fy5LzU6EVIzum1ETL7hq3o1EuCng5zwbG1NU8bUM9A9+IMaDiCwlrPABq3u/EkU1vF7MsiAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765305007; c=relaxed/simple;
	bh=pQJKbGT140e8VsvefKWjTYRzq3P0Ac0M8meWMb9iudU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IK1GFtaELTZGD6JASwWCIbnlJtu6qY5fbnlcOyVS1Mb4NOqeMjnqyzRlIob5x03Iyo/Tt5yfnsUuiJtqVKwRcqQp7SsWphbyPx9v7Pi3ZWyUzDRFnOjhLKDXXqfasT5NHbcnzhnSddhNEGC4QT4IHElzdVOoPyyPAhr1zEhPXfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DWGE+SJJ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477563e28a3so974535e9.1
        for <linux-usb@vger.kernel.org>; Tue, 09 Dec 2025 10:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765305004; x=1765909804; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VEl3GwptBTruJVeLW9dxIQGp74pqpc9XND7IOfdh9Qc=;
        b=DWGE+SJJCfzzuivIYofzuMoC5fB5tgOjv6deViUn+fSAHRpJwjKdh2cYa+0HFFHjMg
         BfvJDncU8UhSBUcZXI/gjSjVfydeWQxUhkNMgRlAyrsQY5kqEqajPyYA52rhrOL3Z8dW
         j/xwePMa57AZzD9Wyyxbw78+g44Lsji9HV+/T44taa4qGNKHLbM+VrzOp2ygt8W7oygf
         K30pi1vedd+I1vWDG5GWuNQ4uzNVr+TfOkAIq9eMHK5gBudUj8YFomWClTKRFP6PGD3O
         ittAjy0StS8XiLjxMjFjRQo6r457dyYQ7/GOeunoo+ClJ5Ax2s9tQTr6uFt5+W8MV/K2
         7EQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765305004; x=1765909804;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEl3GwptBTruJVeLW9dxIQGp74pqpc9XND7IOfdh9Qc=;
        b=nrHFMw5dDPNl/FM5TAQWOJ2u/GM98vegkW49mTuqd/kCZ2sgaqdqw5TTSRgPcNYQ2/
         dbsk/9I8IRnmvRwe5pinq1Hr1wpx2uAGrFSppxjpNxjSw3E2tzUxQw9mww4xVYKRQFsj
         937m7Kp3pv3FMktNMDm8eMfNrSIIwL1eTD5dCwtN8StqMps+m7aem0oiS8W/8TBwvX4W
         DVIC75ie7BKE22xeNJkHdae6aCUOtmLfUgXCko7NYYM6mT9deo5KrDgdM/KG7Hg2Rqsi
         hKw1jd6DWmV0pWYbrANVyTZGQcab93M8j1POWUmv9GUxaHDzrVIgM1MPuOpX63G4SWQs
         Y8bg==
X-Gm-Message-State: AOJu0YzKniqHc09CwzgOP66JHt2p/nL6TdXrRblvvjEn4A/v8+lh+tiO
	6Eszi+b+2QiSU7e83U8NlC00cdKhTdAZ1d/MxOKnqxmcxhyPDQ1SyDXcKfjbkq7lLmjRz1WbaX6
	VHhudujyyDr+CL5ztud1jkQTvjkfxFKU1TQ==
X-Gm-Gg: ASbGncseFZ/kC0TZ0CWwx4eQpP8MbDlfUmUTN/JZNx8vup8nEAqlEQ703snxPetUjGg
	CGJ7nDvLYrdfW4FQC8oZpcYKyoNWmYjy1hJTKvW1aX1bNEp1NHrMS7Z9pNxS3ysW4qX1934GZK/
	GrvCJsJJaMPRjrUKTBQu1vF8zI95QQLZhh0p+KPlrkIxrPQLmpOml4EKrUyW4Ow651whWh3tazN
	v4Dte0iqD5jsNj7t9/8tGg7LU0TOdAY/ZjhkjB1/Z8vKCdzUykIE6Osfa2OMOEMuj3CSTg=
X-Google-Smtp-Source: AGHT+IFvOKsP3QbkZvHZBaY4+i6QngaBKJfU3lLD/mHEBTHzVKp4vbpEAiQccn4yvlyL1MHJoXSEaYrIymWBxK7vdwI=
X-Received: by 2002:a05:600c:1d18:b0:479:255f:8805 with SMTP id
 5b1f17b1804b1-47a7fa13c7fmr29759525e9.4.1765305003577; Tue, 09 Dec 2025
 10:30:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251209155038.912-1-u.mohr@semex-engcon.com>
In-Reply-To: <20251209155038.912-1-u.mohr@semex-engcon.com>
From: Daniele Palmas <dnlplm@gmail.com>
Date: Tue, 9 Dec 2025 19:29:51 +0100
X-Gm-Features: AQt7F2r9yiN-sFlphW0ECOT4MEuafCx6s0vC7EZNt5D31uoHDhaLCzuRlQs8MWg
Message-ID: <CAGRyCJF=gzm=wEq0wzYaHzZi=tuCOqkzxkpurX-ru2BvNeic6Q@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: option: add Telit LE910 MBIM composition
To: Ulrich Mohr <u.mohr@semex-engcon.com>
Cc: linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Ulrich,

Il giorno mar 9 dic 2025 alle ore 17:17 Ulrich Mohr
<u.mohr@semex-engcon.com> ha scritto:
>
> Add support for Telit LE910 module when operating in MBIM composition
> with additional ttys. This usb product ID is used by the module
> when AT#USBCFG is set to 7.
>
> 0x1052: MBIM + tty(NMEA) + tty(MODM) + tty(MODEM) +SAP

This should be 0x1252.

> T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=1bc7 ProdID=1252 Rev=03.18
> S:  Manufacturer=Android
> S:  Product=LE910C1-EU
> S:  SerialNumber=0123456789ABCDEF
> C:  #Ifs= 6 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=82(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#= 1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:  If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=87(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=88(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> I:  If#= 5 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=89(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=8a(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
>
> Signed-off-by: Ulrich Mohr <u.mohr@semex-engcon.com>
> ---
>  drivers/usb/serial/option.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 5de856f65f0d..19921f129c0e 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -335,10 +335,11 @@ static void option_instat_callback(struct urb *urb);
>  #define TELIT_PRODUCT_LE920A4_1208             0x1208
>  #define TELIT_PRODUCT_LE920A4_1211             0x1211
>  #define TELIT_PRODUCT_LE920A4_1212             0x1212
>  #define TELIT_PRODUCT_LE920A4_1213             0x1213
>  #define TELIT_PRODUCT_LE920A4_1214             0x1214
> +#define TELIT_PRODUCT_LE910_USBCFG7            0x1252
>

The latest entries do not have a define, I think you can directly use the PID.

Regards,
Daniele

>  /* ZTE PRODUCTS */
>  #define ZTE_VENDOR_ID                          0x19d2
>  #define ZTE_PRODUCT_MF622                      0x0001
>  #define ZTE_PRODUCT_MF628                      0x0015
> @@ -1489,10 +1490,11 @@ static const struct usb_device_id option_ids[] = {
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1230, 0xff),    /* Telit LE910Cx (rmnet) */
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, 0x1231, 0xff),    /* Telit LE910Cx (RNDIS) */
>           .driver_info = NCTRL(2) | RSVD(3) },
>         { USB_DEVICE_AND_INTERFACE_INFO(TELIT_VENDOR_ID, 0x1250, 0xff, 0x00, 0x00) },   /* Telit LE910Cx (rmnet) */
> +       { USB_DEVICE_INTERFACE_CLASS(TELIT_VENDOR_ID, TELIT_PRODUCT_LE910_USBCFG7, 0xff) },     /* Telit LE910Cx (MBIM) */
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1260),
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1261),
>           .driver_info = NCTRL(0) | RSVD(1) | RSVD(2) },
>         { USB_DEVICE(TELIT_VENDOR_ID, 0x1900),                          /* Telit LN940 (QMI) */
> --
> 2.39.5
>
>

