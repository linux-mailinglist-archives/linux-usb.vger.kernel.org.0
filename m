Return-Path: <linux-usb+bounces-295-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 598707A407F
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 07:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8144D1C2091C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Sep 2023 05:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAD615225;
	Mon, 18 Sep 2023 05:36:25 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6E94C86
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 05:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A799C433C8
	for <linux-usb@vger.kernel.org>; Mon, 18 Sep 2023 05:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695015385;
	bh=xKUy8np9qvMzzg8NWLA66G8r14V8/MC8ivBtJeOgc18=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VjC1H5KchHGp1Q75Ub4R5d4FRLMwiLw3SqGaGrSlX+qQJO4KYwedcLmSEGDquuw6S
	 ahbfbyso7gasiFTi7cZztTeS+zpTe04dIwTj5vDfarLM/RhYP8lPAR85/r5nwCrVMU
	 +MeNWfwCgCNh/JXQGKnJ8cv4wyR1m/ohrOEArra+bA8MtBZv/Umlq+YK3bF2A40PdU
	 vbaT7cqs4qXYoLnpyE8wBbVksdojpjxJDIqYhxkuoxWYkKTTIYXBqfQfsy/rhvazci
	 Qsrd4A2G8CNhso3TSkVsQecIF4BKS6MpB6ciotBK4ldArBJBNGDSGYmSPeG1aSCqj1
	 Gpr5K7hoXD0aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02A26C53BD3; Mon, 18 Sep 2023 05:36:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Mon, 18 Sep 2023 05:36:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217915-208809-adLZEvqPGH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

--- Comment #11 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Thanks for testing!

Yes, this can happen on any dock with PCIe devices (typically that's
Thunderbolt/USB4). I'm also surprised that we did not see this because this=
 is
pretty common use case with laptops especially. Sorry about that.

I've submitted the patch upstream now:

https://lore.kernel.org/linux-pci/20230918053041.1018876-1-mika.westerberg@=
linux.intel.com/

It is up to the PCI maintainer to decide when it lands to mainline and the
stable trees but in this case I would expect it to be sooner rather than la=
ter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

