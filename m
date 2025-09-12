Return-Path: <linux-usb+bounces-27988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F99B54214
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 07:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C92BE58149D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 05:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593D523BCEE;
	Fri, 12 Sep 2025 05:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WcPwcthR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1B28FD
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 05:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757655129; cv=none; b=NWbtssgDyvsG8ylEXEs00dVg9jV1mMesFShnzfgIeBauwcU6fynXvMvHybLZRq12xRsySyC9QIrdDonNdAm54eV1omB8osKOKBSalUOu9nYDUAzEMmiUzuQKYerPXFZq3WdBl+7plgMU9fQzbRwsXWYDEGX9IgbnfWXhcePTtC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757655129; c=relaxed/simple;
	bh=6DFwyGsU+8a4VKSfGK+Fio+Are5WihyMthObEg6kPno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=miJC409I9xDGZfnE+SqwmzGdpkZ/z9duHW2JJiDRY4jTUqIeIWZNInnlvVm6l7rwrU3CQnmuG3s0G4CLAFYXrBDBBR43wtwhVEdd7t+8RuIyQGxpLukZPON60QIsuJPMw0esTP58zkmYxJi90YL1O3ZocXWaV4k7wjpHh1Cs95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WcPwcthR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5BBC4CEF4;
	Fri, 12 Sep 2025 05:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1757655129;
	bh=6DFwyGsU+8a4VKSfGK+Fio+Are5WihyMthObEg6kPno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WcPwcthRYqAS+qeqR2ULUOTs217exJSxz6V55i1fU0OXl8h+DgEQNusxi4uQXBS+o
	 jmGfuuGPLlMqNbUUUj08K4rDlI7d7lN+fbeXaYSVoUCJYCW3fv+Pq4mN24O330VQeA
	 VfWHw+hMLaGCmmN3BCoCeBJbpTO5qqgSLylgnm6Y=
Date: Fri, 12 Sep 2025 07:32:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: guhuinan <guhuinan@xiaomi.com>
Cc: linux-usb@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>,
	Christian Brauner <brauner@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>, Peter Zijlstra <peterz@infradead.org>,
	Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
	Akash M <akash.m5@samsung.com>, chenyu <chenyu45@xiaomi.com>,
	yudongbin <yudongbin@xiaomi.com>, mahongwei <mahongwei3@xiaomi.com>,
	jiangdayu <jiangdayu@xiaomi.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Fix epfile null pointer access after
 ep enable.
Message-ID: <2025091255-bluff-next-ea2b@gregkh>
References: <20250912040506.142146-1-guhuinan@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912040506.142146-1-guhuinan@xiaomi.com>

On Fri, Sep 12, 2025 at 12:05:06PM +0800, guhuinan wrote:
> A race condition occurs when ffs_func_eps_enable() runs concurrently
> with ffs_data_reset(). The ffs_data_clear() called in ffs_data_reset()
> sets ffs->epfiles to NULL before resetting ffs->eps_count to 0, leading
> to a NULL pointer dereference when accessing epfile->ep in
> ffs_func_eps_enable() after successful usb_ep_enable().
> 
> Signed-off-by: guhuinan <guhuinan@xiaomi.com>

Please use your name, not your email alias for the From: and
signed-off-by lines.

> ---
>  drivers/usb/gadget/function/f_fs.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 08a251df20c4..f4aae91e7864 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2407,7 +2407,13 @@ static int ffs_func_eps_enable(struct ffs_function *func)
>  	ep = func->eps;
>  	epfile = ffs->epfiles;
>  	count = ffs->eps_count;
> -	while(count--) {
> +	if (!epfile) {
> +		pr_err("%s: epfiles is NULL\n", __func__);

No need for this debugging line, right?

> +		ret = -ENOMEM;
> +		goto done;
> +	}
> +
> +	while (count--) {

What prevents the pointer from changing right after you check it?  This
will still race :(

You need a lock somewhere to fix this properly.

thanks,

greg k-h

