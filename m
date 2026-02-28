Return-Path: <linux-usb+bounces-33813-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAyDOuIRo2k29gQAu9opvQ
	(envelope-from <linux-usb+bounces-33813-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 17:03:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF341C4340
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 17:03:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3A77300BCB6
	for <lists+linux-usb@lfdr.de>; Sat, 28 Feb 2026 16:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5DB264A86;
	Sat, 28 Feb 2026 16:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QMXnA9zz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122F72139C9
	for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772294622; cv=none; b=tbZ/Wflj31fB5pRDmpy0LphUGLagiOcEIueogmKj77QWszbZWDhguBLOzxVybKtFnpXhDDTD7pMUtQl2vkrbR43slbNBahv6WggVHpfngXiXbLYLICv3GAUKnxCL1mOagmmDN9x0AhbNtm1bJaMco+o+HuRqO60QpRoviLueHR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772294622; c=relaxed/simple;
	bh=717TND/+a6UlwmJxh29h6OpSRj7q0V2G8JNMHQuMn+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPYGTjGALz6/zheY68yWCrgQCrwv4FM0IK8EZ/yOM64U1Ms1szI8bdeXJRzxwygUpgP3LQjGL7lh1VqFi3X04YsMkBY8IpzcoAhUrZODH3bWbH0lqDt7vUh/2AYMPm33oFQMvS+49PyWgezpBRWR0h6x3Se+Eshn+CcxI3jeEdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QMXnA9zz; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-505e2e4c35fso32143811cf.3
        for <linux-usb@vger.kernel.org>; Sat, 28 Feb 2026 08:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772294620; x=1772899420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gtEvZF1h70ZYRjRyVhcdZPeDpLSzN2Ck/fqq80D9E7g=;
        b=QMXnA9zzQCZj+88dEkWgP7z1khm7yIrlTEfvWnF03eP3UelKEwW3MVY2rjZzo6HdfD
         r3e0qMATT1Am08QA+fqBkemskS39g1/EEKp/vuZT4+RMPidUjf2W7Mo6a/hn1eIFvcf9
         6kbQ1/0QCJtZ6/ixcjF6EmdSxlI2to8A5JW63AbQc4ws4ZN6Orw+CWsRTTZeKHjdxHcF
         8capeHKISKw+08nV5mr9jo39A7+wLdVLT8thM4hss+FczCu3AWNE5L55QiOamaPFZMHZ
         pb7ZdLWSnwXFFnpcpWIqjHPsjD5Mr8C24Ie4ylSZSp0CbC2xAN6zkDaWcVepkyfWklBe
         n1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772294620; x=1772899420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtEvZF1h70ZYRjRyVhcdZPeDpLSzN2Ck/fqq80D9E7g=;
        b=DLaSeL3LEDOlVz4XDgsAplO8r05mEcLXMWm7vIZfLsw1vJlx6dWSpQ4qVsgLD7K94d
         GgumOAG8HO/UwCO3OPCocgLYSXEvLtRqcMkD4QIO4yD/c7N/0YeU0wARUj754HDpMInM
         PQT94vAgoaOHn5aLrt5NTT4yfuCPKIGpQotVfTf3JvblF+VtMmm00B+zHQROad/W3yaU
         WDXHXFhtY3tN/tlx18ybzuSt7BanIcRgUragaepUkt4n6yItDzgUvuW7fz/nnl5Uy/D+
         J7sUf8qoAO7+wBwyls2w9h3WqrXoCvyKVhClSsh9lLE5/UAmNhZP4oXALN2PYtM7b7MX
         oBtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXO+mjgEWsvEpBi5YZSk9peCRMZkxUuFeGrW2xffb74ohZFZt3HKOElvy9knx3XijmjGw2trbIDpXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4M5qTXIvfmiTbIyrsYIPtMEwxKzHoHh7Omwu/DWnT+xpfaS6
	9hhIsa7sUVlv5lP29HR+NVr6xZRt3dgteAJuDeBTZ+32uDQg91eTgaL+Ih61UlFG6g==
X-Gm-Gg: ATEYQzyj4bC+3/PPqNS4eOJbPG98tdkktQJQcFnmMX+uAT4VmzeTBeoWupvVfCBc7ol
	41uKo3+LtZgKAM0XWpfIykzT0ZPX3VC/Dfwcr7om+r6KnqtTQAKlUtIM8eMupFkq4QAZQQ0L4Oz
	rFKk9L8XDWUSlJAi7Ewux49H7Zh4poH+TY+3oiDhC7weQPx1lnGXwwRmdPrriMjflE8YBC2PODT
	5nuq59sudxsyjA6dPPtHN9SR+TZrMq5xlZGTKuJVTWyU+vC/odIiW5NbcKPP638eMObNCY6fg6U
	kctXO2Uiovir3LXtbNSDDdVcrmPRPev6ucPA2PlmaqMEJWCLG+XcRV3VHNkER9kzsB0+JTyfuHW
	CD5Ma8eJojbQcz9Uhu/4kkBUyyxFP9if0YvaB7dEu7CNFhjWFC090ZlDocIWw0bfsp1+X1kw0jO
	cshdT4sKZXpA1Kevx2DbTW4J05sYIjUsY3aYc=
X-Received: by 2002:ac8:5806:0:b0:4ee:1e63:a4e0 with SMTP id d75a77b69052e-50752a280b6mr80952051cf.74.1772294619847;
        Sat, 28 Feb 2026 08:03:39 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6592desm733296085a.2.2026.02.28.08.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 08:03:39 -0800 (PST)
Date: Sat, 28 Feb 2026 11:03:36 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: pip-izony <eeodqql09@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Kees Cook <kees@kernel.org>, Yuping Luo <Yuping.Luo@csr.com>,
	Felipe Balbi <balbi@ti.com>, Michal Nazarewicz <mina86@mina86.com>,
	Barry Song <baohua@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_mass_storage: Fix potential integer
 overflow in check_command_size_in_blocks()
Message-ID: <8597668d-fa1d-4893-aedb-edb085cad26b@rowland.harvard.edu>
References: <20260228104324.1696455-2-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228104324.1696455-2-eeodqql09@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,dartmouth.edu,wanadoo.fr,kernel.org,csr.com,ti.com,mina86.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33813-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[harvard.edu:email]
X-Rspamd-Queue-Id: 3EF341C4340
X-Rspamd-Action: no action

On Sat, Feb 28, 2026 at 05:43:25AM -0500, pip-izony wrote:
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

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  v1 -> v2: Removed cmnd_size check and applied check_shl_overflow() macro
>  v2 -> v3: Fix indentation of continuation line and drop local variable
> 
>  drivers/usb/gadget/function/f_mass_storage.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 6af96e2b44eb..b7b06cb79ff5 100644
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
> @@ -1853,8 +1854,15 @@ static int check_command_size_in_blocks(struct fsg_common *common,
>  		int cmnd_size, enum data_direction data_dir,
>  		unsigned int mask, int needs_medium, const char *name)
>  {
> -	if (common->curlun)
> -		common->data_size_from_cmnd <<= common->curlun->blkbits;
> +	if (common->curlun) {
> +		if (check_shl_overflow(common->data_size_from_cmnd,
> +				       common->curlun->blkbits,
> +				       &common->data_size_from_cmnd)) {
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
> 

