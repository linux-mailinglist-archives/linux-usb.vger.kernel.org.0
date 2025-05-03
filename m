Return-Path: <linux-usb+bounces-23668-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4485AAA8187
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 17:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23E53189B028
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 15:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9E826AAAF;
	Sat,  3 May 2025 15:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XmoqvJmD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B405F23D2BB
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 15:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746287951; cv=none; b=GmWZgg0SZVsvNhLm8exPXac+Aev45EZLR1SfN9ig8Jy1lK2Rq69FRws3ZtzB+dWPUGaH63orh4VN1q/j+THtr+/w4STzpL/E+f/gXNL5AxeuNLITxMAzwP0ZqAuUEux/3s8rM/cCWuxlScSJ/6DAbqcCEc9Oh1FVZ3/xGC3apas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746287951; c=relaxed/simple;
	bh=Nj3HMqpWCobSR2p3jYCOlZ8MHdygQprpYMCQMbNzjDM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J6XGd0F/CV/p1GV1ktar8QgYmWT3tWwkhg6NZJSCRa9GvpTrWb3O3O6DYp01B0C14zjW4rtF99SZNZMdt1+McTLoHYAvfhvhGVrtBPxqFwkVhTst2Nfhhq/7MxgMbNiUCZs6A6DnNzefNFVKTRJews4nHiRgjGIuUmBEJX7hAx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XmoqvJmD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EBCBC4CEE7
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746287951;
	bh=Nj3HMqpWCobSR2p3jYCOlZ8MHdygQprpYMCQMbNzjDM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XmoqvJmDYMPLkvHANgHXT32wgemq+ucpnytrUTyvNbxFTSVgJj7WdfNYknJz+ylv/
	 UCDC4lnapLCyRc+jkwCioY6bUGkRN+EDq4En0HQzBj+2vtueBN84f5xWVxgQW2GfIK
	 bssuFbsqnZjCHGqvGN5ogYC4GsgnP5psrjbWGnqgcPSYQ089IZPAgW9SvXCsJ7tlqk
	 yqsCrbIT2J0Y8GVnBULYICfQc5khsyIDbFXfr9WkqD9EcRrh09zJDKYiA5tBQTJVzB
	 KTjxy0HNkZvDBCYqDM8JQYmNSL0/d9q9jMODUmlY4xl6HyJr6dof+9q2gI+yJ6H0my
	 zeLURgSlHbRhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1FE29C41614; Sat,  3 May 2025 15:59:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sat, 03 May 2025 15:59:10 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-6ZPtiaqpi4@https.bugzilla.kernel.org/>
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

--- Comment #11 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Niko from comment #10)
> Here is the output of 'lsusb -d 0fd9:009b -v', Do you want me to boot into
> an unpatched kernel so I can do the same for the other PID (0x009c)?
No, the point was to run lsusb as root at 10G speed. As root, it will reque=
st
the BOS descriptor (bypassing the patched kernel code) so we could see if t=
he
device has a temporary problem with BOS at that particular stage of
enumeration, or if it's completely broken and never responds to this reques=
t.

I think it may be completely broken, because I installed Wireshark on Windo=
ws
and it looks like my Windows 10 doesn't fetch BOS descriptors from SuperSpe=
ed
devices at all (maybe it does from hubs, I haven't tried).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

