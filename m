Return-Path: <linux-usb+bounces-33708-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCNbCvBin2lRagQAu9opvQ
	(envelope-from <linux-usb+bounces-33708-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 22:00:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 832DE19D86E
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 22:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E87CD301E4B9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 21:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6235A30DEA6;
	Wed, 25 Feb 2026 21:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFVfOQun"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DE92701B8
	for <linux-usb@vger.kernel.org>; Wed, 25 Feb 2026 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772053222; cv=none; b=puON2c+h5UbmTg+r5uMcG5ymS51ygzBtiMw4tAmx678XWFIGsqo6/7rL93qQqRRNWD0ZpEiQkDTk9qb7FmYf/6cuXuqQkF/S4cz2k6GOUpK9jjAW7VCJ0v0qR4DYkH/YlqBz37Rjfful4VCnDXA6yIYxSDEZoBiF4lun1B9J2UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772053222; c=relaxed/simple;
	bh=gsz5X50XHJ53n5vQ473U1FKBs7PkABfdz4EURK5Xurg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dm4928fAFi3Ptamznnu8qOwuUm8CgZyguBSdmiP+iM6zUFFSJ1t7UMCwmeVeDTO8Qd4Pb5XpWBP4POP/2nWRVSspLkp9RWKoj6sAnyR8DINKxfwQtb4OcUlitcRwbWxC2Tu2+GMCIwjf26gxT+VwyJ2ZSjohsX+kQAF4Z7mUGyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFVfOQun; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F45EC116D0;
	Wed, 25 Feb 2026 21:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772053221;
	bh=gsz5X50XHJ53n5vQ473U1FKBs7PkABfdz4EURK5Xurg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UFVfOQunWOxsjJui2TeC7MTxoTyZlQnPUCnYcaLsq9cnK8dH586Cx84mzEb9l/Sko
	 EM/H98XINhmOZHZ8XtbPyt1u2Ar5PeHYg5VotguTIe1LgzueGqb9kPoVpQKOW68tjV
	 UtrgmLnExO1cJ0jVIUCL64T+fRABZEAK62DDNF1qOb+CjwgTyeAgE8pZVJgs6yAPKn
	 d54HW1o2qxkng99edmvR2VeBNghzvRyein767tyPbMOkrdXDS+RqgMUZ12k6lh2Cw7
	 wIF9z3sC92JLZDCOWIQ8AIOS0xs+fz8wyJ4tA2+HPVe7Vjl3fdVVQXED3+088oR/57
	 d7cKJMAiVUU3A==
Date: Wed, 25 Feb 2026 13:00:21 -0800
From: Kees Cook <kees@kernel.org>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yuping Luo <Yuping.Luo@csr.com>, Felipe Balbi <balbi@ti.com>,
	Michal Nazarewicz <mina86@mina86.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
Message-ID: <202602251259.B2F5E83731@keescook>
References: <20260225114957.1094146-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225114957.1094146-2-eeodqql09@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,csr.com,ti.com,mina86.com,rowland.harvard.edu,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33708-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-usb];
	BLOCKLISTDE_FAIL(0.00)[2600:3c15:e001:75::12fc:5321:query timed out,10.30.226.201:query timed out,100.90.174.1:query timed out];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 832DE19D86E
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 06:49:58AM -0500, pip-izony wrote:
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
> Fix this by ensuring that `common->data_size_from_cmnd` is not greater
> than `(U32_MAX >> common->curlun->blkbits)` before performing the shift.
> 
> Fixes: 144974e7f9e3 ("usb: gadget: mass_storage: support multi-luns with different logic block size")
> Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 6af96e2b44eb..12e7ef2e074e 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -1853,8 +1853,18 @@ static int check_command_size_in_blocks(struct fsg_common *common,
>  		int cmnd_size, enum data_direction data_dir,
>  		unsigned int mask, int needs_medium, const char *name)
>  {
> -	if (common->curlun)
> -		common->data_size_from_cmnd <<= common->curlun->blkbits;
> +	unsigned int blkbits;
> +
> +	if (common->curlun) {
> +		blkbits = common->curlun->blkbits;
> +		if (cmnd_size > 10 &&
> +			common->data_size_from_cmnd > (U32_MAX >> blkbits)) {
> +			common->phase_error = 1;
> +			return -EINVAL;
> +		}
> +		common->data_size_from_cmnd <<= blkbits;
> +	}
> +

Can check_shl_overflow() be used here to make this easier?

>  	return check_command(common, cmnd_size, data_dir,
>  			mask, needs_medium, name);
>  }
> -- 
> 2.43.0

-- 
Kees Cook

