Return-Path: <linux-usb+bounces-21391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 89073A4FE05
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 12:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DA197A3005
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 11:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B92241666;
	Wed,  5 Mar 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzidVUYo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512FF1F5413
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 11:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175544; cv=none; b=DbQqJK76Qtgin6ecFGvl4bCGs64oJkl7aK6i0AppxlZmWpvQIVcHMqoBmOgQsfMKC1jV1UPDl0g/Wd9+FPVNWcjcTNYQrEBS8/gnSOR3hNQRcYMBFSec9Yd3eHHYmaXrcbW3LapvzJosHUe6/dvDXa9Ibs/3PXlKw5AB9gTt22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175544; c=relaxed/simple;
	bh=wBukZXoq9hvp5sy4GHogOLbL6h+5jmk/vjnU2SplblQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AE+bZLuvh9Vwfh45VL7H7osOO+BLUwoMqluUfV3PYdDjwdpF1n/IcTfYnaH+oxW1h6NDVAVU5QcV/seSCZlPHMIYdqTOaF32bUUJyxjcjkc40si2UWzKrhrUB1nKPfNnzNR97NH4p0hMLYHrpNaNQ+Emxaf8GxvnhMbfSugu3xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzidVUYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADE16C4CEEA
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 11:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741175543;
	bh=wBukZXoq9hvp5sy4GHogOLbL6h+5jmk/vjnU2SplblQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lzidVUYoa7niUsIczg+fwPU37Idcam1AGGCdEVdp1aBIQOLDxIsAgnRCoYy7z2atD
	 MUY6SB7AZ/kZnldnwlpoeMy5Y2+1nxXZlkCx+bHRE9B48TZNl2/vSXyaALv1pUlbeL
	 LkGh6+Rr+NhgedcygwxXTrq+B6cwE1uQpEuyLAJIS0K45wLfYxyh81rZxq6UNt/BmJ
	 rrFa1/ytLV0wkpLFJe4fzXOC9G5NK8C+KQqzfx5RosV7nQoZqyqh82kY/c23rMwU8G
	 55VCi457quzCQWIHGTw0KYsCO02GdlXdR759u0dLVQ5laEVWiRuC9O37ANwKM/U0v4
	 6yJSHIb/4E95A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E6B0C4160E; Wed,  5 Mar 2025 11:52:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 11:52:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-wLYYh9J33n@https.bugzilla.kernel.org/>
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

--- Comment #22 from Thomas (lyz27@yahoo.com) ---
Testing two in one dmesg wasn't the best move on my part.  The Dell was me
plugging in the wrong dock.  Thought I'd leave it for the extra test.  It d=
oes
clutter up the dmesg though.


Dell

[   52.334084] usb 7-1: new high-speed USB device number 2 using xhci_hcd
[   52.475560] usb 7-1: New USB device found, idVendor=3D0bda, idProduct=3D=
5487,
bcdDevice=3D 1.47
[   52.475577] usb 7-1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[   52.475581] usb 7-1: Product: Dell dock
[   52.475583] usb 7-1: Manufacturer: Dell Inc.

The switch from Dell to Pluggable, I think, happens here

[  105.079211] usb 7-1.5: USB disconnect, device number 4
[  108.745727] thunderbolt 0000:c6:00.5: control channel starting...

UD-4VPD is identified here

[  113.165640] thunderbolt 0-2: Plugable Plugable UD-4VPD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

