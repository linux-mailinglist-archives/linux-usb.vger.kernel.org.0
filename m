Return-Path: <linux-usb+bounces-35178-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDjaFrtgvGlxxQIAu9opvQ
	(envelope-from <linux-usb+bounces-35178-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:46:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC502D25B7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 21:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4F1F31A26AC
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 20:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3FFE3F7E9B;
	Thu, 19 Mar 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpwr6co5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCDB387368;
	Thu, 19 Mar 2026 20:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773952704; cv=none; b=HqYx+V0kRR91v98hU7u4w4jtoewq8392E/thvfl9egD/uz7TKfEQtaZEF2xYG1j7y71ZZ1iuRWAhc1kIHK7T/8vF3biIkCjYIefReKvaLb/UNH/errR/x1j/gFkCPcxEHF8V2/NkXpogKZmV3qZofuBfP8g2neI7nr4YKtYXPsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773952704; c=relaxed/simple;
	bh=/kMAkY3cadrAE6DvJPvCkafWINsimgWpUEvjzL+F0jc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYbej8tdo5krnpA2mYvgH/ys0vcbhbuTH8YfJiYoi94Iq+trfS8oKWVW0ZJdzsklBADcPXieXmxMQ8L4Y2wkjiQpI8HVpZnx8R48nCWi+imImP3LaL5THdGwp0sh+QXIdP/k+vTAnyLkeWjHjDFNpf4asZdgYRI0g3C/a0Omt2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xpwr6co5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A16C19424;
	Thu, 19 Mar 2026 20:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773952704;
	bh=/kMAkY3cadrAE6DvJPvCkafWINsimgWpUEvjzL+F0jc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xpwr6co5nmDPCWhT+yJOveJ+oNkbAgNrf0DPsHooox6dcyUX/w9KeseGn5LwD7y4a
	 jMqwDwP8c2CjKyPxxYN0/rA7fXhAr8huvUBAyi5QVc+lm02SP8U2IMUZmKT2C8bBWD
	 pNGRyvRQ40ofW0ZYc9jxvNlBmoZEZhZGAwThfY4S9DwI0hd7AevyvjVG0NqjsOGsBg
	 YNSmdm7YdlDb56uOkzbmu6G+1AN/5cBskwbKEeC83JnwgLWTzI67QodI/bQD4FgpWw
	 Y8JM62wo6xAaV2h+Um78Z2EAPHMqR6Kvohgammfu3rzvYkOjCjSKg4BAu7f7gUtTcg
	 fLnWlj9FcgIoA==
Date: Thu, 19 Mar 2026 13:38:23 -0700
From: Kees Cook <kees@kernel.org>
To: Loke Forsberg <loke.forsberg@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	khtsai@google.com, raubcameo@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: replace kzalloc with kzalloc_obj
Message-ID: <202603191337.2EFF6F7A@keescook>
References: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315111827.20205-1-Loke.Forsberg@gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35178-lists,linux-usb=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.919];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kees@kernel.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linuxfoundation.org,google.com,gmail.com];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EFC502D25B7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 12:18:27PM +0100, Loke Forsberg wrote:
> Replace kzalloc(sizeof(*ptr)) with kzalloc_obj(), to improve type safety.
> 
> Signed-off-by: Loke Forsberg <Loke.Forsberg@gmail.com>
> ---
>  drivers/usb/gadget/function/f_ncm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
> index 14fc7dce6f39..e1e6763293ef 100644
> --- a/drivers/usb/gadget/function/f_ncm.c
> +++ b/drivers/usb/gadget/function/f_ncm.c
> @@ -1456,7 +1456,7 @@ static int ncm_bind(struct usb_configuration *c, struct usb_function *f)
>  		return -EINVAL;
>  
>  	if (cdev->use_os_string) {
> -		os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);
> +		os_desc_table = kzalloc_obj(os_desc_table, GFP_KERNEL);

I was surprised to find this wasn't caught by the original conversion
script, but I suspect Coccinelle is choking on the use of the cleanup
attributes:

        struct usb_os_desc_table        *os_desc_table __free(kfree) = NULL;
	...
        if (cdev->use_os_string) {
                os_desc_table = kzalloc(sizeof(*os_desc_table), GFP_KERNEL);


I'll see if I can figure this out. I may need to send another set of
bulk replacements...

-- 
Kees Cook

