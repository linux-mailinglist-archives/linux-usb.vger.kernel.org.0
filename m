Return-Path: <linux-usb+bounces-21371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB59A4F3BB
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 02:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E28E77A6EC4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 01:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B739714A08E;
	Wed,  5 Mar 2025 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdGSh0HU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF70134AB
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 01:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741138214; cv=none; b=gGlb36ILO2zEDHgMfCz0HgVqg1KYOJwh03eIw4PdC/5RfNmaTbjTDPzRQgncTRrPqjBsjqelAwnjFKQWrDRAquFgXOmWo5MB9pRFZpMUrH5W3a7JdbYJWdQLnDFshVCfwjC39qGnABIC3yhEzOABzmb7XI0OabW/mjMabPLgrzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741138214; c=relaxed/simple;
	bh=2rXQUKnsXM9CtGMY46FCui4FKbBV3RC0AmNx6BSESpo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IySk4lb/7oNXEeNkCDVcBCFv2haAVYJ9vk1pR6s+sdzr7+uDqf6X6Zi/PTCePVzrAfMaXfoMGshko6Qnno58Mn3mRWP6skMwsZS1HFWY0v4Q9L7er5MPxOVq0R4r90UL+4Mg6RM5hJz88DM6e1rCFgU4moVVJLOcwcn1gQd5dYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdGSh0HU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB64C4CEEC
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 01:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741138213;
	bh=2rXQUKnsXM9CtGMY46FCui4FKbBV3RC0AmNx6BSESpo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pdGSh0HUuqvsHTbg3LWXg6tyiq1IONGD45H11dTk9stJmw5dnxus9/YtbGItkd6ce
	 8I8B+I1H9/fMyeKUzeiHFDfb5RLaTQjoIX7f6OBbMvgb8qFTKG8Jbdzv+rn3r5aMoc
	 xpKOYzV23TxroR/ruQNel2lx36v43IK5N9SpvyFbC+ACl9IoEatQd7cpmEBu5w1K2d
	 DK/RuZPlf73FKt+J01ZkbsfK8IPcb8XE620lDCqckl5sBBhFbL/feeBVGJYLScCoVZ
	 yAj0NPePNaGHoeDjan+sudPZsD2NyEZ2K319zxL8P26FCA6LMp2nDUs1T3r9QTk/Zk
	 Y4jJK0uyzCqqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8D0B7C41616; Wed,  5 Mar 2025 01:30:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 01:30:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-y30rsb9EDi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #19 from Thomas (lyz27@yahoo.com) ---
Created attachment 307768
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307768&action=3Dedit
dmesg after move retimers patch

Patch worked.  There's two docks tried in the dmesg.  A Dell WD19S and then=
 the
pluggable UD-4VPD.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

