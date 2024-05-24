Return-Path: <linux-usb+bounces-10529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C9A58CEAF4
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 22:42:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD8CFB21253
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 20:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 356B77350E;
	Fri, 24 May 2024 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e5AWiIQg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B197E2C6BD
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716583360; cv=none; b=h7b4j0Xd5bign6l91f+DblDrf6qb1fHvcSEIsl/L6zkAO+SbPfJ97fRa9YOZ5rIpoIE79WcDw1NRm0z0joUHjdufwLuHg48JhStV+Kgn5/sPcpaQcmJ9DpOktRvPuS0XBnBcufLxxJbWzX/7Y6Uo575X/1SmgV+1run8zrqBRW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716583360; c=relaxed/simple;
	bh=tZX9+C8knBPOinnSeIN8rN2GwkI3N5/bBJfYE6Sa4pk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a1WIyAZoO4s9OG9Bi0vCNsikMZBDA7DE9vs8UTZxGLUP0GanE6Mx5sWN7h0h4nFyaBC62AUXrvOPYHXqSunM+9XXC9vdTV+FddUeswVWsyBhqSFpTyVfv+ngxrX//4tZ5/7XyYRBeGQ/bhApafz3xpAD1hXIOLHBhuQ8YTxAiaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e5AWiIQg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49FF7C2BBFC
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716583360;
	bh=tZX9+C8knBPOinnSeIN8rN2GwkI3N5/bBJfYE6Sa4pk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e5AWiIQgrm87xCL5xZt9JY4VptXsQQXSmtc4+zP0TESDqErPHrtcqWiAEYZu0IJ6T
	 XgAQslq4CShcFF5D+xvHwHcxrlOlG1zF8qAhJW3JD5Uh6oITdaE3fvWyovgNY51Eob
	 LklpajPEsi18kcY3IVMN0tYL1VLt/M6SMRBO0RBYPsjce41GN6kOY9nizNS5OtAdqD
	 4y3rsC6z5sBlia3lUvgnpX3qDg0NnT/k9TVUryxz7qB2J9xaBVHXKGONHSAiw1D5b8
	 vbYDqjxZNR5izfO8oeFGGV1PB6jAbBM+3Uz4Ap+TTk0fU9pKuVj9vcVImjBGd/FTO8
	 yxhcS4Ei8T5ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3FFB0C53B73; Fri, 24 May 2024 20:42:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218886] Steam is removing Steamdeck Controller on launch
 (usbhid)
Date: Fri, 24 May 2024 20:42:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: forum@docmax.my.to
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218886-208809-LGVneKhLpP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218886-208809@https.bugzilla.kernel.org/>
References: <bug-218886-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218886

--- Comment #1 from DocMAX (forum@docmax.my.to) ---
Oh and kernel versions do not seem to matter...
I run Valves kernel 6.1 from jupiter repo. Also tried 6.5 and the current o=
ne
from Arch repo.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

