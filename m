Return-Path: <linux-usb+bounces-32980-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHC1D97Kf2nCxgIAu9opvQ
	(envelope-from <linux-usb+bounces-32980-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 22:51:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCACCC74E4
	for <lists+linux-usb@lfdr.de>; Sun, 01 Feb 2026 22:51:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 569B53007F52
	for <lists+linux-usb@lfdr.de>; Sun,  1 Feb 2026 21:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E732E1F01;
	Sun,  1 Feb 2026 21:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXqDli5I"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3C11E1A3D
	for <linux-usb@vger.kernel.org>; Sun,  1 Feb 2026 21:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769982676; cv=pass; b=IYESpz00bztLIAFmivCBG4LR7ZvJ1KX9VIOyYgNxAYOTmLTx0PT2anXDraQjoIkwlWFJaXLisxhR9Y46EnL7FudHAW3BIIu6aE0hyD7k/j5FMxHxRXRckrZ9Cis3w018wf+bdi8mB4fLBaDyBqhvDBfmr5JHHzOCm6/qC3vkhZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769982676; c=relaxed/simple;
	bh=kwpfg0ZVrz567GYf62txLzegDx4FdKLKozNj2UWgs2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k7qLrFUTMzrdbpHgbZdWjLTkvOopVFZ8iDJBSCsh6TLzUr5hy/X8i+F8r/HML1ej8ByTI6hkEjJ5/rz8euCRZmDeTtFWlNV0UPzZOYwAjI0fQDgDLDR5rDws1RaWZPzqz1ndFQg0c/dp1PfdXEhN19iIFbrSTdf3IcMyUut1kcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXqDli5I; arc=pass smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-124a95e592fso3217962c88.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Feb 2026 13:51:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769982674; cv=none;
        d=google.com; s=arc-20240605;
        b=X+8fcgFAvFTTTs4a2+O79qIN6IVDJGR2h5VFIdSWfwHDtJhTWUG3dC78yM6u4IpEiX
         Qfit8ZJiSfSsOkMnnUB3MVgsDgoJQ4qN/Dqd5Zj7iFP3wOqnWgUX+LldM192udnDiZkP
         WwlZ4J+/UG/cD8qkEOvSmE8lL5iFxMOjkkzKbk/284hoLI2eQNE/QbW4wX6XYCiCVx36
         oJwKbGn6F78eh2QB46+cXE9pYrfydWqyEdwXQJifargd3cvXZ3uVR6K8nR/rFTsJF8+f
         5FJQUzszpN2tZxKYvkD953sCVPqsK2ulbgazWnIa6SQUtk4BKEVrm3xG58DlcD3vxk/T
         CceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XeKA7cavJtekB4Vvd8t/pKrhDnNoXuIB+ADubn+vkJ4=;
        fh=W9zxszOLUxn/BQYHX1Y4t2Fb7ukzH9yfg0Ys8lHvHgk=;
        b=h/xWKmNRlbCZzdAzHMEqMmQed1FtXhnBfCgdktrk8JwNYvg7AnD9fMtwVwh4KmBARy
         DNmJtSw8nrLE6KWSpu9NUXnhdLh6PCbvl1hyTONBSHSLCYXs9GB9BweJrgbYb19z8hiN
         ZUxJmFiqMcYoZfuPaP5tftp+YAoBUSenFLNazTXece4Dz/boP+ZxeYPtUUQBErcw/OE3
         2k0Del+OqogahKfJPL50jQEBwZ45AQ2tFTitmpiHxaQ7PpkhmhkXZ622NNnlo3+mZHcF
         88G7kSlOYRWo80C5mWuJk17dyluW1E/P02P5TqS0kBJkR68zYGqvF6fPCu4cgRmufR4v
         TqAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769982674; x=1770587474; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XeKA7cavJtekB4Vvd8t/pKrhDnNoXuIB+ADubn+vkJ4=;
        b=DXqDli5Ik1ELrHRrxi8hWv61bfprjoDMIvIw5+PWqRy/VD5/f8oCwCTUbQpcHAePiu
         QaJivYVl7g1Evf11n/YmfFkTt/vE6YGXywQrD862VQDvHoS+2yqkV9LhimsciWInAiNH
         EKcYfsvyR6yj6y7MP4qdKHfkkSqPBacQacTecNzNi8saXrYUN22Rg+ab1gGoeGH1UEUk
         mdNd+lkdHaVpbHvcQho0mP8NQOhhxTCFZTEenZxmB0SQZFx+rBFYZa+jewrG6xu2IGg6
         q3kUG2E/bwR8FXDHpyV7rNRcKhLaAeVwFVt2vcOx1MyLqOxxByXZEIx5RL8Lw9Lfn0a/
         rXZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769982674; x=1770587474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeKA7cavJtekB4Vvd8t/pKrhDnNoXuIB+ADubn+vkJ4=;
        b=cO3T5HUZl+yDQsyWdX34+NS6VHp59IkXVbpDCiAv3wrHXXDQBTDN7Nckz7dJx+Ojcz
         5q5BfgOJPDlLiNvXMJgY0HLRsSszQbt4kVQG6dtkDa5UbhT5bVtwc9rS2Mk5ie/+hgZ1
         sRqNc+Ri5yMZmBkMIRG/MtFOOSF7gc/gn7lmyvy81w33fdGQmYVVfWix3iffi2O/tKla
         QAGoNCeEFnbQteLIzG/1Cyck/WXybqUBwVFRjmGgchdUp+VaSsjsvElsWmOmnsJ+nPWP
         vrXiIGo0PlKeR+O+KeY+BUfghLjwiRg/9oZNT9DOBxvABOXe+oYTHRn5XKCbeehTVwjK
         h+hA==
X-Forwarded-Encrypted: i=1; AJvYcCV+ftGp2vGW7vckwEKQ1tLcujgvw6MAlpXS0L/JqHrztFG+XuC1I3INcxgm/sNguwqHPHZOfxV5t4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0erriUIhcUSbn5AAC5Ja2JFsDQov7YZoMZxa+8dqUyrEBTsR
	cXfwRf7lr6IOeOn35U239Z30ZjiBh0zyGZmtWCRDVUz76ePFPIvtlXg2pJnW6qjRvmtwhjvr2ct
	tNs+FgnZYfP2OkDwA93T+K4T8Ws8p4W8=
X-Gm-Gg: AZuq6aIFwj1+3OOXpuubfkHN53NKLQyNO3Qbox7YWWdP/C9f/z3Ym3Oo1zVFaIiOdLc
	jHZXTSqKGw1a5IEYuBqGebLySG3XkP4RHKH113i+8qJdL8tvUVaTQcDhYRrzqlMo++IWTQsRwkE
	OvSxHjwbJkvpxovFHCDRiGAiCXd4GgKnqW3mIVXhb0M5Pd5rpTdHRPgj8LDZwP/yG4kXMLCvMyV
	9JAiW1s4B1EPsZxMD/8Yg6yTrhyKO+9JLh48ygAVW33GEc9vV6o5AaiCIMuL/LJ+Ote8D7yWbeo
	BVozF3/7hGHY4NZnOWJBbqNOWknq
X-Received: by 2002:a05:7022:fa2:b0:11d:fd26:234e with SMTP id
 a92af1059eb24-125c0fad94amr4583788c88.16.1769982673719; Sun, 01 Feb 2026
 13:51:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAOQ1CL6Q+4GNy=kgisLzs0UBXFT3b02PG8t-0rPuW-Wf6NhQ6g@mail.gmail.com>
 <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
In-Reply-To: <1ebf9d19-7293-4902-857b-164fd4d21f25@rowland.harvard.edu>
From: Liam Mitchell <mitchell.liam@gmail.com>
Date: Sun, 1 Feb 2026 22:51:02 +0100
X-Gm-Features: AZwV_Qhs-WY2_60cX_c9YRVlzLK2U4abGWLUMcy3kdEuDKMm80Vfms8FqliBrew
Message-ID: <CAOQ1CL7RpygHvzFhPLFsiVB7PFOh2t+_piO5vFJ5V9LCBC_LWg@mail.gmail.com>
Subject: Re: usbhid: Intermittent EPROTO errors trigger USB reset and
 interrupt user input
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, linux-usb@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32980-lists,linux-usb=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitchellliam@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CCACCC74E4
X-Rspamd-Action: no action

On Sun, 1 Feb 2026 at 21:40, Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Sun, Feb 01, 2026 at 06:57:06PM +0100, Liam Mitchell wrote:
> > Hi,
> >
> > I'm trying to understand and fix intermittent keyboard/trackpad issues
> > on my 2013 MacBook Pro running Linux v6.18.4:
> > - missed/repeated/sticky keys while typing (this thread)
> > - trackpad stops working (see "bcm5974 trackpad broken after USB
> > reset" in linux-input)
> >
> > The keyboard (usbhid) and trackpad (bcm5974) are interfaces of a
> > single full-speed device behind a high-speed hub:
> >
> > /:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=ehci-pci/2p, 480M
> >     ID 1d6b:0002 Linux Foundation 2.0 root hub
> >     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/8p, 480M
> >         ID 8087:0024 Intel Corp. Integrated Rate Matching Hub
> >         |__ Port 008: Dev 003, If 0, Class=Hub, Driver=hub/2p, 480M
> >             ID 0424:2512 Microchip Technology, Inc. (formerly SMSC) USB 2.0 Hub
> >             |__ Port 002: Dev 005, If 0, Class=Human Interface Device,
> > Driver=usbhid, 12M
> >                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
> >             |__ Port 002: Dev 005, If 1, Class=Human Interface Device,
> > Driver=usbhid, 12M
> >                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
> >             |__ Port 002: Dev 005, If 2, Class=Human Interface Device,
> > Driver=bcm5974, 12M
> >                 ID 05ac:0259 Apple, Inc. Internal Keyboard/Trackpad
> >
> > Logs preceding one of these events:
> >
> > [19607.563871] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19611.523681] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19614.550685] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19614.563878] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
> > [19615.050802] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19615.067673] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19616.822636] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19616.835934] usbhid: usbhid 3-1.8.2:1.0: retrying intr urb
> > [19618.126656] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb status: -71
> > [19618.126711] usbhid: usbhid 3-1.8.2:1.0: resetting device
> > [19618.126728] usbcore: bcm5974 3-1.8.2:1.2: forced unbind
> > [19618.129942] bcm5974: bcm5974 3-1.8.2:1.2: trackpad urb shutting down: -2
> > [19618.155292] usbcore: usb 3-1.8-port2: not reset yet, waiting 10ms
> > [19618.217146] usb 3-1.8.2: reset full-speed USB device number 5 using ehci-pci
> >
> > Both interfaces receive frequent EPROTO errors. I collected statistics
> > on the error interval over a 30 min idle period:
> > Interface, Count, Mean (s), Std Dev (s), Median (s), Min (s), Max (s)
> > Trackpad (bcm5974), 631, 3.21, 4.75, 1.74, 0.01, 35.62
> > Keyboard (usbhid), 71, 26.82, 24.90, 19.34, 0.92, 107.74
>
> There should not be this many EPROTO errors.  The fact that you get them
> indicates some sort of hardware problem.  Have you tried swapping the
> cables, hub, keyboard, and trackpad for different ones to see if that
> makes any difference?

Thanks for the reply,

These are the laptops internal keyboard/trackpad/hub. I would have to
remove the glued-in battery to even unplug the internal cables. If
it's a hardware issue, I'm assuming it was like this out of the
factory.

I haven't had problems with external devices, they go through a
different USB controller.

> > From debugging I understand these to be missed micro-frame (MMF)
> > timing errors in the host controller. They require URB reset but not a
> > reset of the whole device.
> >
> > The bcm5974 driver simply re-submits the interrupt URB. This is the
> > best behavior for these errors on my machine.
> >
> > The more "correct" usbhid driver will delay URB re-submission and even
> > reset the device if a second error is received within a 1.5 second
> > timeout. It's these periods between EPROTO error and re-submission of
> > URB where keyboard events are missed (missed keyup == key stays down
> > and repeats). The default error retry delay of 13ms is relatively
> > small but a full device reset takes about 200ms. With the frequency of
> > errors I'm seeing, every ms counts.
> >
> > Can we improve the usbhid error handling for these cases?
> > 1. Reduce first retry delay from 13ms to 1ms?
> > 2. Reduce the stop retry (reset) timeout from 1.5s to 500ms? 100ms?
> > 3. Require 3 or more errors in the timeout before resetting?
> > 4. Ignore EPROTO errors for known hardware/quirks?
>
> It's possible to do all these things, as far as I know.  However, it
> would be better to eliminate the errors completely.
>
> > Are there ways to differentiate these safe-to-retry MMF/EPROTO errors
> > from others that may really need a full device reset?
>
> Not that I'm aware of, other than just by retrying.
>
> Alan Stern

Liam

