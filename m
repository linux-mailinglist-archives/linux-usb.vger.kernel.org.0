Return-Path: <linux-usb+bounces-16609-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191149AD5BA
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 22:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D0A31C20B3A
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 20:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4591CEE8A;
	Wed, 23 Oct 2024 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RFpZLct0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBF413D2A9
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 20:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729716303; cv=none; b=iAszSTptIIJqkZ8LS2xffujgcVZHf9+nC3/f6KWXzqjwTAvsNTcRZGzwnvYAgGVyZ74pnmtw+lA6+g7X/0C22ShQ+YucpGRg/1DAu57q6JhRkMI+p1H/PoDgjFJs7b3TaEHGBpVUyyNGZknNr6KV8qmKRWuUtKSu1Rd1ZW8DuJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729716303; c=relaxed/simple;
	bh=s7hZ133O/DyC3LjmuSUIcZg+3T+kYdQ53P5soOsKRkA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u8Scu2jAHtgxMzidYa3KqUeqnurwYJPkJC+MAzH6KHBWCzylI6dcnXgTirDNP7U15SGUWF1uAVzB8RqJjQRDfKYy/vYmOPRYLaCQxF3IP8X1uBRsbPW5X9LFEUpf0iiFwy2B4+UbCrg77qdIrt688At4EnU+aZ66gyHFN9FSUbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RFpZLct0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EE46C4CEC6
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 20:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729716303;
	bh=s7hZ133O/DyC3LjmuSUIcZg+3T+kYdQ53P5soOsKRkA=;
	h=From:To:Subject:Date:From;
	b=RFpZLct0LmLWbBfd7lOc2NIXSNcY+sHy4yP6KMEmdNjqwPFFexkPDWBmKEoQXaF3p
	 VCCXBNTF2qe0qXNhIGdOylBAn3zNzu/Jqt7vjM6MpHr2H+DZQUgwK+RyXEeXqc5X83
	 mGvbn9xMsDjxMHCwbVC2QECAEBWUWabDDRygMxr+m9Pi+q8fr+ZWjvInJIq+067qvs
	 teMPyLSIMaiQ+us+tG1J86DJyQICWPIpUIs15YqbhqXbPmJYDuMMSGMF/zehzphHnR
	 Vpr+pioBOJQVkXbHrjGNHOhMqQIyc7AfTORA70eTyXrvwVxUsOQfO3mL35gtus1Lmj
	 ov4RF8sAsCBgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1075BC53BBF; Wed, 23 Oct 2024 20:45:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219422] New: Hard crash when USB4 cable is disconnected during
 sleep
Date: Wed, 23 Oct 2024 20:45:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@68x.ca
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219422

            Bug ID: 219422
           Summary: Hard crash when USB4 cable is disconnected during
                    sleep
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: me@68x.ca
        Regression: No

Created attachment 307062
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307062&action=3Dedit
Error after USB4 cable is disconnected and

Hi, my current setup is a Lenovo Legion Go with a USB4 based external GPU (=
Onex
GPU with a 7600M XT). I am running these tests on EndeavorOS with 6.12 rc4
kernel and stock 6.11.2-arch kernel.

My device crashes and hard locks when the USB4 cable is disconnected or when
the device is not inaccessible upon a sleep and wake cycle.

I have been able to reliably crash system with this external GPU with the
following steps:

1. Connect my eGPU dock
2. Wait a few seconds
3. Put the device to sleep
4. Wait for the device to sleep
5. Disconnect the USB4 cable
6. Wake the device up and the system will hard lock

I attached a photo of the logs. The error message is: 'Unable to change pow=
er
state from Dcold to DO, device inaccessible' and this occurs for all PCI
devices on the USB4 dock.=20

The above also occurs intermittently even when I have the cable attached.


To isolate if it was my device or the USB4 eGPU enclosure, I have also trie=
d a
Thunderbolt 3 laptop dock and that works reliably. I am able to disconnect =
the
TB3 device during sleep and my system successfully recovers.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

