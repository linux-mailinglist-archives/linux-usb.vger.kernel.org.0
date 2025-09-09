Return-Path: <linux-usb+bounces-27831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34282B507F2
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 23:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE2227A95B2
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 21:14:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1978257843;
	Tue,  9 Sep 2025 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnhv7Rt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E71B1C68F
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 21:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757452587; cv=none; b=AqA3E4NVcbvYKXvJ3v28yL1Wcr1/1Cyc1/h/mw6iF/L9opbYmC/SPCIcXhA35fKcu1/WsiCjGgbgcSPz0vWvJFPyxhuogBj7+8INgGlBlqZCoAWI1XOF6EszYQLE2eJPSlthrrUkPTOk456PsqxFzvmWiYG5Giq2nRIaYcLABD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757452587; c=relaxed/simple;
	bh=5KFUyCUtRozKEBd1I1Tvh0Jn9MZriF2eUaNMkE9RULk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VQYm0WQEHSVFqnZrSG6ua9ECsxXq+3TM1G4H/959LxQxYe9a7wZIWr7db+4c5Q83GWBacRm3Mb7lVyMFtzufYjIbNssR6Vd9EIUdd99UFyl8A9bzr/u9zrrKsLHAnGMMAmzO5SNfXMUMpGCmwCZJs9DHf7GqQL/onnn3736mwbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnhv7Rt0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D18B0C4CEF8
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 21:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757452586;
	bh=5KFUyCUtRozKEBd1I1Tvh0Jn9MZriF2eUaNMkE9RULk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qnhv7Rt0N0pOQudeg5SeyVJWzqPIB5goJbKg2QScoZcPRVYF7uqboGWx7SmgNfmAA
	 t9eN5OIXVK7LvRMyhXyOBj23s/bEjHISsUBUzgFNs3gBVokuP8LL7J51CGAZrZZaaS
	 3LWx73vAkpZNQ+dkC17ERylmyd+fzDtyTCUt1cAlSDNCBX+2dm+GwgoMXdFotMhE1R
	 J3xjoXSlsPg3OaUVn5yoU0JWcJi8QYpTB+aO8BgmYiqnCCduWCgI9/w51u51yTFkbf
	 gzYVjCPc5IOA01Rl+wMl2WqJC/MQ/pYI8aeXV+oh0vYDApvsq7nuTVaxpRVjE2nyMW
	 +QJadApdV6c+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C064BC41612; Tue,  9 Sep 2025 21:16:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 09 Sep 2025 21:16:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-2RMzntO6c6@https.bugzilla.kernel.org/>
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

--- Comment #53 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308646
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308646&action=3Dedit
kdb triggered disconnect, dmesg tail

I have correlated disconnection of the USB connected SD card with stalling =
the
kernel with kdb. Thus far, a long kdb stall, perhaps as long as overnight, =
is
necessary for the SD card to disconnect upon resuming kernel operation.
Interestingly, the disconnection is not immediate, minutes elapse between
kernel resumption and device disconnection. Also interesting is that once t=
he
device starts disconnecting, it will disconnect several times, maybe
indefinitely, with several minutes elapsed time between each hit of the
usb_disconnect breakpoint. When the usb_disconnect breakpoint it hit, backt=
race
shows hub_event as the calling routine.

The attached file is a dmesg fragment starting upon kernel resumption via t=
he
kdb "go" command. The previous attachment is a usbmon trace of the same
activity period.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

