Return-Path: <linux-usb+bounces-27355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7A6B3A82E
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 19:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5FA0176F42
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 17:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D95133CEBA;
	Thu, 28 Aug 2025 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmu/THtV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22AEE238149
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402398; cv=none; b=kfj/JATghWFrMqOD8b33LYUZTQAj1hfUWGZh3EohXnSEtG/duvSHEqJlQi2zv5VX8+YXSdc6k9ff6x0Zpk9Zr9Fp2FX175X6s5vl63hYkpp4kvdff4SFmbYyyWvCy8b34lq+T+Ud6kMS2obuJcAWgLrWB6W/T3U9QMtYFt+tzz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402398; c=relaxed/simple;
	bh=MN73AkSFGCVqweMfRL4pa86FcjbrHz6RtT1Polohap0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LBcQ/bfhFiGX6UOt4b8KhAvuoNmKwCwsT5gmBA+KbmlnYgD+tR1fY3gNUtrqivRUcY98yyNHY/xNy7eEhAz2g/CL7qbb1/NtuB2/Fz+Lhd04Nc1D/ByNJ25F1X/bTHkwRTmYmDQZo+swiDU4TaCbB2VjDsNLXcRPg5MjqDkdJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmu/THtV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85C04C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756402397;
	bh=MN73AkSFGCVqweMfRL4pa86FcjbrHz6RtT1Polohap0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pmu/THtVNFodDpJqAmNr37LVdf3iE2cn8NgJCqOIFoWSLtDKS99Y5ct4FCprs0NPL
	 sXBu2Ngs6B0EmF7xwaNcTAOr7X9yQxRqeaGDqE+pCPSt835644QiLjotwNXE/gu+mh
	 c5TJLgHayLiTTx9ovUuGPbl0O5MCVwW9qSB9t0RYzgW+EmtA69/cPj9+ASHujVbRPH
	 LXE7lvpMKi7XBq4snjFvg4HdRpOIpOtrJ86YyO4z9JzilbIWq0aiDaqWDSUog6ncme
	 UI+lwzPg8rSbNLi/I80i6OSp9Cc+5hp5PgQZWts2rGe/39zJtipZLu0Dn39UWjBbRz
	 7WG4YgoY2nxQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 757D3C41612; Thu, 28 Aug 2025 17:33:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 28 Aug 2025 17:33:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-vQqsDjhJw6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #13 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308572
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308572&action=3Dedit
dmesg log, S/R, usb_storage device disconnect. dyndbg xhci_hcd, usbcore.

I've posted a dmesg log where the usb_storage device disconnects during res=
ume
and where dynamic_debug for modules xhci_hcd and usbcore are enabled. In the
dmesg log the usbcore messages are not annotated with "usbcore" but as devi=
ce
related messages "usb 3-4:". There are just few extra messages with usbcore
dynamic_debug enabled. Initially I thought that my misunderstanding was more
profound, but after looking at source I found a few dev_dbg messages from t=
he
usbcore source in the log, for instance "Waited 0ms for CONNECT".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

