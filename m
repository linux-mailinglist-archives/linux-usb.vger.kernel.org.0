Return-Path: <linux-usb+bounces-13232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A006994BCD6
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 14:02:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D9496B22F5E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 12:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4144218C929;
	Thu,  8 Aug 2024 12:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kh2kuXLa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA8018C926
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 12:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723118530; cv=none; b=JCcZxnrAO+8aovNWQpPTC5SdiqWFYG+HpYUjYdG+lNkArzBuX2wsfy8upDkJIB/dXJmoUNS2+xAp0NYI7B4NRBQ9wxTzkiiKGciQeEstdH8ieI3kBo7+hl4WSvLf4mExiu3ViX8ENCdATNAF+qPeja+d5rnuJfhCRf9QodEh75c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723118530; c=relaxed/simple;
	bh=rhIcZxVXoRB92vQ3bYIOFsFWi2QSDdSmNQqezr+Th2g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbMxJuncSJdAp27FQkSudQLx8GXj1qBqp+FhxqKnXExXbvQ8TA8dtgWnnpOFZGCygagcw3wcHsSFfMayXH6BuiZOhfV4m5ooLyMHEnNUVasclNB8EqRT5/E8aNPkpomJv7F/5662hJ/r/lwcjkYBXdUbltniZMm3+XwgnvhclLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kh2kuXLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 943EDC4AF0C
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 12:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723118530;
	bh=rhIcZxVXoRB92vQ3bYIOFsFWi2QSDdSmNQqezr+Th2g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kh2kuXLaR2NSgQxNXrrT4i5zBajCOc+kspuxwWjBNQw2JupYkSv2T0FYHy84wjAB6
	 kMG0ApuDYw7UsUz8AgFHgvjOBvh5euub3dzL8v17mQDWWoELurxeLmLrQAfAHlbYnu
	 9jRqvNU4PZfUK+zYz+M3jcEZQGY8qEgNRHlQcL0V+8n7kmwUWgMw8KxSfKmpyp1ZtX
	 Ds6lLyNFFakzp8VyJ2gBJJQbz+chHBj4Z5we84/++xDx4kkUNi8haSItHgT+HcB6Jx
	 prKkQyGXpVUxA7B539E81jbb13udcmRnaxK9wg4tnsPkyi1F/m5GMo5/m3f7xTQEJG
	 TgioAIsdVtZew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8312BC53B50; Thu,  8 Aug 2024 12:02:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 12:02:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-5Oe6mToKME@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #35 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306699
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306699&action=3Dedit
lsusb -v -d 22f0:0008 with old_scheme_first set to N

For comparison with what's lsusb outputs when old_scheme_first set to Y

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

