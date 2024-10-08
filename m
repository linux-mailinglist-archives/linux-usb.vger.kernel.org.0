Return-Path: <linux-usb+bounces-15866-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD99952E7
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 17:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 356F51C22450
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 15:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1EF1DF24D;
	Tue,  8 Oct 2024 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6aEqskl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7767A1DE2A2
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728399874; cv=none; b=nSt4aPlbnqdrWBHJJnO19W6puCM6lKbSCPuP5sussijY+bJUUbeZaBgtqM8PiCbf/+oBW5f4p+3RHadyUG+c2+ZAes5OZsjN4MywhfVaY4d+jZS01rgmYXAPtJWR02I98Alg40wb8VwFr8QESGzTa4zM9xOEYtAK0NBmO11Vigk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728399874; c=relaxed/simple;
	bh=EVlxOh7rvymOdMK8EDGE/vKBqzEp63qaIl7HINKylm8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0NAJ0E5I8LVTpnN7RQyfqpsc+eldc7ZyJsz9c7qguXYWYJfTGTjDOlhYYvhud8eYtIrYsm8LiUOvQ61jQeY4wLUjla1u4TPN8zZAMJmu2n9aRLd92JZSRSQj861iYj4+b5oIhkloJHmn/96H+KUVEN+Ld9XDbv5RlGqmWOBu5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6aEqskl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FFD4C4DE0E
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728399874;
	bh=EVlxOh7rvymOdMK8EDGE/vKBqzEp63qaIl7HINKylm8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A6aEqskllwQnv/AV7Gkst7Jeuu3M8BHnqjv0g3nHCzviYYtGkK88KpWYbU14IGVE1
	 +pd1CooOHsZMoJ5IzuEx75PjSOoWBwy/qwbJBRgq76/LO9eG3dK3z778drZbZTRTwt
	 aF719Djmtyvom4K2dmd8CNdIf0pnKDiScX5Ebs3ah3+0J4I443LEiZMPGw/iz/hKBI
	 Wo/+VcQS1eEBj7OogilqjVf+ifsoVBlk9fAQFloBsUC4k3K2/eU94lCw6P1tuvW4Qn
	 Ja0nSNNnFTsX5nWlUpas3daM4UWD25c3rfB6Sv+Qij2bBVs47mXwJNDAL/UX9ZgKVu
	 rd10cOIo0wJVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AF53C53BC1; Tue,  8 Oct 2024 15:04:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 15:04:34 +0000
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
Message-ID: <bug-219362-208809-RbRF4jr4VM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
The 'u' sysrq code attempts to remount all mounted filesystems read-only.=20
Shouldn't that send a synchronize-cache command to the SSD?  If it doesn't,
there's something wrong.

It's also possible that Tomas is sending the 'o' poweroff sysrq code too so=
on
after the 'u' code, leaving the system insufficient time to flush the cache
before it powers off.

Tomas, the 'o' code does not shut down devices at all, let alone give them a
chance to clean up first.  As Greg said, it is meant for emergency use.  Al=
l it
does is turn off the system power -- it does not perform a clean shutdown.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

