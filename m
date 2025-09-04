Return-Path: <linux-usb+bounces-27522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE813B42ED8
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 03:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D5B61C23EEB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 01:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8951DF759;
	Thu,  4 Sep 2025 01:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="izcG8G0R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A94B1DE2B4
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 01:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949373; cv=none; b=TdVEH9ff5EbUoG4T4j84ovPuCsbFgUPNWquFq3p0o37i9OcPlQUCSf3WlDTbTMoACHdc4Jvv61C0YfOX+G8Zt2RJ/Ll8i9CqN0Xj7LeDxg1U7xSuuXu1EghDI8gVeOGdsU3wuPzBii7mvEaGEwkoPvjtHDIfb7TY+li36UEDYXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949373; c=relaxed/simple;
	bh=Tih1efO8FtcS60/h70ZOWOgYZz5NBrqSehATh8n/gYk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YafJdtkuptaMCr9SmQJIXCP1PZv/0kCqNTeyFjzxl1FYWlu/4hSHBA1I/XmXZS+4rTItUqMMyZFbWKFdenRC3fng9YEsHzerwiTtOxM2n2ELyszdez9j5xXyGwlHI4dQwZs+XN7A/grRr902t7E25XEb7tj60A6aWjrFxwJm+a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=izcG8G0R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E53C3C4CEF0
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 01:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756949371;
	bh=Tih1efO8FtcS60/h70ZOWOgYZz5NBrqSehATh8n/gYk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=izcG8G0RsdBz1RN1jqsdvAAJY8xHnVl6XlWx9MMpFtiLNOdMXtKAGRsA+/eQLcRnZ
	 FXRcnhn1w3tjTrrv5nILzvPm9+7OxmxkbZ/FmdCawT9KLr1/NHvDasl8gNeDvMtwq9
	 3qPzGpGb5YqMZKlAAD7U95UisDcrLyBIEhglpCVYWMwxjb+yN7DUuuuSdIMpHubaIV
	 ZG55gVP0PqVLwnFTigIR8QYWb5jpoXXMpqC94DKDA2CjApzdw05Ii7FQU3GTPmnaBQ
	 dzlj52m7m/twXFBDOuQH3zYaNTgwPMEr483TqWzJnZbn9X6baZiiFGSY9Nw9t6ZrK8
	 TTmfENWcdCSkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D428BC41612; Thu,  4 Sep 2025 01:29:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 01:29:31 +0000
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
Message-ID: <bug-220491-208809-prhP3rX218@https.bugzilla.kernel.org/>
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

--- Comment #36 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Oops, my just posted usbmon trace does contain urbs that I would interpret =
as
talking to the associated hub, for some reason I just missed them on initial
read. This is good as I was expecting hub destined urbs. But the idea that =
the
device ID does not change is still like I initially interpreted. In the just
posted trace I only see two addresses: Bi/Bo:3:001 and Bi/Bo:3:002. In a tr=
ace
with a disconnect/reconnect there would be three addresses, always Bi/Bo:3:=
001,
but two device addresses, say Bi/Bo:3:002 initially and then Bi/Bo:3:003.
Depending upon how many times the disconnect/reconnect has occurred since b=
oot
the device numbers may be larger but always sequential.

I've looked again at the trace from comment #9 and there are two device
addresses. Curiously, device 4, presumably newer, appears before device 3,
presumably older, then comes back again. I don't know what actually happene=
d.
Perhaps I traced the wrong host controller, but perhaps not. There is a sec=
ond
xhci host controller that I might have traced, and it does encompass two
uvcvideo devices, but according to lsusb both of these devices have the same
device ID and differ only in interface number. Since there is only one came=
ra,
the two interfaces must be an artifact of the physical device implementatio=
n.
Anyway, I wouldn't put too much stock into the trace from comment #9. If you
can make sense of it in light of what I've just told you, please do so.

Oh, after reviewing my comment #10 I remember that on that run I mistakenly=
 had
a USB uas device plugged into the same host controller as the SD card reade=
r.
From the amount of trace information for each, I would guess that device 00=
3 is
the uas SSD and device 004 is the SD card reader.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

