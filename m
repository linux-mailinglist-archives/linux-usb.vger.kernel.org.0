Return-Path: <linux-usb+bounces-33534-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iYoqLYgGmWmiPAMAu9opvQ
	(envelope-from <linux-usb+bounces-33534-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 02:12:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA8916BA6A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 02:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ECF7F30059BC
	for <lists+linux-usb@lfdr.de>; Sat, 21 Feb 2026 01:12:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB5BA319610;
	Sat, 21 Feb 2026 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h6mXMqo5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4903F3595D
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 01:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771636354; cv=none; b=JQESD3N6SDvORYxRI2TAg59pZu4imx2GiludyBctwDdIe6Cg16HxFhMR7brJ9y33A+rP7yewkrcic7jT6j3cg/HYNATIRHJjsDhbhB/hRGB0iTDchQWruHFP2U2b7T87T3Gxij6AJRy6DIbagokzTrbAOIu+id9YGBcaOcllMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771636354; c=relaxed/simple;
	bh=gC9aIGtf4NaEN8sx3JD2kFb4GMv60dX2vroGX5as7LU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H2uNcH3WYIscWiq9jg7FsrCnOTbMzaWjsLZdZw6gI78o/Ycm9/xFHY82vKSwOvhUc6pi8AkyXp1lturDwtbOxjmsWTG2tu+vo9afVWdUL/AQ9+E8xQBapFoJCL5SpGatD9YUA+fd7x7vq6xjrMHnxqy42Gi75wWw+yBbNN/vhAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h6mXMqo5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D88C116D0
	for <linux-usb@vger.kernel.org>; Sat, 21 Feb 2026 01:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771636353;
	bh=gC9aIGtf4NaEN8sx3JD2kFb4GMv60dX2vroGX5as7LU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h6mXMqo5FWhN4/SO+kvbqCnORh6MVc/CdDWZT6Nf4l/A3S3l53LWQfqA5JmKQn4x3
	 45sjSUI7id+ulh9ulQVUFWFqVgWLil7c7tk592RV1Ux2OQn0YcO+6Y1B9pHm4nJRbH
	 PzDmm6DzBEmwbYHMYxyghwGL26RS3oLGBpuxy9wQTEJxomNHYZehWN24PIURn6hd1Z
	 UiV1qRb96lHEZ4cI4pjdiH+KpRAweynIOPaRdnhvQVO7/f8PT0naoSxt3GphsSifLz
	 c4dAPAawzIhYjTd36GjvOfkWesOFj5SOMVAprKEOKhRXzsqI8FASPzNA6dJnNXQQyM
	 SzFpAiuiTnxuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C481FC3279F; Sat, 21 Feb 2026 01:12:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Sat, 21 Feb 2026 01:12:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-jPG8NfJmzC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_FROM(0.00)[bounces-33534-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 3CA8916BA6A
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #15 from Paul Alesius (paul@unnservice.com) ---
(In reply to Alan Stern from comment #14)
> Have you tried disabling runtime PM?  Run any of the test scenarios after
> booting with "usbcore.autosuspend=3D-1" on the boot command line.

Disabling runtime PM for USB has eliminated the freeze, tested with hammeri=
ng
all devices too for 40 minutes.

---- Other logs:

With runtime PM enabled, I see this in dmesg on every boot:
[   17.918387] xhci_hcd 0000:78:00.0: WARN: xHC CMD_RUN timeout
[   17.918508] xhci_hcd 0000:78:00.0: PM: suspend_common(): xhci_pci_suspend
returns -110
[   17.918586] xhci_hcd 0000:78:00.0: can't suspend (hcd_pci_runtime_suspend
returned -110)

But 0000:78:00.0 is a different controller than the root hub that triggers =
the
freeze. Here's lsusb with controller information:

0000:0e:00.0 Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
0000:0e:00.0 Bus 001 Device 002: ID 13d3:3588 IMC Networks Wireless_Device
(Internal)
0000:0e:00.0 Bus 001 Device 003: ID 0b05:19af ASUSTek Computer, Inc. AURA L=
ED
Controller (Internal)
0000:0e:00.0 Bus 001 Device 004: ID 046d:c548 Logitech, Inc. Logi Bolt Rece=
iver
(Plugged in)
0000:0e:00.0 Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
0000:10:00.0 Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
0000:10:00.0 Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
0000:78:00.0 Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
(xhci_pci_suspend -110)
0000:78:00.0 Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
(xhci_pci_suspend -110)
0000:7a:00.3 Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
0000:7a:00.3 Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
0000:7a:00.4 Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
0000:7a:00.4 Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
(Triggers freeze with runtime PM)
0000:7b:00.0 Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

