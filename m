Return-Path: <linux-usb+bounces-13302-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CA494DDB8
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 19:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62FAC2820AE
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 17:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F44158556;
	Sat, 10 Aug 2024 17:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5waRhzr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A81366
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 17:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723309807; cv=none; b=F43AmVaOv0MiAQvNYI1YCezv+VLstzo96oGi/hW479dKMlEI5HW9ut2toCVcAuGEfZmDTadi+rmtrJ5nEvF4bR5VYplS4ANVXXRF6ROW8xP7cH9py0hCszOhLvQffBDPt4QHtNx75UpLnafh5+tBZKQx0lJJ+PY0r9e46eB7SMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723309807; c=relaxed/simple;
	bh=y5K2NGEASZdpj/OpvYGsRrjDbYlBIfyRz2RQ7hjkQZI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AjbFJnrQB3tVngW//S54To3HnI2/zZBiYRO6IygORjKhuG8KHG+8hT+e0WDtZCIir7IHYPb9f3XG8DJqjrmuLMs/zbNOeCM5y0j64GQ3PEAqIsMvO1QNe3dYpLztLbMb+VnAOZ0I1HMohbCe2oGul0gabwqyAbgjX4wg10L2P84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5waRhzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1271AC32781
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 17:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723309807;
	bh=y5K2NGEASZdpj/OpvYGsRrjDbYlBIfyRz2RQ7hjkQZI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P5waRhzr9GajD5ABtnwGOidd61ahhEBO6LMT6TTy6FkGAat/ua8ZSxiev8o4XpHcP
	 ZXPsbbrkVmpp587dq1Jn1BsMl7I2PtBAHodtxOJta1DYoez3ryH6QurKYzzCwqe7AM
	 r4NzD6b8aWWldmzIMTEmMNa8eCmtWnywDbN5siaYLwqKpF3ZEDKVDAeErs0xkBh/DK
	 OPiPjBsj1QC1F2YfUw9f+W7Dlh+hrbipXkPuFzh8mheXSidRTDha1Iwi8/HMJQNOtH
	 zJPG+8pvrJk+hBwgMK99ulbSpldHjeL/H4rDI7EnbqScRJc9FehYrjZFtOfS2NzGjM
	 3vcEjImWjZOzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0AA4DC53B50; Sat, 10 Aug 2024 17:10:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 17:10:06 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-i6RAfrSjR0@https.bugzilla.kernel.org/>
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

--- Comment #53 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306709
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306709&action=3Dedit
Second try to capture USB packets on Windows with Wireshark

Ok, I really think I messed up the first Wireshark capture and I captured
something else. This capture seems to make much more sense as I can see the
device identify itself as an Allen&Heath product. Tell me if t provides more
useful informations.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

