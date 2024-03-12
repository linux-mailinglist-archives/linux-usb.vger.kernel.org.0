Return-Path: <linux-usb+bounces-7891-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04776879793
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 16:31:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADAF9286909
	for <lists+linux-usb@lfdr.de>; Tue, 12 Mar 2024 15:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167D37C6DD;
	Tue, 12 Mar 2024 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b="EI0w9cbY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E8F4FA
	for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710257489; cv=none; b=hPHWHC5cyZad0csmd8wMXl6ZZzQXY4IDK8BlN/5la7qRCCYfY/j/DXHIpIZ2sGLesE5qs7q0zHSj/Dg3bja4tqXjo0XCsGQJxKlKR4NRP4BUP7REO2yKem6baoVVI4sU47SO14TaAfxdysglhttjYaIJzzIcWO+H7o94wOmQgB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710257489; c=relaxed/simple;
	bh=W4GbAsNbCMf4EI+dL+3mepFO/AIza4Hp/AAtxoG1Oj8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=oAgzDX9NhWPSPHRTI2rGNuxx3IbR2hwcPzWyOfGzg16X9Kq8sGgSTnc+ya743KW23eEASYpJg86gwHKYHNNbD6RnPU6dybEddds8jlrzIw9XnZyXklNiNvt0mJ87okvchOY0TFELibkGI2qdfM6BHBEXNqPK66k4Y/RM2NdWv/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.b=EI0w9cbY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gimpelevich.san-francisco.ca.us
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1dc5d0162bcso32479125ad.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Mar 2024 08:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1710257485; x=1710862285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eAitRBVFsN429EWywr+JmPOAdWPncpeaRN+3i7UQNtM=;
        b=EI0w9cbYpnPcxjByjxbK3sFIuxl6ky6YJOnntnUvnp1rp5RoyPtU1XFwjQX7Hf9p7J
         pI+NGQuLBu8DKWG7yFLTNZRC+0r8wBxOYIgJC3KvycNO0LrNLzDZAi+HobF8bY3er3Jp
         BE6lIGwmcNzfhYTRG/+IoNLWxyHxQiAZGpwBp3gv19wvKyZS0WfZmb5fXEdE1oUn9frk
         z7O8jq/Rvnt76GN5CvW+d7QqIVVRPMW6ZiVIGmHWxx3QVutihssAHNXFlqAtxRRFkAXA
         6o3HI2QO59iE1H+ql6f1sHiK/lJ1Bij66ZuDImVGrWuv3NG0/+5Hy3iGyECCJC+IJpHq
         HmfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710257485; x=1710862285;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eAitRBVFsN429EWywr+JmPOAdWPncpeaRN+3i7UQNtM=;
        b=dxaNG3xKzj8aj/amgW2Qpb9RD2ghISHUxYbaptCLrA7dAKwUJZ/nF2rDAyEcpW4FkL
         h0koimS4ECA8f06xqYU95rAdVNE4+clSGPvEsdu8k4TG2gJuPVyrshjJFBX3PT7ly28i
         ZIwRopim7T8ZT3RrW8fnUTFSgp+rfcrNnOG4Rvv0e2snfrDFkZFWiM7gstA0/Tzeekn1
         r624v8mAYF8xMWHNvlFEAe0a1pYvAtI4GOvy9Fsx9MXHFRb38XcvL1DAlsJD0or7voPh
         xBloUVq24txaP8vZkX3U2DLorgNAaYddZqZAadAdX428aNv+0zHg4G9E637G7ol5FMRL
         50rg==
X-Forwarded-Encrypted: i=1; AJvYcCXELIIUDi72Tmm+3Vs7Pz2oNehWPt0kyOjIWT4hRMl4U4pZfv8b3N4OdRONvO+U3fSt8Gpj2BH7zyDoJaH1kx9YVwy0Qy6g9wAD
X-Gm-Message-State: AOJu0Yycc5pL1NWvqerP+QZ8cKpvuwmS2q1P3aZnDyqRd9jKtAoFSNwo
	C3A3+WPXisReP0AcE81s2rYv/bk/g0Yky3JbHYnB/wR3fbqJbSMQqQO1nuYrpA==
X-Google-Smtp-Source: AGHT+IGuGzfc/QT2mBrTOgfW/6/O6GFYrqEGXr6zloZPgMNAOZ4F36As43x/tG1179hcyKIocoMEBQ==
X-Received: by 2002:a17:903:8c4:b0:1dc:cee2:5ffc with SMTP id lk4-20020a17090308c400b001dccee25ffcmr9317327plb.6.1710257485207;
        Tue, 12 Mar 2024 08:31:25 -0700 (PDT)
Received: from ?IPv6:2001:5a8:4289:6500:7076:c575:494e:a634? ([2001:5a8:4289:6500:7076:c575:494e:a634])
        by smtp.gmail.com with ESMTPSA id i7-20020a170902c94700b001dd8e1db1b1sm5226695pla.175.2024.03.12.08.31.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Mar 2024 08:31:24 -0700 (PDT)
Message-ID: <1710257483.14565.10.camel@chimera>
Subject: Re: [PATCH 6/7] usb: misc: uss720: add support for another variant
 of the Belkin F5U002
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Alex Henrie <alexhenrie24@gmail.com>
Cc: linux-parport@lists.infradead.org, linux-usb@vger.kernel.org, 
	sudipm.mukherjee@gmail.com, johan@kernel.org, hkzlabnet@gmail.com, 
	reboots@g-cipher.net, mike@trausch.us
Date: Tue, 12 Mar 2024 08:31:23 -0700
In-Reply-To: <20240312055350.205878-6-alexhenrie24@gmail.com>
References: <20240312055350.205878-1-alexhenrie24@gmail.com>
	 <20240312055350.205878-6-alexhenrie24@gmail.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit

You didn't add the "P80453-B" label in this patch nor in PATCH 5/7…

On Mon, 2024-03-11 at 23:50 -0600, Alex Henrie wrote:
> This device is a gray USB parallel port adapter with "F5U002" imprinted
> on the plastic and a sticker that says both "F5U002" and "P80453-A".
> It's identified in lsusb as "05ab:1001 In-System Design BAYI Printer
> Class Support". It's subtly different from the other gray cable I have
> that has "F5U002 Rev 2" and "P80453-B" on its sticker and device ID
> 050d:0002.
> 
> The uss720 driver appears to work flawlessly with this device, although
> the device evidently does not support ECP.
> 
> Signed-off-by: Alex Henrie <alexhenrie24@gmail.com>
> ---
>  drivers/usb/misc/uss720.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
> index 15cafc7dfd22..5803919d7cc4 100644
> --- a/drivers/usb/misc/uss720.c
> +++ b/drivers/usb/misc/uss720.c
> @@ -693,7 +693,7 @@ static int uss720_probe(struct usb_interface *intf,
>  
>  	interface = intf->cur_altsetting;
>  
> -	if (interface->desc.bNumEndpoints < 3) {
> +	if (interface->desc.bNumEndpoints < 2) {
>  		usb_put_dev(usbdev);
>  		return -ENODEV;
>  	}
> @@ -719,7 +719,9 @@ static int uss720_probe(struct usb_interface *intf,
>  
>  	priv->pp = pp;
>  	pp->private_data = priv;
> -	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_ECP | PARPORT_MODE_COMPAT;
> +	pp->modes = PARPORT_MODE_TRISTATE | PARPORT_MODE_EPP | PARPORT_MODE_COMPAT;
> +	if (interface->desc.bNumEndpoints >= 3)
> +		pp->modes |= PARPORT_MODE_ECP;
>  	pp->dev = &usbdev->dev;
>  
>  	/* set the USS720 control register to manual mode, no ECP compression, enable all ints */
> @@ -774,6 +776,7 @@ static const struct usb_device_id uss720_table[] = {
>  	{ USB_DEVICE(0x050d, 0x1202) }, /* Belkin F5U120-PC */
>  	{ USB_DEVICE(0x0557, 0x2001) },
>  	{ USB_DEVICE(0x05ab, 0x0002) }, /* Belkin F5U002 ISD-101 */
> +	{ USB_DEVICE(0x05ab, 0x1001) }, /* Belkin F5U002 P80453-A */
>  	{ USB_DEVICE(0x06c6, 0x0100) }, /* Infowave ISD-103 */
>  	{ USB_DEVICE(0x0729, 0x1284) },
>  	{ USB_DEVICE(0x1293, 0x0002) },


