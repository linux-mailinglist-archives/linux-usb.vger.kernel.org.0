Return-Path: <linux-usb+bounces-29319-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A118BDD533
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 10:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5EE9D4F5E1E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 08:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FF802D24A0;
	Wed, 15 Oct 2025 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdk6Ja9U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80753043D8
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 08:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760515873; cv=none; b=oVOXfp47ERzAL7ZvZEMy/oAJIBB38NbQGHaw1JtBO8WbBsgIgmBtrF3wbkDEi+2/SclCK+LmZmPPuTW1oatAH0xHHlfIq514vz+B84F83bMifR4CMAc85E/NAjGeC/qR2ND6yGkbmEugKP6zlT4wrVs69IHJz7dvuWrB7e2Lr+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760515873; c=relaxed/simple;
	bh=3lD1UPFxMqdP+ePVNjXsmFJa8qz+30zjG+EwH5lzse0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rZ6IQtyXqe/ocPRxbxTGABRhye5codKV0nFns90CPQhqZwPw1qhbT4RL0ZaSSPnCvrZHDLBOFEN9wUwIbBQe3FWip65+TLfetUsTNDLJlqI6PBQHj7Xai3INhCO+Hz3ngVLn9OTrhJdVACwSKYCHqmMJBM8HyBaDs+IwctPo31A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdk6Ja9U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58923C4CEF9
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760515873;
	bh=3lD1UPFxMqdP+ePVNjXsmFJa8qz+30zjG+EwH5lzse0=;
	h=From:To:Subject:Date:From;
	b=jdk6Ja9U+a3gt5WM2++6ohPo8BGAz5Z+4ps8kRg/StCFneIbZf3032LSNHill3aMh
	 hX+Yj76voH17LAHOysz93pR6EUcq544w1VJfsGm22rGIRLKriikqiZgiW4iQhZaRKY
	 13skkITpsgMlaVkXktclLVA0oq1QyLjX9Q8PS9Nat6MQfHip2e32EXfUs6MR0ob+YH
	 TZCk0Iy+3EPmGJnzaUqd3NvzJ4obwoLTSSmmKmV1B6tvwOkII0ZzhI/Bwp+971xAxR
	 AsTe7Sq4bHgPm3YCZnqBvrj/2orlxNTkFVXUsL14ipXhQSRlEBfSqP3mf/nJ6bPRy6
	 Vf2KxsxMgjqJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A764C4160E; Wed, 15 Oct 2025 08:11:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] New: xhci_hcd prevents S3 suspend to RAM from working
 on Zen 5 system
Date: Wed, 15 Oct 2025 08:11:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

            Bug ID: 220667
           Summary: xhci_hcd prevents S3 suspend to RAM from working on
                    Zen 5 system
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kode54@gmail.com
        Regression: No

Created attachment 308808
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308808&action=3Dedit
boot excerpt, followed by suspend errors

As of upgrading my system to a slightly patched build of 6.18-rc1 (not patc=
hed
in ways which should affect this bug), S3 suspend fails due to an empty USB=
 2.0
hub in the system.

Log lines related to the USB hub's PCI device, in attached log excerpts.

Using sysfs to remove the following device path:

echo 1 | sudo tee /sys/devices/pci0000:00/0000:00:08.3/0000:1a:00.0/remove

Allows the machine to suspend normally, and the device stays removed upon
resume.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

