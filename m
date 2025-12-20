Return-Path: <linux-usb+bounces-31651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7444DCD2A02
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 09:08:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AEBE3017679
	for <lists+linux-usb@lfdr.de>; Sat, 20 Dec 2025 08:08:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE1E2E888C;
	Sat, 20 Dec 2025 08:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jFskjKLf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A70B1A8F84;
	Sat, 20 Dec 2025 08:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766218130; cv=none; b=cZDpkX8Z7F49Zp9RBnzrmswPKIqIWHp9jkBGcQvmh1DpE1RcVY1dkTrc99LcIWs8gno+s7n2BhQ2JiPKMKuurVJMJj+Yte/MZ3slKBYHCtfcKyyPpIBPwrqkmLsnqMjDfuia4sNsN6/MwkLymw/j1fdpyTM9y+aiu1Vqrr4PIrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766218130; c=relaxed/simple;
	bh=THtVQYA+y9YcGFWFQAvkK5Yrv/40MBxz45XZ/HC/bVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQ4gq0ghWqu9R+9uKqytgaTaxW4ucgaLTQ/tYgnZjs2mq96l7D0F8fbiNhMfBaaoa7bo++IQ+RAw9uOrl/RuyahquuSpdgJvUEiFhMY7YBCK9mfDcWbW0MM4CN8EBPU+sKer9sQLDtoGVr5yl0/vBaBbXsVLq9sM9CM+AWqaXM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jFskjKLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D641C4CEF5;
	Sat, 20 Dec 2025 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766218130;
	bh=THtVQYA+y9YcGFWFQAvkK5Yrv/40MBxz45XZ/HC/bVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFskjKLfbzR2CdMEAfnMaGrFIFG95hwVpTiCNzQ5CmU2UXqfyf9Vtc+S0g6IX4Xpp
	 62NLYasu7IUZwlec8jKZ79JfNH21EI4xZIFrIARyi+rPPvoMAKaqEVDJfWMvYNPsSJ
	 lL8jwYP39LBhM9KC0er8KzwM33m9n2KQ2K/Xfngo=
Date: Sat, 20 Dec 2025 09:08:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?562U5aSN?= =?utf-8?Q?=3A?= [PATCH] usb: xhci: check
 Null pointer in segment alloc
Message-ID: <2025122014-whole-walmart-f63d@gregkh>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>

On Fri, Dec 19, 2025 at 03:53:08PM +0000, 胡连勤 wrote:
> [ 4021.987553][  T332] CPU: 0 PID: 332 Comm: init Tainted: G        WC O       6.6.89-android15-8-g42db9ecb036b-ab14487600-4k #1 396856ca684d560f9c295b5f1feeed469ef25794

6.6?  Does this still happen on 6.18?

thanks,

greg k-h

