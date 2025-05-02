Return-Path: <linux-usb+bounces-23643-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55C1AA6E56
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 11:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58EB13A6F43
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 09:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF2122F39C;
	Fri,  2 May 2025 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kv9xNnoT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88538205AB9
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 09:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178871; cv=none; b=DLdHmvOOTxf9wbc8UNUYK1Kowv6v8G/R1WHmbbPhjdE8rt92SpeNC5htvjsQNxZ3dNezxyn1KqnY4OvP5vG3mSG2moOWEcbeTgaCNvrveJKDRlDDeaJyekjIcV8ZtawCw6qw+oD/4JPBypNhasS/nhzda9mESLij3TxN78nK79Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178871; c=relaxed/simple;
	bh=igDkdjRXn5PsfbfnTbRRl4ZWtV/bUCQSq78qKW4Uggk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i+ZEHpGE9R1HxZoIe7InPCFgxBqqsw2j1Z8SS5sN14nWIm4LpPFveDHXhr+dl4Buo5gQcdl4OOtz0k0wo/lyXYOiTZvgBe1bDw2qYLXfBIQkJ1N8+7Nv/i7I3yCFvSZGL64W/Oq0a4ylippdciMwNRE60C/K2zWMJbwHHfiZ18g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kv9xNnoT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AE9DC4CEED
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 09:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746178870;
	bh=igDkdjRXn5PsfbfnTbRRl4ZWtV/bUCQSq78qKW4Uggk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kv9xNnoTf9gSdXE3gfbrOmYXs3SfrruSAx6UujOJwC5tQToMdS7BJfwrOX0iJgGZO
	 eQY4aQlo5e4ieAFvB80gN61PvCvQweHcOkAOC8w5ijNol9vvbjzuVW6Zn+OzgHG1bH
	 o+FUgKW8ybBaOstEBCVHVdGyWN3Bwf43CKltSKf2F9c4LXlgmfxKJHhnCWwFsW44Rz
	 qdxJeh/WQtVNFGX3MU/fEzw636SRG2DJherqxwomQDCCUWWkPisDtVnCXKAtFm6NOd
	 Q+fs+Bh4933FfPgg2OCWnFISmtvrlPg5wTc5OkLy1I2ROJ6aVRJQXIqs1Kqfa5TG4o
	 b04VCBK4P/WoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F21FBC41612; Fri,  2 May 2025 09:41:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Fri, 02 May 2025 09:41:09 +0000
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
Message-ID: <bug-220027-208809-6ypDFQj1lA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Created attachment 308070
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308070&action=3Dedit
don't fetch BOS descriptors from devices

Maybe something like this patch, then?

Your device seems to hang when asked for this descriptor, so don't ask it a=
nd
see what happens. I tried it on my own 5Gbps UVC device and it still works,
though many other things break without BOS and hence the patch checks for
vendor ID. You will need to edit it with the ID of your device. The patch a=
lso
prints IDs of new devices to a) confirm that the earlier device descriptor
request was successful and b) help with adjusting the patch if 10Gbps vendo=
r ID
is different from 5Gbps vendor ID.

It should now look like this:
[89023.940009] usb 19-2.3: new SuperSpeed USB device number 8 using xhci_hcd
[89023.954100] usb 19-2.3: new device idVendor ac8 idProduct 3420
[89023.954115] usb 19-2.3: too lazy to get BOS descriptor or descriptor too
short

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

