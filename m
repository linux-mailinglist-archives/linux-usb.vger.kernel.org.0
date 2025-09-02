Return-Path: <linux-usb+bounces-27476-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF7B40F95
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 23:45:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1AD5E6A68
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 21:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F272E1C5C;
	Tue,  2 Sep 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwN+/wLq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64D1F948
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756849526; cv=none; b=qqsMrp5U33lnV+sOE0ibWdTgOlwR6ZzSZkKIHpb0YVVoqNRx/R7x7KjUGYfzfQjcubNsFxZLWpd2L5IpvqZF7cTUA1bmmJU0e/HBXhmZaNr038zphU+oMccFedi3KQ2UcNy1XJ4Xx6++ljyJOdQOSrlTcxKChOMypPVR1rP20Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756849526; c=relaxed/simple;
	bh=xQ3D16wHesFot8Cljl9vIJijZlju2pDlU6VAlql8OAQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JKYK31otC8w1z0t34LS4MP8lTEh8OtKsVdfWE+KrJdoBlT7pBgSTQR9DU4eXk3EHh3clzhefy+RpXsWjJQ0ag5gOExDnkwZ3PeerKNcTAY8ETLQQza4jLhdAK+WgjXaM5z+AhXonURZzoU+DNHv7V2ZxRasbh7l8STzObQAbuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwN+/wLq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80BE8C4CEED
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756849525;
	bh=xQ3D16wHesFot8Cljl9vIJijZlju2pDlU6VAlql8OAQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JwN+/wLqmNsEJ2LjgvRWK+zn0YgZJGewnqfb9b7qQULH6T9ol5YPu8W8yHr3aoP7Z
	 PHDOjvSGnKcq3BzF9I2rF2AuBZpk5A6cvRuQYcUw92JhIJIvAlgYlExZjaWo4VzJm4
	 dzdhrPOsrhqQJexS4l0Su4OoOYBDUoyhS+oeZd6Ja+MRs5iirgeqvZUKR5Thd2hFD0
	 h4amhPI9gu67RjMfVI6+FfU2dObMFxJJDT0lhTmaF6yP1VJNoVgVqbsjKB0OMvlQe+
	 PJsxcKxGQYx75+XEUJmSn7N4UJK9nH5YP1GsP7yzSuNZU7SBSos8jB1otPvtRMvGWr
	 W3Q+IsdEwxW5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 79646C3279F; Tue,  2 Sep 2025 21:45:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 02 Sep 2025 21:45:25 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-prxwv4E3lq@https.bugzilla.kernel.org/>
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

--- Comment #19 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I have a couple of AAEON emb-qm77 Intel ivy bridge motherboards, ivy bridge
being the first Intel chipset generation to natively support USB 3.0. Both =
of
these machines exhibit the same or a similarly situated problem as previous=
ly
reported for my Samsung ativ9, Intel broadwell, laptop, that is USB connect=
ed
storage devices do not usefully survive suspend/resume cycles. Because emb-=
qm77
connected USB 3.0 storage devices, usb_storage and/or uas, reliably
disconnect/reconnect on every suspend/resume, I feel like the emb-qm77 MB i=
s a
better representative of the class of machines exhibiting this problem than=
 the
Samsung ativ9 where the problem only sporadically occurs.

For me personally, machines of the ivy bridge to broadwell era are still
eminently useful and would be even more useful if I could patch around this=
 USB
3.0 storage device issue. Though the fault of these now longstanding proble=
ms
could more accurately be ascribed to MB BIOS and/or device firmware failing=
s, I
feel like it may be easier and more general to patch around these problems =
at
the OS kernel level rather than through individual BIOS or firmware patches=
. In
particular, it seems conceptually desirable to extend the linux kernel's
usb_persist mechanism to encompass disconnection and reconnection of USB 3.0
devices.

Before I pursue this idea further I would like to ask: Does anyone else thi=
nk
that this would be a useful or even possible concept?

If anyone is interested, I have previously attached usbmon, xhci_hcd, and
usbcore traces of a emb-qm77 suspend resume cycle that encompass a connected
USB 3.0 storage device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

