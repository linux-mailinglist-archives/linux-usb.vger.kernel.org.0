Return-Path: <linux-usb+bounces-37454-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAaIENqhBmoMlgIAu9opvQ
	(envelope-from <linux-usb+bounces-37454-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 06:32:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AEE549401
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 06:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 336913010D89
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 04:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A773D564D;
	Fri, 15 May 2026 04:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc9SqWJf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1EB3CBE88
	for <linux-usb@vger.kernel.org>; Fri, 15 May 2026 04:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778819537; cv=none; b=d6uxexYWw1QkSEEfLbDdNOxhDT/iY1ypyfcan1C0oSbUkybekoxs0DVcWUwfSMiJFFee3MDU0KKQG7sS57h5FVvHTTbJ6hxPQK4Yl4pCif6vjTE9uZSBRjhEqk3ELOMONwncqL6+M5zLyby29qkycV5p2lVFiSPDG6ijWpC/XgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778819537; c=relaxed/simple;
	bh=OeEC8d9n4OOnVbH0Lf8TYHwi4n2ulS/7MtBVQToqolY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AV+IgC/xNFevMwLCv3qd/0gRBNjRqvTHUyJD/o3MT8FVVrtrUJm/L/i/A3g8nrI/aTQYEtTU4L+df5YguBYWtUTQKUQBLrHu1hGybrwKlCNDZbN4WVTqojS/1lUedyzwXOUCdlH4OY8yNh7a8KwYMKcsHIsBNSLLJ9AhOnLSeUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc9SqWJf; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso6307165e87.3
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2026 21:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778819534; x=1779424334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OeEC8d9n4OOnVbH0Lf8TYHwi4n2ulS/7MtBVQToqolY=;
        b=hc9SqWJfrU6xFb4R1UwDJAI1E0DgU1KusDr4eq9VafKwvPA1I23WrzMuYk+Jowd5OP
         yu8XAIJYgypMtNmEebk/pSe9SNICgxKNIfpBD9BFIJGq+Y0L3JNe7X3lboVU+o4Pp0Ix
         TFbqlkb12a4ya5l0H4xNpICmI+5Qfye39IG4Ay9G3gJlB64ho222lFTHd8+MXqDaCNTR
         jyI21zL6jkZ6fs+kHCbG2BKMHDktk/ZlZRsGuaXBO2v5LyLJ4kGN5GXbyj1T7UycaTfq
         RUhqphkkF8l1ynu5leBPmiZdgULAs00TO+5LwAt13TDgJRLnH/VN0KB8+sP02STpEJS0
         5/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778819534; x=1779424334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OeEC8d9n4OOnVbH0Lf8TYHwi4n2ulS/7MtBVQToqolY=;
        b=kI7fIOVGKHt/zfqtN/DxK0zqW+tc3zO2bT1qZXZIgWasF4je3FIuIvpVl4e4VR/TES
         2Q9mRbWjqX41GvEN1vteCMG+TdAxjHm97TB1qv/tNKekkjw1sPEukNwm06vQAY9Ewf5r
         Q6LU8G/Et8ZtLqMSgVKNL1uvopFrghgYK0P78IXHavTEkkfLqlvGmyWh3rplMOV7ANSj
         c7HXxOCrOTRBWNBNQ1g3GTnK77vIq2DIyXb5CLSdWJpjJIvfxXI44nAKdovqlmCQgD6b
         LeT2JjPY8XWwiXOi+EqWbbeHtvHYJQD2F3VvGkUYZ10GUxEkpC0BEgu48sdkeSkV/a9l
         dUGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Qh/f3DRVmTdcSmBL2yudmvUEErrZLXlZT6QI14XC9mRlU6dP3/9aiRtiqtIYvRK9Jf+EMK4eLn9I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx999JtZxNVWxctAmFirvDuN6sFoXH7Xoe8FE9O0V7WbcgImGwt
	0ihChtZ7GSbXEav+ec5NDpv7NTKbbs8ouNQ/E/G8cai+SJle5IBPs3QY
X-Gm-Gg: Acq92OH4suXWAYjG4EgIsPP2QdA1hUcdwQLdKGNXZlU96Kl4WdJixefkSvphY+B76CV
	OKNDWtUw0yxpHag05+1A2FmwKhqs3ZFrL7B3RJjsXKTVr6kL+D8vFYyrRkS4goBYFZTCuByIq+O
	ehLM0GI4rAc7uz8v35KkbNElboPviowQS1YTm/wscw0pZ5103P1mVUnQ1RZr3XmDMDwfxdaMqVD
	tR3RySf/t3dGAEE7KLQOZ6E3Z5kyLyj5x67cUyskyjKllArdt2zasMLH6+NJYEcTSy+lA+xJ/vt
	pjaoNTUSNT7qEuNmONKo1f0zuUdL5e2IG+F6Ma0h4jV9bvL8CFeoiIxzhalRmrT19PmJkZeh9A+
	kYhEPd0bHxP/YaYGXMqDTjhWAyKKLs7y1MZ0GtFbTPqilJ5IixF6tJqFnibZ8LFVEEAsgvpwuC3
	i18P3O2LIk2mGRsBRgTzxrVXGCbisIss0R
X-Received: by 2002:a05:6512:308c:b0:5a8:efe8:cd9 with SMTP id 2adb3069b0e04-5aa0e5e9c10mr569994e87.0.1778819533919;
        Thu, 14 May 2026 21:32:13 -0700 (PDT)
Received: from foxbook (bff81.neoplus.adsl.tpnet.pl. [83.28.43.81])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm975871e87.70.2026.05.14.21.32.12
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 May 2026 21:32:13 -0700 (PDT)
Date: Fri, 15 May 2026 06:32:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dylan Robinson <dylan_robinson@motu.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 linux-usb@vger.kernel.org, mathias.nyman@intel.com,
 stern@rowland.harvard.edu
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
Message-ID: <20260515063210.4ed0a940.michal.pecio@gmail.com>
In-Reply-To: <CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
	<20260511192105.3756809-1-mathias.nyman@linux.intel.com>
	<20260512110810.17fbde0a.michal.pecio@gmail.com>
	<85f8441d-d6c0-4607-9269-d80b1294afbd@linux.intel.com>
	<CA+Df+jf79bnONyXUnf0_zAUrqNAVzy1zt9VCivbxYvkedfGHRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: D1AEE549401
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37454-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 14 May 2026 17:16:35 -0400, Dylan Robinson wrote:
> On Wed, May 13, 2026 at 10:30=E2=80=AFAM Mathias Nyman wrote:
> > v2 writes the TRB frame id field of the first TD of the first URB
> > for older non-CFC hosts as well. So urb->start_frame should be
> > quite accurate. Its probably more off if URB_ISO_ASAP is set. =20
>=20
> Testing this patch on a non-CFC host with a bInterval =3D 1 device, I
> can confirm that urb->start_frame is now accurately reported when
> URB_ISO_ASAP is not set.
>=20
> When URB_ISO_ASAP is set, urb->start_frame is slightly off as
> expected. For example, I observed urb->start_frame reporting 1645.0
> (frame.uframe), while the stream actually began at 1643.2.
>=20
> This seems good.

Did you try with short enough playback buffer to get occasional xHCI
ring underruns?

Is Frame ID still correct then?

> > Added last frame of urb < +895ms to v2
> >
> > But only for urbs mid stream, and only print a message if check
> > fails. queue it anyways =20
>=20
> Regarding the valid window check for mid-stream URBs, what is the
> concern with an URB extending beyond the current scheduling window?

MFINDEX overflows every 2 seconds and the HC may consider such URB
1.1s in the past and drop it with Missed Service Error.

> Since the controller only evaluates TDs as it advances through the
> transfer ring, isn't it only important that a TD's frame ID falls
> within the valid scheduling window at the time the host controller
> reaches it, rather than when the URB is submitted?

That's true, but the HC is allowed to look at the URB as soon as it
is submitted. The spec states that SW shall never do such things, so
HW is allowed to assume that SW doesn't and make the dumbest
assumptions, if this saves them implementation complexity somehow.
=20
> Additionally, due to wrapping, and depending on the values of
> urb->number_of_packets and uinterval, I don't think this check will
> reliably detect when urb_end extends too far into the future. That
> said, I'm not sure this check is actually meaningful.

FWIW I have an implementation which checks it reliably, though it
doesn't support ESIT > 512ms to save a few lines of code.

> On 5/12/26 12:08, Michal Pecio wrote:
> > A particularly fascinating case is period > 895ms; it seems that
> > xHCI only allows submitting shortly before interval boundary, or
> > "SIA". =20
>=20
> For endpoints with ESIT greater than 895ms, wouldn't SIA become
> necessary to avoid ring underrun/overrun?

Not sure, and it's hard to test when most likely no such HW exists.
It's also unclear how much HW would support ESIT > MFINDEX period.

Regards,
Michal

