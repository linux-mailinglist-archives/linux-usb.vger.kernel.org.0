Return-Path: <linux-usb+bounces-6448-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2191A855E58
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 10:39:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53E991C22521
	for <lists+linux-usb@lfdr.de>; Thu, 15 Feb 2024 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C723B19BA2;
	Thu, 15 Feb 2024 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b5U56Izf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FE3182B3
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707989842; cv=none; b=kjKs9Mt1ABS66wtLdyyXBzVgdm2Wwq9LisLJveLRwyo0CVtO/SL8mkxY0ovDsOOXtkmlm/ALs0TlrKrTx/QWYJNtMcv7GshF9Qog9vJbPh/ivNhAvh31FXpmno+EPF1ZkncwoMhAHdw7nJ16koHsc56JoCIE8b7kKcI2nFDAIjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707989842; c=relaxed/simple;
	bh=KN1cFDuqCvpdJc9z3ae7sAHCTynNWJLmVpNzmTxnqjw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eT34GvmVETfh7HDZuRmssdDpEgr21+X207MAv8gR0rNEDjV8BbKmPmSkYmRXFQHvjz/4t5Mjhgwow9DSQOOZd9X36RPJ0pYRPU+IMQG08mfbG+uozxaAHH/Rh1ld23DgdxIlrt6hgVmBhTFCy6YpYgC9lWXckepwOirpB9UJVxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b5U56Izf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9FD6C43143
	for <linux-usb@vger.kernel.org>; Thu, 15 Feb 2024 09:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707989841;
	bh=KN1cFDuqCvpdJc9z3ae7sAHCTynNWJLmVpNzmTxnqjw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b5U56IzfdMbt5q7WM9/2rWmSJgeXyzeHV/aDip/JykGS3siraf6I6Ox1JTeyzdiC/
	 5Yk6W9LEz47kdlZ9ja0Yk6PZGSbl8dxmOJXppVG5MB7EGXmrtxiPU3AAgEIBMfZPsh
	 q+R1g7LZ4a53MahyASLWM4hnc5D4iumcYLIrRLD6j8bYgysyBRXvVYxIuHObAiOt8L
	 76/Q73hYjTytAMMUrpINuxETOt9bjJyTVhuTVFzOBYBnrW+YvRVpLiuuX/8nyNhq7n
	 lIkjiq0Kn4mqj4nAL/9UMstacLC5Mp1TYRVjWdr6uzJcZ32liH605m51/xfUNyXJof
	 T5Fi4ljuEt1tg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AAFD7C53BD0; Thu, 15 Feb 2024 09:37:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Thu, 15 Feb 2024 09:37:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218465-208809-ZMDr0huLuU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218465-208809@https.bugzilla.kernel.org/>
References: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
This DELL machine has ACPI entries for USB ports that are not usable.
These ports are supported by xHCI host hardware but are not internally or
externally connected anywhere.  They have _UPC (USB port capability) ACPI
objects stating they are not connectable, and _PLD (Physical Location of
Device) that just returns 0 for their group token group position.

So all unusable USB2 and USB3 ports have similar _PLD entries, which then
confuses Linux when trying to pair together USB2 and USB3 ports.=20

Linux could probably ignore printing any warning messages for ports that
have _PLD entries but _UPC shows they are not connectable

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

