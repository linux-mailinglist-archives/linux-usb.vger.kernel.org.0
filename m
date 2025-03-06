Return-Path: <linux-usb+bounces-21412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A3A5437B
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 08:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F10918952DE
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 07:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5721A2846;
	Thu,  6 Mar 2025 07:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwCbAsGj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0718DB04
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741245399; cv=none; b=MlPA6Igrn7SbPxpeBfVNbswOTl6v9lsFUB7dc/eOfHQKJfaGcNIl8Cr2wl636j39axbtqIjtucphS4S8Ibq3bXFLNOz96gDfJhEoLGzD1Yi3xslIq+iagoJRS3II83/GA55dSqfYvhCAXm5wY0HD6pYzeErpdserUyTEwa6CR+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741245399; c=relaxed/simple;
	bh=cEcVQb7oUX3E1V8qSb0ECUyJkpbfdPK6F01NLcJ59Z0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EWSAxrUUGetdGOCwiUdmZnOkFbgRYNJpI+eI2o2RJqvsGJYD5OU/IlGp3yqw35iEP9ojadcTFr+tGhSYUKgfFc1QNgynMO3RAi/fpgsImuiLLgmJcjJQUvPaywAVUy/AQCsUu8jroCTsM+R0UjRLOqs9RDxc828MlxANgRkjEpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwCbAsGj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A718BC4CEE5
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 07:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741245398;
	bh=cEcVQb7oUX3E1V8qSb0ECUyJkpbfdPK6F01NLcJ59Z0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QwCbAsGjSrjZ50Rv/dc2yP/uCTJHFinI08Aq4Sszt1QK444gyO+ctp7z+/y55O3vV
	 PTkqkxONQs19ZyI6kgc9r1/cJHFNLXE0pbPXQkYFY8HdzFpw5FHwilU3dwxbET5rKB
	 /mjVFljGDPve4WrbXRgotzzD05ED8tUsL+B4vJvAHzXm6EKoa+EhI6wMdHxuG/ofUe
	 xrQFtlg1950FMxtBvopbLwwho4rKxuOu0QdDyCXnI2BLBKH3a4eIrr4InAzp9GR5xP
	 JI24L05CWdUzGsWFgk/yDplV7uESHl9dcI4eNOhmyTDL7cWpp6sla+4OrSXlrDOvvI
	 G3tieBzCfAYYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90C85C433E1; Thu,  6 Mar 2025 07:16:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Thu, 06 Mar 2025 07:16:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-hJd3ETPfvf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #29 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
For the first dmesg with "undetected" display the enumeration goes fine and=
 the
DP tunnel is created however:

[   54.496699] [drm] DPIA AUX failed on 0x0(1), error 3
[   54.579780] [drm] DM_MST: starting TM on aconnector: 00000000a96810d6 [i=
d:
133]
[   54.587986] [drm] DM_MST: DP14, 4-lane link detected
[   54.591410] [drm] DPIA AUX failed on 0x1000(5), error 3
[   54.596690] [drm] DMUB HPD RX IRQ callback: link_index=3D7
[   54.605700] [drm] DMUB HPD RX IRQ callback: link_index=3D7
[   54.612512] [drm] DPIA AUX failed on 0x2003(1), error 3
[   54.616646] [drm] DMUB HPD RX IRQ callback: link_index=3D7
[   54.624654] [drm] DMUB HPD RX IRQ callback: link_index=3D7
[   54.631037] [drm] DPIA AUX failed on 0x2002(4), error 3

Looks to me some sort of link training issue but as far as I can tell the DP
tunnel is up just fine. Immediately after this there is unplug:

[   54.632887] thunderbolt 0000:c6:00.6: acking hot unplug event on 0:2
[   54.632987] thunderbolt 1-0:2.1: retimer disconnected

I think this done by you and then replug. If that's the case then from USB4
perspective it looks okay (let me know if this is not the case). I'm leaving
the graphics side for Mario to comment on as I'm not qualified. I do see MST
and that seem to be problematic in Linux IIRC.

There is one more thing that need to check. Do you have
CONFIG_USB4_DEBUGFS_MARGINING=3Dy set in your kernel .config? I ask because=
 the
driver exposes the AMD retimer from the dock upstream port side too. It is =
okay
if you have that set but if not something is not right then.

Regarding the missing network adapter, what happened there is that the USB4
link did not come up at all so all you got is the USB 2.x wires and devices.
You see them "High Speed" and "Full Speed" in the dmesg. Now, this is somet=
hing
outside of what software can fix. Typically it's the Power Delivery firmware
that handles this but most cases simply unplug plug or flipping the cable m=
akes
it work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

