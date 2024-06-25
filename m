Return-Path: <linux-usb+bounces-11628-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E67C916894
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 15:06:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58D7E281189
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 13:06:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF36156C72;
	Tue, 25 Jun 2024 13:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGvoymrl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094841DFC5
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320805; cv=none; b=IbmsG6U8Od5o/IuprKXKP/k5DctSGGxrw+a/Rt/7pqafw5sOPNpVtcGZRpe8C1xxA+fYWZ0morkoH9DIc5yQnX9r8hRzFJ66JatwfYgnNH+u/VmO2hni1KoglSLHkKE+7JrhjFbX7F+FpZrny0XcSUSvi6l3s1KHBFxUcX3ZKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320805; c=relaxed/simple;
	bh=uMRFmnb6jmBDXxcgBblQ9IGCC5GP6vQ3iOqtL/eHIqk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AuWQyBD/oMC/781RiuHyl12/aN+/jHYqgfkI1EVvRb94o4A+TTltbmdD3RIrYDrXG4byfwSpWDRk5Zb3Y5Ti2Xx7jAw9geVK39r8d3l6OotZBa+4nVpXAYVC+/O2yILb6eVe3rmieZQkCGxY4hgGTgN5cy2Ot2Cwz2IPktvRTdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGvoymrl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DF6AC32781
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719320804;
	bh=uMRFmnb6jmBDXxcgBblQ9IGCC5GP6vQ3iOqtL/eHIqk=;
	h=From:To:Subject:Date:From;
	b=tGvoymrlq/0adE1bNKUlhhpeVsD2yHVn4Tjt686meIGs84IhpfRgVztj411PMn7Rm
	 +p5iZKslA9f+DfcoUsYT1QpmC3g7Slfzcq2cbTg0sewyAtsZlofFmL1B36D0sONTcV
	 0XKwWA47po/+tI4BrIRVJCF0ewW6RhJOht7rh8vg3FkXixeS1V97wRw+kR8Gim288I
	 L8pxmmMfr8eWenOHPQiYsFWbkI18U4i7P1Bkqcp9dGVsHtOwjsz9zpiM2s8scgf2+N
	 TBhn1m093fUClkZKKWCOffQaYpZE4zqUM7cWGHJG1JHTJRirO4Zyfmocgtj4bOUJpQ
	 Z4oySwc86Vt9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87CDBC53B50; Tue, 25 Jun 2024 13:06:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] New: USB devices are not detected after Save/Restore
 error on Intel xHC
Date: Tue, 25 Jun 2024 13:06:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

            Bug ID: 218987
           Summary: USB devices are not detected after Save/Restore error
                    on Intel xHC
           Product: Drivers
           Version: 2.5
          Hardware: Intel
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: repk@triplefau.lt
        Regression: No

Created attachment 306492
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306492&action=3Dedit
Annotated dmesg output showing unplug/replug xhci debug logs

Hello,

With some (Genesys Logic based Hub at least) USB devices, Intel xHC raises
Save/Restore error (SRE) if it gets suspended when those devices are unplug=
ged.
It seems that in this case (Save/Restore error) the host controller does
sometimes miss Port Status Changed Event.

In xhci_resume() host controller port is actually resumed only if Port Stat=
us
Changed Event are generated (xhci_pending_portevent() returns true). Because
such event can be missing when an SRE happened, port can remain suspended w=
hen
a USB device has been plugged to it preventing the device enumeration.

This can be seen in the attached annotated dmesg excerpt with
drivers/usb/host/xhci* and drivers/usb/core/hub.c debug print enabled:

[13903.331265] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaround
enabled
[13904.829108] xhci_hcd 0000:3c:00.0: // Setting command ring address to
0xffc55001
[13904.829300] xhci_hcd 0000:3c:00.0: xHC error in resume, USBSTS 0x411, Re=
init
<=3D=3D=3D=3D SRE happened on resume
[13904.829308] usb usb3: root hub lost power or was reset
[13904.829315] usb usb4: root hub lost power or was reset

...

[13904.832695] xhci_hcd 0000:3c:00.0: xhci_resume: starting usb3 port polli=
ng.
[13904.832732] xhci_hcd 0000:3c:00.0: config port 4-1 wake bits, portsc: 0x=
2a0,
write: 0x202a0
[13904.832747] xhci_hcd 0000:3c:00.0: config port 4-2 wake bits, portsc: 0x=
2a0,
write: 0x202a0
[13904.832761] xhci_hcd 0000:3c:00.0: config port 3-1 wake bits, portsc: 0x=
2a0,
write: 0x202a0
[13904.832773] xhci_hcd 0000:3c:00.0: config port 3-2 wake bits, portsc: 0x=
2a0,
write: 0x202a0
[13904.832782] xhci_hcd 0000:3c:00.0: xhci_suspend: stopping usb3 port poll=
ing.
<=3D=3D=3D=3D Controller goes back to suspend

There are several ways to workaround that :=20
    - Disabling autosuspend (echo on > /sys/bus/usb/devices/.../power) prev=
ent
the issue to happen
    - Triggering a resume manually after the device has been replugged (lsu=
sb
-v, cat /dev/bus/usb/<bus>/001, ...)

To summarize I can see 2 different issues here:
    1) Genesys Logic (and maybe other) devices cause SRE error if controlle=
r is
suspend due to it being unplugged
    2) Controller does not reflect Port Status correctly when SRE happened

Unfortunately I have no idea why 1) happen. Does anyone know what can cause=
 a
SRE error to happen, besides issuing a CMD_RUN between a save and restore ?=
 I
have attached a usbmon trace that registers the faulty device being unplugg=
ed
if it can ba ofe any help.

Also after a quick glance at xHCI specification I didn't managed to underst=
and
why 2) happens either. Is it expected ? Is it a known behavior of some
controller ?

It can be noted that once a problematic device has been unplugged it does n=
ot
matter which device get plugged after (could be any I tried) it won't be
recognized, so 2) appears to me to not be specific to a single device but d=
oes
seems to be a host controller issue.

In the end in order to workaround this issue I have created the attached pa=
tch.
 This forces host controller to actually try to resume if a SRE happen, eve=
n if
no Port Status Change event has been received. This has the downsize to may=
be
try resuming the controller while no devices has been actually connected (f=
alse
positive) but the controller will suspend utimately still. But maybe it is
something we can live with ?

If need be, this can also be made tunable through a XHCI quirks.

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

