Return-Path: <linux-usb+bounces-26859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8CEB26845
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 15:59:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67C4D560E31
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 13:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD34A3009EC;
	Thu, 14 Aug 2025 13:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CfgkCVbf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F3426FD84
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179627; cv=none; b=PxstLQ3daFXF0lTZ/FnqmerbxK32nxpzM1hLQPSS75b8NRy93sjZf2URXxbpfvQVDdrz3fvmKrIBatwQqmeIaMTpUqQYBKjRSAYJFpv4Zs+Aw1EZ7lpE3vNvQFufTq+qOXU8NoroYE1wvdhzYBoINQXTuU4kLul8YdvbuqtpXkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179627; c=relaxed/simple;
	bh=bvBBr1pH+ieSbCHRiF611W8MhHfQz1K+xBXD7kPF5ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEGRSGg/ckVknEAy6rR7wPyY1/eUKPWd4KEtPS/Obtt4kP9BLwq031GzeWePXG5f21AvrM9MG8pbPDbqgYeEdUL9S8/KwnBZvECBB8JPbCQmiVJIb9ThjSXXbDi2tc0jiUh0iMO9UI7d9Wy3nNoif1NEv+oMsVvHCJ83k5bg648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CfgkCVbf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F568C4CEED;
	Thu, 14 Aug 2025 13:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755179626;
	bh=bvBBr1pH+ieSbCHRiF611W8MhHfQz1K+xBXD7kPF5ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CfgkCVbfVykBhkd+PGoMogibYWDrobrlPjzqsKne4tlOLmaD19nhFMuXe5gPvgAUQ
	 Vz0fo4KFYQx4laQXeRMkOo/nFzX5Ghh6eZ2uJz7w5EP8+nkLMlls9mPw7mZjqUVL3/
	 Tnu7ESRr80LeDJkeRia7S77+qyiTK3ALXx8GvVog=
Date: Thu, 14 Aug 2025 15:53:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: raub camaioni <raubcameo@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: Fix MAC assignment NCM ethernet
Message-ID: <2025081421-proponent-tanned-4a66@gregkh>
References: <20250814134609.599023-1-raubcameo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814134609.599023-1-raubcameo@gmail.com>

On Thu, Aug 14, 2025 at 09:46:09AM -0400, raub camaioni wrote:
> This fix is already present in f_ecm.c and was never propagated to f_ncm.c
> 
> When creating multiple NCM ethernet devices on a composite usb gadget device
> each MAC address on the HOST side will be identical.
> Having the same MAC on different network interfaces is bad.
> 
> This fix updates the MAC address inside the ncm_strings_defs global during the ncm_bind call.
> This ensures each device has a unique MAC.
> In f_ecm.c ecm_string_defs is updated in the same way.
> 
> The defunct MAC assignment in ncm_alloc has been removed.
> 
> Signed-off-by: raub camaioni <raubcameo@gmail.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Was this sent twice?  Which one is right?

> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 58b0dd575af3..3164e75caa3b 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1463,6 +1463,8 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  
>  	ncm_opts->bound = true;
>  
> +	ncm_string_defs[1].s = ecm->ethaddr;
> +	

Did you run checkpatch on this?  It should have given you an error here
:(

thanks,

greg k-h

