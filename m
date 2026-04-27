Return-Path: <linux-usb+bounces-36489-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDTqCtm27mlfxAAAu9opvQ
	(envelope-from <linux-usb+bounces-36489-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 03:07:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0D946BCE8
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 03:07:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E0D230068F3
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 01:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E211C8603;
	Mon, 27 Apr 2026 01:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrBcctA8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DA76026
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 01:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777252053; cv=none; b=Dc4oEBwJEjhtpY+9kbwIRjusApyQlA01sCCzaub1XjPBjQNpC98moGfmR+LSvsIQRdZ+hNbUjWDrP2oAhD1hpz9Kj39lUioCVjZgznaJv45d5shgE7TgSCxcZy/xbr0eLFT18ii3NtbWN26DPOOdVUcJnMDs96A1UNse43bHXSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777252053; c=relaxed/simple;
	bh=gt31j89Ys9Ist/r0+qS4Ol3QFCzTKMbSKrPWDeBRGQg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JZswP9yrJ8WGnwb+WeYhWeHKLRKiRMKFRY8LXIygeLnyiwck2IGUvLxcAwlTQC1H5cbia8k2HaqNESS+VN/iqXrk+4Tc3zn+4HenPRuRYUw1297kErRsr9aUzUUDmyFt+mCgrWjLPHOCKPfUIS6nG69eKkWSh2v1/nanN0pxwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrBcctA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E23AC2BCAF
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777252053;
	bh=gt31j89Ys9Ist/r0+qS4Ol3QFCzTKMbSKrPWDeBRGQg=;
	h=From:To:Subject:Date:From;
	b=jrBcctA8F9cvd+bBt1y+cm9I+b3Vj3u1nTyaODWKyEmMu9oLNDMDa8ET0oEOcYtDM
	 UNSOUd6pRjUexTJEs1U5BDYQ1pUwQOabFZKA32kMyOskv3mBAqJnfTJ5aviOwf2hRe
	 yJGjCP8OJZMWCWZA0vWnznrPRPiEGmX9G6pLpHgaFvkpfcTTaQcz8YTpz/ozCni83T
	 Z3RYZmqQyJMdk/fhIUScBKPeUwl+smY/JsS4QvRR31dbHT0ieKI/RtvzIyjmib3jxY
	 sxZ0yYG/PMgamFkMS96ZGOvIPnR8IDXUWLLApSSCW+Xayd7KbYtudwYt6KtI9n5WuD
	 4f7nr+MEC9fRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2E5D0C3279F; Mon, 27 Apr 2026 01:07:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221422] New: xhci_hcd host controller dies on Intel NUC8i5BEH
 with USB audio interfaces (POD HD500X, Mbox 2)
Date: Mon, 27 Apr 2026 01:07:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hmoller@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221422-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 9A0D946BCE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36489-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

https://bugzilla.kernel.org/show_bug.cgi?id=3D221422

            Bug ID: 221422
           Summary: xhci_hcd host controller dies on Intel NUC8i5BEH with
                    USB audio interfaces (POD HD500X, Mbox 2)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hmoller@gmail.com
        Regression: No

Hardware:
- Intel NUC8i5BEH (Bean Canyon)
- BIOS versions tested: 0092, 0095, 0098
- CPU: Intel i5-8259U

Affected USB audio devices:
- Line 6 POD HD500X (driver: snd_usb_podhd)
- Digidesign Mbox 2

Kernel:
- Reproduced on Ubuntu 24.04 kernels 6.8, 6.14, 6.17
- Same Linux kernel works correctly on another machine (ASUS Zenbook 8th gen
Intel) with the same USB audio devices

Problem:
On this NUC, USB audio streaming eventually causes xHCI host controller
failure.
Sometimes it also happens on device disconnect.

Typical sequence:
- device enumerates correctly
- driver attaches successfully
- after some time with active audio, or on disconnect, I get:
  - timeout: still 16 active urbs..
  - xhci_hcd: xHCI host controller not responding
  - xhci_hcd: HC died; cleaning up
  - USB disconnect of the audio device

Important observation:
This is not limited to one interface:
- Line 6 POD HD500X
- Digidesign Mbox 2

Both interfaces work correctly on another laptop with the same Linux kernel=
, so
this appears to be platform-specific to the NUC8i5BEH/xHCI implementation.

What I already tested:
- multiple USB cables
- direct connection and hub
- USB-A and USB-C ports
- multiple kernels (6.8 / 6.14 / 6.17)
- BIOS 0092, 0095 and 0098
- intel_iommu=3Doff
- processor.max_cstate=3D1 intel_idle.max_cstate=3D1
- different audio buffer settings (larger buffer (64x3) minimice or disapear
(64x5) problem)
- reproduced both with active audio streaming and on disconnect

Expected behavior:
Even if the device/stream fails, the xHCI host controller should not die
completely.

Observed behavior:
The host controller dies and all devices on that bus disconnect.

To make them work again need to:
echo -n "0000:c2:00.4" | sudo tee /sys/bus/pci/drivers/xhci_hcd/unbind
echo -n "0000:c2:00.4" | sudo tee /sys/bus/pci/drivers/xhci_hcd/bind

Same kernel, same USB audio devices, different hardware:
works on ASUS Zenbook i5 8th gen, fails on Intel NUC8i5BEH.
This may be a hardware/firmware-specific xHCI issue on the NUC platform rat=
her
than a generic kernel regression, but I am reporting it here because the ke=
rnel
might still be able to add a quirk or workaround.

$uname -a
Linux nuc8i5beh 6.17.0-22-generic #22~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Thu
Mar 26 15:25:54 UTC 2 x86_64 x86_64 x86_64 GNU/Linux

$ sudo dmidecode -s bios-version
BECFL357.86A.0098.2026.0204.1428

$ cat /proc/cmdline
BOOT_IMAGE=3D/boot/vmlinuz-6.17.0-22-generic
root=3DUUID=3Db116f7d7-5bb8-44d5-a83c-527892de0889 ro quiet splash threadir=
qs
preempt=3Dfull vt.handoff=3D7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

