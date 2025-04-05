Return-Path: <linux-usb+bounces-22602-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8530A7C8D3
	for <lists+linux-usb@lfdr.de>; Sat,  5 Apr 2025 13:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DC23B8BEA
	for <lists+linux-usb@lfdr.de>; Sat,  5 Apr 2025 11:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CD91C3C14;
	Sat,  5 Apr 2025 11:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ANM4kS03"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9718027
	for <linux-usb@vger.kernel.org>; Sat,  5 Apr 2025 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851324; cv=none; b=dR3lfQGqlpueCJEPngS22mTqQGKoTKT5R9rOpBm/R9hKNPrZ6iQMGHZVm6z8/tR8GVVWz9VV1g5NBHd3h6REIdhA0l9Rry/EnAhD6kQi7fPs23hPObwbTa5oCnVGjNVnTadic7GdWKQ6YRzccGlYVDKyxoMhWW0od+FwiBLrMxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851324; c=relaxed/simple;
	bh=dezxj8VSTZLrhrjMvBNRo9xpOTdQox3P2xIB/cWe9ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcBPjwLb4EkLmcryT5DdK2CMBX3tORC7PlP7lh8Ip1FenWzC3MlcVEPEJ7SJ+FUE1o7KZFOa3PUz9AMY/Ojkpj+elD3bKQTCdTzgYyoiVfmGdww7P8rxhiWY/dEgXcZySB3uJACK0VoP9ssqDkncVl18JCGP1L3xzYvhnMrdweA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ANM4kS03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2891AC4CEE4;
	Sat,  5 Apr 2025 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743851323;
	bh=dezxj8VSTZLrhrjMvBNRo9xpOTdQox3P2xIB/cWe9ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANM4kS03MtTUdM32rgSWs9YpCS0CGFaMqXHu4IKzHuAfwLypIYNdLmV/vR36aA0/U
	 cELzkwwwuV0gKzDs/uYnYx0TYaiD6GSfh+OAWmz+xCutCfhyxqj1ohLctBXjCLWPC/
	 93hfZf4v++soFdMTZC11JQK/O73giTWHHilMaRG8=
Date: Sat, 5 Apr 2025 12:07:14 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Henry Martin <bsdhenrymartin@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] Subject: [PATCH] usb: gadget: aspeed: Add NULL check in
 the ast_vhub_init_dev
Message-ID: <2025040527-recite-stunt-893f@gregkh>
References: <20250329002911.132826-1-bsdhenrymartin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250329002911.132826-1-bsdhenrymartin@gmail.com>

On Sat, Mar 29, 2025 at 08:29:11AM +0800, Henry Martin wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function ast_vhub_init_dev.
> 
> A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Please properly wrap your changelog text.

> Fixes: 7ecca2a4080cb ("usb/gadget: Add driver for Aspeed SoC virtual hub")

No cc: stable?

Also, your Subject line has "Subject:" in it twice, something went wrong
with the patch when you sent it out :(

thanks,

greg k-h

