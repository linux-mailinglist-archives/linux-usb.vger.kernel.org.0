Return-Path: <linux-usb+bounces-13241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7A694C280
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 18:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E6A61C24FCA
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 16:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13309190477;
	Thu,  8 Aug 2024 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pXMlN5SB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81319006A
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 16:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723133982; cv=none; b=aZapm4kfN79dA5avmd3g8oHV60fguHpyGuLeVxmu1m9cVTxzb/NNQzzbP3b0vDEejWmx0+7LSQW8WEc66yAYV6NMXepwuEzov98GvZ2/U0nvMaVmUVH80hwdC8754vPYHmxawwwcy/Qk185Xva6Lfw5mGVqfnExQVZt47bDeUqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723133982; c=relaxed/simple;
	bh=pyj7P7FjSm14SjmAHGGkUnB9MRUE/Mq72T32TJXKito=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A+L1KrSk+xqzh6F+RekzKroHSobdUP0xt6q6ESf1aiKrSmGWn/HUhMZaH7HE2jecpCDoUDZg/M547snHmjVz3xsd6/ioN8upLyBIu1V6TD9PZL0vv78ZDiddDnoWBcLFIUzWYz9U26zAOiw7xgua1TEfvpyzEPQEUzlahf4E04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pXMlN5SB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20448C4AF09
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 16:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723133981;
	bh=pyj7P7FjSm14SjmAHGGkUnB9MRUE/Mq72T32TJXKito=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pXMlN5SBRPb/oZpBEkRTqjEtHT5JmtdggHyfQTmLv9S9SOEEqI5pK4yuyzReiNmEh
	 CbA6Ef9mdhHgtZwwTnuIIwCNnAgz/wGsfLlAZ0eNwVg7Ol/QkQuk7CaZIzvM4psgrr
	 i0zc+X9fu0Nr6GQ+sX5WRDvIwX7D60EwydtVWJUPU+ZtihnTe1FFs7JXu1mL3TuiXf
	 /ymeJimPzY/YZMz+BbOX9koZADMk+0/yUzRShhNbsIJvchXEYNWmRVpflFg6usg/qb
	 1Jqw04vjjyIXuYEaTY/Heug9Q+73OyDqE1pMFL5Zex/2CBiXbIakBvbeVhPUWqcO1R
	 cFty0ZheJBHnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 07157C53B73; Thu,  8 Aug 2024 16:19:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 16:19:40 +0000
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
Message-ID: <bug-219111-208809-xkX6zPswjf@https.bugzilla.kernel.org/>
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

--- Comment #36 from Alan Stern (stern@rowland.harvard.edu) ---
It looks like the Xone:23C can operate in two different modes, and it decid=
es
during the initial startup which mode it will use.  The first mode (what you
get with old_scheme_first=3DN) exposes a single configuration, which has a =
USB
audio class 1 interface and 2-channel stereo in/out.

The second mode (what you get with old_scheme_first=3DY) exposes two
configurations.  The first config is the same as the one described above, b=
ut
the second config has a USB audio class 2 interface with 4-channel "stereo"
in/out.

The problem is how to make the device go into its second mode.  Your Windows
packet captures don't show this happening.  In fact, they do show the devic=
e in
its first mode, using the only configuration in that mode, so it shouldn't =
be
doing 4-channel I/O at all!  I don't understand that.

The only way we know to put the device into the second mode is to set
old_scheme_first to Y.  Maybe this doesn't have to be done before the device
initially starts up; you may find that resetting the device while
old_scheme_first is Y will cause it to go into the second mode, even if it =
was
in the first mode before.  You could try that to see if it works.  If it do=
es,
the kernel could be changed to make this happen automatically.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

