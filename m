Return-Path: <linux-usb+bounces-27338-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB4B391D8
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 04:47:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E5CF461D0F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 02:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EB452690DB;
	Thu, 28 Aug 2025 02:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwGxw/4l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960CF25B1C5
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 02:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349264; cv=none; b=MZicjlGH22YFWTfTFHPM34JVRDSl0+/6GvF+J3b/cvpHV28j9k54nQUL+m9Yz+LdOZ98nTtQjzcaEcC2IGZJotxjeDvwdik7L3TVd29mnVaQy7cQqC6Uy8nRDGT6pWzltR1xAtWWeLQLV8Zzaeiqk1RCk16quDozM4/r5kYnD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349264; c=relaxed/simple;
	bh=TzzZjW57Sq06onbeP1ga/DqTBfEywT2sQYUZvjZBYkU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lm02YKNCMfzIK1dqnyh2jKGeFQ5vNc7ewG0TBPxOyVZVtHPIOH2PcyWQXYY72ZEszfUpwvPGkH149P2w+e1dkX/P+xMK+Mcqb0LNWD++uOIw2JQkeiEfsdvY7bxovR21CPb6gxkRY+7In7JcGCOnt0V38Zr9/nMgAhitLkCIz+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwGxw/4l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22929C4CEF0
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 02:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756349264;
	bh=TzzZjW57Sq06onbeP1ga/DqTBfEywT2sQYUZvjZBYkU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JwGxw/4lrt+d3BkbyYJtcI2EKBaN9LfzMxNQDvsEaubmXBE1cc39J4DWNtVzktNsp
	 f9b7EE26kq+F7+0962bmvYiV9TCjb+avFZTRDf956tqsbr+soLcunKcdcgiSaQiZs+
	 w/gWIRgsjAyhmj1JGb3CR54T6UvBhPmhadQoEkY5q0b9qYcZ/VYZKCLzWjbPVtj7wR
	 uUIxdvVPTltCIqJjUjMEIXakhGFf42QJdSTR+Co9lPXfUnxcNyQN5VacZCmlG5U5Xd
	 6PCqHanGuyNMlG/oEfHHbM3XU1aH8cpDliJBq/khbeoE/c+Vqfj7MMTI2qmmd6cEZh
	 JsYOy9kOXSowA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0B167C3279F; Thu, 28 Aug 2025 02:47:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 28 Aug 2025 02:47:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-LWSueV2vLA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
Okay, this is different from before.  Here's a comparison of the relevant p=
arts
(referring only to the messages for the card reader).

The difference first appears when the device is reset following the resume =
and
the computer reads the upstream USB port status.  From the trace you origin=
ally
attached (where the reset worked but the device failed later because of LPM=
):

ffff9bbf9f9de0c0 215792020 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
ffff9bbf9f9de0c0 215792047 C Ci:3:001:0 0 4 =3D 03021000

That 03021000 is a normal response; it means the port is powered, connected,
and enabled, and the reset has completed.

From the trace with LPM disabled but where the resume failed:

ffff8d32e6d06780 1883092024 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
ffff8d32e6d06780 1883092046 C Ci:3:001:0 0 4 =3D d0024100
ffff8d32e6d06780 1883156157 S Ci:3:001:0 s a3 00 0000 0004 0004 4 <
ffff8d32e6d06780 1883156182 C Ci:3:001:0 0 4 =3D 03025100

The Get-Port-Status request was issued twice.  The first response indicates=
 a
vendor-specific link status (I guess it was some sort of intermediate state)
and the second response shows the final result of the reset.  03025100 is n=
ot
normal; it means that the port is powered, connected, and enabled (as befor=
e),
but in addition to the completed reset there was a connect status change an=
d a
link-state change -- not surprising given the first response.

This indicates the card reader disconnected and reconnected while the reset=
 was
taking place -- a rather peculiar thing for it to do.  But I'm puzzled; at =
this
point the kernel should have tried to reset the device again.  Instead it
continued on.

We can see what happens next.  The kernel tries to get the card reader's de=
vice
descriptor.  In the first trace this works, even though there's a useless
intervening Set-Isochronous-Delay (in the third and fourth lines):

ffff9bbf9f9de0c0 215864163 S Ci:3:003:0 s 80 06 0100 0000 0008 8 <
ffff9bbf9f9de0c0 215864376 C Ci:3:003:0 0 8 =3D 12010003 00000009
ffff9bbf9f9de0c0 215864472 S Co:3:003:0 s 00 31 0028 0000 0000 0
ffff9bbf9f9de0c0 215864766 C Co:3:003:0 0 0
ffff9bbf9f9de0c0 215864862 S Ci:3:003:0 s 80 06 0100 0000 0012 18 <
ffff9bbf9f9de0c0 215865180 C Ci:3:003:0 0 18 =3D 12010003 00000009 e3054707
19080304 0501

In the other trace, the Get-Device-Descriptor request fails completely, many
times:

ffff8d32e6d06180 1883228171 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883228194 E Ci:3:005:0 -19 0
ffff8d32e6d06180 1883228195 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883228209 E Ci:3:005:0 -19 0
ffff8d32e6d06180 1883228210 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883228215 E Ci:3:005:0 -19 0
ffff8d32e6d06180 1883348155 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883348174 E Ci:3:005:0 -19 0
ffff8d32e6d06180 1883348176 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883348180 E Ci:3:005:0 -19 0
ffff8d32e6d06180 1883348181 S Ci:3:005:0 s 80 06 0100 0000 0008 8 <
ffff8d32e6d06180 1883348185 E Ci:3:005:0 -19 0

The -19 error codes mean the device is considered to be disconnected, proba=
bly
as a result of the connect- and link-state changes.  At this point the kern=
el
gives up; it had tried to recover the original device and the recovery fail=
ed.

In the third trace (where the device continued to work after the resume), t=
here
was no connect-state or link-state change reported.  The reset was okay and
everything proceeded normally.

I don't know that there's much we can do about this sort of thing -- that i=
s,
transient disconnects during reset-resume recovery.  This was something that
clearly happened _after_ the card reader had been resumed; it can't be chal=
ked
up to power loss during the suspend.  To the kernel, it looked like the card
reader really had been disconnected from the USB bus during the reset and a=
 new
device connected in its place.

The xhci-hcd debugging information can't help; all it might say is that the=
re
was a disconnect and a connect, which we already know.  To find out the cau=
se
it would be necessary to know what's going on inside the card reader's
firmware.

You can check this interpretation of events by turning on usbcore dynamic
debugging and seeing what the kernel log says when this happens again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

