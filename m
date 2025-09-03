Return-Path: <linux-usb+bounces-27493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B371B4202F
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 14:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BCDF1BA5B73
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 12:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97D2E2FCBE5;
	Wed,  3 Sep 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SqO7yjcs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195DC22172E
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 12:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756904334; cv=none; b=Y2VmjoP1ynkvAF+hzH0mjZeqsZoQ+DMUHeDndkA2wZzKtJGUDW6QWprjK5bI456rbK4Ese2wN17K2p1teQmS8CHSlv4gGpvOgAvKC7W5kDY9YuIU8M2eseovEpPYVCPSPc8ly3BOWtR3z+eOBiXKEDkppoAwK8Ndk9c3d9wJ1Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756904334; c=relaxed/simple;
	bh=rkBfT4vgCPVpLG01jJjhfLsFKaiv2NSvC2bJ9NgDYzM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S23VLyZzZENW8jy8Dy3784dCfGIWnS9DIlXCScryqmMEJYgZ7Gewuw1hUGHOvjHd3x6XFOfn5dySXAe4bQpbZI2CHfRirAkQbR422OQRmgi7p4P6qE8A0VuQ0vxbjWPC+6VRDpXREr21sGrf1NsyUQwDgFB3fHxrY6g9X1/aPv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SqO7yjcs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C99BC4CEF7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756904333;
	bh=rkBfT4vgCPVpLG01jJjhfLsFKaiv2NSvC2bJ9NgDYzM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SqO7yjcsEZ8Jc2kCpu/rx9AdLJRmQfeQc4n2AzzLpJ1+6ujEbP6T38+Xab3MYhPAl
	 tLakR41pp1mnrsrvxtIhwUGCAn90ClZ0oxOCoWbBDztc6OWcNmgYbiCUZUsKbVVC+j
	 eImIv1O9KlIX/DjucPx2bpNTAv9xBQgU7EylbEYQFr/OA/aFUvrPpgkt3ojfHUR9Xr
	 kvggSbJhhCE62sKYj+Ir8aZVJwMGA1vn4TPf6n3QqwUabeq1k3CNz7ZZAIJS1F2HPo
	 higAlzVoimb/BlmrcmvUEE6QIlSlcaehDgQYED5RI8ZyYLdmFg7iDHzM2lPEx6oKvk
	 fGg3+7cm6xGNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 92A8FC41612; Wed,  3 Sep 2025 12:58:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 12:58:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220491-208809-wwb9zhzJAe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #23 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Looks like main issue is that the device is disconnected during suspend/res=
ume.

USB3 devices will try to train the link automatically after connect, and ge=
t it
up to a full enabled and running U0 state without driver interaction.

I see at least 3 different outcomes after device was re-connected during
suspend/resume

1. Device link training was attempted early in resume (or during suspend), =
but
before xHC host was really capable to di its part.xHC sets a CAS flag (cold
attach state) to tell xhci driver device needs to reset to get the link in
shape. CAS is xhci specific, not part of usb specification, so xhci driver
reports a "compliance mode" state to usb core instead.  This is the idd 341
state Alan talked about.  For som unknown reason I can't see the expected
"Connect status change" here.

2. link is successfully retrained during resume, link reaches U0/enabled=20
state. We also see the "Connect Status Change" (CSC) set. This link state l=
ooks
exactly like a successful resume from U3, except for the CSC flag. It's
possible usb core assumes device is now successfully resumed into U0 config=
ured
state even if it is in U0 Default state, and needs to be addressed and
configured before it can respond to most requests.

3. reset-resume races with link error (ss.Inactive state). If link goes to
ss.Inactive it can only be recovered by a (device) reset. In this race case
the link goes to ss.inactive at the same time a usb core resets the device.
- link goes to ss.inactive (xhci driver and usb core are not yet aware of t=
his)
- usb core reset device as part of reset-resume path.
- xhci driver sees ss.Inactive error state before reset, sets a flag that
prevents transfers. logs show "Can't queue urb, port error, link inactive"
messages.
- device is reset and recovers, flags stays forever preventing transfers.
This needs to be fixes in xhci driver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

