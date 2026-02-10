Return-Path: <linux-usb+bounces-33264-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEtiIftui2lhUQAAu9opvQ
	(envelope-from <linux-usb+bounces-33264-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 18:46:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C911E13A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 18:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4F3B3004C02
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 17:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A6735CB84;
	Tue, 10 Feb 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUfwEb61"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854991DF970
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 17:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770745589; cv=none; b=VSkP21Unh/Yf8uYF/INEiN7fUaEHNDz24yE3w8rfibal3EftM7JFjSMGXr81WXcMUe1+zt7hXyJ2HHgXT6uX88igeUwwMB0iuK2EBWx8K+LGH+6qdIGRXc4h20EcAE0g9YrJWzeZHeckjrGk77eu6YDnTUe+ZIirbta+YHl+rHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770745589; c=relaxed/simple;
	bh=r5YqyRa9c18MdKCPCD7cqcJg2fL1zpH5dHHu5C4EPMo=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sqNcLFrqUk+F47FgYR02cdGh7TE0Ru6Fa0a2D8O9RdslGM/97yACETYezON7cNzK5Xp1asDZNfm3ynQhKmoa6f5IAP2vbVreRH015Eoaw+NpT/ghSI4MkZovFpEjsZgvTiq/p4sUPSaUaiVkYNT4zIzyTBSeNqZX2tRbRaCqsPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUfwEb61; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F6FCC19421
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 17:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770745589;
	bh=r5YqyRa9c18MdKCPCD7cqcJg2fL1zpH5dHHu5C4EPMo=;
	h=From:To:Subject:Date:From;
	b=CUfwEb61boq9SVHASmQphoWdlCIqQwc8/PSs04kfNMqrgqYhDwt5k5m7le34py/cf
	 Y8cOUZ+SZEN1lmlYoLdvzZ7CfgFlUKdXx+8Jr+Lo8qURJp4ugZLEhI4D7C67DLji3/
	 axm7z0kopE/E9jP0HdsezjcDMDGOZTSVIlyEnSnIsWhJKWKwJYnzIH51SoR26ztIyg
	 0dLj2dddAZbYw+Czpwdcg2mnEfG/BLAk4xBbKRZPB98saipPitcSCj7cHIlrn8TE6q
	 92WPbS5cUZJhwsGeggZx5iccP/xZl4kwxZ5DcbNv0b9Hp6nUVNPh7IKw0G34XNBUgk
	 +7LRuIHW3YMQw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C6F8C433E1; Tue, 10 Feb 2026 17:46:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] New: xHCI host controller dies on resume from s2idle on
 AMD Strix Halo [1022:1587]
Date: Tue, 10 Feb 2026 17:46:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mrh@frame.work
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,frame.work:url,frame.work:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33264-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 303C911E13A
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

            Bug ID: 221073
           Summary: xHCI host controller dies on resume from s2idle on AMD
                    Strix Halo [1022:1587]
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mrh@frame.work
        Regression: No

Created attachment 309339
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309339&action=3Dedit
dmesg from Feb 10 2026 reproduction - kernel 6.18.8-200.fc43.x86_64

Hardware: Framework Desktop (AMD Ryzen AI Max 300 Series)/FRANMFCP02
BIOS: 03.04
OS: Fedora 43 (kernel 6.18.8-200.fc43.x86_64)
Reporter: Matt H.=E2=80=94 Framework Computer

Affected controller:

c1:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] Strix Halo
USB 3.1 xHCI [1022:1587] (prog-if 30 [XHCI])
        Subsystem: Framework Computer Inc. Device 000a
        Flags: bus master, fast devsel, latency 0, IRQ 25, IOMMU group 19
        Memory at 90000000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/1 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D1 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: xhci_hcd

PROBLEM:

The xHCI host controller at 0000:c1:00.4 dies on resume from s2idle.
All USB devices behind this controller are lost. Unbinding and rebinding
the driver restores functionality, proving this is a driver resume path
bug =E2=80=94 the hardware is fine.

Reported by Framework customers across multiple distributions:
  - CachyOS (6.18.2, 6.18.8)
  - Debian 13 (6.12.63)
  - Bluefin / Fedora Atomic 43 (6.17.11)

Reproduced by reporter (this report):
  - Fedora 43 (6.18.8-200.fc43.x86_64)

It has also been reported on non-Framework AMD hardware:
  - Lenovo ThinkPad T14 Gen 6 AMD =E2=80=94 identical xHCI timeout, identic=
al
    unbind/rebind fix

REPRODUCTION =E2=80=94 Feb 10 2026, kernel 6.18.8-200.fc43.x86_64, BIOS 03.=
04:

  08:10:41 =E2=80=94 booted
  08:32:30 =E2=80=94 suspended and resumed, controller dead after 22 minutes

  xhci_hcd 0000:c1:00.4: xHCI host not responding to stop endpoint command
  xhci_hcd 0000:c1:00.4: xHCI host controller not responding, assume dead
  xhci_hcd 0000:c1:00.4: HC died; cleaning up

Full dmesg attached.

REGRESSION DATA (cross-distro, same hardware):

  Customer-reported:
  - Kernel 6.12.63 (Debian 13): USB resume fails ~40% of the time
  - Kernel 6.18.2 (CachyOS): USB resume fails 100% of the time
  - Kernel 6.18.8 (CachyOS): USB resume fails 100% of the time

  Reporter-reproduced:
  - Kernel 6.17.1 (Fedora 43): USB resume fails
  - Kernel 6.18.8 (Fedora 43): USB resume fails 100% of the time

The bug exists on 6.12 but is intermittent. By 6.18 it is deterministic.
Something between 6.12 and 6.18 made it worse, but it was already present.

WORKAROUND:

Unbinding and rebinding the xHCI PCI device restores full functionality:

  echo -n "0000:c1:00.4" > /sys/bus/pci/drivers/xhci_hcd/unbind
  sleep 2
  echo -n "0000:c1:00.4" > /sys/bus/pci/drivers/xhci_hcd/bind

This works every time. If the hardware were in a broken state, a driver
rebind would not fix it. The bind path fully reinitializes the controller.
The resume path does not perform the same initialization. This is a kernel
driver bug.

NOT BIOS-SPECIFIC:
  Reproduced across BIOS 3.03, 3.04, and 3.05 on Framework Desktop.

NOT FRAMEWORK-SPECIFIC:
  Same failure on Lenovo ThinkPad T14 Gen 6 AMD with identical symptoms
  and identical workaround.

NOT THE SAME AS BUG #220702 OR #220812:
  Bug #220702 (Strix Halo sleep not working with 6.17 and later) is a VPE
  suspend regression with a specific fix (commit 3925683515e9). That fix
  does not resolve this issue. Bug #220812 (HP ZBook Ultra s2idle failure)
  is the same class, resolved. Our bug predates both =E2=80=94 it reproduce=
s on
  6.12 LTS which is unaffected by the VPE commit =E2=80=94 and affects non-=
Strix
  Halo hardware.

NOT THE SAME AS BUG #219824:
  Bug #219824 (cycle bit on link TRBs, fixed in 6.13.7 via commit
  c7c1f3b05c67) is a different xHCI resume failure. That fix does not
  address this issue.

REFERENCES:
  https://github.com/FrameworkComputer/SoftwareFirmwareIssueTracker/issues/=
163
=20
https://community.frame.work/t/framework-desktop-wired-keyboard-and-mouse-d=
ont-return-after-sleep-linux/76414

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

