Return-Path: <linux-usb+bounces-24710-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4823AD784F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 18:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CEA216B4FA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Jun 2025 16:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27B723AE96;
	Thu, 12 Jun 2025 16:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BUsZ8v3q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4817AE1D
	for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745964; cv=none; b=TgawcTh/cWhNC5xMFMPPy2E7qpkl2pwb4I8Up9sMBs+VY1/RU7Bae6GMMJ7eDRK6jj6pyVKBEVyUAwpAU0ALc3nsERT5R/NoqUedvqiPNyR/SSLa9OMOjc9/rtNy5HasUX9dysigIrOX+HraaUT2AqaxI6JVcbf2IHfIbvib3Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745964; c=relaxed/simple;
	bh=E/zwntV3g9QqimWxjTkDAUIvQGfrD8fXKrijn0w2HHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=niyzHmVzcjxJ7ujKwnvCi1xT59xFGQqCVvFOQxyfWg9hC9eA7oqWGIlTRXWGBuYAwXjYZoKXlOeqPWuJUuIpNUN/dAELMaq8lpTWkZ6+EqsbBktNiT/9S+s4xE9lAEBmA2FEufvq4RT9JCIhFe4CmIpDyieDn3svchKxfVTcTNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BUsZ8v3q; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6faf66905adso7925966d6.2
        for <linux-usb@vger.kernel.org>; Thu, 12 Jun 2025 09:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1749745962; x=1750350762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=BUsZ8v3qGUY31x9n/PYcqC2eD3J0wbTXaX6aHebcoAn4kkUyJgUwSKc65jV/ttbMWE
         w/cHt8h34+5i7w86sfIzENvsxqwtK74ihdjW6OQycNr6rsR9nSemREb2J7rf2mxMieL8
         it+W5OeDEIyCVQu+i6m0Dbqq96taNyoFQWNbbHkfcsDAUynBWK5n32Y8vO28whTqv8Eh
         FptH1r67wQ+iGDVzR1sY9VO3Z1NljBvbNkH1IvNFJ9brBPj3CGYJfHrbWn7Hbbjfz7xx
         8TB1NFXOTKOHgVTuSZtua9m5Gb4HpS/LkMXQKo6RASW2zTWN4bSBSzjImiBXPl0BKyXU
         gj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745962; x=1750350762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkeJvvdmsVwijabIeMHoTRZQ2efXfNOq8ZkrZ12WLLw=;
        b=eYa3TVyAlN4GhWTeyvh9G34sv6QU0MytICaCS0+f2dZa2nSAto+1BuYm5f2AqRLr8p
         oszWQGnYrdC2l2Bhp3WTdlLs18e+yJPmVT2BrUQIoHxKgts0Tb/elyunW7U0BmEsyocg
         mcX5F7eyhUJAOUHI1I8FVymqRtk0ZtIODcgX3hbhAyXeR1cqTj6W6yaWhNfnQ41nn4Lp
         GbHRZ5ol8WX9TZFeqXJu/bdpegTRjZkCbGbDUsTDTST57+FIJKi5abMoIa8qFeD9+ZG3
         Q7bmUofmCgdo/A8oQINm80GQ9C0z60mgICo4gGFwNauwZgpfPjcl/RufkWckGAZ60Cw1
         Kf2w==
X-Forwarded-Encrypted: i=1; AJvYcCX+gAqPokqpKeRw09Dly2L9zhkA4zZ5LrbPvJxpkr7GPTueZj03JD3srBVgzbCNS8Yx+dN7tVstxsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKjOrpVkVeWWhyEY5I20y2x9Pj47US9cKDt9e4Ov9+zBWh+ICo
	cTZspR36LOyVOF0RlOYYBSgNwkhwl93bBoOIUZo+8mIP0k9a7m8ZA8y/AWYvzxoDmw==
X-Gm-Gg: ASbGnctE0zPC4jfQc3vqNfoesGHfIZ4lU3MyYq+W2jVKkImNfblVi2TFD8zchNETkZW
	2W8C1wphu3AAih/31gOdR77OGQI7RnJSji/AIRwJRRJdl4nMWscxuuyjt71b9KJNNzuPJ2ybaOI
	ryqKER2DJNdpL3wAe8IE+giZLY+5H2PoVv/O2Z6z1Q8tqmQjgEP3P84v5qaq57tqleuen4UPWuD
	I8SUwbu9kTNPpzTyhL9jOKvFmVrDzd0SkSeWJxndsmqIRTm2Ec3Dd0GZppDJgLFkNtLKNT4zBft
	7s8UNzyYEKr9kl6MXwT+APb9jNiwLRDDxHZmYuSAC7sYbaBif8Z8QTk0bGMv5LwfBJmC1g0EW6m
	nFi4G9Pui1Wo2izXxSMvDpIB7tEvPPdUmT53F61ExGAjIulkGcp+9/YqY9TKeNQMMAg==
X-Google-Smtp-Source: AGHT+IFC9KA/n/atHkM073sYRCJBPxFjJEGbEOsc2M3UC84+uSQh0I6MJSO3LgA8GA/2X4nXpy0OXg==
X-Received: by 2002:a05:6214:d61:b0:6fa:fbb4:6404 with SMTP id 6a1803df08f44-6fb3d22ea01mr5217326d6.5.1749745961307;
        Thu, 12 Jun 2025 09:32:41 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c31604sm11819416d6.75.2025.06.12.09.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:32:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 12:32:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mihai.Sain@microchip.com
Cc: gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: ohci-at91: Use dynamic device name for OHCI HCD
 creation
Message-ID: <6a3cf972-3c2d-429b-9504-5fd449334348@rowland.harvard.edu>
References: <20250611075414.4239-2-mihai.sain@microchip.com>
 <afaf4c79-ccec-46ad-889c-e8347454c065@rowland.harvard.edu>
 <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH3PPF37F43E35DF7E5350AEBBB079073748274A@PH3PPF37F43E35D.namprd11.prod.outlook.com>

On Thu, Jun 12, 2025 at 10:33:09AM +0000, Mihai.Sain@microchip.com wrote:
> Hi Alan,
> 
> I'm sorry, I'm replying using Outlook web.
> 
> On Wed, Jun 11, 2025 at 10:54:15AM +0300, Mihai Sain wrote:
> > Use the dynamic device name instead of the hardcoded string "at91"
> > when creating the OHCI host controller driver.
> > This ensures that the device name is more flexible
> > and correctly reflects the actual device in the system.
> > This will be in sync with ehci at91 driver.
> >
> > [root@sam9x75eb ~]$ dmesg | grep usb
> > [    1.464487] usb usb1: Manufacturer: Linux 6.16.0-rc1 ehci_hcd
> > [    1.470210] usb usb1: SerialNumber: 700000.usb-ehci
> > [    1.595683] usb usb2: Manufacturer: Linux 6.16.0-rc1 ohci_hcd
> > [    1.601406] usb usb2: SerialNumber: 600000.usb-ohci
> >
> > [root@sam9x75eb ~]$ cat /proc/iomem | grep usb
> > 00600000-006fffff : 600000.usb-ohci usb-ohci@600000
> > 00700000-007fffff : 700000.usb-ehci usb-ehci@700000
> 
> Are these two outputs supposed to make some sort of point?  It would be
> better to have a before-and-after comparison, so we can see what the
> effect of the patch is.
> 
> Before this patch the SerialNumber print from ohci driver, was looking like this:
> 
> [    1.601406] usb usb2: SerialNumber: at91
> 
> I thought it was a good ideea to align this print with the one from ehci drive
Okay, good.  Yes, that is worth doing.

Please include this information in the patch description and resubmit.

Alan Stern

