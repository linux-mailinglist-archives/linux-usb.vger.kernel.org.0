Return-Path: <linux-usb+bounces-12221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CB293137F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 13:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B8561F21EDA
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 11:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A433018A939;
	Mon, 15 Jul 2024 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bywvfhkW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B0189F5C
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 11:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721044395; cv=none; b=GPxunVd48+cqiymBJBFru29bLbPK6U4XiKw7iV5yBrx7v1Lm9SQTnnjUcNDzyjdO8fVsuVlj0DyAUBEhGuTLIeQSxKpyo6pe1d1L5Gtd7WiUUEAtPt84tZGHVE98bUXVJrk7GoYdKpO4xswMWGMyhHzqdUfBi9N3yTcmuxStrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721044395; c=relaxed/simple;
	bh=xUSD8B7uXYUVctm5ueeSzQNxMsvuRfG+6jyLV5KKVjY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kRyk/gdkVRsGJUqpIaqJ9vlWHzrsFICRyAPjk6G8QbsE5meVsexk1QwgtdMmAtTbpnhyurC4NRT70CZYGcLe85NA8rEfaaVPzz5fvi/26xwDQHvSMzHuShZAPirEnqBAGPRyfkg0c2QCm0Q+MbTO8JGhqRebekHMZ8CpD4lFjlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bywvfhkW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AE46C32782
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 11:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044395;
	bh=xUSD8B7uXYUVctm5ueeSzQNxMsvuRfG+6jyLV5KKVjY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bywvfhkW6zbBd5c21Z01Sxlm5Mj23bIMdBlMchr5xssCRmneamHDWjlHkyWxIYsZu
	 o+D+Jd6HA1MuhMktFGrj5i8+0ii27G53p+yVnrmDzyNAdHT9CHsgMbKW3A9rapXawh
	 b/iE3BgM0kjwuk5j9uC+bCIKYh1Z6BDqg8QG27XTbdg5WE197ND0VfssxGaLINAHip
	 VNPT/tJxLDAuJ7OHrVNOt+XDMmwvj+aV+eMgaFAlz1ybWCl0vRrqQ9He2dJd65BHG5
	 HRh09OaJzg1PsCM4m4BdYkzPR/AYxa0S8pv699jmzRKg0XTS6hhkEvgGyROxxrM6sY
	 dU9RycVShglCw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ECB55C433E5; Mon, 15 Jul 2024 11:53:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Mon, 15 Jul 2024 11:53:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: elatllat@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219039-208809-hf1dQrMMUC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

--- Comment #7 from elatllat@gmail.com ---
 RESOLVED with 6.1.99 and 6.6.40 .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

