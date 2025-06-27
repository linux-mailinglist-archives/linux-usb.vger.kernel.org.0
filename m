Return-Path: <linux-usb+bounces-25185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8ADEAEBC8B
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA44B1C62D19
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 15:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5AA2EA734;
	Fri, 27 Jun 2025 15:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owCRs+aM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B0B2E9720
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751039554; cv=none; b=Z1p98iMhEBsjKsBZ7368iYp1S+Z1JZXLF0+IBg1c7IhoUtKd1QoAvTDwqq0ikLaDAWk0yAVgGnVS1zd7mfjNKSt9Toaw0P+wKKrsCZrR3O+xASFwsnyYkXGIWirAmdtAtE6CJHrDpRwKjiTU2fuwEZvFbZ0HQJYPQEzyalPKU3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751039554; c=relaxed/simple;
	bh=9UasFdoF1X3jB/B5Wuu2jAv12GCVTdUK9YFLaKi4570=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOsbu1TPo1rseDtLPJMtDqEorahSu+FvoLWqIXGMXPzLrCV8XjVY7/qI5PxA7sbOdvmL1/O8NBnTX+skHxvcKwDGIF2odYudgOxEZVORaNJQWqbCiO1Yw89GbB+LpqCjFjtJ2HjExl/Kbwd/fKxN/9JXbz3Ek9RNGJUZ3hXmAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owCRs+aM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBFA7C4CEEF
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 15:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751039553;
	bh=9UasFdoF1X3jB/B5Wuu2jAv12GCVTdUK9YFLaKi4570=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=owCRs+aMLC7gg9FGDPpLY0brot3g/ICetbaKVILzfJ3eh7gE0GJv3+gvJcAQexOHM
	 jaPo7hwkahczgtAazlyWrfBQN35AQ7IyGq2yrtFbez/YMF5vDIL+AJ84ksOowNz64Y
	 Tp71y59dpIcmJD7T4Ob2/ySkflDoNzsqtqyaTkDvZLj2uoXzmZwPY0UwvzoFMRD5Eo
	 IaetzFuda6EZ+V1+hxNdDhpgwxdeLyJvCMH/7aWdxk7BmHOzaA2//GDIptPyLHRb6K
	 AwWT308hvuy4OqsL8nQxXAnAK85AjYRHJoeEH2ygvbEWXXXAifFd7VfypdyOzE4cgw
	 gVbm5DNAwfXmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD670C433E1; Fri, 27 Jun 2025 15:52:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Fri, 27 Jun 2025 15:52:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-uWjyDuZnf8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #9 from Alan Stern (stern@rowland.harvard.edu) ---
I don't understand exactly what the two logs in comments #5 and #6 are mean=
t to
show.

Is the #5 log just the initial portion of the #6 log?  It looks that way.  =
You
really don't need to post two copies of the same information.

Also, when I asked for the dmesg log, I meant the output from the "dmesg"
command.  Not the output from journalctl.

As far as the logs indicate, the Sharkoon mouse was working correctly the w=
hole
time.  It was detected during boot, and then about 4 minutes later you
unplugged it, plugged it back into the same port, and it was detected prope=
rly
again.

Your bug report says that the Sharkoon mouse is not recognized/detected with
the new memset implementation, but the logs show that it is.  Do you have a=
ny
logs of a boot where the mouse was not detected?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

