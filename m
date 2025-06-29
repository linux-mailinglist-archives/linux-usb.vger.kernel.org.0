Return-Path: <linux-usb+bounces-25242-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B18AECDB7
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 16:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2C167A1AF5
	for <lists+linux-usb@lfdr.de>; Sun, 29 Jun 2025 14:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489AC21A443;
	Sun, 29 Jun 2025 14:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dCgG09Q8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178AEEAA
	for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 14:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751206794; cv=none; b=gTCYCm8BzmUOReZD4vqlCsPkDGi0YzT3pXPmmn67ko7eQ/hZZweRKVGNmMuigQOosVuo7JFYFIhmxTsHM6sfdsanZ9QIcY7i/MhhRQWBWTHS2K/RjfjTuwmEMFcavIJB9g1e1hDbQsmlc58USL1MHrj0+rcekX+nd23qGIPjeY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751206794; c=relaxed/simple;
	bh=GzWZFW7yR2ucKSln5tpQ7PmR1veWd7qpGSUlMJZ88pI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bJdRnukxBCuU4nK4ZlfuOsz61Y86OOziG+43t4BsTJ7lAyTURqmFjwZPIZMkKk0TuQol0bnkC4Rgn7tjzlSa6IDPA+OJ/bb6lVpxPaHmt/BGsQhKvDrsMb8R6+vFx5nGLvhtjlTsvbC8Bq3S5/gRwXn4MwGUENS181ChrF+Fbow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dCgG09Q8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B1C0C4CEF0
	for <linux-usb@vger.kernel.org>; Sun, 29 Jun 2025 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751206794;
	bh=GzWZFW7yR2ucKSln5tpQ7PmR1veWd7qpGSUlMJZ88pI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dCgG09Q8ZGSMHUvmXrCV2zpwp9jsY0pVFGbrGlWup+stGoEzyJv3bOq4IniOZ4QBB
	 MlzOmyJ5wfWoZiU3p655Bxf6UCe20vfTFlguRu6X094f/YqPGvR7+Y6zmfO6Df/2Wz
	 Pclioz1s9cv7LZFQwg1bJb2iE6x6h6impMcP3FnUVSOE9F/S1xDXLA/0x3+8w38ByD
	 FKCsa+R59carbfyKjk3xguNODII/HN/s4BvJeCusJTmPhMQ0dn9Y3TKKn8OCEXDJiU
	 cO4R4EGD9YmI0+ZYjwqYDWbuF/nQemrS+0B1y5rVSUjHH8fOeT/VsIdxqdDjVx3FY4
	 2QoeYWPnrf1vQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4845EC433E1; Sun, 29 Jun 2025 14:19:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Sun, 29 Jun 2025 14:19:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-xVYCIZm2JO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
At the moment there's no way to know where the real problem lies.  It could=
 be
something wrong with your new memset code; it could be something wrong in t=
he
USB drivers; it even could be something wrong with the mouse itself.

The only way to find out more is to record what happens when the mouse fail=
s to
work.  But doing that requires you either to issue commands before the prob=
lem
starts (that is, while the system is booting -- which can't be done) or els=
e to
use special (and expensive!) hardware to monitor the signals on the USB cab=
le.

If you can come up with a way to cause a failure that involves plugging in =
the
mouse cable after the system is running, then we would have some hope.  But
otherwise I'm afraid there's not much to try, other than guessing at possib=
le
solutions.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

