Return-Path: <linux-usb+bounces-20045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E31A26529
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 21:58:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D86F3A4C63
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 20:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC6320E71F;
	Mon,  3 Feb 2025 20:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPsm5mR1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEDA20E01D
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 20:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738616293; cv=none; b=LEJiwJmkBPb1TTArDC9GxmIBm9wZ9BtQKd/J0uPVNUXjK9YlIRv8WL9ngQAtm6NfsckPp9Gt4zWsDXPPEF8BbWcj2/e2OpcAVIn7/bU/qvaPVT3YWBRNthDr9Sti50EcdaySTYk3rHsaVSgAvUr33SWF5r46QUL5+pgtEORfOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738616293; c=relaxed/simple;
	bh=ELbBu9iQiNO3bamhJO+tBvV9DuBClt159PQ2oyHwuoc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AoD1IQEd+Eo03f7bgpqvE0VrDb2g4sitYg+/ainpzjSgP55MeH2+aSL80gfzlwqIrXLayf5LCw/wKLQz3SrAViC0QM3dZbsy8HTfDTBtrKd7rKJry0PQCHbNENwhh3PRqtGtGECJ5Ajk5MhplSqmS5SiLmIXGs2xxzemnxuhYQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPsm5mR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE680C4CEE6
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 20:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738616292;
	bh=ELbBu9iQiNO3bamhJO+tBvV9DuBClt159PQ2oyHwuoc=;
	h=From:To:Subject:Date:From;
	b=kPsm5mR1Up6zDMORZGqxqskxkgtUdX7klDj1dEd3dFg+3AGja5PPOhHi9w6yPk0YM
	 6IKh5wfqdx4GUbm0e2gSaVPubmKn4w/OIrV7WNBzloBzOI8kfAPJ8yULIRnE8A27QQ
	 mY/HABaS6wePtzzKrr2IbtzCcqWI0Q6R9RoHka94Ur6PKWHx4t0oMQ3eyoSxkFc5/f
	 FSSfzH1DjajQnNPZHf4Y2qgZ40NwMJotpW9KaQFSL1kyMKirw8XRzMsk89wdey0UG+
	 q7o4fZQSLIAzbWwdzOZrSPwEB/7H/623rUs6gR5TdAT0HbD7gxPJVQk9RVa4ALit7l
	 YIYtzAxZcOijw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B048AC41606; Mon,  3 Feb 2025 20:58:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] New: Pluggable UD-4VPD dock appears to continually
 reset with AMD AI 365
Date: Mon, 03 Feb 2025 20:58:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 cf_regression
Message-ID: <bug-219748-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 219748
           Summary: Pluggable UD-4VPD dock appears to continually reset
                    with AMD AI 365
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lyz27@yahoo.com
                CC: mario.limonciello@amd.com,
                    mika.westerberg@linux.intel.com
        Regression: No

Not sure if this is related to the linux kernel to fix up the Pluggable UD-=
4VPD
dock https://www.spinics.net/lists/linux-usb/msg263475.html.=20=20

The kernel running is the latest from here AUR (en) - linux-mainline-um5606
https://aur.archlinux.org/packages/linux-mainline-um5606. It is based on the
6.13 kernel. It adds some patches as this laptop has been a bit unstable.=20
Hence, the additional amdgpu boot parameters.

thunderbolt.dyndbg=3D+p output shows the issue starting at time 27.027128 i=
n  the
attached dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

