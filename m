Return-Path: <linux-usb+bounces-21496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDF7A5659D
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 11:39:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48B518983D3
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 10:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A328D20E70B;
	Fri,  7 Mar 2025 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cPpQCzkL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3420E302
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 10:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741343988; cv=none; b=QxSPMuDgIJQXN9EDnaw+kSOnIJnI7Z5gBBkB2k7gejPbdbIG//JTs7N/4T1MzQ1/wDTG36Sle30sD/spAV3nnTYUxYAX++G63KMTaDLmO5klY8L6cDimB8pKHsJvQ+/MDo0raj7DefnzuYU7PV7e+VVRKAW4KpLpHc0QbwU6cSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741343988; c=relaxed/simple;
	bh=vTFALzJHvqSRWCUmzec7tD0RX9eMEy3rRxFTYtZDRLw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fFbneYjbfAkjyYToMDJvdHwyCl/0yCXw0htRWZdO9OX8QjU9214ukyGQ7J1U3kOXDHMsDqONBhPPFZ1ehdYF0S8L3KrTd7mQ6wdUi7bAAc1PeUcV/7yTL1pX/gkOJAfTkmOPsNC+/8g3lt75xkfNfqguh4mAOJJMexHj8iXv+44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cPpQCzkL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 965B7C4CEE7
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 10:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741343987;
	bh=vTFALzJHvqSRWCUmzec7tD0RX9eMEy3rRxFTYtZDRLw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cPpQCzkL1oMKekmOujVvsAKD6feAuU22sHrfc4d12Dmat460WB6udlKMpRsK4mty2
	 A5QRAF3FW1aSaBo5UKYj9oOeZ0JvK/506kXQ0RaxHS5p4BHTI2ft5lh0vOD18CHt85
	 8jOmRD2jBdtat37MAd3aa2nj74LxSgI/z1AFfnpumplsET/pF1t41Hi2dQMmsk+Pcj
	 JtQli28R1Di1PsvuDlLAoyiGfqMejmBRJNwzU2hBS11Cqsjw8Dum7CFI5m/1EVeIfc
	 C2lXsMhYewb+5XFXhsmzxaWKz1O+xi+i2lzd3pBOlJ9MuNKWHpeYzh2/Acqn4ZDkjy
	 Wl+zecpzMlbIQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8332FC41614; Fri,  7 Mar 2025 10:39:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 07 Mar 2025 10:39:47 +0000
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
Message-ID: <bug-219748-208809-wWekAo6P5y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #31 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
(In reply to Mario Limonciello (AMD) from comment #30)
> > I'm leaving the graphics side for Mario to comment on as I'm not qualif=
ied.
> I
> > do see MST and that seem to be problematic in Linux IIRC.
>=20
> My main worry is if the retimer scan is the reason for the DPIA issues to=
o.=20
> The report that Sean linked in was a failing to read an EDID which got fi=
xed
> by pushing the scan later.
>=20
> So if you can reproduce the display issues try with it commented out
> entirely (maybe we want that for debugging as a module parameter Mika?).

I'm not convinced that retimer scanning has anything to do with that issue.=
 It
does affect timing when the device router is enumerated and that's the issue
with Pluggable, they have implemented some sort of non-standard timeout the=
re.

The other issue happens long after device router is already enumerated and =
the
DP tunnels are established. The patch may seem to "solve" the issue but it
probably just hides the real one and this is what we need to understand.

Therefore I suggest to open a separate issue for that one with appropriate =
full
dmesg and the repro steps, CC me too I can take a look. We can defer this f=
ix
until we understand the real problem but let's keep the two separate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

