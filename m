Return-Path: <linux-usb+bounces-37785-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YINgIFahDWq10QUAu9opvQ
	(envelope-from <linux-usb+bounces-37785-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:56:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DBD58D0F0
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFEE831B3726
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384C63E1717;
	Wed, 20 May 2026 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BfHMfKdM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D03E00BD;
	Wed, 20 May 2026 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276131; cv=none; b=M9mh9CI7SBsYNn2BPTKmCFFhB4Tncx9Pd9IeAHSRlgNpHjZ393bkq/rVNGbrDnpEPbIjpJuGrredv4xIzl4vLsxD7PohHJoh10c5Ay1rbMM1kc2GE73hBW2tw5/wIHgUb3p0h+oCUzGhG0MTEZI7h0Gt7fSydQgxWmZAQNOt7Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276131; c=relaxed/simple;
	bh=zk2Iw3Wl4zYFrHHU3GmkWDTPU1oghjF8ogBbMZFd2ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAlrzoaWRPQxqkxqJoenkgGDTNuI+4UnR2/88ZVreOz++PUBU1AMolN9aA4RPQTK5Adlxr7h2dkLHMX65oehGpDGtCR95aRJMJ7j+sNjJdPQw5KbQbfxlL/4J4fp7J5LLd5Pe7H3+i+7sikAsD+dZs8SjdOJ4efKWV/XqvkmM0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BfHMfKdM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06DDE1F00893;
	Wed, 20 May 2026 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779276129;
	bh=QdZXzviRwIlOT/I3quW66KDWDnjoybexsNxJThgjKCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BfHMfKdMQnUjNLNJ9UBu+LQ8GAUZr6bEON5Xp1ca52hV3lUEumcK+wej2wW2gNs+y
	 9phlv+FGUcxfN9ecKZs4oXMa6bHWiQGo4NVNjU2oOGqYczgne7lkKLikipXZhFdYGY
	 ciP6+PNX3yT6367J9f+qIVzgs1PFU9EZEPDtfYW0=
Date: Wed, 20 May 2026 13:22:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Umang Jain <uajain@igalia.com>
Cc: Lucas De Marchi <demarchi@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] usb: early: xhci-dbc: Ensure correct memory size for
 early_ioremap()
Message-ID: <2026052001-ruined-pesticide-9de7@gregkh>
References: <20260520094804.2981960-1-uajain@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520094804.2981960-1-uajain@igalia.com>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37785-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,igalia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: D7DBD58D0F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 20, 2026 at 03:18:04PM +0530, Umang Jain wrote:
> early_ioremap() checks and fail, if the memory size exceeds the fixed
> boot-time mappings (dictated by NR_FIX_BTMAPS macro). We should ensure
> the correct maximum memory size is passed to early_ioremap() in the
> driver.
> 
> Without this check and page size being 4K(4096), enabling xhci-dbc
> on steamdeck seems to issue the warning:
> 
> steamdeck kernel: xhci_dbc:early_xdbc_parse_parameter: dbgp_num: 0
> steamdeck kernel: ------------[ cut here ]------------
> ay 19 13:42:57 steamdeck kernel: WARNING: CPU: 0 PID: 0 at mm/early_ioremap.c:139 __early_ioremap+0xae/0x180
> steamdeck kernel: Modules linked in:
> steamdeck kernel: CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.18.25-valve1-gcab630e7af50 #13 PREEMPT(undef)  4b70872d9de6788b7f2d10dce46ada89e6cd177b
> steamdeck kernel: RIP: 0010:__early_ioremap+0xae/0x180
> steamdeck kernel: Code: 60 ba 3f a0 4c 89 ca 48 81 e3 00 f0 ff ff 48 81 e2 00 f0 ff ff 48 29 d3 48 89 14 24 48 89 da 48 c1 ea 0c 89 d5 83 fa 40 76 04 <0f> 0b eb a2 6b c0 c0 4d 89 ce 41 81 e6 ff 0f 00 00 44 8d b8 ff 05
> steamdeck kernel: RSP: 0000:ffffffff9fa03cb8 EFLAGS: 00010006 ORIG_RAX: 0000000000000000
> steamdeck kernel: RAX: 0000000000000000 RBX: 0000000000100000 RCX: 0000000000100000
> steamdeck kernel: RDX: 0000000000000100 RSI: 0000000000100000 RDI: 0000000080200000
> steamdeck kernel: RBP: 0000000000000100 R08: 0000000000000000 R09: 0000000080200000
> steamdeck kernel: R10: 0000000000000004 R11: ffffffff9fa03ad0 R12: 8000000000000163
> steamdeck kernel: R13: 0000000000000000 R14: 0000000080200000 R15: 0000000000000000
> steamdeck kernel: FS:  0000000000000000(0000) GS:0000000000000000(0000) knlGS:0000000000000000
> steamdeck kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> steamdeck kernel: CR2: ffff888000000413 CR3: 000000020ed02000 CR4: 00000000000000b0
> steamdeck kernel: Call Trace:
> steamdeck kernel:  <TASK>
> steamdeck kernel:  ? early_xdbc_parse_parameter+0x32c/0x360
> steamdeck kernel:  ? setup_early_printk+0x4f5/0x520
> steamdeck kernel:  ? do_early_param+0x44/0x70
> steamdeck kernel:  ? parse_args+0x233/0x420
> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
> steamdeck kernel:  ? parse_early_options+0x29/0x30
> steamdeck kernel:  ? __pfx_do_early_param+0x10/0x10
> steamdeck kernel:  ? parse_early_param+0x64/0xc0
> steamdeck kernel:  ? setup_arch+0x542/0xbc0
> steamdeck kernel:  ? _printk+0x6b/0x90
> steamdeck kernel:  ? start_kernel+0x66/0x9a0
> steamdeck kernel:  ? x86_64_start_reservations+0x24/0x30
> steamdeck kernel:  ? x86_64_start_kernel+0xcc/0xd0
> steamdeck kernel:  ? common_startup_64+0x13e/0x141
> steamdeck kernel:  </TASK>
> steamdeck kernel: ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Umang Jain <uajain@igalia.com>
> ---
>  drivers/usb/early/xhci-dbc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/usb/early/xhci-dbc.c b/drivers/usb/early/xhci-dbc.c
> index 41118bba9197..699a9ac6d6c3 100644
> --- a/drivers/usb/early/xhci-dbc.c
> +++ b/drivers/usb/early/xhci-dbc.c
> @@ -76,6 +76,14 @@ static void __iomem * __init xdbc_map_pci_mmio(u32 bus, u32 dev, u32 func)
>  
>  	sz64 = 1ULL << __ffs64(sz64);
>  
> +	/*
> +	 * Check that size does not exceed fixed boot-time mappings
> +	 * dictated by NR_FIX_BTMAPS. early_ioremap() will WARN_ON()
> +	 * and not map memory in those cases.
> +	 */
> +	if (sz64 > (NR_FIX_BTMAPS << PAGE_SHIFT))
> +		sz64 = NR_FIX_BTMAPS << PAGE_SHIFT;

You are bounding the size here, but does this mean that the hardware
itself is just broken and should be fixed up to properly report the
correct size?  Does this hardware actually have a debug controller?

And what changed to cause this to start complaining?  Does it fix a
specific commit?  This hardware has been around for a long time, did we
mess something up in the kernel for it recently?

thanks,

greg k-h

