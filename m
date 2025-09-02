Return-Path: <linux-usb+bounces-27474-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D0DB40F4E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 23:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E02216731F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 21:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7562E9ECB;
	Tue,  2 Sep 2025 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkgR3Aqh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170F20311
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848195; cv=none; b=FtEMdZK4LTbn+KNDCMJCsqH9IYxNVAouy2+GiOkIRvo4qd5r38NarIisFz9YXyeZUqYOAyml0T48p+3Wv8PAkD5hwSwF5uEjnzl8K8uy2sD1ruOePzguXiz4M1zssogoskVJ9R5vQ/SrCbxeku/FiofCwLm2pJZbXArXvP8ehfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848195; c=relaxed/simple;
	bh=sTgFANJTUcM3AlV+eqa0pJuu4uiaIXhwMZj2ZauBvrw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ns+yT+UFXuRI4T22NCKdRfAIpDTzjEDB+o6PSe1EzDQDZyAn0IOC5g8Frsn8f8UkKgCEwYyex5a2lxiPwG9m5q3ilT+2BH0Lciklsa3znDPxY1+n9l8Kc1EevYsyusVMbnnC14xQQFxRoUeTbzd4EWB7rMtpfcwtm2Hdl/UGBDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkgR3Aqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E121EC4CEED
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848194;
	bh=sTgFANJTUcM3AlV+eqa0pJuu4uiaIXhwMZj2ZauBvrw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YkgR3AqhoZNpzIDLw66s29CrcI5UpSp6thApIxWeyGI2uuOafavNnrPCSovWbuYq4
	 nWwYtgWlXz4mGQNDX+Es4Ciw/Bw4xL72sz9xQkrKn7Bzj+fJgD6HG4iEVL1AoSXBaf
	 Yk9MiEo59cl9TRUSalN3i1YnTKn4fANjbqlYD8ob0DGHu6ZJzVD/nU0YNPDdJDY657
	 pW9jaJMX94uiBhEZrZW33sdey1jAcy/lbiz4cYO03MC3evh3V6BE6DAWZAJ5SKeWgN
	 UK67/sMLwBp9XEGD6ZfgJ+xzq2vyBdf6EOevt4kUcJFSnPBqxpgCdTvCjSXGkKIWBD
	 t+6Jo4TdqUtYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CC59EC3279F; Tue,  2 Sep 2025 21:23:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 02 Sep 2025 21:23:14 +0000
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
Message-ID: <bug-220491-208809-WAMrRFVYC8@https.bugzilla.kernel.org/>
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

--- Comment #17 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308605
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308605&action=3Dedit
usbmon trace of emb-qm77 suspend/resume with connected xhci usb_storage dev=
ice

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

