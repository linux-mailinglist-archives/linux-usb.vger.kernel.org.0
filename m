Return-Path: <linux-usb+bounces-3945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1F880BBE1
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 16:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04DBD1F2103D
	for <lists+linux-usb@lfdr.de>; Sun, 10 Dec 2023 15:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C783415ADC;
	Sun, 10 Dec 2023 15:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MK0Hinzw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3DD154B2
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 15:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98582C433CA
	for <linux-usb@vger.kernel.org>; Sun, 10 Dec 2023 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702221275;
	bh=P31/xRbQ5qbSP353XQAslY26Au483Ys9c0mD6OU7d5A=;
	h=From:To:Subject:Date:From;
	b=MK0Hinzw714XeF04+RHW8opAihoKE57NykrTMwu+ymxQRa+ZIGoG4mr9q9byuM9e4
	 OBiAuQwTgyn2hb+dsEF+XRRoP5bFbBq+SXX26lNQUtKPEYJl7OrRZOYUUZ8wH6kwsu
	 3Q78WPsqfyphqN+GMYZ//03JFnxdasV0Y/vbL/5ATzoxtXTP42GO1sX7cxGjTKlRnt
	 V6RORdqKEWVYqBPR+vIEKT2NAdQ0So0uv74OgJ4LMelHTTvC6YcaQpUPdOqVtPnmmd
	 q1J1Z1PAN9A7HzVQTdunIkc3xG+rprYM9ILaHhqgMqtF0s8oEh8vR6mjme2zF8xONr
	 ZpvTRxNt0ByrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77EBAC4332E; Sun, 10 Dec 2023 15:14:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218249] New: Since kernel 6.3.1 Logitech MK260 Unifying
 Receiver not working properly
Date: Sun, 10 Dec 2023 15:14:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.grobecker@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218249-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218249

            Bug ID: 218249
           Summary: Since kernel 6.3.1 Logitech MK260 Unifying Receiver
                    not working properly
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jan.grobecker@gmx.net
        Regression: No

I also got hit by the kernel regression for logitech unify receiver (bug
#217523). I hoped that Hans de Goede's fix
(https://lore.kernel.org/linux-input/20231005182638.3776-1-hdegoede@redhat.=
com/)
would fix my issue too. Alas, the fixes were only for

>    This series has been tested on the following devices:
>    Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
>    Logitech M720 Triathlon (bluetooth, HID++ 4.5)
>    Logitech M720 Triathlon (unifying, HID++ 4.5)
>    Logitech K400 Pro (unifying, HID++ 4.1)
>    Logitech K270 (eQUAD nano Lite, HID++ 2.0)
>    Logitech M185 (eQUAD nano Lite, HID++ 4.5)
>    Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1.0)
>    Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.0)
>=20=20=20=20
>    And by bentiss:
>    Logitech Touchpad T650 (unifying)
>    Logitech Touchpad T651 (bluetooth)
>    Logitech MX Master 3B (BLE)
>    Logitech G403 (plain USB / Gaming receiver)

whereas mine is Logitech MK260 Unifying Receiver USB id 046d:c52b.

In my case the regression shows in the double click with the mouse wheel no
longer working.

I can see that it's a regression on that kernel series as it is not present=
 on
a longterm kernel 6.1.65-200.fc39 from
@copr:copr.fedorainfracloud.org:kwizart:kernel-longterm-6.1
kernel-longterm-core.x86_64 that I use on another Fedora 39 machine.

If you need further information from me please contact me. Thank you!

Regards
Jan Grobecker

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

