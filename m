Return-Path: <linux-usb+bounces-37921-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Gi/JAIgEGqjTwYAu9opvQ
	(envelope-from <linux-usb+bounces-37921-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:21:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1238D5B10D2
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 11:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 210E030247C8
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2026 09:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53ECC3A5437;
	Fri, 22 May 2026 09:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="haUkYYp+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F61531E8
	for <linux-usb@vger.kernel.org>; Fri, 22 May 2026 09:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441273; cv=none; b=lNX5ijggojOEJ4pWmU1LvTpPVKl+IyLbS11fp4dM6jnyeKW3tPaA2sVY0o+OhCsoRiOqDXoFDBsfcA1M6u6IrqrIYRxu6v3vrue9W078F/F7oq7sBuX1MtcoFatozJGY0h5k3yDEy5gJuEeQ33lL//HeBSnmppyMySZ5ajPm2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441273; c=relaxed/simple;
	bh=Cq72BMYdTaHaif3ZGyucqsxnru+OByNt0wmBp9ukVd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oSIIZ6TWG4NDUe91W+sBSK+g8LNHyUTV9UW/vEOOahLqglWKg3La4vclgUD0yTk3ZI933bXv43rF+i3TezmVxCfzVv5X7N9zmOhxd33IU+wyqliw+RT2UkZiUCqXLVcu+vC1rX83Fa5cl2qwThxBsXYS7zZ7ulvr1F/bqd56AuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=haUkYYp+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B65481F000E9;
	Fri, 22 May 2026 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779441272;
	bh=lBRGmhtbsXGu27q5c6zi+xL3oI1FFb+YjvdQ7+Hcj5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haUkYYp+GuosbVjVinFcGdCb+XXg96/3f/fs8Eyfnoui8JB3TBnb7aL3uhoLaydCB
	 SdA89IHg1CBa8PUtO4mQxcJz1HY9Qv5ZjUrRbBbV7/oaOnJA9jZWr4b8spKhQQYP1f
	 8qOQdx/a3Vjh7xTfhXXCXGslde1bamXSXCRroV0M=
Date: Fri, 22 May 2026 11:14:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Giorgi Kobakhia <mrkobush@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH usb v4] usb: gadget: f_fs: fix NULL dereference in
 ffs_dmabuf_detach()
Message-ID: <2026052222-handbag-monopoly-1468@gregkh>
References: <20260513231041.77176-1-mrkobush@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513231041.77176-1-mrkobush@gmail.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-37921-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linuxfoundation.org:dkim]
X-Rspamd-Queue-Id: 1238D5B10D2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 04:10:41PM -0700, Giorgi Kobakhia wrote:
> ffs_dmabuf_detach() dereferences ffs->gadget->dev.parent without
> checking whether the FunctionFS instance is still bound to UDC.
> 
> This can be triggered by mounting FunctionFS, binding it to UDC
> instance. Then unbind would make ffs->gadget = NULL. Calling
> ffs_epfile_ioctl with code FUNCTIONFS_DMABUF_DETACH ends up in
> ffs_dmabuf_detach, dereferencing ffs->gadget.
> 
> Crash Log:
> Oops: general protection fault
> KASAN: null-ptr-deref in range [0x00000000000000b0-0x00000000000000b7]
> RIP: 0010:ffs_epfile_ioctl+0x3f1/0x25d0
> 
> Fix this by checking ffs->gadget under ffs->mutex, taking a reference
> to the parent device before dropping the lock, and returning -ENODEV
> if the gadget has already been removed.
> 
> Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
> Signed-off-by: Giorgi Kobakhia <mrkobush@gmail.com>
> ---
>  drivers/usb/gadget/function/f_fs.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 002c3441bea3..67c8e65a5aa6 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -1553,14 +1553,27 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
>  {
>  	struct ffs_epfile *epfile = file->private_data;
>  	struct ffs_data *ffs = epfile->ffs;
> -	struct device *dev = ffs->gadget->dev.parent;
> +	struct device *dev;
>  	struct ffs_dmabuf_priv *priv, *tmp;
>  	struct dma_buf *dmabuf;
>  	int ret = -EPERM;
>  
> +	mutex_lock(&ffs->mutex);
> +	if (!ffs->gadget) {
> +		mutex_unlock(&ffs->mutex);
> +		return -ENODEV;
> +	}
> +	dev = get_device(ffs->gadget->dev.parent);
> +	mutex_unlock(&ffs->mutex);
> +
> +	if (!dev)
> +		return -ENODEV;
> +
>  	dmabuf = dma_buf_get(fd);
> -	if (IS_ERR(dmabuf))
> -		return PTR_ERR(dmabuf);
> +	if (IS_ERR(dmabuf)) {
> +		ret = PTR_ERR(dmabuf);
> +		goto out_put_dev;
> +	}
>  
>  	mutex_lock(&epfile->dmabufs_mutex);
>  
> @@ -1585,6 +1598,8 @@ static int ffs_dmabuf_detach(struct file *file, int fd)
>  	mutex_unlock(&epfile->dmabufs_mutex);
>  	dma_buf_put(dmabuf);
>  
> +out_put_dev:
> +	put_device(dev);
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

