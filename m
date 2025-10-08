Return-Path: <linux-usb+bounces-29023-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B6FBC4859
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 13:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5DC43C00A6
	for <lists+linux-usb@lfdr.de>; Wed,  8 Oct 2025 11:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67B0A1D95A3;
	Wed,  8 Oct 2025 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CD3teykD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA772F49F0
	for <linux-usb@vger.kernel.org>; Wed,  8 Oct 2025 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759922111; cv=none; b=IPeMt4vZz3ar4ljQuVhX9XEzxmNTyuGxBigxFnfOMmcoq+qDaBEFRu2g6ELz6Z5qqlbZiBsVKb9BrI1kX1FrC1vviQdz7CI9+sIFSh4ttHfU//Z+rkWefbgIsMrWT8lOa9YaGb9N1oaTlbe58I3qcdCv6NW33EaJfs+Lp8vCLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759922111; c=relaxed/simple;
	bh=5EnL11Mb1kOsR1RmiFYE3W5udw0hwQTV6vXnfPESM7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTzlmR5lt+yCGKh9I4BuEfj5Drlp8V6gBO2TXWlDcaA/1TIe+2cYu4Xa8WSovuX7F5MI2Z5IRdOUNiShpLe1ls3T7X1BQ5pW5t59YtgjjJ9ldF5DcaX2fNfuQ+Ouu5Fnbz/HJHAa6+jhAyE7aVXoaSWrlopgTARCkJR/p+EgBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CD3teykD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD364C4CEF4;
	Wed,  8 Oct 2025 11:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759922110;
	bh=5EnL11Mb1kOsR1RmiFYE3W5udw0hwQTV6vXnfPESM7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CD3teykDIaLGw9HcIp+vgRpjoUNWooPvyOKMy0hoon/0yLgplTYUUXmLRIUT4FtrR
	 vS1caMI47soZDse6okJFKu49CEAPlzSE19ksejBGcgt+vLYauHwjrsfA5/OSVjdmm5
	 S+AaEbww3h7uczCr72NULifOBdNOymv4k3q7QaVU=
Date: Wed, 8 Oct 2025 13:15:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chen Yufeng <chenyufeng@iie.ac.cn>
Cc: pawell@cadence.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: cdns2: fix memory double free in
 cdns2_gadget_giveback
Message-ID: <2025100856-trend-haunt-fcc3@gregkh>
References: <20250908150425.229-1-chenyufeng@iie.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908150425.229-1-chenyufeng@iie.ac.cn>

On Mon, Sep 08, 2025 at 11:04:25PM +0800, Chen Yufeng wrote:
> A patch similar to commit 5fd9e45f1ebc("usb: cdns3: fix memory double
>  free when handle zero packet").
> 
> As 5fd9e45f1ebc points out, the cdns2_gadget_giveback() function also has
> the same memory double free issue when handling zero-length packets.
> 
> Add check for usb_gadget_giveback_request() to avoid double free of memory.
> If it's additional zero length packet request, do not call 
> usb_gadget_giveback_request().
> 
> Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
> ---
>  drivers/usb/gadget/udc/cdns2/cdns2-gadget.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

What commit id does this fix?

thanks,

greg k-h

