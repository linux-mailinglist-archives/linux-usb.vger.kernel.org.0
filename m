Return-Path: <linux-usb+bounces-36219-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJXvCNJU3WkFcQkAu9opvQ
	(envelope-from <linux-usb+bounces-36219-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 22:40:50 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF6E3F32AF
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 22:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4B6FF3030769
	for <lists+linux-usb@lfdr.de>; Mon, 13 Apr 2026 20:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E1A3947B1;
	Mon, 13 Apr 2026 20:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kQqzVKc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434781A275
	for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112845; cv=none; b=BYRpAuwDq/so70/ZGkrILIRel1DmZtjeazQ/z2beLzorm46uUi983J6sIVOi9XfQFaMLYvlM2mKN9RZHmq8V5zmAek0oTL56hV2GY+JQAr55TUS/F2MErSNVgASYkOFl7uGQ4JDm6Z7y0IsphaD6k8ZhM4rebhEIIGemaT0YCZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112845; c=relaxed/simple;
	bh=R3kn1jILB660u5Pxb1ERxXiYL0nF6pdPiO1AeCh0R1w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K062xyMap/M9pWal3K+4C4jWizIfea4/pS7eTaql3IKJ5wI3jYMkr0NPaQ7BzsAgaFwmpiUZ2Lvsv2hyIQ0Yti+woMaK9fjDRDG0nK5xI4BB/4LcHqE1RQxK9NfcnmiIrCchz1tt1AAoK5DrjGtzqm5tMvXDQ+zt8ETz6O2lQXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kQqzVKc0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488c2690057so47113335e9.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Apr 2026 13:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776112843; x=1776717643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHse7VJY5zHeWLFBiB9crv5GdzNEc2krImA0dhR/Srg=;
        b=kQqzVKc0V30ahS7XYK6UNMpfvf3vVLfeNoHdhpzI5QVIX0dIGOCkBSueI1FoV49tAi
         2GfBBz+qS1cFrU/+ILhmZWg3laB/gPHqZmYCHm6WlmIrBe8qK8TQ/geTEpUGRN912R6I
         3y1jgbIlJkOfZf3sDweaqCUyMOVbN5POhLm22fg1S/ar7xdr3ol2AXv3FNyonpxAtVOx
         qW4C1RSgWIsNcBaXpdYI8bb+GLAA7JClJmaSGl6wwldYOCwGUUsoxVjsq7bgKIr7MPNs
         pqiaLnmnN/hufYn9Iom98wAZ84RMIGFAVIHyIEuQXmKHa9K0fB9AKswBUtFyetR13P7M
         PUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776112843; x=1776717643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHse7VJY5zHeWLFBiB9crv5GdzNEc2krImA0dhR/Srg=;
        b=eeOJFwmDkT+J99OCPsk+4M6gLHOqR5SCtPJDNNRwS0uhngLRD+8ib6pgX60hbdamad
         3w+ZNRVK5LIMVTBVCx2ExV3XWfFEJ9yk6Cj+RXRVg3hyWAUk3+I4XSzTbJsCA+TBxNpS
         AV4WAVEbBOO5bsMRGN8NW2T5wD7Rq9r9/UoFXfUoEAHOxseac13pSaHrNu/aq9xZFhSN
         doPra/DxU6/jY28KQxZqcz8vIbEAYRZytDnhzrmPlT3pq1tXoDzMsuhgn2ilSVEIPm+I
         yUoicgK3JHEByJthxw/8gilxUA9n9JMRwTYPT91HH2K/5UGSSRoPX9tXRsnfK2EjrWKJ
         x2Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/K3Ud9F8D1Iw/YrqHECrbPXi3e98iDF1S8ugu/VGb5PLI0evooLzGYNR9fr+bL1FruNrR5ugM3Sgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXM/H/bPurYS0N8TzG+oQFv/cqjrNk6xd72p7YQrnwrTTBeeQt
	zMoMNxl/fOpwfTP00OgZbLPzBxdtw7F2OC9NvaCqFPqB4WeClF4+NkeB
X-Gm-Gg: AeBDies2Gr8ji4ADSEaxEgq62iseufkoFfOy+GDogIAKFtm2buTc/OP9mgyPCATH9E7
	VP0ehQrGO5pL0qig7bdthXWbAxyUQEPVXdyBdeXE0BN8lFAX7jPMCThPOfebpRw3rCUCqQXVElS
	kw4nz9C8QG2GWnyl+2tNKLefstTwKjzYhFUy2M6MB0QAl56j3zTm9kGbabmsNvd/6siBwmr5zuu
	gLzDNtJme5QWVnvXxwY8RmpjyElJGKA1owcAN99G9rO6DCPHOLciNDAqBv0TeszS0PT5/I1Lesg
	uNNG5tnuoZtzxULmoZs6OnumeACV8+E96/+R0qUTz0hUmk5Di3mHaLD+vCVWW+m0s8kNMSDn1Ur
	YN+9idVm5MRR2Cm5/UQ3uv6hlO1RG66bpHu8fEbBad77Jk1m3GAbhfDcsfJ7tPF8oQJpLhPRe2g
	mr0jR+Z7EkPWBavNDl1IsQxt1b6dfMVhb9VBg=
X-Received: by 2002:a05:600c:8591:b0:488:a824:fe04 with SMTP id 5b1f17b1804b1-488d6abe9e4mr148996225e9.26.1776112842604;
        Mon, 13 Apr 2026 13:40:42 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d58bb830sm330181675e9.7.2026.04.13.13.40.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 13 Apr 2026 13:40:42 -0700 (PDT)
Date: Mon, 13 Apr 2026 22:40:38 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede
 <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, Ricardo Ribalda
 <ribalda@chromium.org>
Subject: Re: [PATCH v7 0/2] media: uvcvideo: Add quirks to prevent Razer
 Kiyo Pro xHCI cascade failure
Message-ID: <20260413224038.641af363.michal.pecio@gmail.com>
In-Reply-To: <20260410002831.1046407-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
	<20260410002831.1046407-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36219-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8DF6E3F32AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu,  9 Apr 2026 17:28:29 -0700, JP Hein wrote:
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
> a well-documented failure mode that cascades into complete xHCI host
> controller death, disconnecting every USB device on the bus --
> including keyboards and mice, requiring a hard reboot.

For the record, reloading xhci-pci is usually enough to fix this.

> The device has two crash triggers:
> 
>   1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails
>      to reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR.
>      The stalled endpoint triggers an xHCI stop-endpoint timeout, and
>      the kernel declares the host controller dead.
> 
>   2. Rapid control transfers: sustained rapid UVC control operations
>      (hundreds over several seconds) overwhelm the firmware.

That's a bit speculative, it's not entirely clear what happens here.
2 seems possible, but Stop Endpoint timeout and some weird error codes
seen in those logs looks like problems with the HC.

And I known that some HCs are reliably killed by stopping SuperSpeed
UVC streams, at least with my camera.

> Patch 1 of the original 3-patch series (USB_QUIRK_NO_LPM for
> 1532:0e05) has been merged by Greg Kroah-Hartman and backported to
> stable kernels 6.1, 6.6, 6.12, 6.18, and 6.19.
> 
> This v7 series covers the remaining two UVC patches:
> 
> Patch 1/2: UVC driver -- introduce UVC_QUIRK_CTRL_THROTTLE to
> rate-limit all USB control transfers (50ms minimum interval) in
> __uvc_query_ctrl().
> 
> Patch 2/2: UVC driver -- add Razer Kiyo Pro device table entry with
>   UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
>   UVC_QUIRK_NO_RESET_RESUME.

Do these patches actually make a practical difference?

If I'm not mistaken, the results of testing on 6.17 are:

1. The original trigger (spamming UVC control requests alone) doesn't
   cause breakage anymore.

2. New problems are seen when doing the above while streaming video,
   and they are still seen even with the UVC patches applied.

