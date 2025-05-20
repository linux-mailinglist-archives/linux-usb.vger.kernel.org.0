Return-Path: <linux-usb+bounces-24117-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD324ABE08D
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 18:23:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9ADA16D0B7
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 16:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011B252287;
	Tue, 20 May 2025 16:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMSags/C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5B417CA17
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 16:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757940; cv=none; b=oTZfUIwrfCsjY36ne9+R6Jqdm4LPle/qIyVWperHDBzNv11lwdVy0HDlAlUy1CZ3e6QGrzN2bOrNbCkmjNBnhR8dn6zoCywyemTNLsHunnaZsn0wvPeNiMh2ubvb1rAWv/3RhFNPwbEN6MMB8b1OPhF/SzWmtuGtze6MeBndYOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757940; c=relaxed/simple;
	bh=mJ4NUMNT7wt47b7yrQ1W+nlKYIg2JJyeoXQS3nDKlFg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pH+AfmFnPBtbn8/O8hpokX+lYZkkAUawXLeFFYXRK748h8H4xFj+MIt6yWp70X/sqSoIA1gK2rjx24ey02cjQQ36WH7DeWUuGo1SEL85lNtXGmmmeXJAlCPJyfuaoxYgmj/kf9SgRngWR2IPLQLIa7CkGS2KJiaYngYWm3/BfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMSags/C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C92A6C4CEEF
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747757939;
	bh=mJ4NUMNT7wt47b7yrQ1W+nlKYIg2JJyeoXQS3nDKlFg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nMSags/ClWFCN0YgO9jMVefwDY0iQtC/8rQp/1abnBuGTSZ0K4to0qjYKvm7mQwO+
	 BTj8dxSXS1ypqe4N2ZFEkqz8DB3y8tp+i2YHlmnQfDKmZmLpHYwJEl6fLn3cF/dLKX
	 Jpa81w8wze5h+KT8ZsEKerKJzfDm9ur11cZfnc51SVYq+5r/5QEBf/8bvHTVCLPk5W
	 4/L63jRHXMoTQWZ2qrSMGgM8jkeEOcaxYhVST4uRHHllEm/aPQtsmQpxe4DHtSDqwo
	 AztCQfhhNEEWox1yMXkDf9d0M0QI6yveaPiWp9DW2pIb+7RG6R93Acp4+8vnDpKox1
	 aEKvXAODUm+qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BAB9BC41614; Tue, 20 May 2025 16:18:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Tue, 20 May 2025 16:18:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-Jy2cveRKpS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #59 from Claudio Wunder (cwunder@gnome.org) ---
Got it:

````
bash-5.2# dmesg | grep xhci.*quirks
[    0.000000] Command line:
BOOT_IMAGE=3D(hd0,gpt2)/ostree/default-5c836f8b9cf21db25d8ea8042cfcac18de42=
950e638fd2ab6f1bf522afe3bf57/vmlinuz-6.14.6-102.bazzite.fc42.x86_64
rhgb quiet root=3DUUID=3D4349ca0b-5bb9-4ad2-83a9-78d7440c02f9 rootflags=3Ds=
ubvol=3Droot
rw
ostree=3D/ostree/boot.0/default/5c836f8b9cf21db25d8ea8042cfcac18de42950e638=
fd2ab6f1bf522afe3bf57/0
bluetooth.disable_ertm=3D1 preempt=3Dfull xhci_hcd.quirks=3D0x4000000
[    0.064435] Kernel command line:
BOOT_IMAGE=3D(hd0,gpt2)/ostree/default-5c836f8b9cf21db25d8ea8042cfcac18de42=
950e638fd2ab6f1bf522afe3bf57/vmlinuz-6.14.6-102.bazzite.fc42.x86_64
rhgb quiet root=3DUUID=3D4349ca0b-5bb9-4ad2-83a9-78d7440c02f9 rootflags=3Ds=
ubvol=3Droot
rw
ostree=3D/ostree/boot.0/default/5c836f8b9cf21db25d8ea8042cfcac18de42950e638=
fd2ab6f1bf522afe3bf57/0
bluetooth.disable_ertm=3D1 preempt=3Dfull xhci_hcd.quirks=3D0x4000000
[    0.613780] xhci_hcd 0000:03:00.2: hcc params 0x0110ffc5 hci version 0x1=
20
quirks 0x0000000204000010
[    0.615279] xhci_hcd 0000:3b:00.0: hcc params 0x20007fc1 hci version 0x1=
10
quirks 0x0000000204009810
[    0.671965] xhci_hcd 0000:68:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000204000010
[    0.730414] xhci_hcd 0000:6a:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000204000010
[    0.733142] xhci_hcd 0000:6c:00.3: hcc params 0x0120ffc5 hci version 0x1=
20
quirks 0x0000000204000010
[    0.734136] xhci_hcd 0000:6c:00.4: hcc params 0x0120ffc5 hci version 0x1=
20
quirks 0x0000000204000010
[    0.736031] xhci_hcd 0000:6d:00.0: hcc params 0x0110ffc5 hci version 0x1=
20
quirks 0x0000000204000010
````

Gonna wait for crashes to happen.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

