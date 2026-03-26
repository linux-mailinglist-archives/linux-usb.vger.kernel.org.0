Return-Path: <linux-usb+bounces-35494-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QENfBJ7zxGnv5AQAu9opvQ
	(envelope-from <linux-usb+bounces-35494-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:51:42 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5E331A41
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 09:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A468302A052
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2026 08:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DFC3B583B;
	Thu, 26 Mar 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oOtOay4X"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C262F4A0C;
	Thu, 26 Mar 2026 08:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774514677; cv=none; b=c9qUQI+60jbqBXuuYQrTuKiI/n3qEVm1EK84E77dIy2kY31UsqJeRMRH5+wtu3dioKmtXHxhtim1srwr7SIhd361eiYj6VyyRFWVTWv0vhWDwempt9td9zLGQ1tWa1Uc21OzVcmcy+U4xzfV1PX7T3veqqvCdnwGBqTdVF74XTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774514677; c=relaxed/simple;
	bh=yBHXNA6h12BpXpdZ0rxBcozFzmw/BaZe/+0062zPrhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p2/ZzpoSr8St0+ZszR99LV8bFATq1JeTZrHtIh5gQchuiOiv5K6EU2xzTGqqZaz8PeGf4PlvAFyA0XcIFEht0/3O+Vq5usBqYKx5IdVNv0tnK1jPUJZyYK5tNmJd+DRwKbS0l9QVblIdR8x18eNB9IKXZHPOB6Us57he3NBpEb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oOtOay4X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61BEDC116C6;
	Thu, 26 Mar 2026 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774514677;
	bh=yBHXNA6h12BpXpdZ0rxBcozFzmw/BaZe/+0062zPrhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oOtOay4XGZ52v3YEnPb9ygVkBQprAj20WcyEkYaUhl4v4i5XDmYcXep/kK7utooDA
	 qVy4TQAci/3WEclbD59Kig2HLmQqgHO6NlLi824oiffNPXA/tUYXRhIwllxd4zYM26
	 iEzRn3H8gRMIDHcG8X5y3KcBuRNJyAavUq6Jxhhk=
Date: Thu, 26 Mar 2026 09:44:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: cuiyudong <cuiyudong@kylinos.cn>
Cc: Andrey Konovalov <andreyknvl@gmail.com>, Kees Cook <kees@kernel.org>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: raw_gadget: fix double free in
 raw_release
Message-ID: <2026032659-carnation-caucasian-0493@gregkh>
References: <20260326082245.39394-1-cuiyudong@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326082245.39394-1-cuiyudong@kylinos.cn>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35494-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,appspotmail.com:email,kylinos.cn:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 63E5E331A41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 04:22:45PM +0800, cuiyudong wrote:
> In raw_release(), when unregister == true, there are two kref_put() calls:
> 1. Inside the unregister block (extra)
> 2. At out_put label
> 
> The refcount increments are:
> - 1 ref from dev_new() in raw_open()
> - 1 ref from kref_get() in raw_ioctl_run()
> 
> Total: 2 references.
> 
> The original code performed 3 kref_put() operations, which causes the refcount
> to drop below zero and leads to a double free in dev_free().
> 
> Remove the extra kref_put() inside the unregister block to balance the
> reference counter correctly.
> 
> Since the extra kref_put() triggers an immediate use-after-free condition
> on the dev structure, KASAN reports a double-free instead of a refcount warning.
> 
> BUG: KASAN: double-free in dev_free+0x424/0x740
> Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")
> Reported-by: syzbot+25612fe5ab3dcafc3aab@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/69c401ad.a70a0220.23629d.0000.GAE@google.com/
> Signed-off-by: cuiyudong <cuiyudong@kylinos.cn>
> ---
>  drivers/usb/gadget/legacy/raw_gadget.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/gadget/legacy/raw_gadget.c b/drivers/usb/gadget/legacy/raw_gadget.c
> index 4febf8dac7ca..a1fd3fdf1323 100644
> --- a/drivers/usb/gadget/legacy/raw_gadget.c
> +++ b/drivers/usb/gadget/legacy/raw_gadget.c
> @@ -465,12 +465,10 @@ static int raw_release(struct inode *inode, struct file *fd)
>  			dev_err(dev->dev,
>  				"usb_gadget_unregister_driver() failed with %d\n",
>  				ret);
> -		/* Matches kref_get() in raw_ioctl_run(). */
> -		kref_put(&dev->count, dev_free);
>  	}
>  
>  out_put:
> -	/* Matches dev_new() in raw_open(). */
> +	/* Matches dev_new() in raw_open() and kref_get() in raw_ioctl_run(). */
>  	kref_put(&dev->count, dev_free);
>  	return ret;
>  }
> -- 
> 2.25.1
> 
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

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

