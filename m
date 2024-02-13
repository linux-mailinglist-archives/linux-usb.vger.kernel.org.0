Return-Path: <linux-usb+bounces-6365-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE018538DD
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:46:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C31251F231E2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4833F60261;
	Tue, 13 Feb 2024 17:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODptSSJO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F2C6024B
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846381; cv=none; b=lwbHVLJBNb/zKKeEqiIvihsueaXOWBnfypG7Nn6P4h2Cy6AKHQf/qbwUe/nmm94+t7EzmB8zJHiRe6QJjhYovYI1YBVurZuCuebkmuQfdhMDeeLJEQ9S0oDnnfT3HyPr+PtQmCqaKfBQcEhxZPWQyCqruci4LwiyIUyYcYBs/ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846381; c=relaxed/simple;
	bh=nEXnt4Tz2Z7F8uxs69ccbjSgQTI74D7uxVDlKfPtWOg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bs2b52RN5EssLLVG44cbkMJKNs1Ah+AFaQIsFjr+/JKdZ+e2HaPtNzymkrJZ3nxY6tFyzO+fIW+4tTd/13cdksS+PmBZos7qbeDSliVz6/OmI7Yik1vf0/MWPuh02dufScmGSTAwL+NyTyFU2f/FhM9Asu9iismvKSaJJGNDg0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODptSSJO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48893C433F1
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846381;
	bh=nEXnt4Tz2Z7F8uxs69ccbjSgQTI74D7uxVDlKfPtWOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ODptSSJO4+0RQAH66b2hrV8n4YSi3Gz31UbvTq37mc0PldcipJcUjlK0v+cjqq1LK
	 nLxVhugOaykGzm0pElyf5sbOG0xf3UT6rEFlhnIHFa6p+mCdVZanNkJshZ7tLlw+JH
	 5ojMn8FztbyRiXFaE8fHa9aY2VRhbIuJYhje7ZkBKg7vLIlIReN1rvGy/rV7UaDFod
	 uGAoYVUXKh+9lgntE3lCoGqyqVAmkYz4nyAyTD8Y48yvzqxiTBFxV5yzcy+YTFkAlf
	 SfZklatubsUS3Q7DO14HMmGYwN0a39aR0C4WZZIs6ploR9UjxcaGuFe2xD8xP8rBdE
	 SX3OAsWawPD6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3909BC53BD0; Tue, 13 Feb 2024 17:46:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218486] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 3620
Date: Tue, 13 Feb 2024 17:46:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218486-208809-IpOy67kAPY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218486-208809@https.bugzilla.kernel.org/>
References: <bug-218486-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218486

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---


*** This bug has been marked as a duplicate of bug 218490 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

