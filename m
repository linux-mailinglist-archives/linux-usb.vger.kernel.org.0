Return-Path: <linux-usb+bounces-23642-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 61DE7AA6E19
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 11:28:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04F817A2553
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 09:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC8622D78B;
	Fri,  2 May 2025 09:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEO50Tml"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA009225775
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 09:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178100; cv=none; b=Kks0A1z/hHUiak8TKLipt1laZIc+yGdkNWRkxeWYsc+XJq2cyv2vcqOwy+6nKMtDTHl8OL4+e1Asc+Oc+/ZHSKS48gkOphxGguii58mTaSviO0AwU6CMJBK4+pWFYsheBgEG3LElaqj++Oct3s5/VvFAQEJD0N/DVgy5IqZzcvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178100; c=relaxed/simple;
	bh=1hDT2qdJ6a5LWGPOgp7iUjcLjLZIGGig/UOFsWQOaDI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nDg4SdO8WUIyRfxwB5TFv1WY1jAbXAcS7FqjtGIGIf1xtm1KnXLq+eCQ72/Zxf+M/Z7V3c3Inr99rrFYfeepVyZcZ/fVVlYkjYUUO6zyz72FGYYeZI/j+DGBXpomdHoqojEmoZGskUj1xE5C+pjiFqhCc2etkPOkE+n3RvmH+sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEO50Tml; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3013CC4CEEF
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 09:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746178100;
	bh=1hDT2qdJ6a5LWGPOgp7iUjcLjLZIGGig/UOFsWQOaDI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kEO50TmlV1U7QMPS9MjeWUF0AmfS4TJC3BA0pfsk9tHaOX8YbIbFmtHiFwv/x1rob
	 GmCBa7wMNEbZJoPi6wwEPVZ92f1KKRn5qsYTTj7w7/1UM390cLVXpmW7feOgJ/cpQ9
	 hluVuKSayiWhgrL6pfTdA2VmrzgkDlzH5riesxZ6VvqANn3RF/lygqvlAM8K7bOt5O
	 IO0nba7l+UBU6c1d7C6Cd4pwf37R3fwWR9dUhX46KiLbpUbhf6MqqIQhv7uSOWAKnb
	 F+maK468trxzBKWTFf+j9zzHwh5V0p64AN+62aTYaihIyEtbVZl7wz2GUjJDOj/3SD
	 3i5UqMS8mUZHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28A59C41612; Fri,  2 May 2025 09:28:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 02 May 2025 09:28:19 +0000
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
Message-ID: <bug-220069-208809-RYeYgp7oMg@https.bugzilla.kernel.org/>
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

--- Comment #20 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Try hammering each variant in a loop for a few hours:

while :; do usbreset <numbers>; done

You could also pile more work on the HC at the same time, for example start=
ing
and stopping video recording makes them quite busy. I suggest automating th=
is
job too, I use the yavta tool (linked below) like this:

while test -c /dev/video0; do yavta -c3 /dev/video0; done

https://git.ideasonboard.org/yavta.git

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

