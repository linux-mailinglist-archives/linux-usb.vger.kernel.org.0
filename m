Return-Path: <linux-usb+bounces-7403-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B91A686E938
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 20:09:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F1E11F23742
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 19:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2558639AF3;
	Fri,  1 Mar 2024 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kZzOzNMM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F83A29E
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 19:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709320176; cv=none; b=dquug33psv5cw6wjAQb322bSjyGMZ0Dn1bLtxQr6jL7VSbPe2Glrx8sxqguFesUqmZIb7KQ0w7fZptNfxZTso9QuF+4vpJbEcWy1lyhEvSEcZthhMDMK1rLRwLwtEl2dB1JhxxTZnxfWG75o9JyjdbNLTWDS/Tp4XxH4lO8LwwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709320176; c=relaxed/simple;
	bh=gGaw7n6HkcI9Dwb9fl4ftknPfprEKaRmQYJUVWKyX9Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aIljcX3lNLPkpsp1nLuQUKiraMSMR4kwQEwHO6haaySk9LiGiHA6vmvvHNLu2kt6f3I9WhDdxVbnzMb/Dx/a2KibTyz1i5hmcQbePF2q1LEbt6ChswlZ9VrGnnpS7mVgnMHTlYrMqc7IhP6MBpuaXjiIC5TU/0Bht7Y8fYwLtSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kZzOzNMM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 227D5C433B2
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 19:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709320176;
	bh=gGaw7n6HkcI9Dwb9fl4ftknPfprEKaRmQYJUVWKyX9Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kZzOzNMMyZ7q9R7YxmfsoQie7BV3wvdQ9QK41uIOvtQkfz2nHOM2ehUjoF0+JBRik
	 ThTrddKLnVPRupPiYBLy06RJgt5rqz0rY1Yzo+uqSWJAsdv0KLklm6aJ+duAWzTkZX
	 E+8KQfNlRRm9t+fVxDaXczraafuPSWT7n9hm78ZO/wo+KnrIywmogh/YzfH/W1NugA
	 wqTOyQAxvMcjrEKUzBFu6Tz+Gw8cjLQN14nBcdFZAbsjq69FBybV9Sx9jiLWXD4qEd
	 /creVsKAHIV1hvqFujnldxb2RJcoecL1m4DJIoZWT+NGvxuFVkhb0nFC+A3rYcW3FT
	 8THuwofMvg5zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10849C53BD0; Fri,  1 Mar 2024 19:09:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 19:09:35 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218544-208809-Y1mC6VYYvZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|stern@rowland.harvard.edu   |

--- Comment #7 from Alan Stern (stern@rowland.harvard.edu) ---
There's also the usbhid interface on the audio device, probably used for a
volume control or something like that.  Maybe unbinding it too will help.  =
You
can try it, anyway, just to see what happens:

  echo 1-1.1:1.3 >/sys/bus/usb/drivers/usbhid/unbind

(or with the device plugged into the rear port, use 2-1.1:1.3).

Without going into any deeper testing, I can summarize the problem for you.=
=20
Basically, the ehci-hcd driver in Linux has trouble utilizing the entire
available bandwidth when low- or full-speed (1.5 or 12 Mb/s) devices are
connected via a USB-2 hub.  That's your situation; the hub is the 1-1 (or 2=
-1)
device, number 002 on both buses.

At one time Intel's chipsets would attach a single onboard hub directly to =
the
EHCI controller and then connect all the downstream USB ports through that =
hub.=20
This is what your laptop has.  Even earlier Intel chipsets worked different=
ly;
they connected each downstream USB port through a switch which would send
high-speed signals to the EHCI controller and low/full-speed signals to a
companion UHCI controller.  Motherboards using that scheme didn't suffer fr=
om
this bandwidth problem unless the user connected a full/low-speed device vi=
a an
external USB-2 hub.

The reason for the problem is that the design of USB 2.0 and the EHCI
controller hardware make it quite complicated to handle the packet scheduli=
ng
when translating between two different speeds on the same bus.  The driver =
uses
an incomplete and imperfect algorithm which can handle the simplest cases o=
kay
but is not adequate for situations requiring a higher percentage of the tot=
al
bandwidth, especially when different transfer types (bulk, interrupt, and
isochronous) are mixed.

Improving the driver to make it more capable would require a tremendous amo=
unt
of work, and for very little return since nowadays computers use xHCI USB
controllers rather than EHCI.  Only legacy systems dating from the time of =
your
T420 laptop or earlier would derive any benefit, and then only in situations
involving multiple devices with high bandwidth requirements.

I hope this explanation makes sense to you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

