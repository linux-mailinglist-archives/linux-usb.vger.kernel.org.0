Return-Path: <linux-usb+bounces-23539-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3F8A9FD81
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 01:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CD1A16FF3A
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 23:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D36212FA0;
	Mon, 28 Apr 2025 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V4Kmbcas"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8658F49
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 23:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745881590; cv=none; b=BlgMcMs81CDsb3m2MkIcAFqunPK9VExJp64vWhMzim5ivHpb5zUM8p8mb0x4qHgov/Weaw7JwOsPvYvekQ7XrONHhVaBoBskeDeMP4ytU4Y1Rki8PYrBhily5KGNUTVA3P/jg4dMf/mrBRNPrHaHurhDqlRveeBzFBAvLphs9aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745881590; c=relaxed/simple;
	bh=JSeAQ+iXP/Gxhh3H65QobtffUvspb1PcWO0uHSMswPM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O1JSunCe5gGMCbxDV2qrAtObgoTdPhZuHi88VJLcLk/qnmwiCR57WcWkJmn5/HYNQCPRy3q3OKxcApHY+0oR0hpVmAjP/+fr4lubHGUnjfB4lqUnXZNnQmcLhxfIyE3kZpQ5y/DRU3N7mkjHOI7a5TJCmKT4hyQRSkv+35eeftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V4Kmbcas; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CB4C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 23:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745881589;
	bh=JSeAQ+iXP/Gxhh3H65QobtffUvspb1PcWO0uHSMswPM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=V4KmbcasihBxfEj0WITsR6NbrwgVHY9PYpN3zIDws7H8VD5XwJ2ihwC2bsTkJB71e
	 MLpBo+3dxLyIb1BGskT9OANUP8HAZa2U8PQRO0Z5VrpA9WiAzJz/oPp8W+w+lm3ODr
	 wQVbd0/kcZzSoKvk1ypg+w34cwPFFWJ/BmLe/0P0Wqi6Vft9gwOe801QUj/1seBuVc
	 vdu6ed4erVBFkylWdicMjkJ+5Rbclw37JDjoXJaY7MbG67KwXu3Y6As0p+6cM9qVuS
	 GV3PM6VPyMtDE1E2Mcz9me33tQKj0St7Pkujk9SGZWJhS3zzVBXmjDb7xy00XHZvy2
	 /w2qCiUkcZoPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79E27C433E1; Mon, 28 Apr 2025 23:06:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date: Mon, 28 Apr 2025 23:06:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luzemario@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213771-208809-uuFhmx17un@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

Luzemario (luzemario@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

