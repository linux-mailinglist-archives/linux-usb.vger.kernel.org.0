Return-Path: <linux-usb+bounces-23305-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D29A96A9C
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 14:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79C5D16263A
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 12:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5069D27C15D;
	Tue, 22 Apr 2025 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuCh2uXL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0121EDA27
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 12:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325869; cv=none; b=gbE7kfEn7xR/EaSENAWb3pzXdaFtlr/TsMA7+2OQkIGjBu3Fyhz5AVi77ggjZPUZ+KMzE7/eRpHKsiLCkExxHT7rbtZ8YuGiSCafF/H31hglLu0+MiyIDwmZ3EMgttDgGlI4mraOHiAtAsXva61U7gRaoXdXiNTrD7121S1byGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325869; c=relaxed/simple;
	bh=sz2p0dPBKVOeM0rA6LT+ZeT3Ci+09Ooz/lQ+j/wwGgI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KhjZxN0NQ65Bu9eHv3Z+xHoZZuoXE0zB+tnyf+0/5CbKAHCMjDatzQjE6vAJqvJTWmdfI9vpcgKxRFbfXzmybERYnucAupn2YOc0XjliXhZDxip6vkGRpTQTTfrmbaeydxMP4iiNyXR0Z6CN6rUAKgvROnxQtUw5KUOQvlcHxa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuCh2uXL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3B75EC4CEE9
	for <linux-usb@vger.kernel.org>; Tue, 22 Apr 2025 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745325869;
	bh=sz2p0dPBKVOeM0rA6LT+ZeT3Ci+09Ooz/lQ+j/wwGgI=;
	h=From:To:Subject:Date:From;
	b=CuCh2uXLNZkniFY1Wv52ZbeNOzspUr+w5oLm1nozJRlKEmrEx6uKmnWs0+mVXM4Qv
	 V8ArEP6TtJsAEPdxKmZhoCL/3AOSRoWXeIUJw29Mslu73EY7SGHqjApQTV/mxBQyBs
	 P7ADZYijxgiahYgwsXRgfaqgCrm0Eo/SS3oZIV9/hWf6uH/C+KQP1ymx+h9Xv55vNK
	 C2Yf+ogXUXIcj7o7+ucDoU4sP8JpT0arInTwfiqBLYoFONGF2t1OmnygRgAQJFJwf1
	 gvdzRicyUrWyubrDJwtpyZNLVviLfMj0/M+QWnBQQu8hAZ2cWRulLd6arFc8QqkODl
	 kxAtB+xtGbZYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 32C62C41613; Tue, 22 Apr 2025 12:44:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220044] New: rndis_host: Zyxel 5G portable router seen as a
 WWAN device and not an Ethernet one in 6.13
Date: Tue, 22 Apr 2025 12:44:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bigon@bigon.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220044-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220044

            Bug ID: 220044
           Summary: rndis_host: Zyxel 5G portable router seen as a WWAN
                    device and not an Ethernet one in 6.13
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: bigon@bigon.be
        Regression: No

Hello,

I've a Zyxel 5G portable router (NR2301).

Bus 003 Device 002: ID 05c6:9057 Qualcomm, Inc. SDXLEMUR-LITE-MTP _SN:XXXX

With kernel 6.12.22 from debian unstable, when the device is connected to t=
he
computer by USB, it is seen as a network card and NetworkManager (1.52.0) r=
uns
DHCP to get a connection.

With 6.13, this is not the case anymore.

dmesg output with 6.12.22:
rndis_host 3-2:1.0 eth0: register 'rndis_host' at usb-0000:00:14.0-2, RNDIS
device, fc:dd:55:ff:ff:ff
usbcore: registered new interface driver rndis_host
rndis_host 3-2:1.0 enxfcdd55ffffff: renamed from eth0

dmesg output with 6.13:
rndis_host 3-2:1.0 wwan0: register 'rndis_host' at usb-0000:00:14.0-2, Mobi=
le
Broadband RNDIS device, fc:dd:55:ff:ff:ff
usbcore: registered new interface driver rndis_host
rndis_host 3-2:1.0 wwxfcdd55ffffff: renamed from wwan0

As you can see with 6.12 it's seen as a Ethernet/RNDIS device, but with 6.13
it's seen as a Mobile Broadband RNDIS device

This seems to be a regression from 67d1a8956d2d62fe6b4c13ebabb57806098511d8

Note that the device is establishing the connection itself and also act as a
WiFi access point. The computer is not involved in the ppp connection at al=
l.

Can something be done?

Kind regards,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

