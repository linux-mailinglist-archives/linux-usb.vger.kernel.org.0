Return-Path: <linux-usb+bounces-27277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F39B35239
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 05:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 856097A5B5B
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 03:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80DFF2D12EA;
	Tue, 26 Aug 2025 03:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuS9hndb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A29149C6F
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 03:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756179271; cv=none; b=W4FrKmwTZY+/7BRU88ZYl60ySma7nbRdaCkUuVBMDq2tbATvksenj4EroyIxU3fMJXd3wWC0VKNpFKxfwNwfwXq5JrpCurtcpdlV6i9e1CoN91SrsPOa0qpsYIo0RD3kxPeVsojXZQUSlaDJpFhQu4V+vmXqiDETkb7+6qPM9rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756179271; c=relaxed/simple;
	bh=RIcbrwOkYgUtlMVPElt+mR/keBDHqYlT+Eej0zGoamg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SA/llSTkYrphkBvNAm3LI6NB+b/NsMsVijh8w718IFI0O4Hsy5Jfak8D3ySZ1qhBs9BWD/8A3xaHMbw1WA5Xy6oOOJYqZ57jOP/G2Sd8RVk0XJU8cVvbWOnVptBD9DwvIqZfwUbIwKLHHgZo0J2MY+OpgJzdgIsNZrFywkYFYOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuS9hndb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E3BCC116B1
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 03:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756179270;
	bh=RIcbrwOkYgUtlMVPElt+mR/keBDHqYlT+Eej0zGoamg=;
	h=From:To:Subject:Date:From;
	b=CuS9hndbl8Io5ZXb5HXcXsifEiDfsMlY73Dy7WynzFmDUccq3JwlVtq4BOw41BKIv
	 Na4G+2o8OkTM43jSjFP1MNwcFRnJTWebGCUyakzIKG6oMlM1gMzD+OL/zzzZt5Tzs8
	 eQDvTnFrOuy3QTKicVm6S4+0hQEfB4lI+tcrqCNHBNmx/YsM8cls/Y4PwsCOkwwRD8
	 dvQbG/pLuTFss9Z3jpr4hGPXQ1dyL1JufjfAd5LRfQ3cZxEq/DfiukIW0xPSNPJKk7
	 gY1gFVbW4Od1UjaTcKa4uPym/DDu5uT72MmFqPXgbdOotVWpbeaBDDe9Pyg5C0Du9B
	 eDK6cyYj1uk9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 615B1C4160E; Tue, 26 Aug 2025 03:34:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] New: usb_storage connected SD card
 disconnects/reconnects on resume from suspend
Date: Tue, 26 Aug 2025 03:34:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220491-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 220491
           Summary: usb_storage connected SD card disconnects/reconnects
                    on resume from suspend
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: paula@alumni.cse.ucsc.edu
        Regression: No

Created attachment 308549
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308549&action=3Dedit
This is machine specific to a Samsung Ativ9 laptop, Intel Broadwell platform

I've had this Samsung laptop since 2015, 2560x1600 display, Intel Broadwell
platform, battery still has > 5 hour useful life. This is one of two machine
specific suspend/resume related problems that I would really like to patch =
if
possible. If the laptop is suspended for a while, the mounted usb connected=
 SD
card is unmounted on resume. This results from the associated usb_storage
device disconnecting and reconnecting. I've looked at the so-called usb_per=
sist
feature and the problem is "hard" enough that the persist feature won't pas=
te
over it. I've attached a dmesg log with xhci_hcd dynamic debug enabled. The
debug messages are opaque enough that I thought I'd post here on the hope t=
hat
someone more experienced would weigh in. I am willing to do work but it wou=
ld
be more efficient if I didn't have to discover too much arcana. For instanc=
e,
the xhci_hcd dynamic debug information doesn't shed much immediate light on=
 why
the usb disconnect is happening. I mean there's a lot of xhci logging leadi=
ng
up to the disconnect but it's not immediately clear why the disconnect happ=
ens
exactly when it happens. Of course, any help would be greatly appreciated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

