Return-Path: <linux-usb+bounces-28778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35FE7BA8FE8
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 13:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D3E1C18E9
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 11:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 896C52FFFAE;
	Mon, 29 Sep 2025 11:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JUknS+c7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF0E2FFF9B
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 11:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759144828; cv=none; b=aGzIoPOM8IauP5FuN79uPOSSeYN8DgiF3d2gVzEVmv7qAZxeMI4Ux4R87k5nVA96x3A5dJvkAd3DRYQBpLFQySVA6mihyQDvJovHT6EsAxYR6/aZ3NUc2IDIHcdFk2zdmfb2EOEbuLECX/CoWnOYKh4OmFxSwu8bh55RzaDtFyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759144828; c=relaxed/simple;
	bh=w3zzf49no1nO5E5KGJbfTtd6wmAu5fXUn/LEF1LCQs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HK4wtnTAzQj3Tm2g1d1S3foUKziTNnYEEDIhyzLOk9nKIhFtuqOykGtq/txXcgdTWst1rExpP8krebbTj9UvMSK7GlRg9daN/4hydD/m0nYj6w2EF0Ahy0EsZEYF6kXJM3QyfFg5bzG95GKe+R/bT5bKjzETrzNYebW6IcBiyqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JUknS+c7; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-634bc2d6137so5697570a12.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 04:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759144823; x=1759749623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fAKeiTCNObaqwVjMhqAXn7CuM0UhDBd0AumYPlZL34M=;
        b=JUknS+c7tS0x2sV9WMaSn2mXRZsvY57wkNMOlynEqpB4noM0i/R6AdQvw4u5n65TLp
         BhrM246w5xwPCAdBP7NsWM5t9MvpaER3Pz8Akv+U7OBWBRtTWyB+C4V9+nxoYtKK7xJZ
         zS5xVi5kx+FeLVVpeU/snnMoyWIcjAWPzNihQzf52GuUMBlRDvZKEJb+DrkuguJxPCj1
         pemivqFVYrVuGVJKv9Uftpk6Ajl1OPtp/QUz7HjAamtUpFsmJUw9/fV/gDKsh51ZE+rB
         E+lSDTySXtEV9PD23eig4pVCwk/7YRpZAicPjNROBd0N5fjXj4hI86S6f4Hp/EsheyAR
         84pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759144823; x=1759749623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fAKeiTCNObaqwVjMhqAXn7CuM0UhDBd0AumYPlZL34M=;
        b=JxEkMIPC+wdOgucRatr8xDKJ0RJ9+cAqZpa6a7E7InVOfjpMMxY0iXvlcvNjLzNuEu
         f4xf9ajs7XUKvLhkHWGTDn21OEU8UnxuMEG09rZWJ9kTP7tZ9MugP8gx7AUVJbAyyXsx
         s3V4NeYIEIbrHYGVhTogPRujhDu/re9y6/sb9/5LCxIWMJTG3mQKa/ZHSHHdmpjpoCD3
         Ysj3Z7MgpqTn0kM4wjSQChP3mKS3BXBZQdOdv/NIR+XeyIfvSUzFaXKrOfsZ/u/pwuCr
         Ozh7Lch/A/kMR6yZ5nFdMNCnxs50aJ5Ckw5QubxiOwaKvYZVQptINe9cJTnjBH9AuXq2
         P11A==
X-Forwarded-Encrypted: i=1; AJvYcCUxiOI9pT1AvdZW/+H/Np2yX3QWhuvPoSpXx35jFZ8wcEaK/Z9waOnTKDcdh16ssK/i62vcDvEbmmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YypcFmLidPytxqtAVO+Z4rsU3fxfw4u6cRVAjidmHIfoYlWfo68
	kecy8WnZnSsMzpRMmYzoSP4BcEdy1Xnfe38427+pxmohBO+9vwa1bLxB7ICQmo9KiH4=
X-Gm-Gg: ASbGncvBIYEwYhlBNsFdqe+2PZbcX+OTq+iCrOFzh9svS1Q/v8pSiX4X1HdbPsbjX1S
	JJ1UQrLgtjqYi0jEjwgM705QlYgf/YKlP942atmV63CSQh9sIgqSidpbBcrgg3Lp+JNDuZ8ww3/
	BdpbTQgWHKxwGNgnqGVUQNprby1LVdDWDLTHYXHfga6LEw/CtaKZkerJ62zocyZ55T3G+tFQXBL
	4gW1/HWqZWksczLpCW0F8iC2+gYhz8UnNU54ghqg1UBbD37rjVyIlJKe1MrSE9UW4pjogvFCRah
	ap3tvSsUNubfbJlQFlfovPt2anknHyDpzExZPYJ6KaoeCaDVKqcWOW+NRqGmLzC1ig36GsWH+Ex
	WMtaO8xHgY3Wmld7OwXD2d76ZQF1wmZr05gh91A7yQq9kgO92sjy69RqvwddzHF4NbsI=
X-Google-Smtp-Source: AGHT+IHQsAqwiD8d9Way6kv1MNaXMXYe8iXnjaMNDorxtGQiDdSd+FTBTd4k3oCMBDrEKY7uYBZryQ==
X-Received: by 2002:a05:6402:1d50:b0:62f:464a:58d8 with SMTP id 4fb4d7f45d1cf-6363516fc68mr5342213a12.3.1759144823568;
        Mon, 29 Sep 2025 04:20:23 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a1:1:4136:3ce:cdaa:75d2? ([2001:a61:13a1:1:4136:3ce:cdaa:75d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3650969sm7513792a12.19.2025.09.29.04.20.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 04:20:23 -0700 (PDT)
Message-ID: <cbd0fb96-f721-42a5-92e5-98324546e9ae@suse.com>
Date: Mon, 29 Sep 2025 13:20:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] net: usb: ax88179_178a: add USB device driver for
 config selection
To: yicongsrfy@163.com, michal.pecio@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: marcan@marcan.st, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, yicong@kylinos.cn
References: <20250929054246.3118527-1-yicongsrfy@163.com>
 <20250929075401.3143438-1-yicongsrfy@163.com>
 <20250929075401.3143438-3-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250929075401.3143438-3-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29.09.25 09:54, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> A similar reason was raised in commit ec51fbd1b8a2 ("r8152: add USB
> device driver for config selection"):
> Linux prioritizes probing non-vendor-specific configurations.
> 
> Referring to the implementation of this patch, cfgselect is also
> used for ax88179 to override the default configuration selection.
> 
> v2: fix warning from checkpatch
> 
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
> ---
>   drivers/net/usb/ax88179_178a.c | 70 ++++++++++++++++++++++++++++++++--
>   1 file changed, 67 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index 29cbe9ddd610..f2e86b9256dc 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
> @@ -14,6 +14,7 @@
>   #include <uapi/linux/mdio.h>
>   #include <linux/mdio.h>
>   
> +#define MODULENAME "ax88179_178a"
>   #define AX88179_PHY_ID				0x03
>   #define AX_EEPROM_LEN				0x100
>   #define AX88179_EEPROM_MAGIC			0x17900b95
> @@ -1713,6 +1714,14 @@ static int ax88179_stop(struct usbnet *dev)
>   	return 0;
>   }
>   
> +static int ax88179_probe(struct usb_interface *intf, const struct usb_device_id *i)
> +{
> +	if (intf->cur_altsetting->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC)
> +		return -ENODEV;

And here you need to work around the problem the
first patch in the series creates. The solution
in this case is to drop it.

> +
> +	return usbnet_probe(intf, i);
> +}
> +
>   static const struct driver_info ax88179_info = {
>   	.description = "ASIX AX88179 USB 3.0 Gigabit Ethernet",
>   	.bind = ax88179_bind,
> @@ -1941,9 +1950,9 @@ static const struct usb_device_id products[] = {
>   MODULE_DEVICE_TABLE(usb, products);
>   
>   static struct usb_driver ax88179_178a_driver = {
> -	.name =		"ax88179_178a",
> +	.name =		MODULENAME,
>   	.id_table =	products,
> -	.probe =	usbnet_probe,
> +	.probe =	ax88179_probe,
>   	.suspend =	ax88179_suspend,
>   	.resume =	ax88179_resume,
>   	.reset_resume =	ax88179_resume,
> @@ -1952,7 +1961,62 @@ static struct usb_driver ax88179_178a_driver = {
>   	.disable_hub_initiated_lpm = 1,
>   };
>   
> -module_usb_driver(ax88179_178a_driver);
> +static int ax88179_cfgselector_probe(struct usb_device *udev)

And this should run only if you match the device ID and the generic
class.

That is, if you want this approach at all. If this should o into
kernel space at all, it blongs into usbcore.

	Regards
		Oliver


