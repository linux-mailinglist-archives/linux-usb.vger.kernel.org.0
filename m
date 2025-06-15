Return-Path: <linux-usb+bounces-24764-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 882FFADA422
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jun 2025 23:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 984753ADAFC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jun 2025 21:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94EB41DF248;
	Sun, 15 Jun 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2iBMFnA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D2F26157D
	for <linux-usb@vger.kernel.org>; Sun, 15 Jun 2025 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750022345; cv=none; b=hlPbMSNkrl92qbSSWX6hCyVsE/TAqYFaEdJGQeBwSLbpVJZ8IfM7Dgd9Jy+sw/XiqdY9+icbAO5QJU9k37abpSNpsWuzbu2XZC+qWC7ExCVjBtqGIUfbx1xS9BkJQvBvVT8BoTrg1kkvJuIXLUwBfHIsIJapjlTndNjBkbPCltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750022345; c=relaxed/simple;
	bh=u18oFired5P0GnLGjzDiwSeg7qsff333P454hXiReyE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OeUDFoxjC5Zv8dtCRQBSOcdYRCq0myEWCnyof4GRIKP8/xdV8+/T8wD61qZSEbB+uqKt1dmzgJSQERzS8FGtkSL7iaw9paUguvdDk8UIs+d/OjPOJvjTtp54FF8z2mZIY2AXf0NBvEH4RcQeqT/D1yzv187OgWdNHhXJqiJQcvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2iBMFnA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8D00C4CEE3
	for <linux-usb@vger.kernel.org>; Sun, 15 Jun 2025 21:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750022344;
	bh=u18oFired5P0GnLGjzDiwSeg7qsff333P454hXiReyE=;
	h=From:To:Subject:Date:From;
	b=e2iBMFnAQHlpr2pkyZBhWU32xB42ahaEK5O+pFLL9zATiy13a5NSA5KtqfUJDU4H+
	 6AIF6KV0crpq9GFvKXE7V3azH76HwdS+bvqwmMXEJddw5uDZsvEKjdUhIxWdGPDz7q
	 gEe/rU7eJg4rQ5yfY/THHWEXoD+4T1jKtJrhh7o4wIS+ZgiN5Pd7fP4SjqHvVaTEhO
	 22iVIRahmJ8Jffc55JgfsSMHdKkRUYrOx+Wl0h5UhK0u4QdJn4ttmCbOgZ2uy4/qrz
	 9LF2VJnSP664btGkAK2ulN3lM9uedYzQbFHf3IRUh4mv2PUNDGE9Eh3g4/OKTgIFlB
	 zNiDzhzgbTRlQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6A5BC4160E; Sun, 15 Jun 2025 21:19:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220236] New: Corsair K100 USB keyboard not working after resume
 from suspend on AMD platform (ASUS B650E-F, Ryzen 7800X3D)
Date: Sun, 15 Jun 2025 21:19:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kosimo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220236-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220236

            Bug ID: 220236
           Summary: Corsair K100 USB keyboard not working after resume
                    from suspend on AMD platform (ASUS B650E-F, Ryzen
                    7800X3D)
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kosimo@gmail.com
        Regression: No

I am experiencing an issue with my Corsair K100 USB keyboard on Linux after
resuming from suspend (S3). When I wake the system from sleep, the keyboard
does not respond, and I am unable to enter my password at the login screen.=
 The
only workaround is to physically unplug and re-plug the keyboard, after whi=
ch
it works normally.

This issue is present on:

    Arch Linux (fully up to date)

    Kernel version: [6.15.2]

    Motherboard: ASUS Strix B650E-F

    CPU: AMD Ryzen 7 7800X3D

    GPU: Radeon 7900XTX

    DE: KDE Plasma 6.3.5 (Wayland)

The problem also occurred on other Linux distributions (e.g., openSUSE
Tumbleweed) on the same hardware.

A similar bug has been reported for the Corsair K95 and other Corsair keybo=
ards
(Bug 112591), which appears to have been partially addressed with quirks for
certain device IDs and boot initialization. However, this issue affects the
K100 and specifically happens after suspend/resume, not at boot.

Further details:

    Unplugging/re plugging the keyboard always restores functionality.

    The problem occurs whether the keyboard is plugged into USB 2.0 or 3.x
ports.

    BIOS and keyboard firmware are fully updated.

    No AUR or out-of-tree modules are used.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

