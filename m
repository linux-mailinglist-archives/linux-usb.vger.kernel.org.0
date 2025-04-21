Return-Path: <linux-usb+bounces-23263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30536A953F8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 18:18:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 981CB1892142
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 16:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E5A21DC99C;
	Mon, 21 Apr 2025 16:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAHqkmgd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD42F3E
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 16:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252324; cv=none; b=O24p0zG3c/EbvxOOy/GXfcyerXvCn6YyP1XMOeqIPuf6f3HZI4nXMBRW/cNEvgcwr3/JBUd2VrNiDm5242WDiP/uD947xJXTUHVD6M4jdta6fuRTcLRs4ubNcgCKh7g1ubkkfKiEbpa+Ry+dUHXDj7YPwUmavyiPC/pRFZmCNBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252324; c=relaxed/simple;
	bh=0eR/FW9K8XR+j7Bad9nVcpfdEgSmcfYqyyax8Gy8Tkk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WMGXrTfi0e9BTIhZtZI4KDZ/BSACtVOoqft9dATUOvejnIWwO9n1ododcN7yeL6cKpBTLyYq8OoVsb7EzCDjLni4rgqMteY5rwTrkrYHLdqRYL2tyIs/JRRTXBnsRUmPYvxwHgEgWwKoHEhBMGblOoWy2kumm1VsmjMnvFyep6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAHqkmgd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B057C4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745252324;
	bh=0eR/FW9K8XR+j7Bad9nVcpfdEgSmcfYqyyax8Gy8Tkk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gAHqkmgdplo2DMwdjYjDwSU8v2rOk7eOZaGAz9vjaklkfAAWrwabPS2rDo/D4JPKU
	 MQI+/ukSLEHO++9F7Vc1eYmfmvDhJWn4ugTw5ph0+6NUA13xLvAuAmp3Svj/mMM1j5
	 pC6c0TeOcAJVJFI29YUlDAb4gkn9b3jEwWu1WeRNZ60gbFHo46G08wu43+R5oAkXGM
	 Ui+K9D5XPdoxfCKTn6LOveDSVyz7dr9NbRQxyK9JTGuAhBIITCt9pxlAD6J6iYDf4u
	 SBXBHu99Hy36iOEEPft7eGByNjKcTWhgayx8Gfsa3H13L+LQ/4jP/2bcdaC6+FlgTf
	 AKXOfiLlkqHpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 27F5CC3279F; Mon, 21 Apr 2025 16:18:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220042] kmalloc Redzone overwritten in
 usb_get_device_descriptor
Date: Mon, 21 Apr 2025 16:18:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m95d@psihoexpert.ro
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220042-208809-B7fNWGBtbd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220042-208809@https.bugzilla.kernel.org/>
References: <bug-220042-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220042

--- Comment #1 from Marius Dinu (m95d@psihoexpert.ro) ---
Created attachment 308006
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308006&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

