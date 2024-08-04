Return-Path: <linux-usb+bounces-12925-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8FA946E4E
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 12:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86ED51C209C9
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 10:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45C2628DCC;
	Sun,  4 Aug 2024 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYe3eyum"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3417C9E
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722767947; cv=none; b=K3hmuQ3HV86ZEABYW+biJnDn6yCwHjEClKkbszQvKJcVz9Jq56Mg3Y/qeVyCygjTAlxFwLPkZO8jaRcqJutd5AY4ltWTvE4zt1fc4il6AyL6SCxEzNkkH6Z5gMW43pvmddabAa/nhWqXp42hePNix1elvq/qx5wt9Hs19Z3+4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722767947; c=relaxed/simple;
	bh=iiG7PSln4VS8G33ZT9rs9KFEhzTY5WdA/tCujrqsAos=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GaY/nL1XEWJQGYMmxM5XRdcDZG1yIPbZBH9IyYKSUpxSTS3cibLSbj+xo5lbkalnURvWl+T9dNet6f3rD4MVRgWnG+JifWxFvOyl99ETA5sLa3mmCUVOO/m6Klw53SteNnwrA0xGzy2FAKUiBV1TvvcujZOtNN4hJb1qkPMUMzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYe3eyum; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47FCBC32786
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722767947;
	bh=iiG7PSln4VS8G33ZT9rs9KFEhzTY5WdA/tCujrqsAos=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fYe3eyumbp6c2acLbf+TH8nEyycv4wJLNXus8OAhCVm7suoe9kvWheeaxneLDaAt1
	 nzlGCXMkqk0PGbE7ElHZeyFdDZZk2K0M9Ekay4dpkGrBmghwmAIJ+l1ybxzJVRglmL
	 poClXO3S2B/gmzHtIioOTMwfTElDmik3SD2uHC0x2AX8+Du5btvsrrzjwcoWgr4FSi
	 k+4qhDhDuHYg5LllzRVjQRradd1jZOI811Rp5eUqpxKAdKfRsiIhjA0Ldl1T5Uhgao
	 uItJpUiGmU+VPKymUdVFnYkHDxxjXzW00Q50uOE5AMGinKXkM5t6I+P7zOaBxSMPN/
	 yHYszPz3nU0iQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 33B38C53B73; Sun,  4 Aug 2024 10:39:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sun, 04 Aug 2024 10:39:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-zoiUUyynND@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #17 from CH (com+bugzilla-kernel@c-henry.fr) ---
I'm sorry, I'm a bit stuck here. The kernel I compiled doesn't correctly bo=
ot.
It gets stuck at the systemd cryptsetup (luks) stage which failes (both / a=
nd
/home are encrypted) and nothing gets logged to systemd, the boot to this
kernel is not event listed in `journalctl --list-boots`. How can I debug th=
is?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

