Return-Path: <linux-usb+bounces-31972-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64FCFBB07
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 03:16:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72036304BCBE
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 02:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79224284898;
	Wed,  7 Jan 2026 02:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAu0O6AF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013BD281356
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 02:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767752183; cv=none; b=QO51Yu3BPztS/2/Gbk98GF904I/rUceyMlkVPXw1PTc+7/KLHaYu8eIGLauc2fjy/qPL6dWAnaZnuR2KJJENIdfLu58z6ISSXKqDnAMnOChNjsKYDgFmpio0ZCZzO13Xj3/P+XGK8UgeMsFJ/6gUPgIIuYgYX7bcRVYZNA8freE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767752183; c=relaxed/simple;
	bh=Jj4s8533l07DVHzONn4MhppO1E6IJdaUwZQDkVIbRvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UoDVWRng9aawOHYdg3n9zYyFyUOYZF7FUKm57zoWJfMJM4Ol30iSWlwUv2zseo5Gm7wNNG1uFCgOGNVBtQxr+jBLi2Pnt3r5B9k/DqJCBP3njkdGXILQiPQzheXGzqM1p6iaRAbInlVOlItIIhl1g9kxa0KleARX8EmOYWLSqi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAu0O6AF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9658C19423
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 02:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767752182;
	bh=Jj4s8533l07DVHzONn4MhppO1E6IJdaUwZQDkVIbRvw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AAu0O6AFj5eT/Pp8AAONW2JKThLIxHAY4LkCSdwsisAjLnIiZOutCqOyRVmcAekKM
	 5rbt96Y6HvBQQtEiWLNHWYLhTJGL75dB3l5ENcp9WXoKOmlwhhZ6W4AtaQk+CdDOzo
	 IZ+aAo3MDUVk60cUIlflpBdfJzZ0P8o7tI8BR6SU1j40GhUiTCyQ3mZny+ohHlO/qc
	 Angrqv4qmwMg9Z7YSeKyJ1S7uBSrnTNA38EBxP6QNSHro5my+hkveY6iYk/hxHDuGe
	 1WDgcs8LC5MTh5FS3Tjfga/JDjtJc5Cu2Vkav1LbpDDqcfslm/7U2VliH/jJCJrOwa
	 igTlbq2r3xbMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BDCF7C41613; Wed,  7 Jan 2026 02:16:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Wed, 07 Jan 2026 02:16:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cvb3452025@proton.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220002-208809-XSCoDBbGYB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

cvb3452025@proton.me changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cvb3452025@proton.me

--- Comment #5 from cvb3452025@proton.me ---
static const struct usb_device_id rndis_wwan_ids[] =3D {
    { USB_DEVICE(0x12d1, 0x14dc) }, /* Huawei example */
    { USB_DEVICE(0x19d2, 0x1405) }, /* ZTE example */
    { } /* terminating entry */
};


static bool rndis_is_wwan(struct usb_interface *intf)
{
    if (usb_match_id(intf, rndis_wwan_ids))
        return true;

    return false;
}


static int rndis_bind(struct usbnet *dev, struct usb_interface *intf)
{
    int ret;

    ret =3D generic_rndis_bind(dev, intf, FLAG_RNDIS_PHYM_NOT_WIRELESS);
    if (ret)
        return ret;

    /* Only mark known WWAN devices as WWAN */
    if (rndis_is_wwan(intf))
        dev->net->type =3D ARPHRD_NONE;

    return 0;
}

Maybe you can try to bind only usbid fits wwan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

