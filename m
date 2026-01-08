Return-Path: <linux-usb+bounces-32029-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B41ED0127D
	for <lists+linux-usb@lfdr.de>; Thu, 08 Jan 2026 06:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08E923001FDD
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jan 2026 05:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203C32B99D;
	Thu,  8 Jan 2026 05:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eUmSsFIo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7629B8E5;
	Thu,  8 Jan 2026 05:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767850975; cv=none; b=PTFcDD5ODFz2+shNAQ52FWiKCQueXXglZBipEqHJCf4amEoe3XY872upnQP9ZFpAYFU32ucM03COq+m80qa1P0kGwLwyV7VPg0bdKVH9tv6861gpimDe89vloAAQKE0xdJSX/a28TZWuoDO3mZqqvK/Ar+5nqU8KX5fY1aiUxWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767850975; c=relaxed/simple;
	bh=m4l1HFVdcOknOx8pWk8focbAS3oiiVQa+RkTSaYMiqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T9KsrxKb5qRnokyNsyfpOhLUbV5TQ6L6OSuFDsmI53kK3kVTBqJzEcmpgBvRm0RsTKDLKBT/5zp0hlgmUaAGM/xMbUt/cfrYffyozJp9R0t5nSMvNzkRFAV1DcV48VeXCCPQHtD6CGrzzQ6Ug8aaZBrba/tBz2ZUFGk/70lVc8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eUmSsFIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20077C116C6;
	Thu,  8 Jan 2026 05:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767850974;
	bh=m4l1HFVdcOknOx8pWk8focbAS3oiiVQa+RkTSaYMiqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUmSsFIoABLqFblU6zoMZLYoEC9yDDVHMO09E2iCuAuW+AAIhemOs13Z/7/J93maC
	 +6WCFl/I8D7gbTal19h4Lbv8mpbUJYjeoE5M+PgOLDmA+0pPNKBxwQpri5033AunwU
	 xkA223j5HMQxrPa3WGLa3/PJ0OkUWgFTdcKtLlmM=
Date: Thu, 8 Jan 2026 06:42:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: jianhao.xu@seu.edu.cn, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, mathias.nyman@intel.com
Subject: Re: [PATCH] usb: xhci: Fix memory leak in xchi_disable_slot()
Message-ID: <2026010804-commuting-hardly-0204@gregkh>
References: <2026010723-earshot-staining-6e11@gregkh>
 <20260108023710.539893-1-zilin@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108023710.539893-1-zilin@seu.edu.cn>

On Thu, Jan 08, 2026 at 02:37:10AM +0000, Zilin Guan wrote:
> On Wed, Jan 07, 2026 at 04:04:43PM +0100, Greg KH wrote:
> > On Thu, Dec 25, 2025 at 04:21:19PM +0000, Zilin Guan wrote:
> > > xhci_alloc_command() allocates a command structure and, when the
> > > second argument is true, also allocates a completion structure.
> > > Currently, the error handling path in xhci_disable_slot() only frees
> > > the command structure using kfree(), causing the completion structure
> > > to leak.
> > > 
> > > Fix this by using xhci_free_command() instead of kfree(). This function
> > > correctly frees both the command and the completion structure.
> > > 
> > > Fixes: cd3f1790b006d ("usb: xhci: Fix potential memory leak in xhci_disable_slot()")
> > 
> > No cc: stable?
> 
> My understanding is that the Cc: stable tag is primarily intended for 
> severe bugs. I wasn't sure if this leak was critical enough to warrant 
> backporting, especially since the amount of leaked memory is small. I 
> decided to avoid adding unnecessary noise to the stable tree, but I am 
> happy to include the tag if you advise doing so.
> 
> > And how was this found?  How was it tested?  
> 
> This issue was reported by our static analysis tool, but we manually verify 
> the bugs.

As per our documentation, you need to describe the tool being used,
please read and follow that, otherwise we have no idea of what is
happening here.

thanks,

greg k-h

