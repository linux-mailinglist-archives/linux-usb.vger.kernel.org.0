Return-Path: <linux-usb+bounces-31973-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0A0CFBB38
	for <lists+linux-usb@lfdr.de>; Wed, 07 Jan 2026 03:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CCE93014AEB
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jan 2026 02:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5192323ABB0;
	Wed,  7 Jan 2026 02:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPBnWS2E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD89230BD5
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 02:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767752215; cv=none; b=Orqlejkr/RU5Rtz7nDGNGM9TsoTZyIVfXFgzhvLstcJlhZR1b+bIw+WQChxpPazmp1EPGxtODjhDxM/RUZWUCf7Wn5RnKRECUzRNjlCk3g5PKdwmd8a1hu5+wLMqo+UDk9y1VrfkmGiaBZuC3OtZfucvw6QeuoVDi6EaVOH5BU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767752215; c=relaxed/simple;
	bh=4L9PC1uWF4ad2WGlpy3eQok2Utb5T4mR27yRWTd9qXI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N3WqbXKEv0mBIdNIlbAWpfgE+pjHpipLj4JzhvO+w1G/U8Q4zk6mRUrm1S5ns1MqntqsgV6kighiwSG/XiW7gYHk1M4uxmiYMNNBVRrXzvRfG41PNHmFzcZ2udtuCx4M6g902qNnxZ4R1ibixS2Jn2djvAAW9qBsjGxpoYc8+0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPBnWS2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41F53C16AAE
	for <linux-usb@vger.kernel.org>; Wed,  7 Jan 2026 02:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767752215;
	bh=4L9PC1uWF4ad2WGlpy3eQok2Utb5T4mR27yRWTd9qXI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZPBnWS2EhWyqlczwpqud4I5xmfkk2s6al1+efb2f7M8Rnhx6l0blGzxenqsX2yOk5
	 hNnLcVHt/W6wRWSUPAL/wG2X942zDqPvex2ybvvlfTXlvsOa4L40X0fqdxImyQj0UG
	 skio/h3N6cBrsaDrbrRznOj89l5im80KalXZy9kPkKzaY74WkEbtidDXtuDKOzMJnI
	 kyCrh7M5dXA74dMt3cXpelNlkpV5Ij4y5cQeYuxmtV6vgSKkNe2W/TWSchttiklGrl
	 Bs69hTa4TmrLEx4oUGT9NgxTNy5grtFMOG/fGmgYAN+IcPR2cMtfS2NoqvKTwA8gIb
	 IEL2GCtBvIduA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AC78C433E1; Wed,  7 Jan 2026 02:16:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Wed, 07 Jan 2026 02:16:55 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220002-208809-ZVW9zl6TlC@https.bugzilla.kernel.org/>
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

--- Comment #6 from cvb3452025@proton.me ---
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

