Return-Path: <linux-usb+bounces-31976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5ACFC324
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 07:40:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F2D03018195
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 06:40:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3E527464F;
	Wed,  7 Jan 2026 06:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mIGcvwtH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F99207A32;
	Wed,  7 Jan 2026 06:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767768040; cv=none; b=oNTZ1P2+7/hiWIxqVeJIt8atX3YHGTh8JgI4RHi20OQ3zUd5g1Mby8kixDSLHQfhxf5D5m7YcCQNF5SLaXQX6ajJcfh0zmTgnCDTSBpkxNqc0gaDyZFsbsZXFuweNamCliawVpRqq+JMIGmyDr4nT9WT3TS8npNzEaUMq5PXHdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767768040; c=relaxed/simple;
	bh=zqzrXhKs6Ytgv5PDytQ1ilghV2FbEPHmq4Iq6a/ZGMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GDG6dwsfbe4NHlTzErth6ri5UaEet3Q084aWCaHC7HFFbAmvF8PPuMb1uNU2TLq7rt4+BFewrwJQTdzU3PFTILSMYuG4dRNwKC83aYfwbVbEw2GPEX6KcmWPW+OoJa02GaTg0Bv55TfVMahWRf/NfmxA7MCRkdkP2QBzPuVzFro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mIGcvwtH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CE36C4CEF7;
	Wed,  7 Jan 2026 06:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767768040;
	bh=zqzrXhKs6Ytgv5PDytQ1ilghV2FbEPHmq4Iq6a/ZGMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mIGcvwtHZ6wBZB8n0geuP+vAX504LkCwLjrJYI+KadzADXqhJeugG9Pfm7ln2Ze1Z
	 vmoKZtW5QxwekPABRA2/DJmLlpCoEOVN7aev9v2UNvqv24lwd+6So36mkJ430IRNPb
	 usNiIUGWbV0bLpcOcegK9p+IQXsEGzj221TB+DJE=
Date: Wed, 7 Jan 2026 07:40:36 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] usb: dwc3: Log dwc3 instance name in traces
Message-ID: <2026010747-darkroom-peso-24fb@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
 <20260105115325.1765176-4-prashanth.k@oss.qualcomm.com>
 <2026010652-dissuade-reproduce-008d@gregkh>
 <dec18683-5b43-464f-a735-4bf26644aa0a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dec18683-5b43-464f-a735-4bf26644aa0a@oss.qualcomm.com>

On Wed, Jan 07, 2026 at 11:33:11AM +0530, Prashanth K wrote:
> On 1/6/2026 3:28 PM, Greg Kroah-Hartman wrote:
> +	snprintf(dwc->base_addr, sizeof(dwc->base_addr), "%08llx",
> +		 (u64)res->start);
> 
> > And are you _sure_ it is ok to expose that to userspace?
> > 
> yes, because it's already part of devname in most cases.

Ah, so then why do you really need this?  :)

> >> +
> >>  	if (dev->of_node) {
> >>  		struct device_node *parent = of_get_parent(dev->of_node);
> >>  
> >> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> >> index 23188b910528..c16e47273ea0 100644
> >> --- a/drivers/usb/dwc3/core.h
> >> +++ b/drivers/usb/dwc3/core.h
> >> @@ -1178,6 +1178,7 @@ struct dwc3_glue_ops {
> >>   * @wakeup_pending_funcs: Indicates whether any interface has requested for
> >>   *			 function wakeup in bitmap format where bit position
> >>   *			 represents interface_id.
> >> + * @base_addr: The HW base address of DWC3 controller.
> > 
> > You already have this pointer to the resource in dwc3 somewhere, so why
> > are you storing this as a char string and not just always using the
> > "real" resource instead?
> > 
> No Greg, dwc3 struct doesn't have the resource pointer, but has res for
> xhci.

That resource has to be somewhere in the dwc3 structure, otherwise how
does the driver know how to talk to the device in the end?  Or is that
just happening deep in the dwc3-platform-specific-code?  And if so,
doesn't that imply that you can't just rely on a single resource for
this "address" as you don't know what the platform really does to talk
to the device?

So this leads me back to the "just use the device name" argument.  Don't
try to encode a platform-type-thing into the name for everyone to be
using as that's just not going to work well.  But if you totally insist
on it, please name this something else, as that's not what this really
is (i.e. "base_addr" is not correct.)

thanks,

greg k-h

