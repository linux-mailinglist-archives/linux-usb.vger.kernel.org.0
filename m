Return-Path: <linux-usb+bounces-38276-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SASABnd9HmpkjwkAu9opvQ
	(envelope-from <linux-usb+bounces-38276-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:51:35 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3C16292EC
	for <lists+linux-usb@lfdr.de>; Tue, 02 Jun 2026 08:51:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD71B3009506
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jun 2026 06:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCD13A839B;
	Tue,  2 Jun 2026 06:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0hk+q8N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA5C395AC7
	for <linux-usb@vger.kernel.org>; Tue,  2 Jun 2026 06:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780382873; cv=none; b=PdwLChEAykheB3aGj7tVSgYwJF2yZ9hbwyRYoX6noZ98+CII/iJEfXzYxZGHQ73Hr+sIvG3vIofTKBHM75JBl3ZpneyLqvzh6pkB+EXXms5J+UE6KzGRF9GXYa6CS68ixaoxrJ6yZYLdtXhC5wBL2NzJeCM1BR7f84M16OxbYA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780382873; c=relaxed/simple;
	bh=Gwv8SxXzxSDMk7tKclXYvsteJ1d76UhRdy4pCZ0LZd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9N8M0Y4cm+KaMlGgAmdbNaCMbuq/pWQNf3jj2Dcq6lpgt24RFp2F+wm5/gVhynGMiAxLo+hEetLbBSjNB4QtVaK6+M6O+1zdXnuslfJanb8ZF5XlEaAgs4eG3X7WjEERoKUwcWnWPlbB/C8fWKm6vACLAPcGXJFJXEY6BQUQEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0hk+q8N; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b7b802299so758809a91.1
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 23:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780382871; x=1780987671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dp7rCvTt4sttdclMslVl9Z0L41k4Fd0MZGTNZjZXhJ8=;
        b=p0hk+q8NjpzgJ1iL/yBAavnTvez5RJHfYrE+i6HevQmFKlyuJmMZS+eaXkHX2zpSC/
         GM6puAcOr/4wzKMPiu5+qfg08L7AJTetEP+e9aXa3SOLsN8wR9k/LxpAalmArIubKSs4
         GzdrOee4fDQwMJP6dWa+liZBlAGKubp0nAQU6cHnKee3MOtOkfZEyfLEjBZSqS+xn0NZ
         8Wyx1KYYwTKeueyb58EMWQYWhUh4V4w0AtQN6TgWyEc5ieTCsftYOgedaYRWtXeG/hpU
         EKALLMH08Piw688xK2gpM56Abv4r0akMqU+4WsteqlT9eynNRpW08+cyiwGDscD3OlKT
         QRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780382871; x=1780987671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dp7rCvTt4sttdclMslVl9Z0L41k4Fd0MZGTNZjZXhJ8=;
        b=IgyuLvby4hXMpLYpXc4F3VlEPWmuxPi6XK/bexXM5DHAu6Tfs1Pc4QJYTn/HBrhyDk
         1BBZUICrv5F5f7ntPfaqp2f955k+1gAJSRSxXleUcXIKZ9p5kU4Yu/a89h2mTnYyRvli
         pSCz3cNz9T32sG0PZ3W4EAH3rzu/+/EWIajvxVLxObvCiDSNlLHMmZ2O6I4+rt4UH86b
         FRHyTj/3COiie6l73NZIB+HZJZQu4iGish7ok90df3HplTySBADTdwr3iEZejInA3Biq
         NJXCt4Vlwx03M2muudyR9XN7UlyUTOqmwMALCdJkqM/j91veFUfi5rEzcqk3To7eFWiM
         7ubw==
X-Gm-Message-State: AOJu0YwRUbizxAMSyl65q6m1UMUkWY/RyV5Gb9mnQRib3K3nJspXiMu9
	o9QOi5VazSVInl/IMZXBfn6rI6E4Y6lWCySZ3sr2HaaVA5LpHlDka+nm
X-Gm-Gg: Acq92OGPngbe97qlf1jUduIsyFIVFlAo2dqvuO7WxYw8UuBm1RK9wdiW0vO9uD5p003
	GP1PvjBhN8l4Dckgh1ht6EIzsj2nIXxVJvUHNGerM48Na8ZWKaB3I1I4Og6t0jTKkmcYQqDknrI
	sJZloJQ0ITLUEbMCeLpyYw4ab/YXDbz+3z9rNzZYD4FORw3w9YrAfjWcvpjqvcDbcvix2TIAmJ4
	GVSC2NbhuPBgVmkfCYJQZeSsbPuIAGKjTB9kHa9ZKBjyhUdvWNsHn7obYwCeJLdhWpGbEFMY9Xq
	2dSgJN9UPmaY+ponSPUEdsFYxbd7Lz94bb23mdL0P1ZOWYXslVk1frGEJPAOEJHRhkraYF0NFPG
	Oj9EgOO9ZKWnCak+WkEIlQbogYNYdtf+Q/4G5jU8pmEGGZy+v8D5hYGEkPUIVl2Wt+c8kElTiBT
	VdGKoKTq0UkGBjnc/NlhoDvBJFwARj/rmJbBl9C8wfE/2f
X-Received: by 2002:a17:90b:3c86:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-36ddbe01c7dmr1214279a91.6.1780382871186;
        Mon, 01 Jun 2026 23:47:51 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.166.161])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c85772b9591sm11647519a12.22.2026.06.01.23.47.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 23:47:50 -0700 (PDT)
Message-ID: <659c740c-66cc-41c6-8bc8-6d6ef1b5ab08@gmail.com>
Date: Tue, 2 Jun 2026 13:47:47 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: add new usb-id for Dell Wireless
 DW5826e-m
To: jackbb_wu@compal.com, Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <20260601-dw5826e-option-driver-v1-1-e0a0a72cfe1b@compal.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38276-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[larsm17@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 6D3C16292EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-06-01 09:52, Jack Wu via B4 Relay wrote:
> From: Jack Wu <jackbb_wu@compal.com>
> 
> Add support for Dell DW5826e-m with USB-id 0x413c:0x81ea
> 
> T:  Bus=03 Lev=01 Prnt=01 Port=04 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
> D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=413c ProdID=81ea Rev= 5.04
> S:  Manufacturer=DELL
> S:  Product=DW5826e-m Qualcomm Snapdragon X12 Global LTE-A
> S:  SerialNumber=358988870177734
> C:* #Ifs= 7 Cfg#= 1 Atr=a0 MxPwr=500mA
> A:  FirstIf#=12 IfCount= 2 Cls=02(comm.) Sub=0e Prot=00
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=option
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=usbfs
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=60 Driver=option
> E:  Ad=84(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=83(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=40 Driver=option
> E:  Ad=86(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 1 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:* If#=12 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=0e Prot=00 Driver=cdc_mbim
> E:  Ad=88(I) Atr=03(Int.) MxPS=  64 Ivl=32ms
> I:  If#=13 Alt= 0 #EPs= 0 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:* If#=13 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> E:  Ad=8e(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=0f(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Signed-off-by: Jack Wu <jackbb_wu@compal.com>
> ---
>   drivers/usb/serial/option.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 48ae0188f2e9..e37013a6956a 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -203,6 +203,8 @@ static void option_instat_callback(struct urb *urb);
>   #define DELL_PRODUCT_5829E_ESIM			0x81e4
>   #define DELL_PRODUCT_5829E			0x81e6
>   
> +#define DELL_PRODUCT_DW5826E_ESIM	0x81ea
> +
>   #define DELL_PRODUCT_FM101R_ESIM		0x8213
>   #define DELL_PRODUCT_FM101R			0x8215
>   
> @@ -1125,6 +1127,7 @@ static const struct usb_device_id option_ids[] = {
>   	  .driver_info = RSVD(0) | RSVD(6) },
>   	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R, 0xff) },
>   	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_FM101R_ESIM, 0xff) },
> +	{ USB_DEVICE_INTERFACE_CLASS(DELL_VENDOR_ID, DELL_PRODUCT_DW5826E_ESIM, 0xff) },
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_E100A) },	/* ADU-E100, ADU-310 */
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_500A) },
>   	{ USB_DEVICE(ANYDATA_VENDOR_ID, ANYDATA_PRODUCT_ADU_620UW) },
> 
> ---
> base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
> change-id: 20260601-dw5826e-option-driver-e9bac038e2b5
> 
> Best regards,
> --
> Jack Wu <jackbb_wu@compal.com>
> 
> 
> 
Hi Jack,
you have the device in the correct driver now and you have got rid of 
the legal disclaimer but there is still a problem with the patch.
Interface #1 which is for ADB should not be claimed by the option 
driver, you have to add a line blacklisting (reserving)it.

thanks
Lars

