Return-Path: <linux-usb+bounces-18168-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1BE9E58D0
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 15:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38DBC188588D
	for <lists+linux-usb@lfdr.de>; Thu,  5 Dec 2024 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4CF21C187;
	Thu,  5 Dec 2024 14:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iYggrcP1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9821A44D
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733410011; cv=none; b=cqe02WVdEtD409GkxUJIXbs1/K+GLAPSh1DVFo549pUfeLG2uMY38byEdx7Uqvu+eW6Y3qJgs9BiCUoHjk36Wnpb30rxgJZq5tyKaXHgjCNUPebyG/FiV6N7sTNS2eA1TnjkxeqrzZ6mY25x8ShJIFaZyvAtBxP4wAktvn8E6uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733410011; c=relaxed/simple;
	bh=N1Mdp98R7SYohUndeA91MpIYO+qqxaJaUfxid1+eCMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bV6G2bAzJ8hBZAoC6U4G0hQ3F6CWhkv+39jSs+UIqwW730e+t/mvHZ6cipACqv9DygUofHREIzMXAbl0kwnXQzloEagAmRDW2r0QbEexx4qWGGecDYd0qcCiVYfiR5Sxi6XnvqoxsfupPXjiS/lo6P1cmPn85UKKdrI3i+l2u+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iYggrcP1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 857D8C4CED1
	for <linux-usb@vger.kernel.org>; Thu,  5 Dec 2024 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733410010;
	bh=N1Mdp98R7SYohUndeA91MpIYO+qqxaJaUfxid1+eCMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iYggrcP10IFlCM9o16VVpRIiSMXhba94i8t22jD7lk5fA2eXutVOGuaYX6lXWJzVE
	 qzl8hsG9cKeCx+SyviuNsBx6IkPXpC8j4OWhZ+HVAC3vl4W5KrRbxqOXJaH4OtQydy
	 oYCuy1xRu+Lmx/UPYSuAg2rTi7ajqhb6QV3yXvKko62vF0n9KvQuYlUdp58/djgdAe
	 /YCPWK3Bx2VMuclhGbuW1ejLWWfq0fHIlmKahETMX0euasJAhi/z4l/fRrB4li3zpx
	 PNmrIsMEx1RexqsX/S8cSDv1O9gVwUyLKa80hIwPLmeDnnkjeBfshsNwc+9ED0LP9h
	 lB5yXy5iGfEHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 75460C3279E; Thu,  5 Dec 2024 14:46:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219562] [BISECTED] UCSI patch breaks lunar lake boot on
 6.13-rc1
Date: Thu, 05 Dec 2024 14:46:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sfle@kth.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219562-208809-xYeTgsX4do@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219562-208809@https.bugzilla.kernel.org/>
References: <bug-219562-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219562

Stefan Fleischmann (sfle@kth.se) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sfle@kth.se

--- Comment #2 from Stefan Fleischmann (sfle@kth.se) ---
I can confirm the problem. My machine (Asus Expertbook laptop) can still bo=
ot
but I see several of these protection faults in the kernel log, and it cann=
ot
detect the battery status or shut down properly.

The patch works for me too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

