Return-Path: <linux-usb+bounces-12730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 971A09431A4
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 16:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60D39284C3B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E961B14F4;
	Wed, 31 Jul 2024 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5eyO2AQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF791539A
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434821; cv=none; b=t2RpAwi3UXyN2buyzYPnxNZG80LD6IP4k6+rjzilldtiN0MzGj5HjE9SdggXknq1+EXdEVHLX7IKEnxt4/NxZ6SAaYBwlPGKsrjlwCS3fM51TU9d2xcRkKybKKYja/SixEqvt4Ki4zWLCLzOx4UC11Mg3oadcwElTjmM2EKnb/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434821; c=relaxed/simple;
	bh=Q+cGvxc0TfH14BKhDNsodxd3zc5yyzj8prY2bg8pMYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jqaz/5rgWvAP4trNC75vn4CAJWGZvGKupAtGJOAgo4g1YzRknuBiYKZV4DINLOFZclR1Uj7MZPUTeJOCs6bjR8gKRyzp434sh6/jbWv4iRhSxrG68xdTtm+ea/kOo9uynx9/kexFp+rAC3nR/5Epjso6eFXbVGDQvFsP8nejzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5eyO2AQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8286FC116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722434820;
	bh=Q+cGvxc0TfH14BKhDNsodxd3zc5yyzj8prY2bg8pMYk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=j5eyO2AQWrU0hoM4gZIXr2bqdwVf+OHE+zI5WTGu3lLgQ7ilsQOT+GuznDiiCdr3a
	 cOAtMTnzIelmG3oZw8e79bpS9CxY0O1r11kZM2JvQ/aS1aRgH102WLTs5A4xCL1qDG
	 YEunATuPz3zmf+wKqelD0LLmL+Shl2WnbDDdLxe4+g7MlOhwE22iDl/mN7QoA+OLA3
	 qsUP53aFLjsqFg7jUStZs0HEPB7o5As5y7nRhFHYw+FGxKDd0gsW0+vovJPNB5uDxa
	 RMsu1a29MNkeKf8qonSxZqVgE7aF70W+6FswnCvl7MdMXL8NMEh1nOLNNENgyo0Yfc
	 2F8uhlIahy8lQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70574C53B50; Wed, 31 Jul 2024 14:07:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] mysterious disk I/O-errors which freeze the system
Date: Wed, 31 Jul 2024 14:07:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-219113-208809-ItVm0UjWCQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.1.102 gcc (Debian
                   |                            |12.2.0-14)

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
This kernel release is not really supported.

Could you try mainline 6.10.2?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

