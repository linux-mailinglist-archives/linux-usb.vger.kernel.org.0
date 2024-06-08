Return-Path: <linux-usb+bounces-11040-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C7F900F1D
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 03:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A315B218A9
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 01:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678C18480;
	Sat,  8 Jun 2024 01:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tl9B7yP0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B48828
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717810983; cv=none; b=nRoTKm31t1KyNr4D0URAetuhKLtwMoUzyU0vTFBZWYtY98qFOqMQPgNBtTN6SaCEJYhxm0Pk91sd2y/jqjTGhlUy62W3dhmnUscJMSjWcHmgGbbCgjYyxdGeXLt5nLCUKSJBUQd7h2SFZIrbJRk/eL5yh7B1HVk5EvsNJS06Zto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717810983; c=relaxed/simple;
	bh=BOUr+5Lza++UQCRpScoyhjEzayc10pOk3QzVZTpRBA0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n69gArinU/4a0r5tRKuW0gG3/jSDPrGkdgpDj57DCLStlLlnOzneBf9Q8sT/FjK/8USyAPsz8uodtThcWOTmZuix20m+Wijq75thPj4XChEzo3zW8aG/pJQSfh6ZYtpdl272FOVeViZdFy2iR+JZfu9trepnApN4pNDDUQq7+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tl9B7yP0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7558CC2BBFC
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717810982;
	bh=BOUr+5Lza++UQCRpScoyhjEzayc10pOk3QzVZTpRBA0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tl9B7yP0RW1R/JoF2ZmVQ8DzjEbAYiCbPtsRZF8S3XKB7UflrvOy4pSpLSumX5D5n
	 Ff0YyjQIaAVVuu5oLjCIlqaDP4CXkU0U1Mt8Mkit9LU7ZZEFR5j0ne1sJ9uabJMR1J
	 CKE8g1gv5/DXmLa44XaJgAquVxM2pm+7t4xZq01kD+N37vEN1ZJXO05Pd2Q9fvo+yx
	 U8Fc5UVf5Az8ibbnbYq6Jh4MekOzLs9EXUD/CohoVotKWos+2q6+zKH7NATje9bfnf
	 KXHa4w3gcDh82dZ/thvWAqJTIOAzhnKIVJ39TARaFOX7/LY5urLaI4peleRBeMyXIx
	 dkdSI5RoU2UBg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A1E0C53B50; Sat,  8 Jun 2024 01:43:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 08 Jun 2024 01:43:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-YDsigmIkzp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #9 from Jarrard (jarrard@proton.me) ---
(In reply to Mathias Nyman from comment #5)
> Can you check the xhci roothub port speed of connected devices:

added as debug bus speed. None of them go above speed 4.  I can also inspect
the device in USBView app and it confirms this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

