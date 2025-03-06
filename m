Return-Path: <linux-usb+bounces-21457-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C60A552FB
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 18:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4EE43AF016
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 17:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB4225CC85;
	Thu,  6 Mar 2025 17:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n55ddoTW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2425C6E6
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 17:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741281863; cv=none; b=EePy2DwfKTA8mqkvGi1rmKzYcn0XW0RDvTXPOv5b5qOJEyu87CTaLnEDIwmrwiaSepSl1bafnsTQK5FrOR65zUbJBwOPCwqSuqMWxPXyX8UiI2cQBY2+Sk7bN5xDMzMoFLrrfbTTuHtFof89YkUXtuM5Z1Eyl3Fuxrc7NjH257Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741281863; c=relaxed/simple;
	bh=QYaCr7uodfT4Id7A7Zux4V/scFxDlVxuM2fFSEcBAvQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WcCZXG3uOru7Z9v7XsA8kdEImUq+DY87FgqbmxjgFAZfmfEfvkVREAUFnMOKzZmqhpriDHdW1+cpIaWZ/jcMUrL9Wvd0JYj7xZ3FVaxUXITCLZCcigOL+bwzi+v4R41Swpqg2b7YAZk8MNGFlSgv0qCZahUFSdkbxttPP8gGnAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n55ddoTW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43C08C4CEE0
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741281863;
	bh=QYaCr7uodfT4Id7A7Zux4V/scFxDlVxuM2fFSEcBAvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n55ddoTWjq7SeDpTUT9u1S7kR8B5WzaAKJ8jGeYfe5cMwsVK7T6rs9E+QsvkfTiSL
	 uw6RDfwsl6QSpEeXNGoAX5N7p5zYcvB08GvLXY/SlqDQc/OIdxhBja8z+4UEhJCwhB
	 sdS7s2NcLdcrYSxKBD9ULgi5t1YkXdft47O3QLcwirJ/OvnpeEBuk22v71Cy2iPXxv
	 rFsZcyOAh18GcLzoijHi9esRijagCbkZ33CfMnwnMi++qGEJgMJdoDz4Mimad89P8y
	 QU53h9cuVNneJd/GohMnv+/uZ+JuQgGFj79l+CrjGN5yhJgn5f11zUGgaovrByAn5v
	 MvF3ANqJLkv7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 29516C41613; Thu,  6 Mar 2025 17:24:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Thu, 06 Mar 2025 17:24:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-8f3uN8Xyt3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

--- Comment #30 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> I'm leaving the graphics side for Mario to comment on as I'm not qualifie=
d. I
> do see MST and that seem to be problematic in Linux IIRC.

My main worry is if the retimer scan is the reason for the DPIA issues too.=
=20
The report that Sean linked in was a failing to read an EDID which got fixe=
d by
pushing the scan later.

So if you can reproduce the display issues try with it commented out entire=
ly
(maybe we want that for debugging as a module parameter Mika?).

With it commented out if they're cleared up, I think we still need to push =
it
to a delayed work queue.
If they're still happening, then this should be a GPU driver or GPU microco=
de
issue.  We can talk about that on a drm/amd Gitlab issue.

> Now, this is something outside of what software can fix. Typically it's t=
he
> Power Delivery firmware that handles this but most cases simply unplug pl=
ug
> or flipping the cable makes it work.

Yup agree.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

