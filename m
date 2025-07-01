Return-Path: <linux-usb+bounces-25378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F91AF0230
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 19:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52C3C7A835D
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jul 2025 17:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6798927E1B1;
	Tue,  1 Jul 2025 17:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u60QW2ve"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42251F4285
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 17:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751392234; cv=none; b=Ghj9w5nxgJs5AIoA0uQtHSwfnuKoTITPs/7TtVlJKiPUIRv9Udg5lLvylBFyY7vuf9NkEqo+jXS9NEUxhEnon8mzgiBM2e87VjwJ9gNE8bHVzzJfSLO/MXBI7j4z73qjVwiLQl8CvEEAnB6LIl8lq6dmLbA4S5vKGcv5rWBRkhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751392234; c=relaxed/simple;
	bh=b0rjoau6A7re4Bat0GuA+Hj69HUgYYxDJokL+1r1gTw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sGElg6xFWP5YN45Z+26K6QU0wXuvMI8bu0ayF4VyOjpPiwJ7lpP3WJ6RgJI4ogtEQYcUqHEM/sZKweH94PsiwaYJijd/nDhuHl0tOP6pix0xlYbamrn3DBV48CbYQOte4GxNWk2O4LUdeb4qtCPQlEAFlUS/NO93sqmIADxx5fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u60QW2ve; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CA0AC4CEEF
	for <linux-usb@vger.kernel.org>; Tue,  1 Jul 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751392233;
	bh=b0rjoau6A7re4Bat0GuA+Hj69HUgYYxDJokL+1r1gTw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=u60QW2venD9cqdCGvYtTKtiY9m0rsDtAkF9SZGQK6wH/1TLyh6EYvC3jsc7BXCbTi
	 U7S/Z24RI7X5hvetDesGBkVl+oU3I9Yo/Dv+GaeCVD8PBP5MgsHw2PNF0ys9eXu7TX
	 RERWdATtR2XaXk3hL5e9gHKyioKGMFIZOOQc2IOBLO16XaiwvRxUYsymMqdp60Nms7
	 lq9XyZkjgTUDdIgyxn/bO+S3aNOqfuhjI46hnvalId+a2qB1dRGQ7+8lBhqGIQyEZh
	 +sRdUNtA8saOB6AF0soSGE9+MAT+CAxmYdUR4roF+MA8Ed/1RiFwK1lOHTlaEElgo7
	 mGmC1Cyq85mQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5FD0BC41613; Tue,  1 Jul 2025 17:50:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Tue, 01 Jul 2025 17:50:33 +0000
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
Message-ID: <bug-220272-208809-KreA6zwP0b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #23 from Alan Stern (stern@rowland.harvard.edu) ---
Well, the new traces are a little more helpful but not much.

There is essentially no difference between the initialization portions of t=
he
two traces.  The difference shows up when you start moving the mouse.  In b=
oth
traces the mouse sends data to the computer.  In the working case, the data
contains what you would expect: information about the mouse position and bu=
tton
presses.  But in the failure case, the data contains nothing but 0's.

Here's where the data starts in the working trace:

ffffa25a535589c0 74469528 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76172178 C Ii:1:006:1 0:1 7 =3D 000000ff ff0000
ffffa25a535589c0 76172197 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76174062 C Ii:1:006:1 0:1 7 =3D 000000ff ff0000
ffffa25a535589c0 76174078 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76176189 C Ii:1:006:1 0:1 7 =3D 000000ff ff0000
ffffa25a535589c0 76176218 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76178108 C Ii:1:006:1 0:1 7 =3D 000000fd ff0000
ffffa25a535589c0 76178128 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76180102 C Ii:1:006:1 0:1 7 =3D 000000fc ff0000
ffffa25a535589c0 76180126 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76182070 C Ii:1:006:1 0:1 7 =3D 000000f9 ff0000
ffffa25a535589c0 76182086 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76184066 C Ii:1:006:1 0:1 7 =3D 000100f7 ff0000
ffffa25a535589c0 76184081 S Ii:1:006:1 -115:1 7 <
ffffa25a535589c0 76186083 C Ii:1:006:1 0:1 7 =3D 000200f5 ff0000

You can see the changing values in the two right-hand columns.
Here's the corresponding portion from the failure trace:

ffffa25a53558780 40179815 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40179828 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40181774 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40181787 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40183769 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40183782 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40185773 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40185783 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40187792 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40187799 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40189792 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40189798 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40191705 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40191716 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40192702 C Ii:1:004:1 0:1 7 =3D 00000000 000000
ffffa25a53558780 40192705 S Ii:1:004:1 -115:1 7 <
ffffa25a53558780 40193717 C Ii:1:004:1 0:1 7 =3D 00000000 000000

There's nothing to indicate why the mouse is misbehaving in this way.  Mayb=
e it
just needs to be initialized twice before it will work right.  Whatever the
reason is, it certainly looks like the fault is in the mouse, not in the
computer's software.

Have you tried using the mouse on a different computer or under a different
operating system?

Also, can you try getting a trace equivalent to the failure one here, but w=
ith
the standard memset implementation rather than your improved one?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

