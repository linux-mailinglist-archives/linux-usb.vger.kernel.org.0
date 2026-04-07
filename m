Return-Path: <linux-usb+bounces-36026-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0N9XKkJr1GletwcAu9opvQ
	(envelope-from <linux-usb+bounces-36026-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 04:26:10 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECF3A9049
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 04:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 93E733006450
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 02:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C4E634F462;
	Tue,  7 Apr 2026 02:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDpiuulS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926F52727EB
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 02:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775528767; cv=pass; b=Ji1TVvgdPPdlPUxbdRR2CtBwfonJPV9IjHnWXYRsoUZy3eKFOjxCTo+/xLdqCt/l42ebsP5bb+SDKyXs6Rlu9Lqw7/sBYFyLY4PMgZNOmN7wuitk/vz3/TYlTYK/f7SMsQWle542m9Knr3Mkhifg6Tam7K6NkNKugKpQogUVyGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775528767; c=relaxed/simple;
	bh=ZioPP1j4X9OgyGzb7tw6pQVX5bcHPsm/OzbLY0eqQRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LExyFu2ryxD4MP7RdiXMcWhwCj3CLalHUwHONqEC1lEkzUYuYxdAZmdzf5bzOartYF/1U/8ionW/2Myzi5c0ZaoLLEUjfz7C3xnToHREdJZrXRbOiZ3HF4939A6I7ljdfEyQFwoMYW4NznctGkQWApfkE0/73hDBy5S610ZL0v8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDpiuulS; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xwf.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-50d8c7a393fso813421cf.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Apr 2026 19:26:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775528765; cv=none;
        d=google.com; s=arc-20240605;
        b=IQ4263lQkU2hJ/jjDwkVW5jSidyREO4IbvU+4LinftLM0461X+1wN/ATjxOfeuGobA
         INcSGDRwLFG3x6INU7IFZsk2hupSCbWJq6Qvv56TQClDcSg81XP3PvIedLOuI84fVgzm
         uR5N4Jfm+csBQXopLA+h64iQFUpqBy2iQfOhdIsoDjR6uHG+qSRgrDIm4uXNkeLLbLzy
         Xv+3oT9f57ByOAKHAIQ072499Fo10u/r1qTQ0EdFp1zpElOFzrny7Wn5icxUXoZZX/wS
         nGTxo5mpg3vorSvHwvF/cSHUNmfBIwBv48tqJJEhygeCsgu9+BJd1fRwqA9qqy7bzBdn
         /7Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=6v+9U7WJOjJn65D0h/U59ycZbTmkHv490oNJVCt4GNk=;
        fh=wuYJ++mvE7nya76F+iuFEcJaiun3fQ7HSe7U6p/TN0Q=;
        b=Tp92H/0qiLItNJcza/08cjfBMIwi1ioyUbNNabBY9iCNJ0MfZgcL0o7sq9UhSr8fyF
         GSXYSUwzWkGVpkZvra8mvVeKay8IS6Jj6lob2JVBDFOV6PozpqpYRpAOAWLrGtF+PAr7
         fnwxzPhgO/Hee2Y4F66+GwEnIt6RRc7t+tMVRe7mh15xBTuUnJ7Wsex35cZKRTfuj9/8
         /0UzNu/mHIiEBC3NqALRnY7b+SEiD6rSmtlDyBVzt0sYbAtrHg4fbttZmr392Zj88JYX
         zBwgFVe166xIXXZfGw4Zg6qojXPuEMILcVUJQw88AjL3XPLRsS+s0lZ2MLS3cV4ISHol
         2fwA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775528765; x=1776133565; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6v+9U7WJOjJn65D0h/U59ycZbTmkHv490oNJVCt4GNk=;
        b=hDpiuulSftJ5Nf9nREZua0a9L15XKKqyCpPRrStTquxsF0O6+AmDYX3K9yL72IOe/d
         zTijSXtmOWdciRao2e8stVz4fBgmdsKaxYTo8fs3lvaJWpzYb6e7mymfFKhXi4Exd7YG
         5kg4BcZD336z2nJ+TBgdEjmjo97NulUx0wyvQEe5S+TOBSv4TjA47Rd2dvsnySYFQ2sa
         fvhqRcZ7baS2Mm2/s6md72nQs1/BPSFlaaCGRL7X+fZCf+QBRpOvlj1ofwONRMIALvGt
         B/xFk9CoXkNDRn3U96RiTi6KA25tqW5xQk9Gr94PrwaGCOKWJL5pkdw/R4JAvrEveuwG
         RZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775528765; x=1776133565;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6v+9U7WJOjJn65D0h/U59ycZbTmkHv490oNJVCt4GNk=;
        b=j2Nw89YyZpbyUCvHiE3hdYjRm9fibiy3wTKpic6vSf+4LPcdURNcBmdoxl0ygmqkz0
         mYCprtjbr7+Gpd8nRdYK4rMEpSRuzo/ijedwdihAQIbh8OOvi4gf/v1hTVkgGfCrpKTy
         bGZDqwhY+04zzNj4DqdNd19zEPSHT9WL+egj6NtYELvCC6vODyUSNNLou8zCstIfHfaD
         BPgc56il9Pj7APYxP+VDMcIBeGu995st+c6o8BtZuITOPbPua5kBEkSFarjkUc7APHZJ
         fVg35dp3z6mrtF1Z3LBfNy8bBaNSD0FVVQbIrAg6QoX6xYZ7Evs9JETrBIUMddH6W4E+
         bUrA==
X-Forwarded-Encrypted: i=1; AJvYcCWkMUq/YErzkY2jWMHdQjUUZnbJrozoekPIQML3epP65X2IPGh5hA0VdgaD2V7mzV8mtDrTTN/Zuck=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0g/7Tdm5WZc0Y6IbaXrxxkOtd4NVv9RYZ9RRUjx6d3l+rlBm
	z0IrD757mHdsymTiEoMKxs6v1PLWv0AkjBx+IoQg86/ubkBNtRcDLXorKQ8kHzzXE9EBu4/k684
	E1oyVD9KeiMYs6EY6l+c2QwIkU8WVPSgUlt8/aeC7l16QNaK5GFhRSIVp7G8=
X-Gm-Gg: AeBDietRox4JlxMZSYbQwtDmPL8hR12G2V625qGikVXYJ+hgFEdUDj6/gRyt+0h0CNz
	qj53PXlw9pXXH7qrF5x7BNShNlBrUb5hejkY+iUiCHVYpKZyRtR4iTPYBfrWvw/p9ZuKDVb80Q5
	JUBwMwssIoBU/15ArRKa77oGkTXY79uFiWRt53Sfht+bLy8tsz36Y0oqqNGO0f1ptqBHl4y8KI4
	EGTBBFgbULNNuXWhMhYPklELApvrhEgJb07FzTm9web6y0WAVydyGhiyfsDQX2PbUXI8mib9Olk
	7VqhS2P4mg==
X-Received: by 2002:a05:622a:11c9:b0:4f3:54eb:f26e with SMTP id
 d75a77b69052e-50d66153362mr36590611cf.1.1775528765163; Mon, 06 Apr 2026
 19:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MAYPR01MB10413B6654E013F981EAA7ED9EB51A@MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <MAYPR01MB10413B6654E013F981EAA7ED9EB51A@MAYPR01MB10413.INDPRD01.PROD.OUTLOOK.COM>
Reply-To: hhhuuu@xwf.google.com
From: "Jimmy Hu (xWF)" <hhhuuu@xwf.google.com>
Date: Tue, 7 Apr 2026 10:25:51 +0800
X-Gm-Features: AQROBzAJcB9q-FtPCsFjMjMZouJt-XTk08wnFAd6QoLCYQwZhg3ZiO-otDpLqGI
Message-ID: <CAJh=zjJByyKrCQ0yjibEYKkbgj3kSZ_JUjsHaahRu=UxE=1RXw@mail.gmail.com>
Subject: Re: [PATCH v4] usb: gadget: uvc: fix NULL pointer dereference during
 unbind race
To: Roshan Binu Paul <roshan.binu@dicortech.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36026-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuuu@xwf.google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[hhhuuu@xwf.google.com]
X-Rspamd-Queue-Id: 51ECF3A9049
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Roshan,

Thank you very much for the detailed testing and the positive feedback!

It=E2=80=99s great to hear that the patch resolved the NULL pointer
dereference on the Xilinx ZynqMP platform, especially under the
SIGKILL stress tests. This confirms the robustness of the
synchronization logic across different environments.

For your information, Greg KH has already accepted this patch into the
usb-linus branch, and it should be headed to the mainline and stable
trees shortly.

I really appreciate the time you took to verify this fix.

Best regards,
Jimmy

On Thu, Apr 2, 2026 at 8:29=E2=80=AFPM Roshan Binu Paul
<roshan.binu@dicortech.com> wrote:
>
> Hi Jimmy,
>
> I have tested this patch on a Xilinx ZynqMP platform running a custom
> UVC video streaming application.
>
> Test Environment
> ----------------
> Platform    : Xilinx ZynqMP
> Kernel      : 6.6.40-xilinx-g7c7280e64b31
> Application : Custom UVC video streaming application
> Base        : PetaLinux 2024.2
>
> Verification
> ------------
> Confirmed patch is applied by checking for uvc_vdev_release symbol
> in /proc/kallsyms.
>
> Test Methodology
> ----------------
> 1. Start UVC video streaming application
> 2. Send SIGKILL to force terminate the application
> 3. Wait for application auto-restart
> 4. Check kernel messages for NULL pointer dereference or panic
> 5. Repeat for 10 cycles
>
> Test Results
> ------------
> SIGKILL stress test : 10/10 cycles (3 Reps) PASSED
> NULL pointer crashes: None observed
> Kernel panics       : None observed
> System stability    : Stable throughout testing
>
> Prior to this patch, we observed NULL pointer dereferences in
> usb_gadget_deactivate() when applications were force-killed during
> active streaming sessions. This patch resolves that issue.
>
> Tested-by: Roshan Binu Paul <roshan.binu@dicortech.com>
>
> Thanks for the fix.
>
> Best regards,
> Roshan Binu Paul
> DicorTech

