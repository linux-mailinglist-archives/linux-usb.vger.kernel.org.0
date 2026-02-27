Return-Path: <linux-usb+bounces-33800-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHYzMDL+oWl4yAQAu9opvQ
	(envelope-from <linux-usb+bounces-33800-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 21:27:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED251BD9E6
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 21:27:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79AD7304FF5F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 20:27:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F9244DB70;
	Fri, 27 Feb 2026 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JFw3jaWR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631502C0F6C;
	Fri, 27 Feb 2026 20:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772224048; cv=none; b=ZD3KO7twwY8hhLKImG643SGSn4RbT+tZjsgdVS+lxZGYWszOhqBatyYBo4w9wDulIkWi0tk3goNwj4sDM9IW3xDhQk+IBe7avWphyi3TtUz1i1spO3Xbigvj0HKJhTcXYPUdt+uUVzsTKc6Oy/TCmATA+ICdp28R2KQCJpzu8PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772224048; c=relaxed/simple;
	bh=I1A/bv9eqYS9UK/3B1iRh4HFBY/9e71CDU6u53TQSYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQSYjvHkBroGtIiFon6PL0PoJLaIURC/gcIFPMdtDeB9k99vHcZTO6gALFFthAHFy+2o7Hap/j5d1ODhW6mzDY/zuuAISvF6E7/9k9aHPHyOMKNCGqYnt2IW/nm1wQylAaqqTYMXkI4h8VYwUUWu5Di2Fcdj9Ak79OIRPVMlhHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JFw3jaWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5081C116C6;
	Fri, 27 Feb 2026 20:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772224048;
	bh=I1A/bv9eqYS9UK/3B1iRh4HFBY/9e71CDU6u53TQSYw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFw3jaWReB+SkW8yaELe3lrkfN2qpS2LHg6is4ZphCo1T5MEtyI0nKHQtZxmtqBOi
	 AJQmk/lSiw7EFWCaCgWFqnxlD9nPVDG6C4/NY2/BvFSW7hK3HHf9JTRcm9e3KxmIri
	 8+cdWkyktDX/1RvCqBxxDpEMy13ctujPyISrjI9U=
Date: Fri, 27 Feb 2026 15:27:17 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Venkata Swamy Kassa <venkatswamy7@gmail.com>
Cc: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 1/2] kcsan: test: Adjust "expect" allocation type for
 kmalloc_obj
Message-ID: <2026022703-knoll-duckling-0285@gregkh>
References: <20260227185021.767948-1-venkata.swamy.kassa@hexagon.com>
 <20260227185021.767948-2-venkata.swamy.kassa@hexagon.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227185021.767948-2-venkata.swamy.kassa@hexagon.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33800-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4ED251BD9E6
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 06:50:20PM +0000, Venkata Swamy Kassa wrote:
> From: Kees Cook <kees@kernel.org>
> 
> The call to kmalloc_obj(observed.lines) returns "char (*)[3][512]",
> a pointer to the whole 2D array. But "expect" wants to be "char (*)[512]",
> the decayed pointer type, as if it were observed.lines itself (though
> without the "3" bounds). This produces the following build error:
> 
> ../kernel/kcsan/kcsan_test.c: In function '__report_matches':
> ../kernel/kcsan/kcsan_test.c:171:16: error: assignment to 'char (*)[512]' from incompatible pointer type 'char (*)[3][512]'
> [-Wincompatible-pointer-types]
>   171 |         expect = kmalloc_obj(observed.lines);
>       |                ^
> 
> Instead of changing the "expect" type to "char (*)[3][512]" and
> requiring a dereference at each use (e.g. "(expect*)[0]"), just
> explicitly cast the return to the desired type.
> 
> Note that I'm intentionally not switching back to byte-based "kmalloc"
> here because I cannot find a way for the Coccinelle script (which will
> be used going forward to catch future conversions) to exclude this case.
> 
> Tested with:
> 
> $ ./tools/testing/kunit/kunit.py run \
> 	--kconfig_add CONFIG_DEBUG_KERNEL=y \
> 	--kconfig_add CONFIG_KCSAN=y \
> 	--kconfig_add CONFIG_KCSAN_KUNIT_TEST=y \
> 	--arch=x86_64 --qemu_args '-smp 2' kcsan
> 
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Fixes: 69050f8d6d07 ("treewide: Replace kmalloc with kmalloc_obj for non-scalar types")
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
>  kernel/kcsan/kcsan_test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> index 79e655ea4ca1..ae758150ccb9 100644
> --- a/kernel/kcsan/kcsan_test.c
> +++ b/kernel/kcsan/kcsan_test.c
> @@ -168,7 +168,7 @@ static bool __report_matches(const struct expect_report *r)
>  	if (!report_available())
>  		return false;
>  
> -	expect = kmalloc_obj(observed.lines);
> +	expect = (typeof(expect))kmalloc_obj(observed.lines);
>  	if (WARN_ON(!expect))
>  		return false;
>  
> -- 
> 2.43.0
> 
> 

Why was this part of a usb patch series?

thanks,

greg k-h

