Return-Path: <linux-usb+bounces-28120-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2F7B58110
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 17:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CDBEE4E223E
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 15:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5367E2264CB;
	Mon, 15 Sep 2025 15:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNnF+avu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9E223715
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757950994; cv=none; b=AlwE74/SfYynF2QZt6wizFpMoehpuaJByyRjFMVFlqLrxavGR/QAgNvCPitGuIqusyPK5mxOLlxMOC9xRPNsntwoqDV9q8GUbC5hYsHvfNPgOXgUYA9caeJPIy2q8P7wwMleUIyxX6E2NlX+5ReJ81n1tdcA52bAHXv5Wz93HmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757950994; c=relaxed/simple;
	bh=FKRBnaOrnPBkRqNb4ej9Sesul3Gr7J/yTqmmnMxcFYY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dOtk2F1ONh3Sa09tsUqPvHGxvK1yb8xp8Ku6j52qlpsw9x+BmuOadnWOQzva8DeO+oOVh/gX3CVxE6hOgDtYd9H6jHeQEiuBJA5b4lc1w711yQyZC+Iktt+/4Y+is3gxT1tMuJupAZmxtEj7yxAIJIG8ObiI3zx6eC1xWAnW9O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNnF+avu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 519D6C4CEF7
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 15:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757950994;
	bh=FKRBnaOrnPBkRqNb4ej9Sesul3Gr7J/yTqmmnMxcFYY=;
	h=From:To:Subject:Date:From;
	b=oNnF+avuDPY9r7Ft2F7rgIRFiFp4lbercYNgeudy0mJmxPt7TLrKF1I4EIHqVrCyl
	 T/d4dniGeAaDddVQRj3DACOglm8B0t5ZlR/qjxlPOUKgfaefgtnwBkvxnBKAu5jD3B
	 r5ujObXC+AUq98MuoNXi//s9R2xLXEx1THFQiP9PI+rgk+4vOPFeAcnoBbYW+9wxJ6
	 QBIHkcnoVklc9yVN0XIiIFbzbKwncCOEtvJvf59rShF9Q/oFznK9WuzrWkdbv5gXsw
	 ahBAiD/6awikSBwc/wq7PpCIUrGkOAQTRv3szwB4KohhMQTSn90iel6LdqkTu3BY79
	 /ACSB9M2lG4ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FDF2C41612; Mon, 15 Sep 2025 15:43:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220576] New: USB port disable doesn't work on all ports
Date: Mon, 15 Sep 2025 15:43:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: forum@docmax.my.to
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220576-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220576

            Bug ID: 220576
           Summary: USB port disable doesn't work on all ports
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: forum@docmax.my.to
        Regression: No

Hello,
with

echo 0 > /sys/bus/usb/devices/4-1.1/port/disable
echo 0 > /sys/bus/usb/devices/4-1.2/port/disable
echo 0 > /sys/bus/usb/devices/4-1.4/port/disable

i can disable the ports on my usb 3.2 hub. It's a 10-port hub from RSHTECH
(RSH-ST10C).

Output of uhubctl for the USB 3.2 part:

Current status for hub 4-1 [0bda:0423 TerraMaster 4-Port USB 3.0 Hub, USB 3=
.20,
4 ports, ppps]
  Port 1: 0203 power 5gbps U0 enable connect [2109:8822 VIA Labs, Inc. USB3=
.1
Hub 000000001, USB 3.20, 4 ports, ppps]
  Port 2: 0203 power 5gbps U0 enable connect [2109:8822 VIA Labs, Inc. USB3=
.1
Hub 000000001, USB 3.20, 4 ports, ppps]
  Port 3: 0263 power 5gbps U3 enable connect [0bda:0411 Generic USB3.2 Hub,=
 USB
3.20, 4 ports, ppps]
  Port 4: 0203 power 5gbps U0 enable connect [2109:8822 VIA Labs, Inc. USB3=
.1
Hub 000000001, USB 3.20, 4 ports, ppps]

The strange thing is, powering off port 1 and 4 works, but power 2 says it's
powered off, but the LED indicatior on the hub is still on (usb drive bay
doesn't suspend, the other 2 do).

Now i don't know if it is a hardware or a software bug. How to find out? Ca=
n it
be fixed?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

