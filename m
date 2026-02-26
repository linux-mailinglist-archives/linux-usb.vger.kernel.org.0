Return-Path: <linux-usb+bounces-33752-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDPbJ7+NoGkokwQAu9opvQ
	(envelope-from <linux-usb+bounces-33752-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:15:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 012071AD6DD
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 19:15:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED66339451F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 17:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ABF844B677;
	Thu, 26 Feb 2026 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="E7ZzTlib"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557CE42981A
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772124781; cv=none; b=Sj8b3JReBDfofmQHosU04Llkiu7CgFYyrAuJVCo1VmD3KbR5NsfzcOP5rVM2/1X90AjSqOGxo2KNzdYHXaNdcy2sWqw6OLcI09qarZpuScLgx/4kM7tl7/aS3gmjrffjsZ/u0xYd5a5fQNUAxmkICppmZiYbyhK12+eDCg9RKww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772124781; c=relaxed/simple;
	bh=/waewuYzirOUs+Ozc/ASHr4bHqmQK3TeIGVBzRljtvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZGRpkc0vxTZUWBY9iThhr2axwrPTNgeWMShJDjsUOiL6Nx2E+vRexohHfWUKY2FTNSK1DQt0RWxBqzjYVTZzrRo9bDf1n0VJr261KHlNt+2qBcir5dw9kO7adh9e701fZsfuk08fXjK+r5C7HtH/9LbKVu83bcHPSC0qWsk9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=E7ZzTlib; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-8cbae8f69cbso99517985a.0
        for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 08:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772124779; x=1772729579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rvlo7KxMIYd8fW6r1r8U0XLSRCywnFvC9/NiFM/txY=;
        b=E7ZzTlibmLkQ1E6yCX3qNFpbakUNCuSWjR35TgmtdvdTbFbxUbKEjhQK6+K85rGXHv
         igNrZ+Ro+vOiN5MBlHAuZz/bxbw6Ov1UYC4fgLarv5ZffvdlPkRgWEaOzTOviNSV5b64
         WIYkHQN2i/Vy2cM39/FMMN2d38oGPlt8J89oOvEQ9GwLWQ7EsW08oPHwTXfGdX96gOyw
         a3/4Tb6PhVOsG1j/ENHkyZ7r0SHEJAUssYxvTZoPXBYrEO83quU7lv9/y67CWwdJJzv4
         RIpOq7Qi3qH4h7EwwPZ8Jmm9LEOGY/pcl1UaY7iPPahCrHDyfMBsBgFV50iMhkB+m/h0
         FkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772124779; x=1772729579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Rvlo7KxMIYd8fW6r1r8U0XLSRCywnFvC9/NiFM/txY=;
        b=AqsH1Eu2usuTiHzTKWjfcE5yHy5n62Tczn7SP5hKWVAYCroMW3TPJ+reYM8VN8KP3d
         Ss/yqvc846kBMPLqV3uRho7o8NfX0YFCc4ww+jA9+CH7opOLPW7rwyqnHCAHSlkmDydU
         bgS3/4tbxKgEhDL5FNPbW/s1v4YJNShF+bwlOnkOFpWbS9RRP0bUph892u64Zl37renY
         +9fw15KA60yGaq1W+L/9w7BrAVpXWqM6/ZOpurwby0r1QFhRRKVQ/ABUT4Bb4sB2Ja7a
         pooDwnEIYMJPiBhu++3BEyyeDPiYKRCHapNwMSoaNenC8BEwjUcemLb5cC0MyNZHR4Er
         gI3A==
X-Forwarded-Encrypted: i=1; AJvYcCWNLmuxFc3ihHu3/wJmFpvgUHZOXZ5QlhVTrwFB7ShYXGInSQiejA9voRu8Tv/exwUtHL1Dbs/BLG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywof8o0q0zfE6fjcGx+a3HaBrNPg7QBBqaNygSnfj2SOPLkGYL0
	0zbOE5cHdjmaSEImqAsnb6fu3sTusE1v4afA/MdcqOtJyua81oxFjNf8mojc6dPwuw==
X-Gm-Gg: ATEYQzwwDGKRp+oO/5urG1XGkTBHsrnYImY2zNCYd/+SwitzqK+gdIv32WBZ+PMAiMp
	bFyEHXr66sKUBxDT7Rw/jpWkGQO4R6i+YaNaUHf9YHi+MaNo0JUuBygvPYVFzAk03544KmpVRqo
	gYrjKrE9wFR8z/QoGNlSw+XIaQNqB6fWsbFjUzmZCmYIowTrn1RClcg7SYgOUGxSqJ90zdROWZi
	X+9qrfEbZBb6nh4lxegWCrjKXAN+j8L43v/dr4Z4exc3BrRMeZpj9lsfNoFBgkqiSJBx6RpncYP
	MUBKvfulsB58Ut391FatJ1CheAghWLQ8HTtdHgXpn4dugXEdMyV0RRq3KeGrHTGtOrPnGgmjhH+
	D3+ERdH7/pOGxuWp2Dxm0LYZ6mQBIji9Vrq4NicbacBC0tpLV8uugjeNQzdeU/gTJl+7UK7cfGb
	24MLBvjSSPOpIyVWL16rIUYY1UWPrzUnw6o1EGkf5AH1WzOn+DdLhzf3dstgWPGewA8ePEXPD6x
	SiICBOsOjvWP/IQm0gH
X-Received: by 2002:a05:620a:471e:b0:8b2:e3c1:24b7 with SMTP id af79cd13be357-8cbbf3e704bmr434066685a.29.1772124779137;
        Thu, 26 Feb 2026 08:52:59 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-51.harvard-secure.wrls.harvard.edu. [65.112.8.51])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c716cc2fsm22153506d6.14.2026.02.26.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 08:52:58 -0800 (PST)
Date: Thu, 26 Feb 2026 11:52:56 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>, Yuping Luo <Yuping.Luo@csr.com>,
	Felipe Balbi <balbi@ti.com>, Michal Nazarewicz <mina86@mina86.com>,
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
Message-ID: <772e546d-ecc3-438d-a9b3-ecdf6cf927f3@rowland.harvard.edu>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33752-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 012071AD6DD
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

It's a little odd to create a local variable for something that's used 
only once -- you could just as easily have put common->curlun->blkbits 
directly as the macro's argument.  But never mind.

The indentation of the continuation line is strange.  This source file 
uses a couple of different conventions for continuation lines, but none 
of them involve adding 5-1/2 extra tab stops.

These are just formal problems.  There's nothing semantically wrong with 
the patch.

Alan Stern

> +			common->phase_error = 1;
> +			return -EINVAL;
> +		}
> +	}
> +
>  	return check_command(common, cmnd_size, data_dir,
>  			mask, needs_medium, name);
>  }
> -- 
> 2.43.0

