Return-Path: <linux-usb+bounces-11797-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5901791C9F3
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 03:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F380B1F230E3
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2024 01:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28A10184F;
	Sat, 29 Jun 2024 01:20:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 15A191C17
	for <linux-usb@vger.kernel.org>; Sat, 29 Jun 2024 01:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719624006; cv=none; b=Z6wtVGYxBsj6KXaSbCbzV0kitPM4xWyqVnvxvYAV9UD1fziBtUaL87fXJOKH9rF4NbBTS8OcRSHWAUoeEYGFJmiWmv0jUWonS45gtzJ2X5W3qw2vYUzq67g9HHr48Q3fKm/PPS+TVDlxbHD68r8OZ1abwRKTCbXkuonMhhyKMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719624006; c=relaxed/simple;
	bh=YpA1Bw6OyqXECpxXQy9mE+clNWRd976ka3hg1OnQUgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wcs5tDdC9/xJZjVceJW8knydKrDZ1AJ06l9G0QIJUDr/Xao8xwAja8qZ7u8bLpfv+To+lRsBRh/YyJjCen1u18wqrFLvyxEGZ6MnpYowlJNdsPHjxIEV6itBIYujU4OpkD53mlPVbrxcLU/ZWddb/AXEHleEsB0UJnj8/vF8lFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 786847 invoked by uid 1000); 28 Jun 2024 21:19:55 -0400
Date: Fri, 28 Jun 2024 21:19:55 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
  Darrion Ramos <darrionramos@gmail.com>, USB list <linux-usb@vger.kernel.org>
Subject: Re: Remote wake up in gadget drivers
Message-ID: <4539c3c5-61bf-4b4d-9391-a041a2a08b57@rowland.harvard.edu>
References: <a306a653-b6cf-41e4-875f-6c520569b1fdn@googlegroups.com>
 <CA+fCnZdZ96yW5tRfm-c1qXWfmNrVg9J1Yb779Ryht6M9v9FQbQ@mail.gmail.com>
 <612f3eee-35fb-4888-b5d9-c17c223d40df@rowland.harvard.edu>
 <CA+fCnZcrn1sr-sMbwk6i5RDMMh3q9TpBgkGAN+4cg4RaCo9S+g@mail.gmail.com>
 <28b478e2-4b17-483a-9584-0e6342677ef0@rowland.harvard.edu>
 <20240628211140.va5ghcr65dl6g323@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628211140.va5ghcr65dl6g323@synopsys.com>

On Fri, Jun 28, 2024 at 09:11:39PM +0000, Thinh Nguyen wrote:
> Hi Alan,
> 
> On Fri, Jun 28, 2024, Alan Stern wrote:
> > 
> > While the wakeup_capable and wakeup_armed bitflags are defined in 
> > linux/usb/gadget.h, it doesn't look like any of the UDC drivers 
> > implement them.  So it may not be possible to see whether the UDC 
> > supports remote wakeup (but it appears that most of them do).
> > 
> 
> The dwc3 driver handles those bitflags.

I stand corrected; I should have said that none of the UDC drivers in 
drivers/usb/gadget/udc implements the flags.

Alan Stern

