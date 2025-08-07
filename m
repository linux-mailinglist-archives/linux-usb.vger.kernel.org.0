Return-Path: <linux-usb+bounces-26559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A72B1D0AF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 03:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D6491AA3D8C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 01:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4661A2390;
	Thu,  7 Aug 2025 01:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IPXdEGtq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB7C186E2D
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 01:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531205; cv=none; b=dzjWfp9n88yWGRReZ8x7+ETLCDJSYKC/ykdCTeX3re8iOM5xqYpvdOcrIbZmaN7uQe+vqswpp7cNecdVcL544VGAPhVOpy/8jWoGvaXeqmHrsTSK2Ld+UemScHuVNeURqOxJTWABsDuaLVkUDLf+J2UoT2ElItanCLgEWrvIOqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531205; c=relaxed/simple;
	bh=+tsGaUpcfsXSOdJCfu8rIM/6E/2og9anZBjTQUEpLX8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CA4quhhpjc2p/MmUx3kGLiME9zp40IPsL3GldAAOH28t6ZrnwPsjCz2GRWeDuI8v1z2j1Sy6Ete5/j+zvHPae1nA/lupe8gs+etA/xgNhEqk4HWaBDeh2xaH4y4eY2tDLMSX5jOHalde6OGhuv9HBMZcBQIuE2PbLq1FvVpn6w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IPXdEGtq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64B43C4CEEB
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 01:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754531204;
	bh=+tsGaUpcfsXSOdJCfu8rIM/6E/2og9anZBjTQUEpLX8=;
	h=From:To:Subject:Date:From;
	b=IPXdEGtqe+hHIv3YVR7h1pVY5yy5/Fce4LJmLa4OghJ/3lTP2p39/b8Psjwb65hJe
	 Jag6da1uKPkhov1X5CpZR6YlYFTjp0z4aHTmDwOR1UPZIT8whvnnrneGbyA6MO+jGe
	 8Ld94JXw7PWgjmNsPdYmr4e4vm6SRFq5YTPUoqTSH72Xq3mEMI3jxFl7pD6roPr6sm
	 4CCnHxGD6WDVYzvKRyTc6XO4f+eY8KfVes5lmnePnA8vNXe0F3vTXjLajGJBc5iyyE
	 mtxMYBMmSQhPt/06ANPWDkJOFHUL2dYT5nlPCNE6QKhorNeYNBWmD99Y/6SxuDcsef
	 /JE34ZEy/ucwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4FA13C433E1; Thu,  7 Aug 2025 01:46:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] New: USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Thu, 07 Aug 2025 01:46:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: steve@groesz.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

            Bug ID: 220422
           Summary: USB: Misdecoded serial number from Dymo Twin Turbo
                    (0922:0018) breaks multi-device support in CUPS
           Product: Drivers
           Version: 2.5
    Kernel Version: Mainline
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: steve@groesz.org
        Regression: No

Created attachment 308461
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308461&action=3Dedit
Dymo Twin Turbo Packet Capture

**Summary:**
The Linux USB core incorrectly decodes the serial number string descriptor =
of
the Dymo LabelWriter Twin Turbo printer (USB ID 0922:0018), resulting in
invalid or unreadable characters. This causes user-space tools such as CUPS=
 to
generate incorrect or duplicate URIs, making it difficult or impossible to =
use
more than one device concurrently.

**System:**

* Distribution: Linux Mint 22.1
* Kernel: 6.8.0-71-generic (also affects mainline kernels)
* Architecture: x86\_64
* Device: Dymo LabelWriter Twin Turbo
* USB ID: 0922:0018

**Steps to Reproduce:**

1. Connect two Dymo Twin Turbo printers via USB.
2. Inspect `/sys/bus/usb/devices/*/serial` =E2=80=94 the serials differ in =
raw binary
but decode to unreadable (non-ASCII) strings.
3. Run:
   `lpinfo -v | grep usb`
   =E2=86=92 Both devices appear as:
   `usb://DYMO/LabelWriter%20Twin%20Turbo?serial=3D??????????????`

**Problem:**
Each printer reports a unique serial number at the descriptor level, but the
raw USB string descriptor data is misaligned or malformed. For example:

```
b'\x30\x30\x00\x36\x00\x31\x00\x30\x00\x33\x00\x30\x00\x31\x00\x30\x00\x31\=
x00\x36\x00\x31\x00\x35\x00\x37\x00\x35'
```

This is not properly aligned for UTF-16LE decoding. The kernel=E2=80=99s US=
B string
decoder (`usb_string_sub()` in `drivers/usb/core/message.c`) treats high by=
tes
as non-ASCII and replaces them with `?`, resulting in a decoded string like:

```
??????????????
```

This leads CUPS and other tools to construct identical URIs for both device=
s,
preventing proper multi-device support.

**Analysis:**
The descriptor appears to contain valid UTF-16LE if the first byte is skipp=
ed.
After correcting for this offset, the decoded string is:

```
"006103010161575"
```

This matches the `GET_DEVICE_ID` response from the device, confirming the
intended serial value.

The decoding logic in `usb_string_sub()` assumes correct UTF-16LE alignment=
 and
does not handle malformed or misaligned descriptors, causing loss of unique
identifiers in sysfs and downstream applications.

**Expected Behavior:**
The kernel should decode USB string descriptors defensively, including reco=
very
from common misalignment issues in UTF-16LE encoding. Devices that return
malformed descriptors should still expose unique serial numbers if the raw =
data
permits recovery.

**Suggested Fixes:**

* Add fallback decoding logic (e.g., try shifted decoding if the result is =
all
`?`)
* Add a USB quirk for device ID 0922:0018 to apply corrected decoding
* Optionally expose raw descriptor data in sysfs for user-space tools to
perform recovery

I have attached a wireshark packet capture with sample packets from one dev=
ice.
I can provide additional packet captures if needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

