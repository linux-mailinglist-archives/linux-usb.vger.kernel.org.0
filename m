Return-Path: <linux-usb+bounces-3300-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6E37F77EF
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7789CB2123D
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 15:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EFC42FC20;
	Fri, 24 Nov 2023 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kg0VqGI2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482D2EB08
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 277D5C433CC
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700840430;
	bh=yD4Ytfre/meOtHMrc1WIxPlSwjN2h+sb3x8+GMe3pgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kg0VqGI2pnq3rjC180CwiSoWsGsvoxcntSChDpJ9+LAtak8FjVV8FM3Xl5mdA7g4l
	 hfYC1vOXdrKXc4LWK/OoMVxhbTbrYm4W14rktrIOdV43mstmHsA1E4Z3Y4mQYfJScm
	 +TGHFWrH60OBuzaprLU1VyXKO6NuoQaywN+YFkZ0th5ZDFazxwS4RXBqP9KguE/o2s
	 Dwg08sZL+o6nBCSiLhnQMO8jRTENwAxVCfHVPzL+Qz2BP3OWoucv7jIT0zRhwVThaI
	 lhL8MhwRvZqwlQRsVBiePhNd96JhYaWV8MsA6+eXgWinDW+StOX4bKdnp4sp3OhkBR
	 sBUOwR9OZ3S9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1596AC53BCD; Fri, 24 Nov 2023 15:40:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 15:40:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-0FcuADHcye@https.bugzilla.kernel.org/>
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

--- Comment #25 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
I'm not sure I understand 'u8 (*buffer)[8]' in the data struct, sounds like=
 8
pointers, so the side has to be 32/64 bytes. As for the next field, status,
it's a pointer and again 4/8 bytes. I believe we are talking about x86_64 c=
ase,
so I fail to see how 1 and 4 map to the struct usb_hub fields. Is the len in
your debug patches is in "long"s units? Then it makes sense if the status is
mapped first (1 long) followed by 4 (out of 8) URB buffer pointers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

