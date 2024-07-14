Return-Path: <linux-usb+bounces-12197-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0071A9309FA
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 14:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A04F31F2176B
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 12:50:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FC476033;
	Sun, 14 Jul 2024 12:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZ5Twe6g"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B6171750
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720961443; cv=none; b=dwOHs+JkOUp9TQDMUhD2+Kxe0QGRDBLDKT8tbQWh5Ag0ZUEfWj2uUXCmntyAHH38xUREo2GqFy/x5m3zQVPRMbJPW0/5hlIB9aX/s9Qh8XWpcSdcTgYCZoJxm165yQxozG5Gb/+odhA+deRKOLWmWFaSqXbkNIcW4w0j1wOlHjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720961443; c=relaxed/simple;
	bh=P47BQjrroqZdEKEGLp6pZbbFOuOEV2FMcE9nIajNc38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tH2WEQxAS/TuURdvn9qjlOYYOd39MmCun085UHwcu9EMsCEMYX6jgXWCRrpO833E2k5m5sxp/WAdPNlNPzlDIOG7hCSxpRmRRiwyj/rNCEwFXJ1AeDhjE+9kmQCKMMAtFu3uDqbegoNYv7qDB7h2/uB/xwWxljRDmJZXGNH2CUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZ5Twe6g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 664CDC116B1
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720961442;
	bh=P47BQjrroqZdEKEGLp6pZbbFOuOEV2FMcE9nIajNc38=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rZ5Twe6gfRsvOlL5QXDgdBe729L4hVndA9NS40VGBRJHCCekIQ29NRBwNsWv5v4+O
	 ooZzWzvQUwuuugo1dCfubeGYF7yLvo9DzNq6/OoLgkoz/7+g1PadKM2bi1la7Y2hnY
	 UleqgiLbPYw8leQ5lMP8nV3xmcFPMXzlpFA6FUofgQqtUYSHpNXFgIk/iwnqJAugoP
	 MSfzDhjLIJDPgqBuobGRf1alVkDakvZmPz8WntwE7p4cmTlnyCaBRWjKUeNmsxuv+j
	 U4w+jnmklUfmOs2yJFkCXgQu10EwnE1Qwc+n19wCIOFPjXQO85WizcbgoA75SDqZeC
	 4dAXbCdK2GYTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5988EC53B50; Sun, 14 Jul 2024 12:50:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 12:50:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ZeroBeat@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219039-208809-oKhCVeRhwG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

Michael (ZeroBeat@gmx.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ZeroBeat@gmx.de

--- Comment #2 from Michael (ZeroBeat@gmx.de) ---
I can confirm that.

My case:
ID 152d:0578 JMicron Technology Corp. / JMicron USA Technology Corp. JMS578
SATA 6Gb/s

Kernel freeze immediately after the case is plugged to an USB connector.

Linux stable kernel (6.9.9) is not affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

