Return-Path: <linux-usb+bounces-27328-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B061FB387D5
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 18:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6ED2D1BA7FF2
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 16:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDCF2ECE82;
	Wed, 27 Aug 2025 16:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QwYqIBRu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959482EBBA9
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312499; cv=none; b=GKmhD7BhgnbZjiatahQjRP0XgXRosZ9g9cV4HblwktV8MqvqjTs+j08E0bMoIwHGZn7I2Ov3M5nx0fL78gVAQxzMNWNTmyPdWrC71sBshuXP4tftqy197jUSVxhO8CM74+CZcKdLRggdafF50o63BCUl+fGaVZvbLVXZ4GsS4U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312499; c=relaxed/simple;
	bh=oYZmv2HvbrELk+xQBWrljNaL5v9MoDW7WhBrTP4EA9g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aI7nYg/ZoTzdcat49eBMFmd7ff5VTnaDUq0DXO6mNlS07GSa9znoQfNaNwnlgyekSCdrCMejYSJKDacpRVE6Hm6Ve6Ur/uGd8UqYA9akUk0xy/FFhulPHNlPXc8L8kL/EznwgGW07Pce7sKcR04W1ZK50+NHWqFvIFfu8a2Z/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QwYqIBRu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 263ACC4CEF0
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756312499;
	bh=oYZmv2HvbrELk+xQBWrljNaL5v9MoDW7WhBrTP4EA9g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QwYqIBRus6CIbbHcP8R9YKkWWQD6HMf4XoOsfLHbUxKcwZA78hVBKrSZXWdMgkHHY
	 4BKXYJ91NJsiDmxTVbivkmNbkzWvLjKu8n9X91YI8+aoiZhlbuL98gxzBLRfeYjUTt
	 6N6TS5uaSE/Hsev39D+4YLe7xQBO2tFpjWpOyYnUPD7qhzU9EtzgrkdGINaCnzFT04
	 RQnJeiQ0rSTPsfN84HZHmK48FTJEtN7ZHaDd9HefF0Fjq0kTc6BiQ7UVp+lOMUCBIb
	 PV9vsYDaj4CfPvoGHRVyBMZX9cLSfwGxNxf6khmpc13IkkhquXQNRq+xDGiJphenH7
	 Np31LYo5kKeKQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0ED04C3279F; Wed, 27 Aug 2025 16:34:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 16:34:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-PIKgpM00bu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #10 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Oh, I forgot to mention that I have a USB connected m.2 SATA drive that I a=
lso
had plugged into a USB Type A port during the last usbmon run. This m.2 dri=
ve
is a uas device, not usb_storage. The USB connected m.2 device does not suf=
fer
from the same problem as the internal USB connected SD card. It always surv=
ives
suspend/resume without disconnect/reconnect.

Perhaps it was a mistake to have this extra device connected during my last
usbmon run as it may make the trace more difficult to analyze. I will conti=
nue
to trace, without the external drive uas drive, until I again get a disconn=
ect
trace with the "k" quirk in place. If it would be useful to provide a reset
trace without the external USB device plugged in, let me know.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

