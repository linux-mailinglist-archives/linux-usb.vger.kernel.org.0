Return-Path: <linux-usb+bounces-33755-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHk9D1iOoGkokwQAu9opvQ
	(envelope-from <linux-usb+bounces-33755-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:18:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AACC81AD763
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71240312D0F5
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 18:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0A73624BA;
	Thu, 26 Feb 2026 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjodYNDm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0924035A39E
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 18:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129152; cv=none; b=e5XhN40dkcI/nv4bm9p5KgkDKa1K3CVUIv0MJBRFuvKVEBApmKOYHARoHQa8S3i/D0rlph+YGGq8oF1ztzk6qz5SAXMdcDGV1xaLz6izq04UlZSHTo+u43+DpkP6EJPohQdu6tyd/a205HUbGKGMxuv/b7e36xWaglcfRvzVToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129152; c=relaxed/simple;
	bh=wvqgfYErGwvobg3QLY82S65S75lVpHGk5u3Ckga6WnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lsGGAkG7LPmmUJk236OxxVX6y0SXAaNfCE8iHJX0UeY3/YToT+1KhLVSE++b93KQGhjUJnhpRlIxa5BfAwwEY753M++L/DywvnonsuzI/Bw0+9aLvX0CcfXr9L6Q+gurErW/42xI9KnX8dmnvOCBweltYc1vPmbBwpOUeBfJcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjodYNDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98416C116C6;
	Thu, 26 Feb 2026 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772129151;
	bh=wvqgfYErGwvobg3QLY82S65S75lVpHGk5u3Ckga6WnI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tjodYNDmKyRiXeuPmEF/lOXSjHhAwQK8OILq3Y7AaTf/t5hoJosbJCwpN07T8h+Ro
	 3LmgFG+lYQXNr5dR3kQ4L0Qu8EVPIz7Tbfk31gXTwfyvdJLIHJYvwrmFZKsr5U+5rv
	 pAzeDwA4R6hmb820f364D3HsdyQ0xzwgFSu7ysZPtjUtHESzvr9PKa/UfQkrTq1ELH
	 R0BuNdCPXoRXCHc+thkT7xroV+hY5MpOooJgA4bZGPMQxM+2gmrBuEUvIJpVlHxssN
	 Oj22im2tE8LFMVvtsgxxjyqJXHOjKsAVeIcaRPMC4xxUQrUMa9XaHYtw/uqh0wgYrV
	 ppqAeyB3eZJmg==
Date: Thu, 26 Feb 2026 10:05:51 -0800
From: Kees Cook <kees@kernel.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yuping Luo <Yuping.Luo@csr.com>, Felipe Balbi <balbi@ti.com>,
	Michal Nazarewicz <mina86@mina86.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
Message-ID: <202602261001.4387F04112@keescook>
References: <20260226155556.1439672-3-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226155556.1439672-3-eeodqql09@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33755-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,csr.com,ti.com,mina86.com,rowland.harvard.edu,kernel.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AACC81AD763
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:55:58AM -0500, pip-izony wrote:
> From: Seungjin Bae <eeodqql09@gmail.com>
> 
> The `check_command_size_in_blocks()` function calculates the data size
> in bytes by left shifting `common->data_size_from_cmnd` by the block
> size (`common->curlun->blkbits`). However, it does not validate whether
> this shift operation will cause an integer overflow.
> 
> Initially, the block size is set up in `fsg_lun_open()` , and the
> `common->data_size_from_cmnd` is set up in `do_scsi_command()`. During
> initialization, there is no integer overflow check for the interaction
> between two variables.
> 
> So if a malicious USB host sends a SCSI READ or WRITE command
> requesting a large amount of data (`common->data_size_from_cmnd`), the
> left shift operation can wrap around. This results in a truncated data
> size, which can bypass boundary checks and potentially lead to memory
> corruption or out-of-bounds accesses.
> 
> Fix this by using the check_shl_overflow() macro to safely perform the
> shift and catch any overflows.
> 
> Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns with different logic block size")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  v1 -> v2: Removed the cmnd_size check and applied the check_shl_overflow() macro
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 6af96e2b44eb..cb885153a31e 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -180,6 +180,7 @@
>  #include <linux/kthread.h>
>  #include <linux/sched/signal.h>
>  #include <linux/limits.h>
> +#include <linux/overflow.h>
>  #include <linux/pagemap.h>
>  #include <linux/rwsem.h>
>  #include <linux/slab.h>
> @@ -1853,8 +1854,17 @@ static int check_command_size_in_blocks(struct fsg_common *common,
>  		int cmnd_size, enum data_direction data_dir,
>  		unsigned int mask, int needs_medium, const char *name)
>  {
> -	if (common->curlun)
> -		common->data_size_from_cmnd <<= common->curlun->blkbits;
> +	unsigned int blkbits;
> +
> +	if (common->curlun) {
> +		blkbits = common->curlun->blkbits;
> +		if (check_shl_overflow(common->data_size_from_cmnd, blkbits,
> +							   &common->data_size_from_cmnd)) {
> +			common->phase_error = 1;
> +			return -EINVAL;
> +		}
> +	}

Right, as Alan suggested, I would expect the code style to be:

	if (common->curlen) {
		if (check_shl_overflow(common->data_size_from_cmnd,
				       common->curlun->blkbits,
				       &common->data_size_from_cmnd)) {
			common->phase_error = 1;
			return -EINVAL;
		}
	}

I would have expected scripts/checkpatch.pl to complain about the
indentation. Did you check your patch with that?

-Kees

-- 
Kees Cook

