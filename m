Return-Path: <linux-usb+bounces-31916-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D46CF3B20
	for <lists+linux-usb@lfdr.de>; Mon, 05 Jan 2026 14:05:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DBBD30E230C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Jan 2026 12:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE10933EB15;
	Mon,  5 Jan 2026 12:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="057l05nA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0E833EB02;
	Mon,  5 Jan 2026 12:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767617074; cv=none; b=oA5x3KjSV9W526BMwppp1qil0MTGspZKfSthtK+N9L+eJu0pC4L79JTlJEbYUsMpAstY35Pa5tUXAOrBZV+L8XsYpT7uKsFCzFzYm/xdDc6CGqh66f4vBq7g0Z5sijD/KggBz9MC0JYzftzC8rXcbuPRQT9jgQY435OrGsvLnbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767617074; c=relaxed/simple;
	bh=KYPLxpBxp4B9PSYxTpaKyCAPRtZzdCXaszjs3P2UQpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTmLKGTHCGs/kPIbUKHwvMTEPT11U6LwJ/GlneUlquha1wnRmny6iVguW1J5EmGKO0IwRbIXCGz36dLnxiR8emESqDwd1ntJ/23A3l+VSSy6MGuh71UmsnOFUGs3GovJlTK1+6R+NIwmJNivlKZNmpXteIgJBSjJqdoY6m6C4mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=057l05nA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C828C116D0;
	Mon,  5 Jan 2026 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767617072;
	bh=KYPLxpBxp4B9PSYxTpaKyCAPRtZzdCXaszjs3P2UQpE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=057l05nATWY2IL32vuVudcAIpCGLSdx4YKDrNjXjOqvNSGnY6ZnBmCjG2ZgN8+rX1
	 k2p7Cm1V+xcoxJ4HMrWFdPX1/Ogzay59RPhnQqVqjZyYchhSr78osDzcT58Fuc9wHM
	 AkqRZcsWAZvHu+9zfjofW7zAGmQovqKfWPLBAM/Q=
Date: Mon, 5 Jan 2026 13:44:29 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Add the DWC3 instance name in traces
Message-ID: <2026010555-squealing-easily-7659@gregkh>
References: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105115325.1765176-1-prashanth.k@oss.qualcomm.com>

On Mon, Jan 05, 2026 at 05:23:22PM +0530, Prashanth K wrote:
> When multiple DWC3 controllers are being used, trace events from
> different instances get mixed up making debugging difficult as
> there's no way to distinguish which instance generated the trace.
> 
> Hence append the controller base address into ftrace. This needs
> the following reworks which is addressed using this patch series.
> 
>   1. Removal of dep->regs and use dwc->regs everywhere
>   2. Use dwc pointer in all dwc3_readl/writel()
>   3. Adding the base addr in traces.
> 
> Changes in v2:
> - Avoid using macros for dwc3_readl/writel()
> - Use base address intraces instead of dev name.

Wait, why change this?  The dev name is what you should care about.
"base address" doesn't make much sense as this is on a lot of different
busses, right?

thanks,

greg k-h

