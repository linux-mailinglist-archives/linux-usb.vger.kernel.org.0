Return-Path: <linux-usb+bounces-2753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1D57E71E5
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 20:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60F2B1C20B4D
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 19:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2C2F1DA41;
	Thu,  9 Nov 2023 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmWutWZP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD031DA4E
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4E09C433C8
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699556799;
	bh=1GU4VcrMkcvfbUwU43LMLnIjY7Kmf89CW6DTXsfnzXc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XmWutWZPSfz34FHbyz5H4xmD50VwtxdWZX4AuZLfBrs2k+jhnDhyLXgEj6yiX6rqt
	 HuUZmEmCgAK3WA9MOg4rJkNf4XU8HNbNxE3IiIcQwsyOuF3TiKT7B8dq4PsXCuVavy
	 bxmKWfgacu/almvK6G58WdQJWfZO1U1mQD5HYNImcbl3eHBIDVZmQQLJRvavcQuzy4
	 quHp1zpwEe2VGshZfAFg34EI1oy9b1sJyHbDoQ2Az+eiuIVBEp921tnoTLQ5+QQRXJ
	 n94nf/YIWdplCY1JkVRDoWbxZZ7jqqo8QzIGlo0C8nkcShp5xtkpYDlEqjvWGDLKns
	 z1jGA8+5/jXKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB28BC4332E; Thu,  9 Nov 2023 19:06:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Thu, 09 Nov 2023 19:06:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218118-208809-UjUSbtwCXF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

--- Comment #2 from Andrew (quark@disroot.org) ---
Created attachment 305382
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305382&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

