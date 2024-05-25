Return-Path: <linux-usb+bounces-10534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7728CEE6A
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 12:03:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85731C20BDF
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 10:03:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56064208C1;
	Sat, 25 May 2024 10:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gswqpcFO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB58F66
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716631379; cv=none; b=C4uTxUVrCs8WBRrB0k8i87Ts+RvuCX7Czs4Gcj8tGbElPfh9ed1yP4xnnuCGSW3X9ILuGCQf0WGICHquNgqhD0A3TqqDk7E3GiURpqPMffhvNFNda0UzolOdWyGQlyTlWSX6C3EagRBps764AWVO1yjWZrEDYPuuEhknfK8HaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716631379; c=relaxed/simple;
	bh=rpWiKi0mu/2WP2PewKmkW9htrT30Fw8l091v55V/kSs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=U1bXDvQAPCIeUOmhmv4sDgdHX4ds55fefLRKNsITQsqAJGnbg1Flibi4T6YtWT5F/EMHpBPMpVDYB03RwL0Y6That8JhVQIQWbtPVfc+zzlsiC8Qo09k+sa1HoivA9OhwK2mDxNGTvmNz+i7hhvOgHvmu8WXaobuNgGeRXHKLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gswqpcFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 772BDC2BD11
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716631379;
	bh=rpWiKi0mu/2WP2PewKmkW9htrT30Fw8l091v55V/kSs=;
	h=From:To:Subject:Date:From;
	b=gswqpcFO19H+8zSeevO8/01RNR9D3oR4OivZktAkB3qH41RtbUfo3AYw+6lp4S9dp
	 o13nTCEShsskF6a//SOBeqYPVLUyF/Bp6AOlThyifAI2BfbxbkeAjcqXtnPhxxJ4kd
	 +xDhI406gy0UX5xwkcVZdxXFs79hDirIFynWIF6u0Ols86nvonKpeEWuheh92GkDXi
	 kYYPQW6ItSDtCGAsyeCcs4azo/RnDP6HzSUE4yWEFUN7MkCXRzTOF1D9Yj7DpF/HKS
	 pKT/xpw0B9RsfRkvaak6qP6ORyhOG2Iu4ZgBvVlYQltmAoXsk8fslg3h+Y8s10S4zK
	 IJ81VIVgaYdxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 64EF8C53B73; Sat, 25 May 2024 10:02:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] New: reset SuperSpeed USB device number 2 using
 xhci_hcd
Date: Sat, 25 May 2024 10:02:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

            Bug ID: 218890
           Summary: reset SuperSpeed USB device number 2 using xhci_hcd
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pierretom+12@ik.me
        Regression: No

Created attachment 306346
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306346&action=3Dedit
usbmon

Hello,

Since kernel 6.1.82 (amd64), I got this message when turning on the external
drive.
The device is accessible after about 1 minute, then I can mount the fs and
access data.

It happens with those kernel versions:
6.1.82
6.7.7
6.7.9
6.8.9
Git mainline

Latest kernel versions tested and not affected:
6.1.76
6.6.15

SATA/USB controller: Bus 006 Device 003: ID 174c:5106 ASMedia Technology In=
c.
ASM1051 SATA 3Gb/s bridge
SATA controler: ASMedia Technology Inc. ASM1061/ASM1062 Serial ATA Controll=
er
(rev 01)

Added this module parameter: `quirks=3D174c:5106:t` for the usb-storage
driver, same.

Part of `dmesg`:
[   89.821220] usb 6-1: new SuperSpeed USB device number 2 using xhci_hcd
[   98.669813] usb 6-1: New USB device found, idVendor=3D174c, idProduct=3D=
5106,
bcdDevice=3D 0.01
[   98.669829] usb 6-1: New USB device strings: Mfr=3D2, Product=3D3,
SerialNumber=3D1
[   98.669836] usb 6-1: Product: AS2105
[   98.669842] usb 6-1: Manufacturer: ASMedia
[   98.669847] usb 6-1: SerialNumber:             XXXXXXXX
[   98.702925] usb-storage 6-1:1.0: USB Mass Storage device detected
[   98.703186] scsi host10: usb-storage 6-1:1.0
[   98.703323] usbcore: registered new interface driver usb-storage
[   98.712000] usbcore: registered new interface driver uas
[   99.729263] scsi 10:0:0:0: Direct-Access     ST3000DM 001-1CH166       C=
C29
PQ: 0 ANSI: 0
[   99.729842] sd 10:0:0:0: Attached scsi generic sg3 type 0
[   99.730034] sd 10:0:0:0: [sdc] Very big device. Trying to use READ
CAPACITY(16).
[  130.381128] usb 6-1: reset SuperSpeed USB device number 2 using xhci_hcd
[  130.401814] sd 10:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00
TB/2.73 TiB)
[  130.402173] sd 10:0:0:0: [sdc] Write Protect is off
[  130.402181] sd 10:0:0:0: [sdc] Mode Sense: 23 00 00 00
[  130.402486] sd 10:0:0:0: [sdc] No Caching mode page found
[  130.402493] sd 10:0:0:0: [sdc] Assuming drive cache: write through
[  130.403339] sd 10:0:0:0: [sdc] Very big device. Trying to use READ
CAPACITY(16).
[  161.100747] usb 6-1: reset SuperSpeed USB device number 2 using xhci_hcd
[  161.395030]  sdc: sdc1 sdc2
[  161.395511] sd 10:0:0:0: [sdc] Attached SCSI disk

Output of `cat /sys/kernel/debug/usb/usbmon/6u`, see attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

