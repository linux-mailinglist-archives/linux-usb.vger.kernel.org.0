Return-Path: <linux-usb+bounces-35321-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INaJFkcOwWk7QQQAu9opvQ
	(envelope-from <linux-usb+bounces-35321-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:56:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F00672EF77E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 10:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D0AC3007536
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 09:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF21D29BDBB;
	Mon, 23 Mar 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="akYCfoHc"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31659387357
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259779; cv=none; b=lW8JxC1GbZA1KrcFPF3bgbVaFOrsTSApNzdHCq8MlMTxzfWox7iNvjalxR2BsUJ3HZ+ubn70VyXcGKi/txWkTnO8ayXBOE1ORqIh9GGgBfCA0OsikDZPsj/9t4sCj9CxU5ejclPnNqvmn/Zd5NGpfIkGl1a8V2NsfnYPydsq1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259779; c=relaxed/simple;
	bh=3/Rg/BX2DfUy3s37k/M8yXA5dRTcBuREAmBzZiqXRP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzpMIkgDr+ntKROKeho9Gir5D2AGRsDvYyKMeBcHuJHlTI45qd4qG9IiUBssVSAgmScfucC/LAyQdF2Uhbp8axIjxyx5NW5t5YzBV39TbyPVvk7UDKWv17t92CESIH63wiPO/+lSBeObtT6LUotj+KimQC5wyJVuvfXHi0/lGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=akYCfoHc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6644a3029b3so6093569a12.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 02:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774259776; x=1774864576; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bU5I+1pCOUAYiUlxW8VCH/e+rD3CTOAJqq49cAprQ0w=;
        b=akYCfoHcb3UNJ6ZTRoK3+uEsg4IjuUvOwG07ngUfvDQGljAEyMwG42SrG53z32gkpP
         12JFtH0vLsWVyAF4zDvfY1SXqZdglU8RJvfaUkklrUNagEQZj4PyX51wthdVbkdbh5LJ
         hOwVyyQEaQ9KBTnPBeZYorzxxYmALrEWZNhEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259776; x=1774864576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bU5I+1pCOUAYiUlxW8VCH/e+rD3CTOAJqq49cAprQ0w=;
        b=sZLnFUmmes9gXjhYa/vBv7SJdeSJgC5hvapxZ4fI3ZwFA9rtX9EV9GJDB0iJRUSR0B
         nWc3YtxDCF1zQZ6KuWk48c5wXV5mVpuHNoP/M/mttFsVosUrJQe+UZfO4Cp+IpGrWLow
         NdoBUcZg25Mo37vp/ALE0iWu8H9wSISLkitw7bztlcxwbyz5mk5AmJms7KWH3peRCdMg
         SKRfMOjZgj4raqivCA40QY+cxbt4AhzLbDLA7Bzea0PloAp45Sd7/TtZqc0SpVR7FlFK
         u/1/Ox3nTYgUonb8qqT8qL6lIPsuwun9YNpBNKFpCelJVktKJKg95a4yNlpgxznX4HiL
         6+OA==
X-Forwarded-Encrypted: i=1; AJvYcCUlASf2pJHD1rXoiU6O6sMfu1YmwwRCsoXa9zJkRxBBrWu5/nMayxYI6YfD5KPFJiZdNWCxnneDoFs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoSwmsY6ekk/WXpUd0g1yMBTIAbc33HqJncdbu95XreJXvbPID
	VY3gHlU1vgwQ9r0dvL1c7Ys3oWzzM8eZucLI8MF4qKKaiTGFO55obGxD8CqeRIGElYeM4fzLcIF
	BL+kU5w==
X-Gm-Gg: ATEYQzy4U8TJcDXHMFLVMQQaIQ2UHxgam6WElKJvJlN84EK/073o78Hh6GcFUh3deRw
	f0RMG1PRZXcKweDygASx6fWLttiillHIIRxVz2eRV5GQcAX497CNZbdpVUumuxVfd7jwjYbsCXP
	9e2kCd+B12hLS+i9LaqeWkU3uBZ7CFLBW0o+Api5jjcXjAb9J3qsCjD/TY9GbK35Cui4xvUlq3P
	OcaoICbPpb1TFcU7o2wfA2ahuh/mctyrKrEa32QC9SAlye7TM/hzAkv1m3H6MSRud18L75recWt
	TqIEcC5sFYLHBtxFupHnraRyG7+tidO890rjFegkS9jrdyYYHNyLsY1bPfevCdztcQYHI0ywZiK
	WQElJAY3RrT/eOIejd2YRKurL771XdVV97nuoqyW1YYVxE0ALx4i8MK+/tdynPXGKC1guhNOj11
	QIejjhBUFlCGV/+9KxsQ5SirkoAHzhufCNkXix8Fl+/61OfyrA8/eMGyqhKTXc
X-Received: by 2002:a17:907:72c7:b0:b98:6177:2ef8 with SMTP id a640c23a62f3a-b986177770emr322002166b.20.1774259775418;
        Mon, 23 Mar 2026 02:56:15 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9833663137sm478913766b.49.2026.03.23.02.56.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:15 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b97f9587e6eso531266266b.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 02:56:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOMYwXThOt3gWI9M78bYwiTN3yjzN0O26EieOJPQ8rSj63KiTn0pr8wWxjxjYVoGcvkhnhf2lYXDE=@vger.kernel.org
X-Received: by 2002:a17:906:a895:b0:b97:8503:8313 with SMTP id
 a640c23a62f3a-b982f30378emr724881766b.27.1774259773686; Mon, 23 Mar 2026
 02:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260321223713.1219297-1-jp@jphein.com>
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 23 Mar 2026 10:56:01 +0100
X-Gmail-Original-Message-ID: <CANiDSCsZf0QWzCQdgFC=hj+V4ChCynwjRNAz6u-F3Y8vzZXXDw@mail.gmail.com>
X-Gm-Features: AaiRm51pgrzPjR2hqfRCdAFfdxEd-_k1LaQPVJwPrlN7jYDCE9YsC62lPeYFY_o
Message-ID: <CANiDSCsZf0QWzCQdgFC=hj+V4ChCynwjRNAz6u-F3Y8vzZXXDw@mail.gmail.com>
Subject: Re: [PATCH 0/3] USB/UVC: Add quirks to prevent Razer Kiyo Pro xHCI
 cascade failure
To: JP Hein <jp@jphein.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[chromium.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35321-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:dkim,mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,jphein.com:email]
X-Rspamd-Queue-Id: F00672EF77E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi JP

On Sat, 21 Mar 2026 at 23:38, JP Hein <jp@jphein.com> wrote:
>
> The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has a
> well-documented failure mode that cascades into complete xHCI host
> controller death, disconnecting every USB device on the bus =E2=80=94 inc=
luding
> keyboards and mice, requiring a hard reboot.

Have you tried reaching out to Razer in case they have a new firmware
that fixes your issues?

>
> The device has two crash triggers:
>
>   1. LPM/autosuspend resume: Device enters LPM or autosuspend, fails to
>      reinitialize on resume, producing EPIPE (-32) on UVC SET_CUR. The
>      stalled endpoint triggers an xHCI stop-endpoint timeout, and the
>      kernel declares the host controller dead.
>
>   2. Rapid control transfers: ~25 rapid consecutive UVC SET_CUR
>      operations overwhelm the firmware. The standard error-code query
>      (GET_CUR on UVC_VC_REQUEST_ERROR_CODE_CONTROL) amplifies the
>      failure by sending a second transfer to the already-stalling device,
>      pushing it into a full lockup and xHCI controller death.
>
> This has been reported as Ubuntu Launchpad Bug #2061177 and affects
> multiple kernel versions (tested on 6.5.x through 6.8.x). There are
> currently no device-specific quirks for this webcam in either the USB
> core quirks table or the UVC driver device table.
>
> This series adds three patches:
>
> Patch 1: USB core =E2=80=94 USB_QUIRK_NO_LPM to prevent Link Power Manage=
ment
>   transitions that destabilize the device firmware.
>
> Patch 2: UVC driver =E2=80=94 introduce UVC_QUIRK_CTRL_THROTTLE to rate-l=
imit
>   SET_CUR control transfers (50ms minimum interval) and skip the
>   error-code query after EPIPE errors on affected devices.
>
> Patch 3: UVC driver =E2=80=94 add Razer Kiyo Pro device table entry with
>   UVC_QUIRK_CTRL_THROTTLE, UVC_QUIRK_DISABLE_AUTOSUSPEND, and
>   UVC_QUIRK_NO_RESET_RESUME to address both crash triggers.
>
> Together, these keep the device in a stable active state, prevent rapid
> control transfer crashes, and avoid the power management transitions
> that trigger the firmware bug.
>
> Tested on:
>   - Kernel: 6.8.0-106-generic (Ubuntu 24.04)
>   - Hardware: Intel Cannon Lake PCH xHCI (8086:a36d)
>   - Device: Razer Kiyo Pro (1532:0e05), firmware 8.21
>   - Stress test: 50 rounds of rapid UVC control changes, 0 failures
>
> JP Hein (3):
>   USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam
>   media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
>   media: uvcvideo: add quirks for Razer Kiyo Pro webcam
>
>  drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
>  drivers/media/usb/uvc/uvc_video.c  | 33 ++++++++++++++++++++++++++++++++=
+
>  drivers/media/usb/uvc/uvcvideo.h   |  3 +++
>  drivers/usb/core/quirks.c          |  2 ++
>  4 files changed, 54 insertions(+)
>


--=20
Ricardo Ribalda

