Return-Path: <linux-usb+bounces-5179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591538308D5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 15:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED4EF1F267F0
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jan 2024 14:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE1AF2111C;
	Wed, 17 Jan 2024 14:53:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id C3E0A21103
	for <linux-usb@vger.kernel.org>; Wed, 17 Jan 2024 14:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705503206; cv=none; b=ge7ThsjsVuB9Ztnp6aYt6GBLlRxLZZkMR1xu5FHjbF1Ps6wQfW2l1BcFW5/0xtTIqf2cH/xKM+gEbg9ZrPN+1+gv1q7OjFXRKmjlfH0C3DoA82VWOxmsgai7OittTFDoVyfPh2GuB1J7Lo0PlmTx0XG/iDIZSNyHQeJB5LuDJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705503206; c=relaxed/simple;
	bh=K7kh4Rd8HVHiUTV2u3OifKVEMC+qPKNXPZxf9CUNPfM=;
	h=Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To; b=h05KEaejxlXrE2Ny/YiXtWdO13aT9Lykt5twFuSSdK+/U17fLqAk1D8kwWwQcbxUIJeZJ0o93JFukHJ7oJFu0HNG+Mz4ttIt8Jpu2KmJrANpI0wrO818E243H1LGXg1jRDG1WdgvtpiqPsjdifsdz59cZkKQSj8jEKaHFGiH2eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 777840 invoked by uid 1000); 17 Jan 2024 09:53:17 -0500
Date: Wed, 17 Jan 2024 09:53:17 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Bruno Haible <bruno@clisp.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, Lars Melin <larsm17@gmail.com>,
  Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Message-ID: <21712025-0b46-4afb-9161-5d1f1afb502a@rowland.harvard.edu>
References: <3750407.VQhiAETyHQ@nimes>
 <2024011630-convent-slouching-ce10@gregkh>
 <fc14c873-04ee-43cd-8328-b4e5b03e0230@gmail.com>
 <2270283.o7ts2hSHzF@nimes>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2270283.o7ts2hSHzF@nimes>

On Wed, Jan 17, 2024 at 08:59:29AM +0100, Bruno Haible wrote:
> Lars Melin wrote:
> > 0bda:9210 is a Realtek USB 3 to pcie chip used by umpteen
> > enclosure manufacturers.
> 
> SilverStone TS16 is not the only one that makes problems. There's also
>   - Sabrent NVMe M.2 enclosure (Model EC-SNVE) [1]
>   - UnionSine Dual Protocol M2 NVMe to USB 3.1 [2]
> 
> > I have got one from Orico and it works ok under both linux and MSWin but 
> > it can be a bit finicky if it doesn't get enough power, it may for 
> > instance work well with an earlier (slower) type of NVME SSD but not 
> > with a later faster type unless you provide external power to it (usb 
> > hub + power adapter).
> 
> So, the Orico one has problems as well. Do these problems disappear when,
> instead of changing the way it's connected to the computer, you add this
> quirk?
> 
> > Slowing down all RTL9120 already in the market with this quirk is in my 
> > humble opinion not a realistic solutio.
> 
> What else do you propose, for those of us who buy this hardware (€ 50,
> it wasn't a cheap one), connect it directly to a computer (through the
> vendor-provided cable, to an USB-C 3.2 Gen.2 connector, as in my case),
> and then experience 1-2 crashes per day under Linux?

The proposal is that you keep on doing what you've been doing: Set the 
UAS quirk.  Then your system will work, and others who don't have the 
same problem will get to keep the advantage of quicker transfers with 
the uas driver.

Alan Stern

