Return-Path: <linux-usb+bounces-29210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57535BD2342
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 11:08:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C683AE58A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 09:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069562FB995;
	Mon, 13 Oct 2025 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZp7N3EF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0142F8BF7
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760346481; cv=none; b=QVuZXlkL+GDNYEyfVS+hWGtqfyyfbLjOWTyotp4971Qrd6UGGh9/ldRXUQPOmUetCv6lg8Lr0vYENXR1jdBjI9R9BLm5j+qDVompxOe7bCdCMKI5tonkC8mOGxBDE6DFU2FWbt0H1aGMgmUkqZJ6wGPqZl1f1/EQK4L2YbJHNh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760346481; c=relaxed/simple;
	bh=8//V7stYSb/ZcMHYYxRWyffozcLomDJYC12ClHhkNrM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hOTWSaprPq1Qnz+6sgDJbIFbLOVZ2u8PAmicL2nlr4pYHodo7OyjNoGf71YIvHvEIrUKMQpMD3WQEimmSAIWujfQLLe9H1ZLnGUX3orVJ62sgf2gj/Eq0b4F0xkXrO4BkFk1dFm7QDr8MqOFaW4CLqQsctIIpPSyJZ7e/051oLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZp7N3EF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e234fcd4bso666449166b.3
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760346478; x=1760951278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzlpxZqbyALDR3rt0SQ7Rqb+QihBOTYCYyezgUugnDk=;
        b=kZp7N3EFVMENudkUaIFECU+8PDiM63RJUCjyNRwiyewSAZ9nVjF2+fxlzzSYPi2PDh
         151C0g6MSH3gcEDOVGM2njOIIal9l3YjSf4wHrTlaaI+MTeQIGvVrP3DS0+SSY7k/K6x
         LD7dSVUowlzwFojA+s8utXWY8LbLdCAArIbvv/4iHosMVRYHoeVtaWUH3ohniechyick
         D3Hxbu+dfRyovTY2FocP/Lw2dEVGGRxAdD/wcnL2dcU8DSL1iss8RnJ0X8p3BzYYs5yv
         0u5i1mTxR2zZt34rrJItruif9c66JmAYS+GNap4kXcGF5S6KyT1gaw1dfH6XudDvouGm
         o2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760346478; x=1760951278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzlpxZqbyALDR3rt0SQ7Rqb+QihBOTYCYyezgUugnDk=;
        b=LBCrCSzfSq2O2s18+FHkUuHN1JozLYqfPWJfux23awiFNPWKDyEZmZyW1cJ5c9Duwh
         n/IVIoY3HkOqqAW0pUvCKTfiOttlQlpJllbQYKF1D00H1ibbeUIh/8YLitkEfu9qIsfO
         urdMBHH0/SmW0w1JPGVtD0ETa3jBRzMSNp1fgZH1NW1mjH709l+2FkBxrH0pl/frWpjJ
         tCsA66sFiva7aDkG4OgTBQffuVhkS4pfEdQMCQRVQe2Pdm/JLJ3eNKur6IoGm6+4Ap6c
         gewWiao61Gja33HzLdWiaIxJtOuwWdkZYhthg0Uw7fqKr7JVIEUOAICVNGOmj0paJXMz
         vVOg==
X-Forwarded-Encrypted: i=1; AJvYcCUq8s2qEjy1L77Wv9ybTVYtPo2EWa9PZ81qWSAzijLDzNHeJmWQd8Plk2aBoujEQ6tQB569FKrnXf8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8k/FTCp6qNYE6lYLeJCefGjW+TS0/0tLxQn8Otk8Apm7W0vQ
	7WMMV+QPFYn/Lss15xJUfkIqQJyMowhwYAtXHjtWb8ZdgDgqTrdlly0E
X-Gm-Gg: ASbGnctmcC/S0+pFshw6EpNwed5TlhET72kKa6Gibn9j1pkC4amJkiTza7bdt199bTK
	xZbJd+3Z4Akekxq8NRKdiWNUSKkWEDaTdipUFCOSOWpAgq3LMoO9PeniiEFtrPbEX50Z/mRQsHE
	EhodlUbNLRNJswRxnTcU3kkXcAGAF1iUixSXT1HeWMe9itY1qQqUFDPnn6ec1QmnRqWtNX9UU+F
	hCJ9TB2OEKmkI2556Jb5aDNy5q+zHiRvwch7RCj518s5dtOu1Otakh0C4CN0iIngpiJ0RrThiqK
	v7s7Nr8fNAQOQ1ggBBnOlh9K1wn4QtRj+Puz8WbtgDXm6kMUevyNpoDEI4TtEg0YoKre9GWVoCB
	RE/WZrvvaDQ1NioebrvTt6qfPgmhhp80KiEW9rLV4h1iW4NzomWHnHSEivQts4OFR1/4JKGH7dk
	M=
X-Google-Smtp-Source: AGHT+IH3k516/vzVd7/DFQFdOqqnJfS18hrvkJlNFIXpMY4apFTyG3GSuibTdrQEUW2DflK6qfqkcg==
X-Received: by 2002:a17:907:6ea8:b0:b24:7806:b59 with SMTP id a640c23a62f3a-b50ac9f86f9mr2149534166b.55.1760346477858;
        Mon, 13 Oct 2025 02:07:57 -0700 (PDT)
Received: from foxbook (bff184.neoplus.adsl.tpnet.pl. [83.28.43.184])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d8c12ccbsm876236366b.46.2025.10.13.02.07.56
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Oct 2025 02:07:57 -0700 (PDT)
Date: Mon, 13 Oct 2025 11:07:53 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: yicongsrfy@163.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, oliver@neukum.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, Yi Cong
 <yicong@kylinos.cn>
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device
 driver for config selection
Message-ID: <20251013110753.0f640774.michal.pecio@gmail.com>
In-Reply-To: <20251011075314.572741-3-yicongsrfy@163.com>
References: <20251011075314.572741-1-yicongsrfy@163.com>
	<20251011075314.572741-3-yicongsrfy@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Oct 2025 15:53:13 +0800, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> A similar reason was raised in commit ec51fbd1b8a2 ("r8152: add USB
> device driver for config selection"):
> Linux prioritizes probing non-vendor-specific configurations.
> 
> Referring to the implementation of this patch, cfgselect is also
> used for ax88179 to override the default configuration selection.
> 
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
> 
> ---
> v2: fix warning from checkpatch.
> v5: 1. use KBUILD_MODNAME to obtain the module name.
>     2. add error handling when usb_register fail.
>     3. use .choose_configuration instead of .probe.
>     4. reorder deregister logic.
> ---
>  drivers/net/usb/ax88179_178a.c | 68 ++++++++++++++++++++++++++++++++--
>  1 file changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.c
> index b034ef8a73ea..b6432d414a38 100644
> --- a/drivers/net/usb/ax88179_178a.c
> +++ b/drivers/net/usb/ax88179_178a.c
> @@ -1713,6 +1713,14 @@ static int ax88179_stop(struct usbnet *dev)
>  	return 0;
>  }
>  
> +static int ax88179_probe(struct usb_interface *intf, const struct usb_device_id *i)
> +{
> +	if (intf->cur_altsetting->desc.bInterfaceClass != USB_CLASS_VENDOR_SPEC)
> +		return -ENODEV;
> +
> +	return usbnet_probe(intf, i);
> +}

This isn't part of the cfgselector driver being added by this commit
nor is it documented in the changelog, so why is it here?

It doesn't seem to be necessary, because USB_DEVICE_AND_INTERFACE_INFO
matches used by this driver ensure that probe() will only be called on
interfaces of the correct class 0xff.

> +
>  static const struct driver_info ax88179_info = {
>  	.description = "ASIX AX88179 USB 3.0 Gigabit Ethernet",
>  	.bind = ax88179_bind,
> @@ -1941,9 +1949,9 @@ static const struct usb_device_id products[] = {
>  MODULE_DEVICE_TABLE(usb, products);
>  
>  static struct usb_driver ax88179_178a_driver = {
> -	.name =		"ax88179_178a",
> +	.name =		KBUILD_MODNAME,
>  	.id_table =	products,
> -	.probe =	usbnet_probe,
> +	.probe =	ax88179_probe,
>  	.suspend =	ax88179_suspend,
>  	.resume =	ax88179_resume,
>  	.reset_resume =	ax88179_resume,
> @@ -1952,7 +1960,61 @@ static struct usb_driver ax88179_178a_driver = {
>  	.disable_hub_initiated_lpm = 1,
>  };
>  
> -module_usb_driver(ax88179_178a_driver);
> +static int ax88179_cfgselector_choose_configuration(struct usb_device *udev)
> +{
> +	struct usb_host_config *c;
> +	int i, num_configs;
> +
> +	/* The vendor mode is not always config #1, so to find it out. */
> +	c = udev->config;
> +	num_configs = udev->descriptor.bNumConfigurations;
> +	for (i = 0; i < num_configs; (i++, c++)) {
> +		struct usb_interface_descriptor	*desc = NULL;
> +
> +		if (!c->desc.bNumInterfaces)
> +			continue;
> +		desc = &c->intf_cache[0]->altsetting->desc;
> +		if (desc->bInterfaceClass == USB_CLASS_VENDOR_SPEC)
> +			break;
> +	}
> +
> +	if (i == num_configs)
> +		return -ENODEV;
> +
> +	return c->desc.bConfigurationValue;
> +}

I wonder how many copies of this code would justify making it some
sort of library in usbnet or usbcore?

> +static struct usb_device_driver ax88179_cfgselector_driver = {
> +	.name =	KBUILD_MODNAME "-cfgselector",
> +	.choose_configuration =	ax88179_cfgselector_choose_configuration,
> +	.id_table = products,
> +	.generic_subclass = 1,
> +	.supports_autosuspend = 1,
> +};
> +
> +static int __init ax88179_driver_init(void)
> +{
> +	int ret;
> +
> +	ret = usb_register_device_driver(&ax88179_cfgselector_driver, THIS_MODULE);
> +	if (ret)
> +		return ret;
> +
> +	ret = usb_register(&ax88179_178a_driver);
> +	if (ret)
> +		usb_deregister_device_driver(&ax88179_cfgselector_driver);

Any problems if the order of registration is reversed, to ensure that
the interface driver always exists if the device driver exists?

> +
> +	return 0;

return ret perhaps?

> +}
> +
> +static void __exit ax88179_driver_exit(void)
> +{
> +	usb_deregister_device_driver(&ax88179_cfgselector_driver);
> +	usb_deregister(&ax88179_178a_driver);
> +}
> +
> +module_init(ax88179_driver_init);
> +module_exit(ax88179_driver_exit);
>  
>  MODULE_DESCRIPTION("ASIX AX88179/178A based USB 3.0/2.0 Gigabit Ethernet Devices");
>  MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 

