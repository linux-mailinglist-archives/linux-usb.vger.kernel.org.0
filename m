Return-Path: <linux-usb+bounces-24759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D38AD9F95
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 21:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6EA81741FC
	for <lists+linux-usb@lfdr.de>; Sat, 14 Jun 2025 19:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 384F52E6D37;
	Sat, 14 Jun 2025 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ssDgUG9n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEE4148830
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 19:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749931038; cv=none; b=phUILdsAeGu+zIN96AfWtQ5ZOgHOfJVMdr2EO5C2EvT9FH+cwvbevz/OIFs9QztXVBqeYPL6GRPvs60jAEvKyQ4Xn/g8iiFHdk0fY/ljoSFCDvRqb4yp3ixOPMe8lLFNc7+QEI9zkai2Wzw3iRkz5tiG4xoxrHgYXrAuBxF79yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749931038; c=relaxed/simple;
	bh=N8tm2DJbbLKUj1SqZgIlpe6ygf+7NYgMu/VRGgNdvDs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ee1Y9TPm4t3XLxE2RxLT0BjXa7QPs+nm3WazkQ1WOOi9VdCw1WRP5zczggAQLslWUU4+lp5D/N3r6e1cj06TaFOjdGifdDTVuVPP8ZNnQnOCijmipsDAzErxWarkN48Swb/G8aTJBj9mJ1SdTzEloVlhvrNdxJoQn+5u/voy4OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ssDgUG9n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A5F7C4CEF0
	for <linux-usb@vger.kernel.org>; Sat, 14 Jun 2025 19:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749931037;
	bh=N8tm2DJbbLKUj1SqZgIlpe6ygf+7NYgMu/VRGgNdvDs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ssDgUG9nOB4rsIWv6nCtvq3zEr8uD5u+rPd4W2f6zpEBejjNQpCWj29bM9FQ5AmvQ
	 9XhBAHCbVuq7pzhs3RKIOC8Qc81qZJRhv9UBv8ZGn+g8Fhd41J6T2wZlKpGcvIYd2w
	 eD0NJVqay+Oh2OraHTeBgj47x+oKniyI0mGnTa0Zy2HTlklZs1kkl4Ov+w83qtj+RU
	 54lMt0jttA5vMMpjG+js/80QylX1OIHhRv0aAifoq5rmalJdqiQSAefZOTIlHDScQt
	 6xuD/Ihz1VWkyMzeZUKUFB4nsrLqMHMDsvjBj5LWtfISZ7YQmDjMrFb3ASFUR5+ZgM
	 iBO0pefal9lTA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 295CEC3279F; Sat, 14 Jun 2025 19:57:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Sat, 14 Jun 2025 19:57:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: gnw3@acm.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-Rm4b47mT8V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

George N. White III (gnw3@acm.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |gnw3@acm.org

--- Comment #8 from George N. White III (gnw3@acm.org) ---
A Fedora user with a system with USB4 ports is seeing=20=20
`fedora kernel: hub 6-0:1.0: config failed, hub doesn't have any ports! (err
-19)`.
I wonder if the "the zero USB3 ports" issue is at fault.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

