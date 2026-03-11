Return-Path: <linux-usb+bounces-34618-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wK3xIpTosWmcGwAAu9opvQ
	(envelope-from <linux-usb+bounces-34618-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:11:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 060CD26ACE0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32D223044BB0
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 22:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3548B2E719C;
	Wed, 11 Mar 2026 22:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsF6GxP0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DD126F3B
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773266953; cv=none; b=b+rwsBvaFcxms3TXqKCew93Tg+Os6DsY3ERtdVIkyfhkgfaTXaYP8KLK5wPicwRnOtCW/JUHUJJPCxCasI5G8LBIwgL0cFVbt2pS2L1Mk3fQH2KSQD++uOE+hlI+O+RapUNm/5wUCcA63e2qmZ+WhwbIrBJbVpmot6S/lidYWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773266953; c=relaxed/simple;
	bh=6dDmVFwHuURTzvmEWChTBRfVMhH2FRc+yEgMKx8l6dA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a5hMh4w/0V7zfMIZxW1/qK9R00j/KZ3oIo0JZJln523Bz7X7GwnZxX4by/oedJcG+6DDoTjn/bCJd9Q64xR82bwSZiwybwYxpSPw5YTntQpKOH+8/3Vov5B8fmOkXkxLOg6APTUposN37vpA/q6cpJZM8ZyFAhmn9JEF8vzmUvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsF6GxP0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45089C2BC9E
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 22:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773266953;
	bh=6dDmVFwHuURTzvmEWChTBRfVMhH2FRc+yEgMKx8l6dA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SsF6GxP0fazk6lU6F6e+PVBHQ2h9lKBPyETsp+j7kzHSLm2wVh0iylrty6cxDBCe1
	 ALGatF/YDk7b9Ma8tmFlxl2LFV4Iv1qibUq2oOfq8Vk8YPkXGxsaab9Rt1TyFXmjeX
	 /Z0evzeLGwNG2BO1vugzZ6s6ot/SqezrdMhvXvtA9VAsTJUF2XjE9d6qQCY3bBSqDw
	 NuNp1ZUgfe4emsSEMCN6JgpMNCngOR8rMlGhOAeEZORyqDCAyMDJ0XHJ1z4SjTIeSv
	 51pt4svBzqiNZBpWuuW3RrlSF31kIguwjmAa0m8CcWo0P3J6jHqdxHz+r6d34iMC6Q
	 HtaHYl6NkDugg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A7C1CAB780; Wed, 11 Mar 2026 22:09:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 11 Mar 2026 22:09:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-221073-208809-5P3JKioI2T@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34618-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
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
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 060CD26ACE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #35 from Alexander F (superveridical@gmail.com) ---
Created attachment 309621
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309621&action=3Dedit
Z13 klogs with reg dump and MSI-only patches

Sorry for the delay.

I wanted to be succinct but the circumstances make it impossible. My main OS
uses zfs root which taints the kernel, so I've been reporting from a copy of
the system modified to run from a 32gb usb stick to avoid taint. (Also to
isolate all the testing modifications) So far all the prior reports I used
6.19.3 kernel and 20260110 firmware. To make my reports more relevant I dec=
ided
to update the version of the kernel to the latest stable release of 6.19.6 =
and
20260221 firmware. But that caused an unforeseen issue of the system not be=
ing
able to reach the proper sleep state:

    Mar 10 19:14:57 rescue-flow kernel: amd_pmc AMDI000B:00: Last suspend
didn't reach deepest state=20

I isolated the issue to the firmware upgrade, downgraded the firmware to
20260110 version, and it became like it was before. I don't know whether it=
's a
bug, firmware-kernel version compatibility discrepancy, potential brokennes=
s of
my device manifesting itself, or something else, but I have to mention that=
 I
used `make localmodconfig` from a 6.19.3 system in order to avoid long build
times (due to building all the modules) on the slow usb stick, and on the
laptop in general.=20

What's weird/interesting is that when I tried to make sure that the issue is
reproducible after updates and encountered "didn't reach deepest state", I
still managed to trigger the "HC died" issue -- I did it 2 times and both t=
imes
it took around 30 tries, which is much less frequent than the usual state,
where I need 3-7 tries. (klog-deepest-state file)

So I returned to vanilla-sources-6.19.6 manually built kernel and 20260110
firmware, patched the kernel with the register dump patch. Interestingly it=
 was
a little harder to trigger than before, but I didn't do enough runs to say
definitively. The files are klog-pecio-patch and klog-pecio-patch2.

I then applied the patch that makes the HC use the MSI interrupt(had to
manually erase it since the patch wasn't working with that version of the
kernel). I provided lspci files of the effect. I was not able to reproduce =
the
issue with that patch. I had to automate the suspend/resume cycles with `wh=
ile
true; do sleep 5; rtcwake -m freeze -s 7; if dmesg | grep -q "HC died"; then
break; fi; done;` I did about 70 cycles. I'll do at least 200 later to conf=
irm.

Since there are power issues involved I also provided 3 reports from amd-s2=
idle
tool. Two of them are from the newer and the older firmwares on the live us=
b,
and one of them is from the main zfs system with the 6.18.10 kernel, which I
included to show the following log entries in the 46th cycle:

ACPI: \_SB_.PCI0.GPP3: LPI: Constraint not met; min power state:D1 current
power state:D0
ACPI: \_SB_.PCI0.GPP6: LPI: Constraint not met; min power state:D3hot curre=
nt
power state:D0
ACPI: \_SB_.PCI0.GP10: LPI: Device not power manageable
ACPI: \_SB_.PCI0.GPP0.SWUS: LPI: Constraint not met; min power state:D3hot
current power state:D0
ACPI: \_SB_.PCI0.GPP1.SWUS: LPI: Constraint not met; min power state:D3hot
current power state:D0
ACPI: \_SB_.PCI0.GPP5.WLAN: LPI: Device not power manageable

which for some reason (missing modules due to localmodconfig, misconfigurat=
ion,
newer and vanilla kernel, don't know) I wasn't able to make the tool produc=
e on
liveusb, neither in the test nor in the report mode. But the output above w=
as
produced for a what I think is regular working suspend, and I think also
without any potentially broken state from "HC died". I don't remember if it=
 was
with 0x40 quirk or not. Not sure if it's nominal sleep discharge rate -- it=
's a
bit high. I can do more digging if any of that is important.=20

>There are some error flags set on DevSta=20

These flags only appear after the "HC died" occurs. (That event also adds
(warning) taint.) I verified that by running `lspci -vvv | grep DevSta: | g=
rep
+` before/after every resume, and NonFatalError on all c4:00 devices flips =
only
after the event.

Files:=20
klog-deepest-state -- kernel log of of an attempt to trigger the issue with=
 the
newer firmware, didn't enable debug output for that
lspci-right-after-boot -- lspci for older firmware right after boot
lspci-0221-firmware-after-boot -- lspci for newer firmware=20
klog-pecio-patch, klog-pecio-patch2 - register dump patched debug output, u=
se
any of the two
lspci-msi-patched-right-after-boot -- shows that MSI, not MSI-X interrupts =
are
enabled
klog-msi-patched - kernel log with the two patches. I had to trim it, since=
 the
issue wasn't triggered.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

