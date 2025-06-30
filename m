Return-Path: <linux-usb+bounces-25314-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B09AEE110
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:40:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F292D189FFCC
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2077328D827;
	Mon, 30 Jun 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WET10gtA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB6328CF50
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751294119; cv=none; b=Ib0OfdwS8v1jwYZQPQlMI2HggHkWaVys8b2ugDl5OkPNXnLw7ejNQOhTKJ9TSpcH+GFDJLROqlGC6FVkhpT1HmiluxCGQyMQCfRWEYD7u12AR5H3rCCO7t3hjMeq08F5d4f9+yym9V2n1rSb/UbyVbcdiLWev9eV1f966U8I1zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751294119; c=relaxed/simple;
	bh=hUNNP/TGjed4/plwLse0kYbkJZvPIHYCqrVgY2WTTI0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qXSVGlc+br5PE1ZN/ScAaH5wu/JtfcG3h8nqruFq1tGO+bWFoJcfTgbAVXQfhUXTUzOPwFeh3+9V3GSmu0tYUaQxD8Al3cTWctTosP7nnGItCxlcZlX6bKGaXz8uWvcLBv3fiN275bwMExWJqeeVoc3XShVMjLo3YqHLlPsJFqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WET10gtA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D82AC4CEF0
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751294118;
	bh=hUNNP/TGjed4/plwLse0kYbkJZvPIHYCqrVgY2WTTI0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WET10gtAT62tXQrgQJeaXOvyysva+RS4tbI//OHBohxUG4gn5aOQrRETGQmFCHBg9
	 x6aKwXAqC8A3ZnWyUeK1Tvu+15B6CohWj3DcQVXUn+LIrMDCAPTR/99fHBTZhVR/ID
	 uJICiC3wzHkDeIDxRR4Veg4cWgvhA03joIPaU+D3vyuNVoebsaCpgQ5minmZukd2aS
	 om4regb3RfHaVzSLYLy9ZlwRx6jmpCVw2Hhu0zTXS31m5S5d5dP/HW4PFlnyr21d0q
	 zVC702NvpaB7I9N5r12MpvzirKCBJZmWgjfY9Fg7ylJv+CZQjbyA/JfpSQvENUorXS
	 fu+mzzjiwjatg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1EAF0C3279F; Mon, 30 Jun 2025 14:35:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 14:35:17 +0000
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
Message-ID: <bug-220272-208809-twb3VzSMdv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
It's great that the mouse remains non-working after Micha=C5=82's test!

You should collect two usbmon traces for bus 1.  For the first, start the t=
race
before issuing the second test command and don't end the trace until after =
you
have tried (and failed!) to use the mouse.  Example:

echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/unbind
cat /sys/kernel/debug/usb/usbmon/1u >usbmon1.dat &
echo 0000:00:14.0 > /sys/bus/pci/drivers/xhci_hcd/bind
(try to move the mouse)
fg
^C

For the second, unplug the mouse, then start the trace, then plug the mouse
back in.  Don't end the trace until after you have tried (and succeeded!) to
use the mouse.

The traces will be easier to read if you disconnect as many of the other USB
devices on your system as possible.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

