Return-Path: <linux-usb+bounces-35182-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECrkDphmvGnQyAIAu9opvQ
	(envelope-from <linux-usb+bounces-35182-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 22:11:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D01F32D28B7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 22:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCA913014421
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA63FAE14;
	Thu, 19 Mar 2026 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hibZZQqT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7963FF883;
	Thu, 19 Mar 2026 21:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773954699; cv=none; b=WXDckmfFbwxuPxn9HDAOsxprSbUkrTvd73lQM4WiOy8g/ROvwhCpS3lc8zVMdnRSeKZxvD48WvzeoIekCQeD/HzlTUSvOd0YaXBMzHpybHa1B8dp8PGfzFxnOla02yMiMmmiMC+NZDRP/9Ll3lQOVdDywZxgCmLvV4x1dy5KHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773954699; c=relaxed/simple;
	bh=cktKzwYMrKV2arN68rUyoWolcM+aLEW/5dsoh0URqkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzZqJK03cBvG/MJ9Ixk2MYdJIDpm44RCUwKK9wMr/g1xJ9TsPG7x9kS8u7M02yzfTrC4W2KrKqVXBEzqyQLZyEF27bNCpfiIFgeXw1I7XuSPDuW2ZDdBRkJg0TFTXLBEMBgqUzG/zZ9kIP6+xD627e2ILU9gZmGNzRLuwW9Db7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hibZZQqT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15FBC19424;
	Thu, 19 Mar 2026 21:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773954698;
	bh=cktKzwYMrKV2arN68rUyoWolcM+aLEW/5dsoh0URqkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hibZZQqTlWdAl4xW8if8rWWAWA3zw5gtQagmgARtWjE55wwyp3v0gmOQ8ySV+8V1a
	 5sDhIlV/+yNMurrzy7vAwbBbVyPHyYa4tX6g/2ASRnes66IAntLEH9sufL+jqkD6pW
	 Kpgc3+4NNER719MvGC8/ZCRlbAPLaHANhw3lEKcbxkYJUF0wtaQsOdYsGS0E0RzzwK
	 a6yNEbgIkMBpot+3Y352IGV8ZYWZoZjycFbaLfR8iJUpim3ov8y3YVtT/drwOChwaI
	 u3beBff4pFQFlUTZZDOVmnHrZFnkGZHk3PfqwZ2wvtZtb4y0j5/s/CcMixAeOXNQDh
	 y2t2pft3LT75A==
Date: Thu, 19 Mar 2026 14:11:38 -0700
From: Kees Cook <kees@kernel.org>
To: Loke Forsberg <loke.forsberg@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	khtsai@google.com, raubcameo@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <202603191410.9DF140D@keescook>
References: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
 <202603191337.2EFF6F7A@keescook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202603191337.2EFF6F7A@keescook>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35182-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.978];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,google.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D01F32D28B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 01:38:23PM -0700, Kees Cook wrote:
> I was surprised to find this wasn't caught by the original conversion
> script, but I suspect Coccinelle is choking on the use of the cleanup
> attributes:
> 
>         struct usb_os_desc_table        *os_desc_table __free(kfree) = NULL;
> 	...
>         if (cdev->use_os_string) {
>                 os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
> 
> 
> I'll see if I can figure this out. I may need to send another set of
> bulk replacements...

Ah, it's not so bad. Latest Coccinelle handles the cleanup attributes
correctly:

 72 files changed, 104 insertions(+), 117 deletions(-)

-- 
Kees Cook

