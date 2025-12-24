Return-Path: <linux-usb+bounces-31753-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFACCDC2AC
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 13:00:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47BC6300647D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Dec 2025 12:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABE23168E6;
	Wed, 24 Dec 2025 12:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIOcvQVI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F531386DA
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 12:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766577619; cv=none; b=Hvq2YxTTwUzPqwdE4Lp9WP7IFBWfEXJOH5EMZY0j0968bk9CPIZ/HhBvejO2z/2nws6oaEcA/wnD53Y+LnOyYfZy/50nfVwBXJIvxkueKouaO7mUzhNn9Lv3kS3cgW4zxetU38ZuiTDQT+14eHN02jm9S0n/WP+sDs0RVkfuyT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766577619; c=relaxed/simple;
	bh=Gng2LHY/8KVfhOPkgvZqvZwljHCsj4cCR8aAF8gLRso=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zi83iEJ0HvpVLxwU1sb/AOUHjN1lPkv8wTAeBXe2Irvk8EGpaTsXWsc/2hUrmydz6bYCeAJHv649pp1NuoAZy0r+nIloWWBfvG2mymLSKhhE02KbYM5ahRz7kQoYJnx/B40i3eDOib114mvfwj3TFKG0xU0Djezq8sO5Y8Mr+xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIOcvQVI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCE91C4CEFB
	for <linux-usb@vger.kernel.org>; Wed, 24 Dec 2025 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766577618;
	bh=Gng2LHY/8KVfhOPkgvZqvZwljHCsj4cCR8aAF8gLRso=;
	h=From:To:Subject:Date:From;
	b=RIOcvQVIfgi3F+B+wHZSuZjFgPLt8j1/ipSd/Vr+sCBioA2T3sZglGGCLFUtLFdYE
	 rMYtCmpJu++qjz2yE9Zdm7F9Ey8LtsTFxQdcr+gYuzzF7JZFgqlljzx5SnCqp8uuXn
	 WOfEV2aISne3u82LABs2mvMk1a1YswNHvNqp44XvtLgQc6yzFJYOlELdPcgeKc16JU
	 peg/bvncBvMaP8SwcETu9cI4U+jYMoPUliFzpu3uhBaZwxf99z/MOMhlhJzWKG4Bkj
	 LkJcdMjhR9J00yOrcoVMVlmvWbdfNHrwDEHq6Ogj5iuoHA+16SLizHiOo6WljuXqca
	 3+VNPkF03kN8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD5E4C3279F; Wed, 24 Dec 2025 12:00:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] New: [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated
 on USB-C hot-plug
Date: Wed, 24 Dec 2025 12:00:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

            Bug ID: 220904
           Summary: [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
                    USB-C hot-plug
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.18.2-zen2-1-zen
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: thomas@jetzinger.com
        Regression: No

Created attachment 309074
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309074&action=3Dedit
Kernel .config for 6.18.2-zen2-1-zen (Arch Linux zen kernel)

[1.] One line summary of the problem:
USB-C dock USB 3.0 devices fail to enumerate on hot-plug (only USB 2.0 work=
s);
works at boot and on Windows

[2.] Full description of the problem/report:
On ThinkPad X1 Carbon Gen 11 with ThinkPad USB-C Dock Gen2 (40AS), USB 3.0
devices
(including ethernet adapter) do not enumerate when hot-plugging the dock. O=
nly
USB 2.0
devices (audio, HID) enumerate. The same dock works correctly when connecte=
d at
boot,
and hot-plug works correctly on Windows 11, indicating this is a Linux driv=
er
issue.

Detailed analysis:
- At boot: Dock connects via Thunderbolt 4 controller (0000:00:0d.0), USB 3=
.0
devices
  enumerate on Bus 2 (20Gbps SuperSpeed), ethernet (r8152) works
- On hot-plug: Thunderbolt USB buses report "root hub lost power or was res=
et"
but
  dock falls back to internal xHCI controller (0000:00:14.0) Bus 3 at USB 2=
.0
speeds only

The typec subsystem shows the issue:
- At boot: dock connects as port0-partner, port0 has USB connector bindings
  (usb2-port1, usb3-port1, usb4_port1)
- On hot-plug: dock may connect as port1-partner, but port1 has NO USB
connector
  bindings in ACPI (possible BIOS deficiency)
- Even when hot-plugging to port0: SuperSpeed lanes are not negotiated, only
USB 2.0

dmesg on hot-plug shows:
  usb usb1: root hub lost power or was reset
  usb usb2: root hub lost power or was reset
  usb 3-1: new high-speed USB device  <-- Only USB 2.0 enumeration, no
SuperSpeed

The UCSI driver does not appear to trigger USB 3.0 SuperSpeed lane
renegotiation
on partner connect. No typec connector binding messages appear on hot-plug.

Tested workarounds that do NOT fix the issue:
- xHCI controller unbind/rebind (echo 0000:00:0d.0 >
/sys/bus/pci/drivers/xhci_hcd/unbind)
- UCSI driver reload (modprobe -r ucsi_acpi && modprobe ucsi_acpi)
- Using either physical USB-C port

Working workaround: Boot with dock already connected.

[3.] Keywords (i.e., modules, networking, kernel):
ucsi_acpi, typec_ucsi, typec, USB-C, Thunderbolt, hot-plug, SuperSpeed,
xhci_hcd

[4.] Kernel information
[4.1.] Kernel version (from /proc/version):
Linux version 6.18.2-zen2-1-zen (linux-zen@archlinux) (gcc (GCC) 15.2.1
20251112, GNU ld (GNU Binutils) 2.45.1) #1 ZEN SMP PREEMPT_DYNAMIC Thu, 18 =
Dec
2025 18:00:58 +0000

[4.2.] Kernel .config file:
[Attached separately as kernel-config.txt]

[5.] Most recent kernel version which did not have the bug:
Unknown

[6.] Output of Oops.. message (if applicable) with symbolic information:
No kernel oops. The only relevant messages are:
  usb usb1: root hub lost power or was reset
  usb usb2: root hub lost power or was reset
And then USB 2.0-only enumeration on Bus 3 instead of SuperSpeed on Bus 2.

[7.] A small shell script or example program which triggers the problem (if
possible):
# Reproduce steps:
# 1. Boot system WITHOUT dock connected
# 2. Log in to desktop
# 3. Connect ThinkPad USB-C Dock Gen2 via USB-C cable
# 4. Check USB topology:
lsusb -t
# Expected: Dock on Bus 2 with 20000M devices
# Actual: Dock on Bus 3 with 480M devices only, Bus 2 empty

# Diagnostic commands:
ls /sys/class/typec/  # Shows port0-partner or port1-partner
ls /sys/class/typec/port0/usb*  # port0 has bindings
ls /sys/class/typec/port1/usb*  # port1 has NO bindings (ACPI issue?)
ip link show | grep enp  # Ethernet interface missing on hot-plug

[8.] Environment:
Hardware: Lenovo ThinkPad X1 Carbon Gen 11 (21HMCTO1WW)
BIOS: N3XET63W (1.38) dated 2025-10-08
Dock: ThinkPad USB-C Dock Gen2 (40AS), firmware 5.05.00
OS: Arch Linux (rolling)
Desktop: Hyprland (Wayland)

USB Controllers:
- 0000:00:0d.0: Intel Thunderbolt 4 (USB 3.2, buses 1+2)
- 0000:00:14.0: Intel Alder Lake xHCI (USB 3.1, buses 3+4)

ACPI USB-C controller: USBC000:00 with two ports (device:a2=3Dport0,
device:a3=3Dport1)

Related bug reports:
- Red Hat Bugzilla #2248484: UCSI driver bug
- Arch Linux Forum: https://bbs.archlinux.org/viewtopic.php?id=3D308325

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

