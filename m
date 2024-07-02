Return-Path: <linux-usb+bounces-11826-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F191ECDD
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 03:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E96F1F22A6F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2024 01:59:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF81CBA29;
	Tue,  2 Jul 2024 01:59:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id BCF7516419
	for <linux-usb@vger.kernel.org>; Tue,  2 Jul 2024 01:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719885581; cv=none; b=Znqj5jVXCkpI9L3QexWz3R80OTRkl35LRh/41P6kgydkTubop/508P0id4gL3+BLSPGI36m74V+pVxHQz4P5EMZl/3FJG1s7FSP0x0WCnUr7Zpz296pXZHJWwbH4RRa89SeYS/xK1SOKUy47Um2ulnqr3C/WVdJiNHNwJvOWDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719885581; c=relaxed/simple;
	bh=u7q/i7xSaCHvbjkiBVd1PlEySSUloDWtOavx/TSSdmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvk5YsZHRSLGDLnxFJOMJeHHJQmISHCPm8SbWpBdlzSdOvvqIPnrzs5pav4vWphxnXUO5mzifFnFqvWYYnHnJt7pmqysBuMO3IiMnvSN0JVs1iRNCeja+XO8AKwwRTDsxR6GzWJG0Gs/CQI22BItxjiijBHDNTnhnKKMqTpJoG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 877385 invoked by uid 1000); 1 Jul 2024 21:59:37 -0400
Date: Mon, 1 Jul 2024 21:59:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Darrion Ramos <darrionramos@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
  Andrey Konovalov <andreyknvl@gmail.com>,
  USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <dcc10e02-ab6d-47e7-ba82-9a740b9d110b@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com>
 <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
 <CAE=33HWobLgdhx3nWrQGqcsVxPBK5zDxO4pL8YAOaPW1wTs09A@mail.gmail.com>
 <21f8608d-8df7-47eb-8400-9a5a2165f57e@rowland.harvard.edu>
 <CAE=33HWsS02CVmasLjOiNjXOv_jnrxkkjUuhGLqD+iinohrY9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE=33HWsS02CVmasLjOiNjXOv_jnrxkkjUuhGLqD+iinohrY9w@mail.gmail.com>

On Mon, Jul 01, 2024 at 09:31:59PM -0400, Darrion Ramos wrote:
> Hi Alan, I do not quite understand your second comment. But I realize
> now I was not thinking of the big picture earlier. The UDC needs to
> send the actual wakeup signal when prompted by the
> usb_gadget_wakeup(). Since the raspberry pi I am using only supports
> the dwc2 driver, and the dwc2's usb_gadget_ops does not have the
> wakeup function it looks like I just need different hardware that uses
> a dwc3 UDC. Unless you know of something else.

Oh, sorry, I got confused.  For some reason I thought you were using a 
device with DWC3 hardware.

Yes, the dwc2 UDC driver does not implement a wakeup routine.  So either 
you'll need to find someone to implement it for	you or else you'll need	
to switch to a different kind of UDC controller.  Do any later versions
of the Raspberry Pi use DWC3?

Alan Stern

