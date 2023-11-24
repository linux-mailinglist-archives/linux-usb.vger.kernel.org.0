Return-Path: <linux-usb+bounces-3305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1C47F78D0
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 17:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA33B21010
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D2133CF2;
	Fri, 24 Nov 2023 16:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XokgLs75"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738ED33094
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 16:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF923C433CC
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 16:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700842869;
	bh=jDMp6MW9nQhTv5x4GHz/EF1UYZWCFaErRXeqz6OBjqQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XokgLs75Ns/ndOg1hy+uGXGLA8dRWNv/UAww9exQnAhvetS64zKJlrn71Y/xFcEhW
	 iBA8xSb8uu+o2N/oOuC5ZNzRuVo2zTdMAU7nNzYayTkGqrSgDc6Nptqt2wNGowVV7k
	 LhW7A3fuoQxXzxjgIX8FrXEdZbQkM4WBgaGvloCgtlY5jT8kGfZpa1KLh92qt9TIcI
	 8oBCSMsy5K2340Ry2CHvGiyKfxXkoyQnH5b+3dYAXYbmlto+uDpCMe4gUDVq0AkKsQ
	 Dk3Jt9seJ5AtrlHVfbQ7vpNIFRBnZM5o2KRWrvi+k+INZu8awmV/BQHVFvtKdm90iV
	 51xALyUL+wrug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BAD67C53BC6; Fri, 24 Nov 2023 16:21:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 16:21:09 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-HtWTFPBX9s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #28 from Alan Stern (stern@rowland.harvard.edu) ---
Yes, that one.

The issue of "which mapping is the problematic one" is more or less irrelev=
ant.
The warning is issued when the second mapping is created.  The order of the=
 two
mappings doesn't matter, just the fact that they refer to the same cache li=
ne.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

