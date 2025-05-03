Return-Path: <linux-usb+bounces-23669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC9AAA81DE
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 19:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2C927A62D3
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 17:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA61E7C12;
	Sat,  3 May 2025 17:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY1RQUz+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC501199938
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 17:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746294578; cv=none; b=qwlebiu4jZRp/n4oL6XtNnn70XhEQUOSJUTO2qB9jra/f72EsFMWmxOYg2Hefy9LznU/rqqolbIFuEt/szCvJ4wIsCp0CtW75RPkni2/uickgsgAP3Sae+KYy2dSdM/6SBYjmVZu+LZ1vESB3PiWbmlV+/zmZcctFmlYcsRf1hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746294578; c=relaxed/simple;
	bh=ak7q2l5N67lleJUlcSpDODXfSuKCmKRsrarUA6spzfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JkYdgVmc5TXzOtixP/SN5uYWzPY+EkT2AjG4vTysYOQz9E3lmL2f4VfezCu9bmnRo/DLRnkylr0p22GCgpqWn8WiUb7A7uXkbEtzfZKErQFP2Bfk9LtfUX5Jlq0DULywTi9KiLqTc0WEvHdgY6T1ehgK1smwSybc2CDrjreGUhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY1RQUz+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 625D7C4CEE9
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 17:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746294577;
	bh=ak7q2l5N67lleJUlcSpDODXfSuKCmKRsrarUA6spzfY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aY1RQUz+An6OYPN/ga8P4QVjTvcdpyHo+tirVro/lxVQfr4mZWi4/VUz1T7LiBwj+
	 x0wKjt3No0eS3MBYo9e50LiPlzrKasxOCgLMNejY/DjTwuvKijqIj8MwQjKaEQzEyC
	 EoaSmYPeZxIJWGgeAuzQc4f8QBYeB3OcaoOIvQrUKlk3+4msW9JjWPUz7JQmmhpg6E
	 b6kTJf3wNNgaRNLzATN7wJW+/vOZLPcvAeXwhaZjByx8EngoriyUiAtt+WJUb3jtHS
	 3f/82VmAwmFMiQO/lnQtw/O7FrY9Bv7ACwYyCZnvIxVmzIaYoegbguHnaW1xXs6Y39
	 r02ZwEwtxY5qw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5301CC3279F; Sat,  3 May 2025 17:49:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 17:49:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220069-208809-hejfUllmsG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #28 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 308078
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308078&action=3Dedit
collect xhc crash data and reset the thing

Could you run this script?

It tries to catch debugfs after the controller hangs, but before the kernel
"kills" it and forgets about all devices. It simply saves debugfs every few
seconds, and packs the saved copy plus current debugfs and dmesg to a tgz
archive when all devices disappear. Then it automatically resets the
controller. Don't disconnect all devices by hand ;)

The outdir and tmpdir paths need to be set to point at existing directories,
and PCI ID is passed as an argument - use lspci to know if it's currently
0000:6a:00.0 or 0000:6b:00.0.


I think it's somehow related to the 7-3/8-3 (USB 2.0/3.0 parts) hub, and its
children - either the 7-3.4/8-3.4 hub or the 7-3.3 webcam. Would it be poss=
ible
to move one of those child devices to another place so that it goes to a
different bus? Perhaps bus 5, which is the first 600 chipset controller, so=
 we
could see if the problem moves to the first 600 controller or stays on the
second one.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

