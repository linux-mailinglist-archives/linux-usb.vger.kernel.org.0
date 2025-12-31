Return-Path: <linux-usb+bounces-31859-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED689CEBCAC
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 11:31:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED2AF300975B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 10:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D5C314B7C;
	Wed, 31 Dec 2025 10:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3oqeysL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4ED19CC0C
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767177068; cv=none; b=WfGYBgo0gBDjoXPlOzcgNcely/sT12qSDpwIO1I0nniarYh7SVgnzuxe7WK9+g1aSMNZlGjtTnD5oZgNnmZKwLy70LH0L9Rx9VCjGFdzLU7DaIbUOkPBHAbYqAuQWFMGgapiQt+JUJ5spEOewshF0v9kRHxilkxMhIFwvjsLRSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767177068; c=relaxed/simple;
	bh=6ixj6LCXae5CIFiNPVc+33nsYorZUB9skm26gukPGSg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cc47/pgyTSzV/nIsimunWMuJYvTNzov1xpEKGzGlsm8XrV1MJULWylOGdYB9zi+SBdqOv8X+MhmOnm0kHXsre7a9B3eu8kQW704mVAuu34s03ahvCnl+oK9c+D6B6empg6qM4dBOSLxHjr+GccAWRkrhaIt16PPBx/zUHfKVMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3oqeysL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B200C113D0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767177065;
	bh=6ixj6LCXae5CIFiNPVc+33nsYorZUB9skm26gukPGSg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i3oqeysLIHRtyvgjMHgjEzba/a3GoCY6gF/fWuDTG1Tc4e9XPbTEMZgcnIxoVvbmN
	 tnozdehKp20NhW7kFfJMX0aEcCcZL62iQgx+lWvAYlAlcUyEg8+BVUZpHddQAxFbrl
	 qxxztuGMa1gOJCnLbO3UAJU+/gFHPEAKMb6ZKVpG08uHwoRF0mT1EYSPUSOcI6BQ8q
	 HZniyYT9llQFqUXlMNF8j73MgYAFGzRHiXw72vnuezIu0EYkEF14GHFMUNHV5HLmfy
	 NNR1O9mt6BwTASQExqJpLXOlhEUgQEwIrceajy86PzdpW+rUa1MkcLXedxMg7MSPVO
	 TU6aUEDCGZVGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31BC2C4160E; Wed, 31 Dec 2025 10:31:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 10:31:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-DJKjJALa77@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #6 from Thomas Jetzinger (thomas@jetzinger.com) ---
Thanks Mika, your xHCI runtime PM suggestion was correct.

Root cause: /sys/bus/pci/devices/0000:00:0d.0/power/control was auto.

Fix: Removed xhci_hcd from TLP's RUNTIME_PM_DRIVER_DENYLIST so TLP sets xHC=
I to
on on AC.

Result: Hot-plug works. Dock enumerates on USB 3.0 with ethernet at 5000M.

Note: TLP ships with xhci_hcd in the default denylist (defaults.conf), leav=
ing
xHCI at kernel default (auto).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

