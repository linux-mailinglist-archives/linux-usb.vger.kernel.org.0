Return-Path: <linux-usb+bounces-29440-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6752BEED7C
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 23:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E7F3BC2E8
	for <lists+linux-usb@lfdr.de>; Sun, 19 Oct 2025 21:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 555811E9B31;
	Sun, 19 Oct 2025 21:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmJrSiD7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA220322
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760909228; cv=none; b=dwyDcVCw2LLBDSpB8cw4c9U+KAyu445PWxKipF5PrYnyPPNaTA9C8KH9T/GcxqIfdEFNSp7F8VA+Uamzlw9vNSmEXhJk8SvGjpdGZXDQmdj0iiwxUxwNPisLhs4O+k2TnyAFMRaTdpYjyoniQ3Dx3wCgzTnU3M2hXTIWXpwromI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760909228; c=relaxed/simple;
	bh=iRpqQHhgqFETkFPv79jygXi9Nn1XUjYP12bQPnFvsNI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gLh4a2f8gWiMgkvgFNzKRZr7AOwbpbEAc+KKtW0lrL7Vhqyw3JeO9hwTACrFAWQYDHYPexhMiryAd58qq6H0aqwdJBwCjd33DjbOulue8PwdkltS/WpK8Ghd1kX0jILq02nkrY9OPBrM+CIn9wRZEbTa/0BogLgUdg1U/xg/lQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmJrSiD7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FD83C4CEE7
	for <linux-usb@vger.kernel.org>; Sun, 19 Oct 2025 21:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760909228;
	bh=iRpqQHhgqFETkFPv79jygXi9Nn1XUjYP12bQPnFvsNI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CmJrSiD7Ys3XtGPI8Flb3jk2yQ5hIyz+21kGgwvSnnvUit80VEobgEQ+ez001+LuQ
	 YJsn7bk4P2dTTeaW6Jq1Y61iBfZpiE41/5wvQBZNGaY0sBVGbj8B+lBjHq32+XRjOE
	 i1U2GzWoKF/cKXJ4zXRwvty6Z5y0MqrQfSQ5ap7U11gnOfL8JeSq5pA0jwlYkrimHr
	 xMM97s1wVMoBbXQYmcSbWk79z52cyvnszjOx2YShkagBaup8B/HyV0bC3TykPGk7/R
	 vWpNeGENMg8X1ffUdmGmRx8AQXjeKrKBge0NhN2xlu9toSqwBizr2sodzUIzEdvZEE
	 G7aHUSbJGXcwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0CD2C4160E; Sun, 19 Oct 2025 21:27:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Sun, 19 Oct 2025 21:27:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220686-208809-4urvLNmsJb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Not sure which kernel version is broken? You listed 6.14.0-63.fc42 twice.

6.14 series is long obsolete, if Fedora still maintains it and screwed up on
-63 revision, that's on them. We don't even know what patches they ship.

If your problem is with upstream 6.16, that's frankly obsolete too, but at
least well known to anyone here.

Can you double check and specify clearly all known good and bad versions?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

