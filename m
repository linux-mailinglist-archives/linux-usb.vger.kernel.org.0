Return-Path: <linux-usb+bounces-13768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 670EB9592AC
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 04:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BED41C21241
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2024 02:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DA6774040;
	Wed, 21 Aug 2024 02:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZjVqYzt7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF2E1C683
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 02:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724206692; cv=none; b=fY8VZziVRvBVsOmxCw9NtG/Z4rcy7QjzR4KPQ2mk3jmShZU742RqW6/9rg6+OlfGUwZbyTpPqIZxsGIPKmoDPtr7ShSfUpIX1fj7c0ExmjxyQ74sUV1RsVMmOd2J4MXaFynFfbSyjRhGpQwB2twuExwccfQe+Hh+7XRdhaCx5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724206692; c=relaxed/simple;
	bh=mICq+MmhjDxX4+Qi+aCUDHMlziDzjY5HbRr2P78tQ/Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dHu8UGj+YwWk9mP8wa0fHFIaF4q/yDQT70RorvrCY8ZqhJcM2rZsr6Jrl18+2IVRx2jBuIDqD30+zG77+ewKB57EA1XcYL2OIbGFq+D4e/6Y/3K8++WIGBRLEGCWfynOwMpyYR2qF+kVCFmNZ5gI1NIu3g2kbLriGn9ynTKHA3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZjVqYzt7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27685C4AF09
	for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2024 02:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724206692;
	bh=mICq+MmhjDxX4+Qi+aCUDHMlziDzjY5HbRr2P78tQ/Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZjVqYzt7rEa7cCvUaj7mgbgc1A94RuSqIJ31oyuXwDNoDAU8fbRtqS78s4KlosLRq
	 VaUPqwPjRoKgTfWmEmr8455HubGJc54Oos8sr+7E/EBxjl7dSw9qBd5UbhLSZqk/Xa
	 +5PzARqF/ZiVIzpcgG3OgOtSbL4Lwqeu8516dOuTgL7RJU+/8tu5l3zOT6GG/ls5Jw
	 5rJdxhbZGbaBwGQegsE92S5lvqw/EGaTkuGc1oy0ed2l0wYWnx7mkGVGABOIQaEltt
	 eXPonYNLt6YB8mOypmMLO9PbpTMPlwmc+WDvsrmknrCABIqze82NVscUZzw1UNh/gH
	 2FwxngdC6beAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 14ED7C53B50; Wed, 21 Aug 2024 02:18:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217511] HP Pavilion x2 12-b020nr - Charging over USB-C not
 working
Date: Wed, 21 Aug 2024 02:18:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gabrielbarros+k@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217511-208809-B7hYMQYGAr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217511-208809@https.bugzilla.kernel.org/>
References: <bug-217511-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

gabriel barros (gabrielbarros+k@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gabrielbarros+k@gmail.com

--- Comment #4 from gabriel barros (gabrielbarros+k@gmail.com) ---
I had this happen to me today, also with an Elitebook, but different model.

Computer bat>95%, plugged to a charger that provides AT LEAST 40W. It charg=
es
normally. I never see the Unknown event_id messages.

Computer bat>95%, plugged to a charger that provides UP TO 40W. Computer do
charge, but at random times:
- `acpi` will alternate between "Battery 0: Not charging, 95%" and "Battery=
 0:
Discharging, 95%", never "charging"
- KDE or any other battery watcher besides `acpi` command, would just show
"charging" at all times, no variation.
- virtualbox guest (win10enterprise ltsc) would sound the "charger unplugge=
d"
immediately followed by "charger plugged" notification sound.
- kernel would log "kernel: hp_wmi: Unknown event_id - 131073 - 0x0" (never=
 see
the 0x1 event, not once)
- the kernel messages and the windows virtualbox guest sounds were in perfe=
ct
sync.

In both cases my battery is indeed charging (the percentage always go up no
matter what of those things are happening). Can't say for speed/healthy to =
the
battery.

My guess is that is a low power charging mode event that the linux driver
doesn't know. And I don't know how much raw information the virtualbox driv=
ers
do forward, but that old version (2021?) of windows' drivers was clearly se=
eing
it as a power cable disconnect.

Linux 6.10.4-arch2-1 #1 SMP PREEMPT_DYNAMIC Sun, 11 Aug 2024 16:19:06 +0000
x86_64 GNU/Linux

relevant parts of lshw:

   capabilities: smbios-3.4.0 dmi-3.4.0 smp vsyscall32

     *-firmware
          description: BIOS
          vendor: HP
          physical id: 10
          version: U82 Ver. 01.07.00
          date: 10/05/2023
          size: 64KiB
          capacity: 32MiB
          capabilities: pci pcmcia upgrade shadowing cdboot bootselect edd
int5printscreen int9keyboard int14serial int17printer acpi
biosbootspecification netboot uefi

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

