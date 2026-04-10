Return-Path: <linux-usb+bounces-36119-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qL0ZHFxD2GnfaggAu9opvQ
	(envelope-from <linux-usb+bounces-36119-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 02:25:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 049DD3D0C35
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 02:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B2A33017019
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 00:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0030026F29C;
	Fri, 10 Apr 2026 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="z6IkpPg9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B62727F3
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 00:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780690; cv=pass; b=GWQtQiWv7icPix0t88ux7XHP8OkRUBcdcwVFUzVR5bAhoiFr8N0Iyeg2LNdEvfk7BLM/gx/FEunZY2wMpv4FnX7NNqHmaF4bRvus2251abY0EF3VxHRiG4DNn0MTnQzpO2J9ikccBw5bD1PtXfz5Zwa+s4NMA892qCp9/12gwv4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780690; c=relaxed/simple;
	bh=lGEEv9glUe1Iivgjd8wqmSvhwzywsg/HbvNLx2jLX8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IN6NNcSpDM7mrXrw/sn9AYjtxXhHsOw/ejiUxnjMgN+ofYLJhMM+66HMuGsTsiTB2KcAo5oGGsUR3WOt4+C01coOU+7AmbHNNrU50P9URinYfX8oEDsbAdoOdDrPyt6zW3fN38YTCTLns0hslmBne3TWooDkL4R00WXxKeFrYMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=z6IkpPg9; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6500040ef83so1161030d50.2
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 17:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775780688; cv=none;
        d=google.com; s=arc-20240605;
        b=DhVV8a4Zt8gEBjgqZZFfGa5mN2NoGU67nW+TvNzXoFK47Yq5Tv9CzIdheCgoR4NRSz
         jdV9M3UMWflv71fc9bkBIhyO7NEBliVaXZgYZ6vMS/KfTUFiGdWXleHJ9/VIna4WTTYv
         x+0qvzof6Tnp/M3MpGv7vlVO8/HR6BpHWAnx0p+a+e1XxkgM5DkDbZ7i+CjLw1yvqKuv
         WCdPTPXZVqB8zLbCeLotQafxWTu10SiP17Tb4moA6wUC3yHIKtmg0xMBrMDyRzzuY0xA
         09vZf7nw4hlyw7bu2o7efsJPIuYdIOp8nA9K2sfqoVuQZ1/B0QPnlrT7V3PjqYKGlf8b
         D5Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        fh=O+pdUE1f9MveZ/8EKLLL6p2BAwH8Lw4urARxLm4gpvU=;
        b=X4KrU9/1rLG4miuY2E0bmBiyO+LuC0mQa4cAHJhoIlbd5XpbEoiwHhoxqMfm1SzYl9
         9zDAqcvmaKYxVbrh60qbALtkm99YfCnKIIlIh4JWzAO/V2p+9rHANYber6DWpIJYB6RN
         mzK2QLw7aI8CxIGIyLmZV/GnQMlr2zRSuERkYVECnmme44ODS93HarIUto7R3I8TN6sO
         MF+Jjg4oamarvCUKqlMKu8eVjeqdDn9uC6I2rqWq35ZPeHh2UyYMUsC/AuxWhTKeWZ9h
         fOyCIss3f+auvQoYif4R7FqcfMGcab9BVYOZt4+MVciaR7a0SSnYkjJtm9wGu5lhWUKT
         cHtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775780688; x=1776385488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        b=z6IkpPg9FiZX7MjmO1pGQMtosfRaIzbLwoFgylFlF55hVUqQhcRlvSN078b6SW9kVT
         q3pnL8Qi+AVlztf2QjgGn3bgTB8vQaVYK4PfjCZgGlltRiqodgHVd2yxVKdUYA/KGLL5
         0TtRYwCyepCMB0L0tNfOTSrnNase9xvbmhH8K1Rj3QLMUvqtpcdpR4GU4MaE478fBpGD
         Nq1RbjedD/gswOODFUoazeB9M3movUAegUCfEdlJNRtPgnCf4NSqhHJbepgTYjB4OKqf
         mOfVcWa31DtojL8eIKY4lkLvhyL6BV9qJAkr7ttMK0ndQIIBSIrFJtlUZZYeyhT9BbtJ
         dTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775780688; x=1776385488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PSTynu5H3U6NvBdR0vN3EDqTZRC1PjpEAUrWz8MB7/U=;
        b=jjaPG94U0hokNgrQVfmLlf56/9kYpZyomnY0dDk+/Y9SIh8hCp+dntqTptnAVdZBDe
         cCjJtkQXQVPFG66Nr8g85LHAqfV7vgHuWZ8SRjSUCsHdvtqiut/te39Q0rnDt/IQQD8X
         wrghNXwWOf1md4dKokTM0MJ+jr5aSU0PC25EydZ8ZK6c09VNFa4Ugggv6cQAPm1maxMh
         zObFCRO/wrL2BsIt572vgOijZnMiEaayrZQORu/nMbCFpOZJsmfe5JGtrdG+FxOE2tx1
         xK2kS3Lr35i8V8n8b1L5ZPZWDroM6q/MgvQQixPyUuExEkVDvR5RMb7OXq2eTRZ1G4iM
         ByWA==
X-Forwarded-Encrypted: i=1; AJvYcCVr8dAJGrPkdjByGhxp3l2w1yt/Yaf13utaozlNuTx73NUAC/UbrSGOtor7QzFipGoZWfFatn/K8WE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTUIfkaBhhJG9JuMyaaz4WsfMSVnAqkUmJkWdCp9Zkvew19c66
	thVAmTEjvHvv0J/hnUeoCvKfBunAMtCekcDQ4JcOsL0p4ugX7JcrvhUypSeKDlWSYMpjSpgptJa
	UcPNmlBNLNP4iBqufuWjNiaTLcf2LGXIXSzRBrF0h
X-Gm-Gg: AeBDievmMgjOcOrCvetjj4kUTGJKK+3vo0LPw5gzxNHnr9/bl1FkJHs69d2z1zmS+Gn
	KQZQsyQDVL1dI/2JzvOVopznqifA4sOmbvWYJfV9rL8fhSqyuOqQn514FeMGORB1U6n2o6PFDLK
	p+Zj1e7J2YY/aKADkYiSfhjDLcHT3inoRmyDY4mvEscEuRa181dSojqnKQG7W3YA/ROprTFP74i
	sykYOM4mOGSfUimQv0o9bsVdfCxcYWcmKVTGHAUDz98+7VVB9i9xsgwlGsIHvQGox/BHZDVrTYT
	XQsVCf2QN+T97eB58K5DCZDMGdZfgNk0P3whkNJfJ49y9/p227uMQSvM0Ou8g8ut8g==
X-Received: by 2002:a05:690e:244e:b0:650:36e6:2acf with SMTP id
 956f58d0204a3-65198a9d38cmr786361d50.15.1775780688340; Thu, 09 Apr 2026
 17:24:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331003806.212565-1-jp@jphein.com> <20260331003806.212565-3-jp@jphein.com>
 <CANiDSCvsxP+npQTHUrMTp+Z8XULYKSLTz2AFu+WQnsLbRBGa2w@mail.gmail.com>
 <20260409100247.7cfb62d1.michal.pecio@gmail.com> <20260409221749.5e6bccab.michal.pecio@gmail.com>
 <CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
In-Reply-To: <CAD5VvzBQLGDrbrds=OrOOh5ptmVjP+nyq-jRHF5dCFzw+S6iQA@mail.gmail.com>
From: Jeffrey Hein <jp@jphein.com>
Date: Thu, 9 Apr 2026 17:24:36 -0700
X-Gm-Features: AQROBzDJCjlxavks6Ub5ZF6jfWDfLUTJG7_G3iHuw1Ym3HvJjO5KZjGocMMy4Jc
Message-ID: <CAD5VvzCVxn6ehen4vzbzJzm3Akc-0BREhMZrfsffXTz782jQcw@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for
 fragile firmware
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-usb@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36119-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,mail.gmail.com:mid,linux-hardware.org:url]
X-Rspamd-Queue-Id: 049DD3D0C35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

One more thing -- you mentioned referencing an lsusb from
linux-hardware.org for an "identical(?) device". Here is the actual
lsusb -vv from our device, confirming the wBytesPerInterval mismatch
you found.

EP5 IN (interrupt) from raw SS Endpoint Companion descriptor:

  Endpoint Descriptor:
    bEndpointAddress     0x85  EP 5 IN
    bmAttributes            3  (Interrupt)
    wMaxPacketSize     0x0040  1x 64 bytes
    bInterval               8
  SS Endpoint Companion:
    bMaxBurst               0
    bmAttributes         0x00
    wBytesPerInterval       8

So wBytesPerInterval (8) is indeed 8x smaller than wMaxPacketSize (64),
matching what you saw in the third-party listing.

Note that lsusb -vv does not decode wBytesPerInterval for this
endpoint -- the value above was parsed from the raw descriptor bytes
in sysfs. The full lsusb -vv (934 lines) is now in the repo:

    https://github.com/jphein/kiyo-xhci-fix/blob/main/kernel-patches/crash-evidence/lsusb-vv-kiyo-pro.txt

I will follow up with the test results from your patch.

JP

