Return-Path: <linux-usb+bounces-13157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DD8949803
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 21:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CECC2862E9
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 19:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA2280025;
	Tue,  6 Aug 2024 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e4nu/Dwf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637D72A1CA
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 19:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722971329; cv=none; b=bEBcSrwAyvkrTKVr+VAVhlNpstZ19hLRjCnjeEX6TrH2yzRFrKdPpwlNwvM7tvyrhRS7m6QWx+4NoCl6FL/7CJPafPxqJTQ/j7odmemOfVp+V3SqA9Ruro8a6kQAZprazN8048qEttCNzaDYFkbDp23XPe0LFJwOsU7gqYgEoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722971329; c=relaxed/simple;
	bh=O3Y/lEqkA+NBi6ZPHHyJzu7fUOdxet/+vmXMnujcRcw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o4cZTl/Nlu3oj9GGhZmN7wRjLjoMM2srAQv7pycpJtQLd9wqmuW/Jf4qu9VciQR5iD4Ir9nl6Rhnp1PQw0KDdsKnRiD4Pui+lpmFoKLMWmH4xsejgnjpaosTJaRkHqzTfKLxbNXEqLjK7VgUW2+Rix6F9Od39MoloANSh+aG2WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e4nu/Dwf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFDC8C32786
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 19:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722971329;
	bh=O3Y/lEqkA+NBi6ZPHHyJzu7fUOdxet/+vmXMnujcRcw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e4nu/Dwfxdy06xWF65t5dxx1j7TmwizYYGfRjVN+x8b3b8ho5pPQ70gapTTQbawfv
	 rhp3pw/RuHXZxIga61d0tnBppRFpxCwJh4oet7EqJylhD8+RBg9Pgfr5yKlL4FCCLT
	 GMTklb2ePIt94NMgN4uI1c8ho3apb07+lLzwVdSt3KpPuriqetwZ6sxdOjyXYvd5Md
	 6+SisBg+wS/Ix0DwsRBBgvoMUmd7D6u07ciG3SLQJZCB7BO411Awhva+vv/j4CKPPu
	 18rgCwo4L8Qx0I+YXNLC+NIhrmX4J6SXR7lsy21jjFi1c0FkkFYyLKOVXYRR5L9S2v
	 kAmbHck93KgIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF86AC53B73; Tue,  6 Aug 2024 19:08:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 06 Aug 2024 19:08:48 +0000
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
Message-ID: <bug-219111-208809-NFzp8rn6iY@https.bugzilla.kernel.org/>
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

--- Comment #31 from Alan Stern (stern@rowland.harvard.edu) ---
2 minutes is way more than I need; 1 second would be more than enough.  Just
the first 100 KB of data should be sufficient.  You should be able to attac=
h it
to this bug report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

