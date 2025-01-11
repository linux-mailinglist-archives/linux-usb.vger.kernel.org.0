Return-Path: <linux-usb+bounces-19210-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF3A0A53F
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 19:37:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD84E7A390C
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 18:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3001B4253;
	Sat, 11 Jan 2025 18:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7Dn9TST"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F561F16B
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736620657; cv=none; b=rfEt36FRix/oo00L8xbkqt/daBzEaduvg3DuaBPsQ3jBv9xEywWd1xb9NcAWGUsGOa8U9+prL6UXrcwe6EC78TxBuQcYa+l4ivz0eEHc/HTIwVfO+KWAXfU+iN8Gy4AoQ2qmAQ9ipq52uGBBGuKlMgYgOCLiBcLasP1rvB5h5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736620657; c=relaxed/simple;
	bh=64ilN5O0QdC648NiQygG4WRZgj22bfWm7jE0rFjfP4Y=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XBy2dWLhSpZeN6+OLn8tngLBKluUW8bzp9Q8fmcEcBN/pt+ZqCbAMI8Ah5B6C2u/hFOMvyjAR4HqtFRIXLC3u73MrTKVCviHRij64ytobaiVixjk2CT1vgDWWw6dEjH+eWxOKAdYan4KAUvgtC9zqiuiSpLqLGUK8U0x23CMU/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7Dn9TST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77D9CC4CED2
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 18:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736620656;
	bh=64ilN5O0QdC648NiQygG4WRZgj22bfWm7jE0rFjfP4Y=;
	h=From:To:Subject:Date:From;
	b=A7Dn9TSTyMRZXutL5EPQHJhHcjU+WC6CTsqLqCjYUm0hEtskUdzTodz9758yyF7Qh
	 pNUZemZntQydLn3PUXiG85eXKrIVVutkX9XqzVaerasosdTaua0iIRQr9KEXnWngFl
	 qnHIM2K4+TMnp9+hdb4TN61vUoYppKDeYJO5Lv3upy1E5JtCQ/mlpQSS/cIl+nry/x
	 5VfNgZBhsqa69NU6e5H6pHG6FoyBwhrM/d0qXEc9Y6PpZdTJns71pXLhTiWaHJCAFH
	 zaJNRhsNToyI7EZrbUHbsoFc7r+75B2xx5OIdaUqh6q7jVjLIfyLdaKzZWUi/oAQdT
	 jr1pSjrHu6Shg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 55271C3279F; Sat, 11 Jan 2025 18:37:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219683] New: Noname web used to work
Date: Sat, 11 Jan 2025 18:37:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: pierre.juhen@orange.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219683-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219683

            Bug ID: 219683
           Summary: Noname web used to work
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pierre.juhen@orange.fr
        Regression: No

Created attachment 307477
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307477&action=3Dedit
lsusb -D output for WebCAM

Hi,

I have a noname camera that used to work perfectly (1c3f:2002).

Since I migrated recently to kernel 6.12, it doesnt work anymore, but the
microphone works.

Log when it use to work:
Apr 10 17:05:17 pierre kernel: usb 1-1: new high-speed USB device number 2
using xhci_hcd
Apr 10 17:05:17 pierre kernel: usb 1-1: config 1 interface 0 altsetting 0
endpoint 0x83 has an invalid bInterval 32, changing to 9
Apr 10 17:05:17 pierre kernel: usb 1-1: New USB device found, idVendor=3D1c=
3f,
idProduct=3D2002, bcdDevice=3D 1.00
Apr 10 17:05:17 pierre kernel: usb 1-1: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Apr 10 17:05:17 pierre kernel: usb 1-1: Product: WEB CAM
Apr 10 17:05:17 pierre kernel: usb 1-1: Manufacturer: WCM_USB
Apr 10 17:05:22 pierre kernel: usb 1-1: Warning! Unlikely big volume range
(=3D5120), cval->res is probably wrong.
Apr 10 17:05:22 pierre kernel: usb 1-1: [5] FU [Mic Capture Volume] ch =3D =
1, val
=3D 7680/12800/1
Apr 10 17:05:22 pierre kernel: usb 1-1: Found UVC 1.00 device WEB CAM
(1c3f:2002)
Apr 10 17:05:22 pierre kernel: usb 1-1: UVC non compliance - GET_DEF(PROBE)=
 not
supported. Enabling workaround.

Log Now :

janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: new high-speed USB device
number 2 using xhci_hcd
janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: config 1 interface 0
altsetting 0 endpoint 0x83 has an invalid bInterval 32, changing to 9
janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: New USB device found,
idVendor=3D1c3f, idProduct=3D2002, bcdDevice=3D 1.00
janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: New USB device strings:
Mfr=3D1, Product=3D2, SerialNumber=3D0
janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: Product: WEB CAM
janv. 11 18:01:42 pierre.fonteny kernel: usb 3-1: Manufacturer: WCM_USB
janv. 11 18:01:46 pierre.fonteny kernel: usb 3-1: Found multiple Units with=
 ID
5
janv. 11 18:01:47 pierre.fonteny kernel: usb 3-1: Warning! Unlikely big vol=
ume
range (=3D5120), cval->res is probably wrong.
janv. 11 18:01:47 pierre.fonteny kernel: usb 3-1: [5] FU [Mic Capture Volum=
e]
ch =3D 1, val =3D 7680/12800/1

Difference is :

janv. 11 18:01:46 pierre.fonteny kernel: usb 3-1: Found multiple Units with=
 ID
5

There are effectively two parts bunitid 5, one for the image, one for the s=
ound=20

But only the second is taken into account, so only the sound works.

Regards

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

