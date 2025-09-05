Return-Path: <linux-usb+bounces-27571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 550B8B44B61
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 03:57:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FFD1A400D7
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 01:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21D02045B7;
	Fri,  5 Sep 2025 01:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p73ST0SA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A8931AA7A6
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 01:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757037462; cv=none; b=iBq6FpPDansnqM/MZvMrcQpoSEb6GKpcPFnEl4CmmVib7/1RjbgFopKXgHMRVa6HoQ+SKtzJqGZFEQNWMYHHBaUplb4rOexaDefN9Eaa57pxo+E1knhKiZJNA8GU3n8XnSOrt0Al0BgC3u/nD2n4xnjWerfrhQG7hIMVwqI21CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757037462; c=relaxed/simple;
	bh=ZHCKd+sgDwMcON/kn6QGZATdL6hsGOMYtZpPr4Wtgdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ai0XFEvEF7Hk7hX3cRqbwx0SSc3obvAaIiAeuFCkJMBDcegbQshi1hEFvQ3236EvMdST0kzjd88ZLN/EmFPqqXO5eNdYj7sMg+NSqnp2gFa6pKa7JLWNjoWB0toRCncy7D+51rR4WvNuYfSp1prXoHYOnQBT25nBmCZqlpRXDLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p73ST0SA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98009C4CEF0;
	Fri,  5 Sep 2025 01:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757037462;
	bh=ZHCKd+sgDwMcON/kn6QGZATdL6hsGOMYtZpPr4Wtgdk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p73ST0SAAP8CfIp1FAWVCDJE8eWGvrsgMZqxSk6XrlfBtei8X7vlBxF6g2zIwxBv0
	 y6MIGKgyYo2UyEk4wCkqdShEIfk91C9qNCZF55MYlJ4h5erGDzkPPg/1trdt2LBW+a
	 oLgw6nZ4aHQdqhB96PPedDnohhGQ6kt9cvc7yQ9tMOLQnok7BUgWXdiu66ZjUqs1UC
	 wEMyxnvtwu54B9WOu73k3pAxqDC4HX36ZjgixDdxZAdXU02BXX1XPWo00E5RqhvekX
	 2X3UuXi89OjioPUcj5cDG5sxbQ8kfIXRWiwfrDs/UgDVPciuFaruFICof5kT2cQP8a
	 FMfEqVYTJZIhA==
Date: Fri, 5 Sep 2025 09:57:39 +0800
From: "Peter Chen (CIX)" <peter.chen@kernel.org>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: xhci: Port Register Set improvements
Message-ID: <20250905015739.GA2473920@nchen-desktop>
References: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904154221.2314596-1-niklas.neronin@linux.intel.com>

On 25-09-04 17:42:13, Niklas Neronin wrote:
> The aim of this patch set is to introduce tracing for PORTCS writes and 

I find several patches you are using PORTCS instead of PORTSC, is it typo?

Peter

> implement a Port Register Set struct.
> 
> Introduces a new struct for the Host Controller USB Port Register Set.
> The current implementation accesses these registers through a single
> '__le32' pointer, which, in conjunction with a macro, navigates to the
> specific register using (base address + offset).
> 
>  Currently, how its accessed	| Register Name
> --------------------------------------------------------------------------
>  port->addr			| Port Status and Control
>  port->addr + PORTPMSC		| Port Power Management Status and Control
>  port->addr + PORTLI		| Port Link Info
>  port->addr + PORTHLPMC		| Port Hardware LPM Control
> 
> 
>  After, how its accessed	| Register Name
> --------------------------------------------------------------------------
>  port->port_reg->portsc		| Port Status and Control
>  port->port_reg->portpmsc	| Port Power Management Status and Control
>  port->port_reg->portli		| Port Link Info
>  port->port_reg->porthlmpc	| Port Hardware LPM Control
> 
> These changes make it easier for future modification and their review.
> 
> Note:
> I have chosen to split the struct changes across three separate commits
> due to the substantial number of modified lines. Personally, I find that
> minor typos are more likely to occur when dealing with larger patches.
> However, I am open to consolidating these patches into a single commit
> after review.
> 
> Niklas Neronin (7):
>   usb: xhci: correct indentation for PORTCS tracing function
>   usb: xhci: align PORTCS trace with one-based port numbering
>   usb: xhci: improve xhci_decode_portsc()
>   usb: xhci: add tracing for PORTCS register writes
>   usb: xhci: add USB Port Register Set struct
>   usb: xhci: implement USB Port Register Set struct
>   usb: xhci: rename Port Register Set pointer in struct 'xhci_port'
> 
>  drivers/usb/host/xhci-debugfs.c |   6 +-
>  drivers/usb/host/xhci-hub.c     | 115 ++++++++++++++++----------------
>  drivers/usb/host/xhci-mem.c     |   3 +-
>  drivers/usb/host/xhci-pci.c     |   4 +-
>  drivers/usb/host/xhci-ring.c    |   2 +-
>  drivers/usb/host/xhci-tegra.c   |  12 ++--
>  drivers/usb/host/xhci-trace.h   |  39 ++++++-----
>  drivers/usb/host/xhci.c         |  41 +++++++-----
>  drivers/usb/host/xhci.h         |  94 +++++++++++++-------------
>  9 files changed, 161 insertions(+), 155 deletions(-)
> 
> -- 
> 2.50.1
> 
> 

-- 

Best regards,
Peter

