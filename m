Return-Path: <linux-usb+bounces-22304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AECE2A751D4
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 22:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8C163B374D
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 21:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A57D18C907;
	Fri, 28 Mar 2025 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dfg2aF5A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72750145A05
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 21:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195850; cv=none; b=Nf3qlVORHWocglM8NV66tpppxGJOocQHGFx1Rsw1EkoT/MPcC/QJVory6kv+GC9LbUWvS7yWkly6xqWmEMSlvQ/m8sh2cNYeN6KgjSBF134Vrv/ly2dT+nMrkSOr4eUaSsldhxL0Ee5WdtnJBCwaOekYRfqWFRbJ7XG3Pcf/nMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195850; c=relaxed/simple;
	bh=vtWvm+/AzPp+LBBJt3DZR5sLduYGjNj5H2sVIh2rXd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxuMXliuVSKTWL9kLND3WdH3CCm3w1lTE6B77cnLJKq/03kXDxJUeauSpm/XMoALk+V081V8XVhDon0tfUjYxJNi2kD6Rdf7C7RuDPBEssybHPCPtXQCxXPj1q8zvcW6yTq22ZS/+wMk82jo40IUEuQiTiHf3EnYoBvHcPyV8so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dfg2aF5A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD49C4CEE4;
	Fri, 28 Mar 2025 21:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743195849;
	bh=vtWvm+/AzPp+LBBJt3DZR5sLduYGjNj5H2sVIh2rXd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dfg2aF5AgHdXzOpMKyojLPn4u4fe9sgisFYgku3u3+V5SgcrHObytERzIoCYo8vmj
	 40ThXKLV1vLTx/p8RstPwYc5K+FvjOdgUlM5jTIVOvjn3iTpYOkYZK/MIeOGv3cVsC
	 toMqITQD8XHkr3lLpF36PnHZwq4fh16e/Qj66QLE=
Date: Fri, 28 Mar 2025 22:02:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Frode Isaksen <fisaksen@baylibre.com>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
	Frode Isaksen <frode@meta.com>
Subject: Re: [PATCH] usb: gadget: f_fs: Invalidate io_data when USB request
 is dequeued or completed
Message-ID: <2025032835-sixtieth-unable-1548@gregkh>
References: <20250328161823.2240125-1-fisaksen@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328161823.2240125-1-fisaksen@baylibre.com>

On Fri, Mar 28, 2025 at 05:17:15PM +0100, Frode Isaksen wrote:
> From: Frode Isaksen <frode@meta.com>
> 
> Invalidate io_data by setting context to NULL when USB request is
> dequeued or completed, and check for NULL io_data in epfile_io_complete().
> The invalidation of io_data in req->context is done when exiting
> epfile_io(), since then io_data will become invalid as it is allocated
> on the stack.
> The epfile_io_complete() may be called after ffs_epfile_io() returns
> in case the wait_for_completion_interruptible() is interrupted.
> This fixes a use-after-free error with the following call stack:
> 
> Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
> pc : ffs_epfile_io_complete+0x30/0x48
> lr : usb_gadget_giveback_request+0x30/0xf8
> Call trace:
> ffs_epfile_io_complete+0x30/0x48
> usb_gadget_giveback_request+0x30/0xf8
> dwc3_remove_requests+0x264/0x2e8
> dwc3_gadget_pullup+0x1d0/0x250
> kretprobe_trampoline+0x0/0xc4
> usb_gadget_remove_driver+0x40/0xf4
> usb_gadget_unregister_driver+0xdc/0x178
> unregister_gadget_item+0x40/0x6c
> ffs_closed+0xd4/0x10c
> ffs_data_clear+0x2c/0xf0
> ffs_data_closed+0x178/0x1ec
> ffs_ep0_release+0x24/0x38
> __fput+0xe8/0x27c
> 
> Signed-off-by: Frode Isaksen <frode@meta.com>
> ---
> This bug was discovered, tested and fixed (no more crashes seen) on Meta Quest 3 device.
> Also tested on T.I. AM62x board.

What commit id does this fix?  Should it go to stable?

> 
>  drivers/usb/gadget/function/f_fs.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 2dea9e42a0f8..f1be0a5c0bd0 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>  {
>  	struct ffs_io_data *io_data = req->context;
>  
> +	if (WARN_ON(io_data == NULL))
> +		return;

If this happens you just crashed the box (remember about panic-on-warn,
which is still set in a few billion Linux systems these days...)

Just handle the issue properly, no need to dump the stack and crash a
device.

But, what keeps io_data from changing after you have checked it?  Where
is the lock here?

thanks,

greg k-h

