Return-Path: <linux-usb+bounces-18736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4449FAD27
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 11:31:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EFB11884A99
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 10:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2E8D192D67;
	Mon, 23 Dec 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVHwuewF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644D618F2DA
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734949874; cv=none; b=QR3ekVRu/8T2gw6Z2PhKp2I2a2J/tQudpZOl7XQCM08OAVSHH8Ty1/+MHSFgAb7y2MpWeq/qmatP4kBP7a/PshTKV45yUWtvQUnLtVdMFWOzBGCiekM9IvwxE/MxrqQGiwKvdiv3b68r1RTrBZLOyCXU6vYVTz/FwUTA3MdTmDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734949874; c=relaxed/simple;
	bh=QIb8Uix2r4jkDxtXKqV3USffwkF9VJGVZQVFj0G08ZU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OExQ1vGDggW7oDqwQx4+vCkpaG5FzpHmDAmmbpfOk4Tfd3700jU5sX5xk09TthP1RR6Oh9e5R61vVd5kLaoPA7+t86Dr+t5K1dmLiR66XozFh0QXsSBAb8nd7usXT3tPohpxpgEbX7lrdlzJVRrItqzqWHfFWMBSi612I8JR3s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVHwuewF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB8B6C4CEDF
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 10:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734949874;
	bh=QIb8Uix2r4jkDxtXKqV3USffwkF9VJGVZQVFj0G08ZU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DVHwuewFA/iZ+w0FI7PNFGUcjTtGuFtNEhczY7ILFn0juSK9lA1XiNu6l6lTRY9dS
	 XDsluR3PYKqA6GYfjBMiBREYV/KVQtmgXt4II+rQ9v6iqzuvla0Iu1N2JJd5xdOZCV
	 FtR1jthrWjlUSeGgPrnhHg8GbzHqwNSRj0SjiR1TnjA/Ur8C8Jq9g8eBMqjKA6C3cu
	 7iGePH43m74PQkiwunjnPAxoMACNPc9M0vflofhFsGzGT5v1Rp9jVPPr6PlI9pkjRb
	 AFNf79077CPOL/VPKcJlTrKyqiN7dLUG5cvfsCbKjmGZ4IT0w1c92RbZ0XmT/DDuP9
	 oVRGDx87rkpAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF8E1C41613; Mon, 23 Dec 2024 10:31:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 10:31:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-SABwkKjOLZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #22 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
That's good to hear. Just to be sure, can you confirm that without this qui=
rk
the problem still exists today, on the same machine running the same kernel?

This enables the XHCI_ZHAOXIN_TRB_FETCH quirk which allocates 8KB for each =
4KB
transfer ring segment and leaves the upper 4KB empty, so that DMA accesses
beyond the 4KB segment end up hitting valid and harmless memory.

It wastes a few KB of memory per endpoint, and RasPI came up with a more
efficient solution, but this is something already implemented here so we co=
uld
try it immediately without patching.

BTW, there is speculation that the Zhaoxin bug may be caused by odd page si=
ze
requirements of some controllers. If your kernel has debugfs enabled, please
also post the output of:

grep PAGESIZE /sys/kernel/debug/usb/xhci/*/reg-op
lspci -nn |grep USB

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

