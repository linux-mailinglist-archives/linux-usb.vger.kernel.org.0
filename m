Return-Path: <linux-usb+bounces-34832-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOmIEFD5tmlfLAEAu9opvQ
	(envelope-from <linux-usb+bounces-34832-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:24:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CEF291E97
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 19:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BD60300C7E2
	for <lists+linux-usb@lfdr.de>; Sun, 15 Mar 2026 18:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B15377ECA;
	Sun, 15 Mar 2026 18:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iB7wCJpB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC029371CE3
	for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 18:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773599048; cv=none; b=vBUtCWz2r2m4j0Rz7A9XCSvlbuCr/5yipMCfa7bf8sdSOc0p8xONRsL2olhxRq/VIcuP0xBI6IpthqEQokvspKHj7NQgtwKK/klvfO2mcSmewyXNiIO7027TI+VspIy9eSMq4Ge9pd4V9L9+K6jrREWMK9daSo6aMzM8jkmmjXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773599048; c=relaxed/simple;
	bh=xhknvPSZEJamjwfC6E7xqNbP5Lcu+fQ9sgFybkiurc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JSgY7fuk5/T+YIPFDp1pxc79V0tZGfLdYSnlwUmtxeI1Qayd2P9QH1lLcl0tB01RQKUT0vTd4cADMIkKEarpeIl3a0hZMyzZbDCc2TZI1PoqDc5/zHhTeuJ6v1uTyxygaMMLzRgkGnsm2lA81D7HVSE7PeafaPgpA4UQ0qQJ2+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iB7wCJpB; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899e87b04d8so51320236d6.3
        for <linux-usb@vger.kernel.org>; Sun, 15 Mar 2026 11:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1773599046; x=1774203846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TIW5TAlAjLsCnvPOmmDoGfbXCgAP9kJ4BYzswK9qnNk=;
        b=iB7wCJpBp0vgUONT5uPhslTJDd7610rnDMV/x0fOoMuNtQwAaIB3WZbXZHCnbYgcFl
         0V+I8SxCHwa1BsaCNg6L1JlwP5hzB1otg5eUKp+qrmVlBrdJ0BANH7wAKEdAF+AvC3fE
         ncIyxShC/GDY9Nq3URcplqSj3pkrx+TJDB0Q+KIDFOu5zZgy8me11HILZnmvJKQ9g9tD
         ufYkOiHR/cSSXdrDyXLLd+D7odR+UFXySiJMn/55EIrBzQ4It06JWpwyYCzEkRmH8wh/
         UR9BkDj4aocTn4Dd0yhsghk/xa+1inJXZ963uCAMMFVwB93QKDC53beutYQm6nLybec9
         Wnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773599046; x=1774203846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIW5TAlAjLsCnvPOmmDoGfbXCgAP9kJ4BYzswK9qnNk=;
        b=tFRWevnhJqkYo3mVV+xwm0qZQrxqKo4/xurKZ67RJZSxXPNOTIZ0mtz2BhRR6QmHeP
         pnk31O9sdNznAIm+YWwh05W6M8l0s/58lDYpRNoTL6d7XAfel1rPjfV6m8fvcqEdZKOQ
         tHLNV7oP15006eYGbcKmGSbJoUFSnrP3nHwGsYXSAv4bOM/KSMNpLndtzJ5gNKSdJ9sw
         s34zWW5nwFVywgdlxThkpHM3ZrGuHEOjmm3aBaKkhzYL5RPqo26FmySMn56EyemNDUJ7
         5ZjqjtCG6TUJUGOmB8QT1+QdPSWInQGAtk7bfRQMfblyQS1iJJdvdwY66sJwxWin2A7Y
         HhaA==
X-Forwarded-Encrypted: i=1; AJvYcCV3exQRpxr/GGlPy1A3pqkyIpPKOxA9aqamzcnJ0qduZpUGRKJ11xkpz6MfiYuh9BQkAIYtvFBaEZc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy+SG09ROf+mf7xybyafGPOhPNyJcusRDkEHDkpfMRlAsVl+rf
	2kPhPA8JwoeLa3TlqE20MX3KVD9n68HazN0q57zAlxCNHzq7bGkOGy2ky9GaRF7yv+cTZKPdVzO
	W0mQ=
X-Gm-Gg: ATEYQzxNWeK1ouNthAfdNAwy0Dj73z2CQ5rjq8zVPvwtxVXJZtnq2v0LIaTKiPQlSLr
	soYtQhVAAe3+1I4CeTPivPhe6b0OZ6g0QSajY4iyELdjh4E6yDahEaSCAurC405/jW8Sfnailec
	w090kBXUIGQNXDiUAHEoYkCilP1CUtK45pb+EKnV9yYY42gyJIcFWlxKoSO6iBmGcyXPu21YXi6
	hy/BwpDiyp6CjgCmjSQ/9LnwSEeHAa+O9pXL3DqeALEP4e54GE9h5/KTrtMxwhUvtWyxAOPGK1V
	Tzm0qDOWmBfCbeplhjELpXFg+BeyN4dXLi2t7SnzDaYD4xEAa19rlHz79Qzar3IH7SQ79PDdaZ2
	dSjh9EScw6ilylYt5Kpe7UEhoRx4EFobyVS1Xhtes4ibFuUVWAQ+yfbwiAbuNb/d7DS00e7iAgt
	AEidB/x3w+hthohLvMF5rsFKjP
X-Received: by 2002:a05:6214:e4c:b0:899:fa7f:7155 with SMTP id 6a1803df08f44-89a81d44d25mr169761946d6.5.1773599045763;
        Sun, 15 Mar 2026 11:24:05 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c5246e77asm3689836d6.27.2026.03.15.11.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:24:04 -0700 (PDT)
Date: Sun, 15 Mar 2026 14:24:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Sebastian Urban <surban@surban.net>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: dummy_hcd: fix premature URB completion
 when ZLP follows partial transfer
Message-ID: <df692db2-5efc-4065-8b16-d8c04caaf88d@rowland.harvard.edu>
References: <9f2c403b-5955-4e6b-a356-330cebead7ed@rowland.harvard.edu>
 <20260315151045.1155850-1-surban@surban.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315151045.1155850-1-surban@surban.net>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34832-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 65CEF291E97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 15, 2026 at 04:10:45PM +0100, Sebastian Urban wrote:
> When a gadget request is only partially transferred in transfer()
> because the per-frame bandwidth budget is exhausted, the loop advances
> to the next queued request. If that next request is a zero-length
> packet (ZLP), len evaluates to zero and the code takes the
> unlikely(len == 0) path, which sets is_short = 1. This bypasses the
> bandwidth guard ("limit < ep->ep.maxpacket && limit < len") that
> lives in the else branch and would otherwise break out of the loop for
> non-zero requests. The is_short path then completes the URB before all
> data from the first request has been transferred.
> 
> Reproducer (bulk IN, high speed):
> 
>   Device side (FunctionFS with Linux AIO):
>     1. Queue a 65024-byte write via io_submit (127 * 512, i.e. a
>        multiple of the HS bulk max packet size).
>     2. Immediately queue a zero-length write (ZLP) via io_submit.
> 
>   Host side:
>     3. Submit a 65536-byte bulk IN URB.
> 
>   Expected: URB completes with actual_length = 65024.
>   Actual:   URB completes with actual_length = 53248, losing 11776
>             bytes that leak into subsequent URBs.
> 
> At high speed the per-frame budget is 53248 bytes (512 * 13 * 8).
> The 65024-byte request exhausts this budget after 53248 bytes, leaving
> the request incomplete (req->req.actual < req->req.length). Neither
> the request nor the URB is finished, and rescan is 0, so the loop
> advances to the ZLP. For the ZLP, dev_len = 0, so len = min(12288, 0)
> = 0, taking the unlikely(len == 0) path and setting is_short = 1.
> The is_short handler then sets *status = 0, completing the URB with
> only 53248 of the expected 65024 bytes.
> 
> Fix this by breaking out of the loop when the current request has
> remaining data (req->req.actual < req->req.length). The request
> resumes on the next timer tick, preserving correct data ordering.
> 
> Signed-off-by: Sebastian Urban <surban@surban.net>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

> Changes in v2:
>   - Rewrote commit message to describe the specific ZLP-after-partial-transfer
>     scenario rather than overstating the general case (Alan Stern).
>   - Added reproducer and step-by-step code path walkthrough.
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
> index 1cefca660..0eead4a85 100644
> --- a/drivers/usb/gadget/udc/dummy_hcd.c
> +++ b/drivers/usb/gadget/udc/dummy_hcd.c
> @@ -1534,6 +1534,12 @@ static int transfer(struct dummy_hcd *dum_hcd, struct urb *urb,
>  		/* rescan to continue with any other queued i/o */
>  		if (rescan)
>  			goto top;
> +
> +		/* request not fully transferred; stop iterating to
> +		 * preserve data ordering across queued requests.
> +		 */
> +		if (req->req.actual < req->req.length)
> +			break;
>  	}
>  	return sent;
>  }
> --
> 2.53.0

