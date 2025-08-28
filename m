Return-Path: <linux-usb+bounces-27356-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37725B3A9AD
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 20:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 810FC1C234F4
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 18:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8DF26C384;
	Thu, 28 Aug 2025 18:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0e8no9d"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AB4264609
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 18:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756404713; cv=none; b=hjP6M6kyLig8eZCdOsgPJHr0V+HQaa8//TaYnPkAz+CNIU9YyG8BUxFf5UnRiTi5hkmpRtsR7sthQdFoKsfOUMOPykXG0MpU/Deaw/hjIyK1+ybHPa0perXIzZVHhCLiBlRAk8tfc5ShQCGtweO5JvtIS+jpuYzSY6QVWuqBug4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756404713; c=relaxed/simple;
	bh=eLNvvR1isKmpOKtTHCrl6XUOWHni5zwyo32PWARtzIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QatK81c4VrFF8048LmVNA44hgTnNoOmoaTtlWWa0TQ0EDtc28y6MR80xqcH3vd8mugZfRMpwSITlWWk8cRp8PpY6CUAFgoUHT3JHKg03GSGeb0WvZ3DHLCtgBRJvUKM7rxhNoNfhCJpn8rrtDEN2AsJX1rUKhFotezp6m7uhuz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0e8no9d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FA4FC4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 18:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756404713;
	bh=eLNvvR1isKmpOKtTHCrl6XUOWHni5zwyo32PWARtzIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o0e8no9ddNfUFDUNA3klLO4eZo85PGhN6tl2xVW4HZ4uhy2lGFXTafwY1oDyaGxvr
	 CBdgDOJiTZwpRffbqmdeqBda8+kWdRxwB7NSmFp/Yci2IB8L2oa66Rva/gDTKi+Bon
	 3ywm77S0MtrFmluQNRD2GgwRC5kCfmQLIWGnl+p/XhMpEjtb2M5Tm5TULtob5ZMshJ
	 lCBDfmqV+mrlQffrCfJH1S5a0Noc3fQrN18s22tm8XrKZ8IeqAeY4ORSyIZt1CrAXX
	 zJChanoUdwdjBymw5Q15RqbCbmki76dYLsCVzyTzlMFSh461DUPYXutdMNCztzEGmb
	 e1rWy+cQa6Ajg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46476C41612; Thu, 28 Aug 2025 18:11:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 28 Aug 2025 18:11:53 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-oZiGH88ZSH@https.bugzilla.kernel.org/>
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

--- Comment #14 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 308573
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308573&action=3Dedit
Retry reset if there was a connection change

Please test the attached patch.  It causes the kernel to retry if there was=
 a
connection change during a reset of a SuperSpeed device.  I don't know if y=
our
card reader will just disconnect and reconnect again during the retry, and
there may have been a very good reason for the original code to limit these
retries to non-SuperSpeed devices.  Still, let's see what it does.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

