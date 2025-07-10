Return-Path: <linux-usb+bounces-25660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A41AFFD9D
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 11:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90980B428AF
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jul 2025 09:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A9628DF02;
	Thu, 10 Jul 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQ8KLjY2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5281C861B
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138674; cv=none; b=ZKodwgKHVVZjoOpCxrDtpREhIXTKmq00MS60so73UkNAI3cP6SUrsAx1FAA+V8BMZ0FEUPEP93YJiLfe1m86ZhDjIH/4dveplgjJr84JSRQcUimZtFxiXh732oiOvfl9cg4uyF0ubxaQ2+wOY9DRPZhybjXweejCkY179HU/uWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138674; c=relaxed/simple;
	bh=bU3G3NQXTbBsUsFWHm0A7cxZQOxzkDZNyLdo/G03m4I=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=TJZHAKh0Ie550W71/2eHtp1HdKfSLwL185z9nrq0tI7rJueSEwrVTzCBSmG3h8Ns5E9rG4GYkTk86LF9lMTOZduY+QLRS+jqLeK8mwYfVionaVqqoEaZU1fyP6XhCXGCRtNiOaMi9FsTcUr2DRFschw8fbJ52MV41IR+z1zSjJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQ8KLjY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C7B4C4CEE3
	for <linux-usb@vger.kernel.org>; Thu, 10 Jul 2025 09:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752138674;
	bh=bU3G3NQXTbBsUsFWHm0A7cxZQOxzkDZNyLdo/G03m4I=;
	h=From:To:Subject:Date:From;
	b=QQ8KLjY28ERV2nSQWcB7ySApsWbgXkVFy2kP8KALfi+iX1BqYOtIwqX/5XNATwKW2
	 7AYpqwSLLFhBkf0o6pGAhxDxhnqEIwbydsx2WJsZ2itZYVIpJXr6K8lRDUK7NlmVzq
	 YzlC4dlXE8LR0NAuuWIO2bjXPGl//hUILhiOP2Zo4wBSX/bbrVxDWEA3UBGaerZzli
	 vceyeo3PoHGnNFr5PgsQyiWSr8GnwXXC91nikl5ZGx46VZoKQXX82ib0mLXWumPsxi
	 vrx+/yOVTK8x+Gqdp1/wLM9KnaBJGTriCMdjswNkGvrEQ7fcMqYGKq495ePz9Bdc6b
	 nwWMyLd56BRXQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C5B7C433E1; Thu, 10 Jul 2025 09:11:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220331] New: FTDI serial IO - unknown device type: 0x8312
Date: Thu, 10 Jul 2025 09:11:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomas.hanslik@septim.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220331-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

            Bug ID: 220331
           Summary: FTDI serial IO - unknown device type: 0x8312
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: tomas.hanslik@septim.cz
        Regression: No

Issue with a newer hardware with USB DisplayLink adapter, syslog throws
following error about unrecognized device type 0x8312:


> [    4.447826] usb 1-8.2.1: New USB device found, idVendor=3D17e9,
> idProduct=3Dff00, bbcdDevice=3D83.12
> [    4.447833] usb 1-8.2.1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber
> =3D3
> [    4.447835] usb 1-8.2.1: Product: PM1000
> [    4.447836] usb 1-8.2.1: Manufacturer: DisplayLink
> [    4.447837] usb 1-8.2.1: SerialNumber: 9638293100007141
> [    4.479297] usbcore: registered new interface driver ftdi_sio
> [    4.479363] usbserial: USB Serial support registered for FTDI USB Seri=
al
> Device
> [    4.480786] ftdi_sio 1-8.2.1:1.0: FTDI USB Serial Device converter
> detected
> [    4.480848] ftdi_sio ttyUSB0: unknown device type: 0x8312
> [    4.480923] ftdi_sio 1-8.2.1:1.1: FTDI USB Serial Device converter
> detected
> [    4.480957] ftdi_sio ttyUSB1: unknown device type: 0x8312
> [    4.486014] ftdi_sio ttyUSB0: unknown device type: 0x8312
> [    4.486049] ftdi_sio ttyUSB1: unknown device type: 0x8312

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

