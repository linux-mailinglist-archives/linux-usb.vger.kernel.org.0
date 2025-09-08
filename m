Return-Path: <linux-usb+bounces-27713-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1DBB48FE6
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 15:40:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87CFB34500D
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 13:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4412330AD13;
	Mon,  8 Sep 2025 13:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0fmagGL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14322ECEAC
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 13:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757338746; cv=none; b=BKyraVqO69uA60dLCys5zN1HegbAqt88iktpgJA/V892AtwF3ik4of7IswZTEdJeMlFy3NJUwEQogi1ouviLSFZaDmg6vOsFGT5kclvc6Eiml3U95WFcb5rQ9DCInz/GvsOsfdJ8c6GX0+EInmFZ2Jv43K6fCTmJ8HXCfHEz4pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757338746; c=relaxed/simple;
	bh=3dKENaZI5n0yfpIKlASEhV5wjRA3Vzp4l80U7vlIsxQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V95abA1rhuqVucqtg/VJ3/T4SJ44z/9QBAhhKrqcloZuwPyt3EK+3PV2Yywn8isYXaNGNUFU1JfdStUtWVI11X/2SFH0otz1/GOA4OK883R/Hz1xRdBSyP3EgxtDSmb393SdmMDrTSBFIxry5zhhT43B/EN76K9xLH07t6VhOAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0fmagGL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40802C4CEF9
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 13:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757338746;
	bh=3dKENaZI5n0yfpIKlASEhV5wjRA3Vzp4l80U7vlIsxQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P0fmagGLfIUAvum9joZUmh2qYfCeWcC5zKHuztjcrjN1M3xZJgWaLvwLfToAbi5RF
	 X4ZX0nxNoOWk38jDpJKIOU+D7O9thwU8yc8edpL4UmqfFf/hbfcl0yyHK4eqG0Rtub
	 Cop1DBMLxrzrI1utRFDAJHdu2JuNWxnITGZUXwNUDZQcZhHQ96TRrTAL83Mwf3mNeS
	 p7A9yBlgbkQXUpAdCk4uwzBh9GJEr8ox+H1QsIipbiZZM8tVsKpeVZ//lTOPZnWJuG
	 A2wfqpI6HqD5cIG+lpkCNxNM5jd5DS1uzx0/4epwBtfZgFET+OrQlNtQ5M9b7Vf6v4
	 DdU+rx+j8nsEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E3AEC3279F; Mon,  8 Sep 2025 13:39:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Mon, 08 Sep 2025 13:39:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-IIUkGwBpX2@https.bugzilla.kernel.org/>
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

--- Comment #46 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 308630
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308630&action=3Dedit
detect disconnected USB3 devies early in resume

This patch has a bit of different approach than adding delay to let link
settle. Trys to detect the disconnected USB3 device as early as possible in
resume, and reset devices as soon as possible. Idea is that maybe link is in
"better" shape if we reset it immediately instead of first trying futile
requests, let link fail , and then giving it more time to recover before re=
set.

Best case is that reset-resume is immediately used here (if persist is
enabled), and device may prevent visible disconnect and unmount.

If this does not happen then it should at least fail faster and do visible
disconnect a bit earlier

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

