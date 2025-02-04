Return-Path: <linux-usb+bounces-20069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F2FA26C44
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 07:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 565B1188703B
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 06:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 859391F8AD3;
	Tue,  4 Feb 2025 06:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9CYZzv+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0549F3D81
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738651747; cv=none; b=LHIl7/MAsn43nSdwtNeFulpNOdl6I+HhXzPFe7PbOM+ZmkC35kOmBFDxQRo0aXa7rsc5wHeZ06+oIB0CpdB3MmGGiDcsNzLhZGjJVPSXwp3tSVHGEvyxo8GcFvBsVyZXYsSadh8a5ZcF9E28XAY3pAweClRdCT/z9KqM5EoBwto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738651747; c=relaxed/simple;
	bh=eEyy4lSDBjdVzfq9Hwq12fa7VzxiwzYfvfhfpkwaAB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uSiwhC7v019y2BsJE869wNFBHXL/mumW1PXMOvOZaubghX14o6eAMX/TSpFExa8fno1Hkp5zAwm7olB6jw/qCji0lrmttXCZadQ8v03CVn9Bd61P+hI/w0Gpw+kr1Ij3zFlbuDFOu5/dRuEVL9vTTYeM+k7Zp7ERET3k2kPNUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9CYZzv+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61016C4CEE3
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 06:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738651745;
	bh=eEyy4lSDBjdVzfq9Hwq12fa7VzxiwzYfvfhfpkwaAB0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k9CYZzv+/G65Ne7pJiGg1L56porK5+fYdj/uJsPbB7QFoPG/DFSkWdDPhqJ9S1vhq
	 bDhTiDw/qGRMA8TCHRo08cfN5kQQ8/xjFsZEZODq0EkfzqjS4gxsxaUsrS0u6nEWm6
	 brWydJt3jc/LYpCQ1AD7bWYxX72/YbQ8CSGuB5QPhHp/LgwzikUHZhhLnMRtzQ5b7p
	 7kNINefo+/faqz7ztILodvnyz7AMeOLVYPBfW5VaFgSmHoCytTCYc315u1Gxfa+++y
	 8xLsPn4X3+Ocj0X88RRh6BB+LdjrfehmvKmEY5hqHPDX29zaueHMtOliJwo9QxEQMR
	 i6JCtoVCokofQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E38CC41606; Tue,  4 Feb 2025 06:49:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Tue, 04 Feb 2025 06:49:05 +0000
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
Message-ID: <bug-219748-208809-PCmKjpizFl@https.bugzilla.kernel.org/>
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

--- Comment #2 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Can you enable tracing as well and attach both dmesg and the trace output h=
ere?

1. Boot the system nothing connected.
2. Enable tracing as explained in
(https://github.com/intel/tbtools?tab=3Dreadme-ov-file#tracing)

# tbtrace enable

3. Plug in the dock
4. Verify that the problem reproduces.
5. Disable tracing

# tbtrace disable

6. Take both trace output and dmesg and attach them:

# tbtrace dump -vv > trace.out
# dmesg > dmesg.out

(We need the dmesg as well to be able to match the trace lines with the dri=
ver
logs).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

