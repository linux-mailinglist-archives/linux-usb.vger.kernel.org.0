Return-Path: <linux-usb+bounces-29352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E3106BE0714
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 21:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F45034D281
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 19:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5CE630FC06;
	Wed, 15 Oct 2025 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNAEIRlH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4926C30F936
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556709; cv=none; b=iqK48q9R4f1BDbT4oF1c8ihIBqUdKC7dOu2ptij4+wBycv0Ymw0Vt6ZaoDMbJaBxURDCfxKy62cYJhvzDRF/9nx/eOu9LdI220vR45vlg1zg8obOx2je1zynE43rdTyCfCxdXNO2w3O8Dyy4IhM3qIqfZNhJcWYkkNc5kGU5lq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556709; c=relaxed/simple;
	bh=B9sI/piFbrYZPxaDj9sY9j/qbxb7z5570bOdeMnEKiY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t4z1j9RlSshX4N4bvPI8hcCJubfsUeu4f9cu0Aw5owz9qXMJUXwCQ0cNaR6GDlg1Wgcg2ql+LvvnvlSGwzEAji5cDvV6txKt4qtEGTmROChj4PvcOu0n2ZHQYeaJQLAA2NS+TOhuaMWIAhjfZ46kf3vTYnDVR0NFPm07BxJ8aSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNAEIRlH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFC4CC4CEF8
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760556708;
	bh=B9sI/piFbrYZPxaDj9sY9j/qbxb7z5570bOdeMnEKiY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GNAEIRlHZYRKUg/GCBOfejIAXNhl2iRZi8l9trKt9s39GboamWUw1LCo4LnqlPGZZ
	 IkVwVW8cQQgWx986AI7+qaSSyH/A9msIL5LvhYH6zJmXGPksIgWJzwy5XMOu5k3Jtm
	 xoIBjchkHCeAaCo2bcmhF5CBhf8Fks0+wW1fTKE6ZnekxxGPABXc4QSr2C3php9iWU
	 JGEGlEdBtN3WPfwrC5FZFrZoZtgiz29v9+ap+U+VIUn1RH1hf2nqjIVzlzfZHQDc/9
	 z94OhPR+U8c7MDhkH41RKOBgVGdZbifhYsvaOO+SFjtDvMMfK8klsGsli6WYtdeAYw
	 0x1Ppzo6Ci2Pg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1002C4160E; Wed, 15 Oct 2025 19:31:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220628] USB disconnection after mounting file system
Date: Wed, 15 Oct 2025 19:31:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WILL_NOT_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220628-208809-qMeiB0rhFu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220628-208809@https.bugzilla.kernel.org/>
References: <bug-220628-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220628

Pierre Tomon (pierretom+12@ik.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WILL_NOT_FIX

--- Comment #3 from Pierre Tomon (pierretom+12@ik.me) ---
Follow-up here:
https://lore.kernel.org/linux-usb/4cmQKG1DjhzRBw@smtp-4-0000.mail.infomania=
k.ch/T/#t

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

