Return-Path: <linux-usb+bounces-8437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D10B88D04A
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 22:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3848C3239D9
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 21:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D3213D88C;
	Tue, 26 Mar 2024 21:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzsxP30e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF155173
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 21:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711489511; cv=none; b=SF38TPQ9BDQ7MqTVrgpcS+9kBLbIzmuRkxlNRfnEQyklaS7toP7pFtjVsdjG5WdfzYhNNxuBV/pvLAZ1MZoyBSLCoACX70SKyprYSx+SFHehfK2uCRIYMwybygegek7FXXwYKCFcFZqI3EC52Vm6sVp/Kmm0nOM6CDXr16UlM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711489511; c=relaxed/simple;
	bh=4vZLXJXKkPFBzjjoICohdc4ePi1kegI8t2hOYlIfS0U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IyZDt6MO8CZNPyGMp3WqzF5/HL+PgFV6gX0gFlkYEEh4V6gZXiorhE98SU1GVzRHaFnaV4gDN/NfXylptO9Ouy/ooi0jj1pbt1IsUSi3vA9mIAE8peC3h5RdVH73rjU1q2xmZxDSlMD3LKRzqf9SRRGOJxEhI/LUk+YZ6fAaKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzsxP30e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64361C433F1
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711489511;
	bh=4vZLXJXKkPFBzjjoICohdc4ePi1kegI8t2hOYlIfS0U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KzsxP30ePDbqvkZ+M6W0kbB9Msg5GuNfSLDxscQ0l0f+Wh000Yfx95eTtIHhDEcFO
	 KehfqugyAZGfj82OlaugRJ9Fhoi9RKhvh2JVWaOITStRfodLrH6CQZkRUlimXh5Kr/
	 EwMkw1ot66I5IISLZX112ni+OqI7mS+Ir8l88eFYMJEo+GuZh9rAVd3Yk5urKBTNwt
	 oQ2APYSXG2jERO0C80dZuSJqtskdIHIvo//lNGzBX9HFQd4/p/KTCnNOzHSyTsT1NR
	 Xaqgp4mvxYZ14aEImoTP77Cg7x7NO1KgPBhbdqO0/5Fj6wuTpuduRgWCtjjUlEGVXl
	 7qHKcVDHQrmtQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C2F6C4332E; Tue, 26 Mar 2024 21:45:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218646] Problem with search driver or this is guide how search
 driver.
Date: Tue, 26 Mar 2024 21:45:11 +0000
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
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218646-208809-3qNjtJJoHY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218646-208809@https.bugzilla.kernel.org/>
References: <bug-218646-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218646

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
This is not a user support forum, please ask elsewhere, e.g.
https://unix.stackexchange.com/questions

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

