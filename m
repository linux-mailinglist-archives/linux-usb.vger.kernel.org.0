Return-Path: <linux-usb+bounces-28798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 722C0BAAAEC
	for <lists+linux-usb@lfdr.de>; Tue, 30 Sep 2025 00:19:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06626188D3A8
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 22:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA59E221275;
	Mon, 29 Sep 2025 22:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyegMl9c"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA061DD9AD
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759184364; cv=none; b=J2EOc29K5O4X6/TFk3vWCMmYCj07ga1jqZ2j+z4TcqU+34Io44hq3H4hX0b+LUkSw9NsOmyYT2SnUq7RYPjagl/ramnLpA9rQwmP2yeZQKTReiRZR09fj0QRsemEnGLc41k3Tw8ffHDSv6yhvUQRxat0kIPVZu8wVWfwt93L7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759184364; c=relaxed/simple;
	bh=p7t9LMkgqyH6AhpkD9y6LNmbP1WTagcWU3UitfZSer8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HDdzlRvvuTHZzK9QxCqqwjI1RQDFWey18i4FuCaCagIygnfh3RQS+aScAyz5HXjhUqVcPimj9sB3hJuRTv5Ui3zqjs45ljFw1i8qKakC7F8sLsJqfqyUGPA8NwIlG9QuTiaNl+zW+AfnAXHiAzfUbA/KHpZt4tD9GMN8jpRjdOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyegMl9c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFD9AC4CEF4
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 22:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759184363;
	bh=p7t9LMkgqyH6AhpkD9y6LNmbP1WTagcWU3UitfZSer8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lyegMl9cTKqKHHzsZEJBhYIWqrUALiuciZkUGLamtiYutFSPh3vfXbtSxIwylLBwm
	 cWO/bd3NH3Z8jKfWx2mTzNsMaTFWHpH0K1146I/COmaRh1rdqmPViNQ9v6rvk2OgWZ
	 sBz+zaMFyVd6/AhXAANIi12RiL2Oue80Gt5YR2uPtReCXdVqjjyib8flYOgQ/GAC27
	 I0xTyslaSHlVYeiGbA4U35PZWYL1VrcIjYSW2OeqjJ9METQ0E3dY+5CoBD8oTomMXm
	 6TqEDD93yPpVjCARWY4skwt/r4TgF2ozcwhphkwIyB7k60hwHwfvhYFkxa1n3vCuQu
	 fbeucCq9ZtCnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B63CAC41613; Mon, 29 Sep 2025 22:19:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Mon, 29 Sep 2025 22:19:23 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-wNaZY84B0o@https.bugzilla.kernel.org/>
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

--- Comment #56 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308729
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308729&action=3Dedit
usbcore log of disconnect following reset

Mathias: I apologize for not immediately getting back. I am still working on
this problem, albeit slowly, mostly due to my getting older. Unfortunately
neither of your patches fixed my particular ativ0 SD card disconnect issue,
though the last did help to jump-start investigation.

I am slowly instrumenting the ativ9 kernel to help me to understand the code
path to disconnect. In addition adding/changing logging information, I've m=
ade
a few changes to the code to get past some bailout points. I now have a tra=
ce
where the reset code detects that the device, not hub port, is not respondi=
ng
properly and initiates a disconnect.

I have attached a log of the entire sequence with everything else stripped =
out.
I've stripped other things as the log is long enough as it is.

I've thought from the outset that it may be necessary to disconnect and
reconnect the device in order to successfully patch around this problem. I'=
ve
gotten to the point where I can begin to see how to start coding on a patch=
 to
accomplish that and I will continue on that path unless I get a better
suggestion.

One thing I haven't looked at yet is the warm reset concept. As far as I can
tell, the current code is performing a "hot" reset. I think maybe I should =
look
at trying a "warm" reset instead. If this seems important to anyone, please
weigh in.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

