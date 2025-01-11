Return-Path: <linux-usb+bounces-19206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC3A0A1CD
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 08:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6983A16DE24
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jan 2025 07:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5651C156F54;
	Sat, 11 Jan 2025 07:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mJsUuevM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE1914F9EB
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 07:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736579970; cv=none; b=ImqlRyjkIpSSiSMpEtz+ne4JFWkMZZ1r4WijR2wy2gPzXinLwQl0s6TnsLsFv9XdJS/40FqvfAGEnLyd2FjxZJe3NyvmdY0WPFeRxmF1lc1z9dXySTUYRiL6Shv35BVXFWuaSs7Sh5TBEHyv0P9iVJga4pnaxySliV/yMNMRzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736579970; c=relaxed/simple;
	bh=TjMDCWUG8hDPmIBuTJZJGyBwZeeFsGnM5YXyYoOQCMY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=OHFO8LB7jzz3BEo4iFrMzGkalHJYkUfceMzmcbCsJug0lMl5m8XlF3dV+KgKImHhk87WQWbEtSMO2l1V/4xdl8MNHl1IqHWFK6PlWfYtuhJxbuhmVMQAIN684LpNxrPH2qYS7KmvjxJTnEv6wMvxlbNpo7DMUbBvQ8COvCFGMNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mJsUuevM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41151C4CEE2
	for <linux-usb@vger.kernel.org>; Sat, 11 Jan 2025 07:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736579970;
	bh=TjMDCWUG8hDPmIBuTJZJGyBwZeeFsGnM5YXyYoOQCMY=;
	h=From:To:Subject:Date:From;
	b=mJsUuevMsdtfcZI/DevmCEEIxRP2p1V0n/uk36170zddUef18hWT3uhhk5SEnqYsc
	 ZJIEQkYG00FaEboh8FKkvipSAiYDfCwd8mKuR9pATVWI9OQaN86LbkGgOqiQUBQLvs
	 XNJtnae3zX4k9Z6waSSBIREkrYNu9Hl4ZYqVIxESVOW9UzQtyzSjqmPQSmxv+r06bw
	 zzRVPKNpZtkAfjRcPHNgt+D1rT3iDzhoXA7NddLLc3aDEzVrKx2wzFIKNkgdBjqz1X
	 4U1Cp5GLCbak7c7ehayRaMUSxlweKU0upK+Cq4UzDa+amkopKQzjWt1sERSAx0/F+D
	 qoxll3Qx1wpuA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2BA10C3279F; Sat, 11 Jan 2025 07:19:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] New: ASUS Zenbook S 14 UX5406SA: Unstable USB
 connection on USB-A port under certain condition
Date: Sat, 11 Jan 2025 07:19:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

            Bug ID: 219681
           Summary: ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
                    USB-A port under certain condition
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: dantmnf2@gmail.com
        Regression: No

Created attachment 307476
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307476&action=3Dedit
dmesg output

Kernel version: 6.13.0-rc6-1-mainline
Kernel config:
https://github.com/archlinuxcn/repo/blob/d92ecf4073f4bb620665c2cd47b088efff=
31d43a/archlinuxcn/linux-mainline/config

Why this bug report:
No connection issues found under Windows.

USB devices affected:
* JMS583 disk enclosure
* 2 RTL8156B Ethernet adapter from different makers

USB devices unaffected:
* RTL9210B/ASM2464 disk enclosure (with the same disk)
* Any devices mentioned before, but connected to USB-C port through a passi=
ve
  USB-C to USB-A adapter

Steps to reproduce:
1. start the appropriate background service (NetworkManager and udisks2)
2. connect the device to the USB-A port
3. attempt to use the device, such as reading from the disk or letting=20
   NetworkManager to do some DHCP

Expected behavior:
No connection issue, just like how it works on USB-C port.

Actual behavior:
1. I/O timeout on the JMS583 disk enclosure (dmesg attached):
    # dd if=3D/dev/sda of=3D/dev/null bs=3D512 count=3D1=20
    dd: error reading '/dev/sda': Input/output error
    0+0 records in
    0+0 records out
    0 bytes copied, 61.3496 s, 0.0 kB/s
2. frequent device reset on RTL8156B adapters (dmesg attached)

Attempts with a bus-powered USB hub connected to the USB-A port:
* connect ONE of such devices to the hub - same issues
* connect TWO of such devices to the hub - no issue on both devices

Additional information:
* Without udisks2 running, the JMS583 disk enclosure seems to work fine
  (no errors on simple dd commands)
* Without Ethernet cable connected, the RTL8156B adapter also seems to "wor=
k"
  fine

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

