Return-Path: <linux-usb+bounces-27316-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 168FEB37BC9
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 09:32:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47D371BA19C6
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 07:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E99318127;
	Wed, 27 Aug 2025 07:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcGD0wWm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0301F3B96
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756279973; cv=none; b=INJjJk9IY4ZNQOge3xTC2no+gf0IAWmSOsOPf0NrFmCXdyXC5MwyEjewbeXOw5FXePs+ii6hHu4bymAIQm4wdbHtzUBAmFRg93PDBmdMlqYinbRDuotZlX974b5eHdIcDUuBF6JDXoig6PyB6G32IpgmnwqPdq+MQmt/uEyyD0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756279973; c=relaxed/simple;
	bh=/A46qN4sXJCzw0/l8YC5n0/AJbVID2sI1VX/j3KU85A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oVqMVR7GA1ggebOwAtVA7sGFU/meatygTLJVP80Z4zVjED1MaLTZa2e45q2nJvcAoNiB0dJJHCoYfFanRUWJ8OCsCe9dnQ8faOpaW3XGQC85Q06d/DeQPpBLk+Kta+M05zt/CMqTYXKkeB/d3s1X/cka2XOHd0H6AkuzpNUxUyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcGD0wWm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 956E3C16AAE
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756279972;
	bh=/A46qN4sXJCzw0/l8YC5n0/AJbVID2sI1VX/j3KU85A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NcGD0wWmOgo4EaPRTjDdJm0cnHJ3R1CQGIaSY8vMvorYcbVsdXRclcxRuXR8iyzEX
	 K8emSUbzgmcCo5kUFW5LtHOc/zNid8+FRlTtTCpDz2KMgErwZ5qT9Wp/fGeWEiUh35
	 FYHJnF4lr67fZwFgAtZIe4ZiqOh573RAp+KDVsBe7gKFK8Va3diuAEXPwAaHkpx9t5
	 Sz0knsbKLtNq4+FvpG8yS5tGDVPQXT1pQGnj1XYPDj0fEuKLES+WIKhzPQtNskOBhm
	 BiZqivpeZWZYfy+4oF5cahLpJQEn034cV0vX2hEzpMOhVwNFPr5Ic/OKOi/gc1RDye
	 R20fDUmRQ0Jig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8E771C41612; Wed, 27 Aug 2025 07:32:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 27 Aug 2025 07:32:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: manya3084@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-Gsgz4MJufo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Anthony (manya3084@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |manya3084@gmail.com

--- Comment #16 from Anthony (manya3084@gmail.com) ---
I applied the patch and issues i was having with my internal USB 2 header o=
n my
MSI MEG x870e seem to be cleared up.=20

Previously i couldn't get access to my internal USB 2 header, which has a L=
ED
segment display connected.=20

The patch applied cleanly to 6.17RC2.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

