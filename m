Return-Path: <linux-usb+bounces-32938-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I+SILrJfGnaOgIAu9opvQ
	(envelope-from <linux-usb+bounces-32938-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 16:09:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08304BBE26
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 16:09:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06AFC30166E0
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 15:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 426CF322C6D;
	Fri, 30 Jan 2026 15:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tcl7HrBB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E092F7475
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 15:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785764; cv=none; b=oMeS+XfF+5AzsafT4gkUrkzsssqbD0VpLSr36EZBpTdaWKDyrJnQaSvJiicbwHOEr53A5jcP39sD8nOYx2ohOrBRCkLbA/0srSXVgXj7TBUuzZcCF4yqBJ9zL31M+NADHnad0Yp1boQpRz5r40saHeo3cOqfbKoxOEvj9eubhbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785764; c=relaxed/simple;
	bh=//5CjfyZsMbMpKsqMCkFPUOWNYjHkWuXAoQqBUzZTGw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NKdKFMFa1uZBbjX32/bLU9waYhvRMOo7ie6uUBfnjc8Ie5ZXIZqYaoF3+jsLbqjE285iWBH2hHQUe2IIoOGVCmEDB8ttwu7rGX5ejM+oNFEsrW98LPjYhTs6dPrG2yZbHiQlB+RlLAga7R0MktfCn7SMwGEaQSdkWOGp6nMjiLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tcl7HrBB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EBA0C4CEF7
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 15:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769785764;
	bh=//5CjfyZsMbMpKsqMCkFPUOWNYjHkWuXAoQqBUzZTGw=;
	h=From:To:Subject:Date:From;
	b=Tcl7HrBBuZu0Zsj7qtogukaqeXxuW1e7LilqoJaM9/Vn8qoO2prN3/wz5rVF9DtjZ
	 TQOOCc8l/0OslTw2qHwkNXDVvQQjHYaR7sQP5aUfKkSo+orwXFDKr/lqFviDEe8ITJ
	 0UNf0r1kFBxOdBH0G96HeXwCKaF7PRT9a8hRer19j1lKdVUH3PslGO6Apoc6EzfvsZ
	 NXVe48hZ686iPJvtBUzZW3B+YKCndwlP81G8QtnJpQNodtgyDN+KbnMKtshAmvgWVs
	 rBXqzubQrmEcOhAqx630E46NH7R107LzrzPknCN/BpixbKjIOTDOUPJL+YUby8v83j
	 YoojRc6dmx7LA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4CAE0C41613; Fri, 30 Jan 2026 15:09:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221022] New: [REGRESSION] Kernel panic in ucsi_reset_ppm on
 6.1.0-42 after HP USB-C Dock G5 firmware update
Date: Fri, 30 Jan 2026 15:09:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: stamdar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221022-208809@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32938-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 08304BBE26
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221022

            Bug ID: 221022
           Summary: [REGRESSION] Kernel panic in ucsi_reset_ppm on
                    6.1.0-42 after HP USB-C Dock G5 firmware update
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: stamdar@gmail.com
        Regression: No

Created attachment 309280
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309280&action=3Dedit
dmesg

I'm experiencing a kernel panic during boot on kernel 6.1.0-42-amd64 that d=
oes
not occur on 6.1.0-35-amd64. The issue appeared immediately after updating =
the
HP USB-C Dock G5 firmware from 1.0.18.0 to 1.0.24.0 via fwupd.

## System Information

- **Hardware**: ASUS Zephyrus M GU502GV (Intel Core i7-9750H, RTX 2060 Mobi=
le)
- **Distribution**: Debian 12 (Bookworm)
- **Working Kernel**: 6.1.0-35-amd64 (6.1.137-1)
- **Broken Kernel**: 6.1.0-42-amd64 (6.1.159-1)
- **Dock**: HP USB-C Dock G5 (firmware 1.0.24.0)

## Problem Description

After updating the dock firmware, kernel 6.1.0-42 hangs during boot at the =
UCSI
driver initialization. The system becomes completely unresponsive and never
reaches the login screen. Kernel 6.1.0-35 boots successfully with the same
firmware.

## Error Messages

**Kernel 6.1.0-42** (boot hangs after this):
```
WARNING: CPU: 5 PID: 107 at drivers/usb/typec/ucsi/ucsi.c:918
ucsi_reset_ppm+0x210/0x220 [typec_ucsi]
ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-70)
```

**Kernel 6.1.0-35** (boots successfully with warning):
```
WARNING: CPU: 10 PID: 117 at drivers/usb/typec/ucsi/ucsi.c:917
ucsi_reset_ppm+0x210/0x220 [typec_ucsi]
ucsi_acpi USBC000:00: con1: failed to register partner alt modes (-70)
typec port0: bound usb1-port4 (ops connector_ops [usbcore])
typec port0: bound usb2-port1 (ops connector_ops [usbcore])
[boot continues successfully]
```

The same UCSI error occurs in both kernels, but 6.1.0-42 treats it as fatal
while 6.1.0-35 logs the warning and continues.

## Reproduction

1. Update HP USB-C Dock G5 firmware to 1.0.24.0 via fwupd
2. Boot system with dock connected
3. System hangs at UCSI initialization on 6.1.0-42
4. Boot with kernel 6.1.0-35 - system boots normally

## Additional Information

**UCSI driver status on working kernel (6.1.0-35):**
```
$ lsmod | grep ucsi
ucsi_acpi              16384  0
typec_ucsi             53248  1 ucsi_acpi
roles                  20480  1 typec_ucsi
typec                  94208  1 typec_ucsi
```

**USB-C port status:**
```
$ cat /sys/class/typec/port0/data_role
[host] device
$ cat /sys/class/typec/port0/power_role
source [sink]
$ cat /sys/class/typec/port0/supported_accessory_modes
none
```

**Dock detection (working kernel):**
```
$ lsusb | grep HP
Bus 002 Device 004: ID 03f0:066b HP, Inc HP USB-C Dock G5
Bus 001 Device 009: ID 03f0:046b HP, Inc HP USB-C Dock G5
Bus 001 Device 007: ID 03f0:056b HP, Inc USB Audio
Bus 001 Device 006: ID 03f0:036b HP, Inc HP USB-C Dock G5
```

## Expected Behavior

Kernel 6.1.0-42 should handle the UCSI error the same way as 6.1.0-35 - log=
 the
warning and continue boot rather than hanging.

## Workaround

Booting kernel 6.1.0-35 works perfectly. All dock functionality (USB device=
s,
Ethernet) works correctly, though DisplayPort Alt Mode fails to initialize =
on
both kernels.

## Attachments

I can provide:
- Full dmesg output from both kernels
- Complete /sys/class/typec/ directory contents
- Detailed lsusb -v output for the dock
- Kernel config differences between versions

Let me know if you need any additional information.

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

