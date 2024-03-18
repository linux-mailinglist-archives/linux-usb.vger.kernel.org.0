Return-Path: <linux-usb+bounces-8047-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC2B87EB77
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 15:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6541C21240
	for <lists+linux-usb@lfdr.de>; Mon, 18 Mar 2024 14:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C57C4EB34;
	Mon, 18 Mar 2024 14:55:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 28AAA433D2
	for <linux-usb@vger.kernel.org>; Mon, 18 Mar 2024 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710773758; cv=none; b=YixKP6jYGA86HNZsqQwHn/ILQh0BYF4/W5nURURFh0wDcZSAfqQlog5YtEV5dWfywnjGofuKnJF3Ns//F5hJ9a0QQBm83R46MZf6CZa/DSJdrUFWUSAKtmPhqJhViWfEcM8dXE25ScYCU1F6aY4PMumj/YxP+P+gdPMyP04BmBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710773758; c=relaxed/simple;
	bh=WN+e/0Exw7NbAIA0M/dL4KZzbjtIJzLogkwvqAVl8uE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnkcIbLyAcqK8P9fwG751wNVpK2UD71GYRrzb4RaLEVD2yX193YlvqxIQoUqTPMgiiHu5QpLPgaRzFn8PyPTfeINldkw/s4KPBhb/ZxFXfqRMgOYzAAVfY24Xcm9ypKY9VSrGnIpbE267YW2myttskAKWyqcy7XFlRCJF5oon6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 582607 invoked by uid 1000); 18 Mar 2024 10:55:54 -0400
Date: Mon, 18 Mar 2024 10:55:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
  Aishwarya TCV <aishwarya.tcv@arm.com>, Greg KH <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH] usb: usb-acpi: Fix oops due to freeing uninitialized pld
 pointer
Message-ID: <19ec72e2-8273-43a0-bbeb-706565e926f2@rowland.harvard.edu>
References: <20240308113425.1144689-1-mathias.nyman@linux.intel.com>
 <f5681869-0cf2-4888-83b9-4ff14b1174c6@arm.com>
 <1b67d844-440a-52c3-b9e7-d12c6fe5dad2@linux.intel.com>
 <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0039c32-e670-455c-8d64-d7b706c6ad7a@sirena.org.uk>

On Mon, Mar 18, 2024 at 02:40:31PM +0000, Mark Brown wrote:
> On Mon, Mar 18, 2024 at 04:36:24PM +0200, Mathias Nyman wrote:
> > On 18.3.2024 15.30, Aishwarya TCV wrote:
> > > On 08/03/2024 11:34, Mathias Nyman wrote:
> 
> > > When booting the kernel against next-master(next-20240318) with Arm64 on
> > > JUNO using ACPI, the kernel is resulting in boot failures for our CI.
> 
> > > A bisect identified f3ac348e6e04 ("usb: usb-acpi: Set port connect type
> > > of not connectable ports correctly") as introducing the failure.
> > > Bisected it on the tag "next-20240308" at repo
> > > "https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git".
> 
> > > I believe this is the patch to fix the issue. Kindly note that the
> > > failure is seen on next-master runs from the past week. Any chance that
> > > you could get this merged into next-master sooner?
> 
> > We are already mid merge window.
> > Not sure if there's some way Greg can still get this in, otherwise I'm
> > afraid we need wait for rc1, and try to get this into rc2.
> 
> Given that it's a bug fix for a fairly serious issue (it's causing boot
> failures) it should be perfectly fine to apply during the merge window?

Greg is away on vacation until this weekend.  If the bug is all that 
serious, you could consider sending the fix directly to Linus.

Alan Stern

