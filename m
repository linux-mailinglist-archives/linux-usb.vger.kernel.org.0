Return-Path: <linux-usb+bounces-31533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AACC6C93
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 10:26:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED8493013ED5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Dec 2025 09:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7783E33A6F5;
	Wed, 17 Dec 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V8PSMhol"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64791335085
	for <linux-usb@vger.kernel.org>; Wed, 17 Dec 2025 09:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765963486; cv=none; b=eTCY6pvdDY/0tQjuddYsXm0zre9M76uvp+rXxqSd0g7we7/GMD2s9HmNP9QnY30gq14LAeAWBUVar2u/XORLUtjJnQheA1tR7jxznjC9QrYIESKREXTJSp3pvQwHoO9vJ9vmCAzWaifu036r3Phu8tYq8cdjcZRidm1NUFZ58VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765963486; c=relaxed/simple;
	bh=xEgkXyB16kGYxs8+Ksa/miEfICTAheE/LC8uO0C/Tpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hSD+iLaXk4SEvjXKDr0GI2a8iV7NEkpex57yKfD254r1Xbq/oK1b58MJ14wD0hOIYV8498dISE1D+l+TDM9YH3uKpaVyub7a0IZf1jAz/VgILSYbQWfCupZMXtIrUR+eo8yxTDSlXypxwLbfHp1U0C1389243n8jdb3HfFnm1jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V8PSMhol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93AA2C4CEF5;
	Wed, 17 Dec 2025 09:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765963486;
	bh=xEgkXyB16kGYxs8+Ksa/miEfICTAheE/LC8uO0C/Tpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V8PSMholeHSWhgTZ5L2usRMw80L2Nj4pZi0fQ9EYKU2bS0dwil9qx0YjJWer33OGP
	 Lz9wZvyVlPqaJ6VmgVpIaXNhBLLhYhXqaDPqHio1I/KsAGk5JUp1mvS4X/45ikq7+m
	 15yqtJE+svg9OWNPcvzq1nvRWBs71uAIA4l9VhWI=
Date: Wed, 17 Dec 2025 10:24:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: raoxu <raoxu@uniontech.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org,
	michal.pecio@gmail.com, niklas.neronin@linux.intel.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v2] usb: xhci: route endpoints to secondary interrupters
Message-ID: <2025121728-linguini-denote-8568@gregkh>
References: <7D02195CD578C798+20251217085407.3774968-1-raoxu@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D02195CD578C798+20251217085407.3774968-1-raoxu@uniontech.com>

On Wed, Dec 17, 2025 at 04:54:07PM +0800, raoxu wrote:
> This demonstrates that transfer completions are no longer handled
> exclusively by interrupter 0, but are instead distributed across
> multiple MSI-X vectors.
> 
> Signed-off-by: Xu Rao <raoxu@uniontech.com>
> 
> Changelog:
> v1 -> v2:
>   - Bind interrupters to endpoints at enable time instead of selecting
>     per transfer.
>   - Store the selected interrupter in struct xhci_virt_ep and program
>     TRB_INTR_TARGET() from the bound interrupter.
>   - Use a single IRQ handler for both primary and secondary vectors,
>     with STS_EINT handling restricted to interrupter 0.
>   - Keep a common dev_id for IRQ registration to match the existing
>     xhci_cleanup_msix() teardown constraints and avoid dev_id
>     lifetime issues.
>   - Clarify secondary interrupter teardown to avoid double-free or
>     use-after-free during xHCI removal.
> ---
>  drivers/usb/host/xhci-mem.c  | 86 +++++++++++++++++++++++++++++++++---
>  drivers/usb/host/xhci-pci.c  | 28 ++++++++++++
>  drivers/usb/host/xhci-ring.c | 79 ++++++++++++++++++++++++---------
>  drivers/usb/host/xhci.c      | 38 ++++++++++++++++
>  drivers/usb/host/xhci.h      |  7 +++
>  5 files changed, 212 insertions(+), 26 deletions(-)

Changelog goes below the --- line please.

thanks,

greg k-h

