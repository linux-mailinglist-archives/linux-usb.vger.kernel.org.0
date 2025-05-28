Return-Path: <linux-usb+bounces-24346-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA6AC5FAB
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 04:48:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52F051BA1429
	for <lists+linux-usb@lfdr.de>; Wed, 28 May 2025 02:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3762B17A2E3;
	Wed, 28 May 2025 02:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lns2D4CV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33B128E0F
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748400502; cv=none; b=CKCPJ3TK788fYVETAllLHUyYplw8TZyOh53BhoCr0ErZ5SqCc9ELG+JQwx3fXGaeSgczTY6zkD4hl1kT4RTylgenuj596u2NO1fKfU4JoPPNu7tSe1Nqgu3klPTDm3ToQJ77J0e90lS3QEHTx/MsIXRXyDG1UPfJ5NT0MjADcZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748400502; c=relaxed/simple;
	bh=gTr+g23mc8Sd1W2vZxYrkSU7RhCYhrx+qwYIO1NpbbU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Kox7PAv4onD9mXj3MrVZKltTOydgkUAA9G/lu4oc4pabv79bkCpAsRfJwdb4vmaTglRwLucQsrCYJ5dPmaEc8qn8BeSZDK4edpQ6zeZ7ojOsGIfDs2eNuSs6PHaYucots3+Kpnn3scNL41OLQz/YrG7A1glyKQh5nhbrUQxLX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lns2D4CV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20D57C4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 28 May 2025 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748400502;
	bh=gTr+g23mc8Sd1W2vZxYrkSU7RhCYhrx+qwYIO1NpbbU=;
	h=From:To:Subject:Date:From;
	b=Lns2D4CVa16X6p8YW3ug+sdlUIlB6dLmwIa9WRPGFv4cCb0SyHQTj+p+SQes5M+by
	 a+5W0pkNrqGQdDmboe/adEk+IzIunNOa12eutaemqdxPWBxUjWDXdHS3e/pZWJpBoE
	 1kXxwzF/RIhTdcjD3s7Hnx23kesDEQS4Vjy5ao6zC1Z/WF1WJxDsS9IQFPpGpMW7y7
	 cZKI309qCbHgPTBN6Ymv53oZ0ZlP6SavuMRYVis+l7Zxtb7rg+pT/uG48wLwN2uUFn
	 YuGTfA3nz1gjmknzg7W6IkarYzLiG1P1010xAmCRSUS+QmoMRg0LJF9X88OW3PEXT+
	 Z2t+F7G+SRbeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10434C433E1; Wed, 28 May 2025 02:48:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220166] New: The g_webcam UVC gadget driver fails to enumerate
 properly on Windows 11, returning USB\DEVICE_DESCRIPTOR_FAILURE in Device
 Manager, while other USB gadgets (g_serial, g_mass_storage) work correctly on
 the same hardware and Windows version. This represent
Date: Wed, 28 May 2025 02:48:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joshcabarrus@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220166-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220166

            Bug ID: 220166
           Summary: The g_webcam UVC gadget driver fails to enumerate
                    properly on Windows 11, returning
                    USB\DEVICE_DESCRIPTOR_FAILURE in Device Manager, while
                    other USB gadgets (g_serial, g_mass_storage) work
                    correctly on the same hardware and Windows version.
                    This represent
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: joshcabarrus@gmail.com
        Regression: No

System Information

Hardware: Raspberry Pi Zero W Rev 1.1 (BCM2835, Revision: 9000c1)
Kernel: Linux 6.12.25+rpt-rpi-v6 #1 Raspbian (armv6l)
USB Controller: dwc2 20980000.usb
Host OS: Windows 11 (up to date)

Problem Description
When g_webcam is loaded and the Pi Zero W is connected to Windows 11 via US=
B:

g_webcam behavior:

Loads successfully on Pi: g_webcam ready, bound driver g_webcam
UDC state remains: not attached (never reaches configured)
Windows shows: Unknown USB Device (Device Descriptor Request Failed)
Hardware ID: USB\DEVICE_DESCRIPTOR_FAILURE


g_serial behavior (control test):

Loads successfully: g_serial ready, bound driver g_serial
UDC state becomes: configured
Windows properly recognizes as COM port device



Steps to Reproduce
bash# On Raspberry Pi Zero W:
sudo modprobe g_webcam
cat /sys/class/udc/20980000.usb/state  # Shows: not attached

# Connect USB cable to Windows 11
# Result: "Unknown USB Device" in Device Manager

# Control test:
sudo rmmod g_webcam
sudo modprobe g_serial=20=20
cat /sys/class/udc/20980000.usb/state  # Shows: configured
# Result: Working COM port in Windows
Expected vs Actual Behavior
Expected: g_webcam should enumerate successfully on Windows 11 like other
gadgets and previous Windows versions.
Actual: Windows 11 rejects the USB device descriptors with
DEVICE_DESCRIPTOR_FAILURE.
Analysis
The issue appears to be Windows 11's stricter USB descriptor validation. The
g_webcam UVC descriptors may not fully comply with:

USB Video Class specification requirements
Windows 11's enhanced USB security validation
Microsoft's USB descriptor formatting standards

Loaded Modules
g_webcam               16384  0
usb_f_uvc              77824  5=20=20
uvc                    12288  1 usb_f_uvc
libcomposite           69632  17 usb_f_acm,usb_f_uvc,g_webcam
dwc2                  176128  0
Kernel Messages
g_webcam gadget.0: uvc: uvc_function_bind()
g_webcam gadget.0: Webcam Video Gadget=20=20
g_webcam gadget.0: g_webcam ready
dwc2 20980000.usb: bound driver g_webcam
Impact
This affects numerous Raspberry Pi Zero W webcam projects and tutorials that
previously worked with Windows. Users report this issue across multiple Pi =
Zero
W webcam implementations.
Suggested Investigation Areas

USB Descriptor Compliance: Review g_webcam's USB descriptors against latest=
 USB
Video Class specification
Windows 11 Requirements: Compare descriptor format with Windows 11's valida=
tion
requirements
VID/PID Issues: Verify Vendor/Product ID configuration doesn't trigger Wind=
ows
driver conflicts
UVC Version Compatibility: Check if UVC version advertised matches capabili=
ties
provided

Request
Could the maintainers investigate updating g_webcam's USB descriptors to me=
et
Windows 11's stricter validation requirements? The fact that g_serial works=
 but
g_webcam fails suggests this is a descriptor-specific issue rather than
hardware or driver framework problem.
Additional Information Available
I can provide:

USB protocol analyzer captures
Testing with different Windows versions
Comparison with working UVC implementations
Further diagnostic information as needed

Thank you for maintaining the USB gadget subsystem.
Reporter: [Your name and email]
Date: May 27, 2025

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

