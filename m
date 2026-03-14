Return-Path: <linux-usb+bounces-34780-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIh7OE3ktGnvtwAAu9opvQ
	(envelope-from <linux-usb+bounces-34780-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 05:30:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18328B901
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 05:30:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD2853020EF5
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 04:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 844AC33BBB1;
	Sat, 14 Mar 2026 04:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWjdIE1H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B71322DB7
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 04:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773462600; cv=none; b=BhDBj1c3rY4UqNi1dKkLTcs5ddwm5tuQxB1gDg40ZLcKStpUSfdEdQKfG0POzTXLeJ8U+Wo2Cico6LeZBdTGRBOWXwYG3gL8Z+/+47oRxRBk5w2nU+iynmPTxIcK/1jaao2GIp7ADkeOGQ3GMDjFiwwnl5fmQGDnPQhzzF+EGkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773462600; c=relaxed/simple;
	bh=eiK5llpIqDlKtadpJmS9IixMnePsEadIlhshVasLptg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qJS9b8vfG6rolionkVigFNXGpiziZWqoQXbQmPoYj6AXImZwrXlHNgjfZYiYEraYZcvVdbWGNSNkGBV0XIO9Aua63+T1Q8rPg9kS5A5Lqf5C4aoGVZN1pHV2qrffxuPyWpGnavua7DvWHinHeRDsFZ5408EOEJ2o96I2ZRrBAgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWjdIE1H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A0FA0C2BCAF
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 04:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773462599;
	bh=eiK5llpIqDlKtadpJmS9IixMnePsEadIlhshVasLptg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bWjdIE1H0N048LNjM0L9m6GFnqypkm8yb5Fw/1NC0ewtCb35+iYiYTQ5dGxyW//1G
	 0pBo3GfffHjykmjieQTBOGXiko93DU1Y5Wa5BLMAquJrW0F9Sd4yiRCVoVyyHtHf/C
	 BlfoKpx/Vert+ikrIfb4x78dlc/8x0LMBGiWZ0lApLCJXiokdvZOwiGEx9VpW/T+hC
	 KrpD0lY+o1yyHICDmpJNpK01wIkHdvvhx4FQE3J/o+qxNBDVRfFgM9YbzD6SIOc9Xw
	 tq7g5WurE0M4hqs3fhVi8i2MgQL19TWzuHmZ8e1GRGBP0Xg8Z9e+2CrTde78cLw138
	 dCjAENyT9iqsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9AA3FCAB780; Sat, 14 Mar 2026 04:29:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Sat, 14 Mar 2026 04:29:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@logical.ink
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-TzAdgWqsvO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34780-lists,linux-usb=lfdr.de];
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
X-Rspamd-Queue-Id: 5F18328B901
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

bugzilla@logical.ink changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugzilla@logical.ink

--- Comment #39 from bugzilla@logical.ink ---
Also experiencing this bug on Framework 13 AMD Ryzen AI 300 using Fedora.=20

### System Information

| Field | Value |
|---|---|
| Machine | Framework Laptop 13 (AMD Ryzen AI 300 Series) |
| CPU | AMD Ryzen AI 9 HX 370 (Hawk Point, 24 threads) |
| GPU | AMD Radeon 890M (integrated) |
| BIOS | FRANMGCP09 v03.05 (2025-10-30) |
| RAM | 64 GB DDR5 |
| Kernel (at time of event) | 6.18.12-100.fc42.x86_64 |
| Kernel (current) | 6.18.16-100.fc42.x86_64 |
| Distribution | Fedora 42 |
| xHCI controller | 0000:c1:00.4 |
| xHCI hcc params | 0x0118ffc5 |
| xHCI version | 0x120 (USB 3.1) |
| xHCI quirks at init | 0x0000000200000010 |

The affected USB device is `usb 1-1`: a full-speed internal device (device
number 2, bus 1) which corresponds to the Framework laptop's internal input
device hub (trackpad, keyboard controller, fingerprint reader).

Relevant Logs:
**Failing resume (44-minute sleep, lid closed):**
```
Mar 13 22:40:43 kernel: usb 1-1: reset full-speed USB device number 2 using
xhci_hcd
Mar 13 22:40:43 kernel: PM: suspend entry (s2idle)

[~44 minutes elapse]

Mar 13 23:25:33 kernel: PM: suspend devices took 0.162 seconds
Mar 13 23:25:33 kernel: PM: resume devices took 0.285 seconds
Mar 13 23:25:33 systemd-logind: Lid opened.
Mar 13 23:25:33 kernel: PM: suspend exit
                                                          <-- usb 1-1 reset
ABSENT
Mar 13 23:26:13 kernel: PM: suspend entry (s2idle)        <-- next suspend,
still no usb 1-1 reset
Mar 13 23:26:18 kernel: PM: suspend exit
                                                          <-- usb 1-1 reset
still ABSENT
Mar 13 23:27:09 kernel: PM: suspend entry (s2idle)
Mar 13 23:28:56 kernel: PM: suspend exit
                                                          <-- usb 1-1 reset
still ABSENT
[reboot required to restore input]
```

**xHCI controller initialization (boot):**
```
kernel: xhci_hcd 0000:c1:00.4: xHCI Host Controller
kernel: xhci_hcd 0000:c1:00.4: new USB bus registered, assigned bus number 1
kernel: xhci_hcd 0000:c1:00.4: hcc params 0x0118ffc5 hci version 0x120 quir=
ks
0x0000000200000010
```

Additional Context:
- The xHCI controller at `0000:c1:00.4` already has quirks `0x0000000200000=
010`
applied at init. The `XHCI_RESET_ON_RESUME` bit (0x80) is not present and m=
ay
need to be added to the AMD platform quirk table for this hardware.
- `bluetoothd` logs `Controller resume with wake event 0x0` on all resumes
including the failing one, indicating the Bluetooth/wakeup path is not the
differentiating factor.
- No kernel error or warning is emitted at the time of the failed USB reini=
t =E2=80=94
the failure is silent.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

