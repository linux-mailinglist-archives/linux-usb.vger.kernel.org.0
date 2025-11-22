Return-Path: <linux-usb+bounces-30820-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE89C7CE6A
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1463B3A968B
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFC5D2FD7AE;
	Sat, 22 Nov 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A815k30s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FD229E10C;
	Sat, 22 Nov 2025 11:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811167; cv=none; b=fynOlAuovTZ8pDFpDNYtYgbRRIZOYhCBoH9fUYHGg2yBHzrPWN5ZkNiAK/aratTEaRL4lVp+/QCUXHp0svSh9og3mHRLmsbpedh6xzsWUsXUU5r1SCnYeNQWlh+yXSPu2pfBGhNRa1xsd9FOsUoNsKvONx+TZrkt6xiqcW1tEPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811167; c=relaxed/simple;
	bh=cgIH4iwXtqNYjATDL/ZGAtsz81xgfJBltX3NlEBOIhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEBFcJsXefMvI7PR3Rhoun2+HzUlYdpEv8Oyfqei1JgI6S0pMUmObDEU49T0ZLvqOpq+4uNnyz4o4SsD/WFOZHrGYW4vyjQnXk9r0OmGRPObqtmbv8bBd9SolxTOazqa6JhWXJ+BbBobjPYQJW+toqLIg75LMboYOfTarxuEsCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A815k30s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F830C4CEF5;
	Sat, 22 Nov 2025 11:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763811166;
	bh=cgIH4iwXtqNYjATDL/ZGAtsz81xgfJBltX3NlEBOIhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A815k30sKXeUzcaRj06iF2w5hROmGFZD9+dD86vLEs1Guz+/mPjy7pDPT8UZsx/r2
	 efpLI4K3yfCYHREZRJ/5+MShg+KmYTKJBuGLLLxeGX0yp1kzSZmFSjHRSqXyCxtbXC
	 oELI3MS08+TKaVuDYYvp0CuiJ/0le/11YK0U2S48=
Date: Sat, 22 Nov 2025 12:32:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhengqiao Xia <jerry.xzq@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112234-pants-unsmooth-1fac@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122112539.4130712-1-jerry.xzq@gmail.com>

On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> We should not point the of_node of a USB device to a disabled devicetree
> node. Otherwise, the interface under this USB device will not be able
> to register.
> 
> Signed-off-by: Zhengqiao Xia <jerry.xzq@gmail.com>

Also, gmail.com is not a company email :)

