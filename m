Return-Path: <linux-usb+bounces-19636-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 399D3A195DD
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 006583A270F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 15:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C068214809;
	Wed, 22 Jan 2025 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="N8lUAhxX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AB82144DF
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737561329; cv=none; b=lqEx3uypfiYpVh2T2kxIAk0L8XPb9N6kURSbIqcXYFN7GdPJDlWUSCu1DYV94uSeRAYMhlqBffcoGb97LsX7fbWezCHenDVGPtfOggANnP6POkC2+hcJA6G8KH41P5Ni5gOh7Gbw8xgD6xjTjpUv+Az28R1SEs9CE/2hV7y9qn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737561329; c=relaxed/simple;
	bh=34Mo4iUlF9H2v2LsgLtHmi95IxaUBuKhpwNo/2272r0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noCNMx6D3icKBUYW38BgfHaGXUM/NzsjOrLGu3fl4GLOLZee5JsEkINjRoqxhVrR3rd0hFNrU5oIsDKwEyGldlaTzKbFoIblEQjePxpfxEPiVr0eKVfyJIb68raFokwJVhpH4cfW7su6FbqY0+QVXONoCNmsDFbUUBaY8qHQISE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=N8lUAhxX; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6dd15d03eacso10142966d6.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 07:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1737561327; x=1738166127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sC6Rj8uvNX7sf2A0wKYmV4CP0IYKTxp9yemshr49YiI=;
        b=N8lUAhxXID/OpVg6sF4DwP26WD+iCBvgUgttgo+UnJm7Iu5C5cRljc90hd3mhAJ5Cr
         ulkvzgQxmLGCELeLBfZfey3D4NDvXxlGy8UFScPtOKxWvbufTL5BXaNBTJ+2F2owcAk4
         twRiqiaAvQzzl0BWhjPNA53QGW/RupY2aog8tw551l9r4MpXcfC7ZI3crrgSHGfL/X2p
         tCICfyaz2mT9cugR2PDHCRjGcUeUeD1y29Rc9dY/gZq16kgH0jV2MRU8IaFKnw0BeFmh
         1zLdWxeuAwn1/4FpLwgxwolwc28HZGQv3R6FfgVl88aWr9FZ7ledlRd+c6uEX4S34mAC
         shYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737561327; x=1738166127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sC6Rj8uvNX7sf2A0wKYmV4CP0IYKTxp9yemshr49YiI=;
        b=FVyH6/k+34L/eoxgW526odRxEDsaGp08ra1Lyi4r0GuWqb2iRCjCHmIU/GiETRZxr2
         Hiq0SI2vdUF6P489SZEzq0s7tvJqHuVYpzriXEsJynW+84jN1nZUpCRoZYyvr8f4dCPo
         ZaTy52gYoWUxuGKwed9/49QfE3w3KLgMh1nSW2sbF5wJNpzlU4f/ZXSeT6KYlc6ciRW/
         AvdJ42VTTALRJJwZsF7H7pVoTw7lhmo7mGpHyXcnT6J0ULsxwrN6hyMXsgmwADYSmPH6
         NVv3fYSgHTkXyGnCMiI94s9sjEbT1JHX7MQW9doRCdNWphOY9S5w9HnuGF/r6SR61YZP
         KHdA==
X-Forwarded-Encrypted: i=1; AJvYcCUACJQtFqLBe3iUit7NRNyz30Y9V7zJetVQi01xc/M1RY9NuA0OU3zAcdyqwRBruYrIok5t+so+bqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl5ZdJJfrIOm0wyRA9ghXt/2nI4jJKFi1fH7q4RytGRKUXJel3
	8NRLJFv/ShfXSsRWCDZ0uinPTeb0OcvKOhkt6E3uThsXzctgM4FL6zsZ80XYhw==
X-Gm-Gg: ASbGncsn2AcA7HfnhDKwXSHxhyrvDFHC3twaTs2xLcVZk9Uzdwn4y+8gIXGQuj4Vo0o
	GPwXNPecl9yLC/AiXRIVwROr1i/6TdIqkSBj+9rUmDTgrcompq3mbP2ug86zv1HILDUqR1C8tyP
	nTq0ujCcAZI2BUmuEKz23i1kVkkU1fHfN9jPRkOWHFEbEb9TR973hg0j4Hdua7GkOxEsEhRSHfx
	7A/GgFTn81SjX2OIeubOs+gFwh7NpBR2IKtUzzmECv9F0DsNoCv3dkKWaJjjXlLzMtmEVtdFgU0
	c2zI9YJQesX6
X-Google-Smtp-Source: AGHT+IEdeP1mejSSUW6FufZgpzHHJs/1NXW2BHFwp3JXWOAT/CZoEuIyor8xaPCXoJS+g0GWnALzSQ==
X-Received: by 2002:a05:6214:3bc7:b0:6d9:429:ab4b with SMTP id 6a1803df08f44-6e1928d96a0mr476536576d6.0.1737561326947;
        Wed, 22 Jan 2025 07:55:26 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc24122sm62127436d6.60.2025.01.22.07.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 07:55:26 -0800 (PST)
Date: Wed, 22 Jan 2025 10:55:24 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: rtm@csail.mit.edu
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB hub code can dereference NULL hub and hub->ports
Message-ID: <d86313f9-e77b-47a5-9a84-01d71493b15c@rowland.harvard.edu>
References: <2025012150-nervous-john-fb53@gregkh>
 <66581.1737545865@localhost>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66581.1737545865@localhost>

On Wed, Jan 22, 2025 at 06:37:45AM -0500, rtm@csail.mit.edu wrote:
> > Great, can you submit patches to fix these issues now that you have a
> > reliable test program to verify the problem?
> 
> I think the problem is (at least sometimes) not that hub->ports is
> legitimately NULL and there's a missing check, but that
> usb_hub_to_struct_hub() returns an object of the wrong type so that
> hub->ports is junk, and only accidentally NULL in the demo I
> previously submitted.
> 
> I've attached a new demo which crashes because hub->ports is
> 0xcccccccccccccccc (on a kernel with red zones). The demo presents a
> USB device whose DeviceClass is a hub (9), with two interfaces, but
> the Vendor and Product indicate an FTDI serial adaptor.
> 
> First, usb_serial_probe() sets the interface zero dev->driver_data to
> a struct usb_serial.
> 
> Later, when the hub code is trying to set up interface one, it calls
> usb_hub_to_struct_hub(hdev):
> 
> struct usb_hub *usb_hub_to_struct_hub(struct usb_device *hdev)
> {
>         if (!hdev || !hdev->actconfig || !hdev->maxchild)
>                 return NULL;
>         return usb_get_intfdata(hdev->actconfig->interface[0]);
> }
> 
> interface[0], however, has been set up by the serial port code, and
> its dev->driver_data is a struct usb_serial, not a struct usb_hub.

Okay, that explains the problem.  usb_hub_to_struct_hub() assumes that a 
hub device will never have more than one interface, because that 
requirement is in the USB spec.  But of course, a bogus or malicious 
device can violate the requirement.

I think the best way to deal with this issue is to prevent the hub 
driver from binding to non-compliant devices.  Does the patch below fix 
the problem for you?

Alan Stern



Index: usb-devel/drivers/usb/core/hub.c
===================================================================
--- usb-devel.orig/drivers/usb/core/hub.c
+++ usb-devel/drivers/usb/core/hub.c
@@ -1848,6 +1848,17 @@ static int hub_probe(struct usb_interfac
 	hdev = interface_to_usbdev(intf);
 
 	/*
+	 * The USB 2.0 spec prohibits hubs from having more than one
+	 * configuration or interface, and we rely on this prohibition.
+	 * Refuse to accept a device that violates it.
+	 */
+	if (hdev->descriptor.bNumConfigurations > 1 ||
+			hdev->actconfig->desc.bNumInterfaces > 1) {
+		dev_err(&intf->dev, "Invalid hub with more than one config or interface\n");
+		return -EINVAL;
+	}
+
+	/*
 	 * Set default autosuspend delay as 0 to speedup bus suspend,
 	 * based on the below considerations:
 	 *

