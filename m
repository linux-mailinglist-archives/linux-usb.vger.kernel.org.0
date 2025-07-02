Return-Path: <linux-usb+bounces-25387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8B4AF0956
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 05:40:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DE374E20A5
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 03:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B821187FEC;
	Wed,  2 Jul 2025 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tvrlh6x5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCBC1B0413
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 03:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751427595; cv=none; b=k7w/hWrHQsZrw3XkaX+50vBpgFg7yIL/eL5AL83Zyd4qU8cxdWjZl5CW/UnKHEPGcn8Yo3/HL+DBhRICCnGVptp57w4QxBWes6b/f6O5gbhAI+WxVqtugas2EnrPz1oEs80sob/P51JDZHJt/9oCY1/eTC5pymHvKcPBNxeusME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751427595; c=relaxed/simple;
	bh=46+GWMEUGh3NDk8dQ8xGMvVXbY7Lkbyn1P/SkgeN6Nw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hD/wt2S9LU6drbT2aaA7GpDlWJ6y2P7i4kJO2B9M4eq5EhT1FmBiue9+LRjYAXMt4tH2alcafzDbYV6gxQpF/d2xIJIpiClyYfiAM9CPB0w7jXHdBfXWkcESpeUotO6beGxVTKT/entXl8/CCAXeTx/a8GoVN2U4fh7Y4T9B0KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tvrlh6x5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E38DCC4CEEF
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 03:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751427594;
	bh=46+GWMEUGh3NDk8dQ8xGMvVXbY7Lkbyn1P/SkgeN6Nw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tvrlh6x5rEU8/2p2CAN5weCmyedTl8XNDwtgovFTzUDpHAL76cTa6WbPjkkIqokfI
	 qUk/xvW09HXNECUl6K+0XMmGdu4LWrvj4nfrSG5FFcml7KOXGCT314701wUtzqqdGQ
	 p/qfbS0VOoTrMMsGk4bywc9B8Ms9dPPx6oyxQRMwaBuqQtVo68kJqGirhn7LMuhUP9
	 syeJQYS5a9jL++cEtfUaOtKKabVdHtPi8v/NdwpVsyjOOsO7KPKBKzu3frodPfbZNL
	 IQDs/VcYoLdxXrRZREevuShKoa7DcvVITZw6mO3GM3Ma/0j4IaWPAyVrw2UTawNuRS
	 wfQoHrLQkv9vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CFFDFC3279F; Wed,  2 Jul 2025 03:39:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Wed, 02 Jul 2025 03:39:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-V6GWIghsZu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #10 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to oneukum from comment #7)
> On 23.06.25 12:03, bugzilla-daemon@kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D220238
> >=20
> > --- Comment #6 from Ryan Walker (fewspotty@protonmail.com) ---
> > (In reply to Oliver Neukum from comment #3)
> >> It is good that you have found a work around. But you were right. This=
 is
> >> supposed to work.
> >>
> >> Could you please post dmesg of working and non-working cases?
> >=20
> > I emailed you the working state to you directly because it had a MAC
> address
> > in
> > it.
> >=20
>=20
> Hi,
>=20
> are you referring to SerialNumber?
> You could set it to XXX and indicate that you've done so for privacy reas=
ons
> in the public report.
>=20
>       Regards
>               Oliver

Just curious, did my ticket get looked at and end up helping with fixing the
bug at all? Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

