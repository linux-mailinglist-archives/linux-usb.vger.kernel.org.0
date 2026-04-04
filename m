Return-Path: <linux-usb+bounces-35975-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 9fIEOR8t0Wn7GAcAu9opvQ
	(envelope-from <linux-usb+bounces-35975-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:24:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A49A39B966
	for <lists+linux-usb@lfdr.de>; Sat, 04 Apr 2026 17:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 93908300D14C
	for <lists+linux-usb@lfdr.de>; Sat,  4 Apr 2026 15:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080FA29E11D;
	Sat,  4 Apr 2026 15:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5i07A3a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D43AC8E6
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 15:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775316248; cv=none; b=fVL9eFDSABx65Mfj7jcfGnh8V1WjjsE9Z9PS4hGHCgpFUC/t9j3ZAe5e79/nG2NzQDtdkwXeXB1VeuDbs5rXo4PyPv2HfwIdtXIJPBvwOSaYmdEF51/rEIHOVgJxRLsjD7ZKJVg0l4xL0yP87rytB5ZpEEa+CDUEfgfUINCRFWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775316248; c=relaxed/simple;
	bh=ijVpyLiCbKsoT0oTEF/vmOsfI2bGFBOeWdHUfKXsyHc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gwS0gvEPWJYAKuqtQ7HnkjxiFZKU11VX6otf+fEN/bp39fW7ePAd9L6ardYjwmzF3GDH1qlqPx18QWjiixof1e5IJVfKdqcMbSrxZrO/o3HK4tG92vLIzWwaXAqPE6FwB7ry9TuEf/5/XkDuvbOSEnnlNWh/N8P6lhnYbpq/f4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5i07A3a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25876C19421
	for <linux-usb@vger.kernel.org>; Sat,  4 Apr 2026 15:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775316248;
	bh=ijVpyLiCbKsoT0oTEF/vmOsfI2bGFBOeWdHUfKXsyHc=;
	h=From:To:Subject:Date:From;
	b=J5i07A3aDy8+CLj7SoXITo4M2jbhAnZLDgrtkTbW6yQq/zh5IQUzwv+RzjH7040vZ
	 ZDvShrKa6Slk5EpoHYYg2NvPBnZGeT+2sp76MB+Kz3EKEOYMcd7ZzhkfjsiBaMhvyd
	 1idF9ykA7Ny60ImlngUu3sPSHuTIxPsIu8WhhfqDsRnvNa0juhH8Zhy/VWrXxZmf/f
	 x5sdi3LZ5jiL6vTujXE9yG6kpy6xABaxrjbr6QJ6tge1I58q8mPWqrxVgu+iFNTwYO
	 U8ayjdjGEV/psA91Sdp4CCiyEn9jYboNwRmBy4qWjmOEp4a/R3CK43b/8t/aOKAa/O
	 NgEgVyTYoBv1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14F44C3279F; Sat,  4 Apr 2026 15:24:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221319] New: Certain operations via PCIe tunneling between an
 AMD USB4 host and a Thunderbolt-5 peripherals cause an instant reboot
Date: Sat, 04 Apr 2026 15:24:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: foss@morgwai.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221319-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35975-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,morgwai.pl:email]
X-Rspamd-Queue-Id: 2A49A39B966
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221319

            Bug ID: 221319
           Summary: Certain operations via PCIe tunneling between an AMD
                    USB4 host and a Thunderbolt-5 peripherals cause an
                    instant reboot
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: foss@morgwai.pl
        Regression: No

Created attachment 309813
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309813&action=3Dedit
dmesg log when using Nouveau driver

I have an AMD Strix laptop (TUXEDO IBP-14 gen10, HX370 APU) and an RTX 3090
that I=E2=80=99ve been successfully connecting using various eGPU adapters:
 - ADT-Link UT4G (USB4v1, ASM2464PDX),
 - Minisforum DEG1 (OCuLink 4i),
 - even daisy-chaining two 3090s via EXP-GDC TH3P4G3 (TB3, JHL7440) + UT4G
...and it has all been working perfectly stable on my Debian-13 system acro=
ss
several kernel versions (6.16.1 - 7.0~rc6) using both Nouveau and NV
proprietary drivers.

Recently I=E2=80=99ve purchased a new TB5 adapter: Minisforum DEG2: it is q=
uite new,
but a few reviews it received from Windows users praised it for perfect
stability and flawless work.
However when I connected my 3090 via my new DEG2 to my laptop, it abruptly
rebooted about 0.5-1 second after the driver was loaded. I=E2=80=99ve tried=
 several
driver versions across different distros (live Fedora-43+Nouveau, live
POP_OS-24.04+v580, Debian-13+{Nouveau,v580,v590,v595} with kernels 6.18.x,6=
.19x
distro-provided and self-compiled 7.0~rc6), but the result was always the s=
ame.

I also subjected myself to some Windows-11 usage and confirmed that my DEG2
works perfectly stable there with NV's Studio Driver v591.74.

Given all above, it seems that the problem is related to TB5 handling by the
kernel.



After some hair-pulling and extensive testing, I=E2=80=99ve managed to noti=
ce, that the
operation that causes the reboots is somehow related to GSP firmware: I=E2=
=80=99ve
verified that the following configurations allow the eGPU to work somewhat
stable:
 - Nouveau driver without `firmware-nvidia-graphics` package (containing GSP
v570.144)
 - NV's proprietary flavor driver (package `cuda-drivers` from their repo)
v580, v590 and v595 with `options nvidia NVreg_EnableGpuFirmware=3D0` (NV's
"open" flavor cannot function without GSP firmware and ignore this option)

Also redirecting the 3090 to a VM via VFIO and loading the firmware inside =
a VM
causes the whole laptop to reboot (with either Nouveau or v580 or v590
installed in the VM).
Redirecting the 3090 to a VM with v595 installed, causes a reboot of the la=
ptop
even without loading the firmware (ie even with having `options nvidia
NVreg_EnableGpuFirmware=3D0` inside the VM).

Note: there were also numerous reports on egpu.io forum of vast instability
from Intel host + TB5 adapter + Linux users to the point of being completely
unusable, though without reboots. A few of such users that were using Nvidia
GPUs reported that avoid GSP firmware also mitigated the problem.



Attached are `dmesg` logs from Debian-13 with self compiled kernel 7.0~rc6
under the following scenarios:

dmesg-deg2-x4sp4nal-debian13-linux7.0rc6-nouveau.log:
1. initially package `firmware-nvidia-graphics` containing the GSP firmware=
 is
not installed.
2. eGPU is connected and is properly detected by Nouveau, nothing bad happe=
ns.
3. Nouveau is unloaded and eGPU is disconnected.
4. `firmware-nvidia-graphics` is installed.
5. eGPU is connected and reboot occurs about 0.5-1 second after loading the
firmware.

dmesg-deg2-x4sp4nal-debian13-linux7.0rc6-nv595: (to be posted in the next
comment)
1. initially cuda-drivers v595 is installed and
`/etc/modprobe.d/nvidia-nogsp.conf` file contains `options nvidia
NVreg_EnableGpuFirmware=3D0`.
2. eGPU is connected and is properly detected by the NV driver, nothing bad
happens.
3. all NV modules are unloaded and eGPU is disconnected.
4. `NVreg_EnableGpuFirmware` is changed to `1`.
5. eGPU is connected and reboot occurs about 0.5-1 second after loading the
driver.



Related links:

Corresponding egpu.io thread:
https://egpu.io/forums/wip-builds/wip-2025-14-tuxedo-infinitybook-pro-14-ge=
n10-890m-rai312chx-rtx-3090-64gbps-usb4v1-minisforum-deg2-linux-debian-trix=
ie-loading-nvidia-firmware-reboots-the-machine/

Windows build on egpu.io:
https://egpu.io/forums/builds/2025-14-tuxedo-infinitybook-pro-14-gen10-890m=
-rai312chx-rtx-3090-64gbps-usb4v1tb5-minisforum-deg2-win11-25h2-daisy-chain=
ed-rtx-3090-via-ut4g/

Nvidia Linux forum posting:
https://forums.developer.nvidia.com/t/loading-gsp-firmware-from-an-amd-stri=
x-laptop-to-a-tb5-3090-egpu-causes-instant-reboot/360903

Sometimes a split second before a reboot, there are some error messages from
`amdgpu`, so I also posted to their bug tracker, but it seems `amdgpu` is
rather a victim, not a cause:
https://gitlab.freedesktop.org/drm/amd/-/work_items/4981

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

