Return-Path: <linux-usb+bounces-15846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6877994839
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 14:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8629B2836BF
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63EA1DDC31;
	Tue,  8 Oct 2024 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwoQMA4F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BDC1DD9AD
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389340; cv=none; b=EqkX28AMKhI3hy3jCRZOd65yqI1Fw0zQHglu07K3Z3zUG1qaToGXtJd6+yCTy/d4KbjKOs+W/pyLaAa0ToTwPkBuqkdLDuON1ZRPxXskm3Os9RsW/lU+B+bCPcZKFuo6uDoDU9q7wlL61gvi/MPfmbg/LUHgQiawMbQ6FVkXhpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389340; c=relaxed/simple;
	bh=6ZU7e3d6qcisdDhzP/yXliyuyK2dyfw6tV3iYm1p44g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jIF5q+cZ+qjbsVRpiKwO/cYorcn0x2/x5KA2tYwRwVubdp/MexypNdpDEd17cfkWCsJ6hkC9ZkKnDE4pX/mxlogCR0JEFtp63VKeDVOsquCKmzorxzrOqsLMr4w1YgZ/SPGexQsZF/DNEpaep32cMenD3xyTOXBlxvtqAmcnOfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwoQMA4F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 179AEC4CECE
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728389340;
	bh=6ZU7e3d6qcisdDhzP/yXliyuyK2dyfw6tV3iYm1p44g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lwoQMA4FjslXOqvgaZrZCKp0FEvpPRTWUwCnuWDM+FNjbDo0qyRgaRtd4Gp3Mfag1
	 bB1yIK8CHHrrIVuk21F1KwDq0+ZHSqpUUZt1qMINrxJfk7ymDFI+L+3uEjONUIWrC5
	 ePi/ze364SG78DYzJAmxw8rzkPQ7l7bBL9NxtK9N+F5Oa8ACJPnPQ1+qkvvKkvizZP
	 7jtZhWtNqgWgkrsxK/zl/Rwh3g0gJAVfI9/jOizpSGk/cjYjMAtj54b/ELh1R84/mR
	 878TnuuWHD5OZoyqEZzJ65p0loAZs4xcOJGOw7h2W2HvVrgRdCMm45EWFspw1CSL85
	 /4WoiUWMg8r9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0943AC53BC1; Tue,  8 Oct 2024 12:09:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 12:08:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-ryzhl3jOve@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Tue, Oct 08, 2024 at 12:00:33PM +0000, bugzilla-daemon@kernel.org wrote:
> It's an emergency shutdown in embedded scenario, we have capacitors that =
are
> able to sustain the system for 1 second in case of unexpected power loss.
> It's
> plenty of time to shutdown filesystems and drives properly. But we simply
> cannot afford to wait for userspace. Works nicely so far.

"so far" seems to mean "data loss" so I doubt that :)

> > Yes, that is because you are shutting down things in the proper order,
> like a normal shutdown will do.
>=20
> Is there a reason for sysrq shutdown not to do that? I mean... c'mon...
> shutting down SSDs cleanly is the bare minimum we should do... if we fail=
 to
> do
> that, we can as well just unplug the power without trying to unmount or s=
ync
> anything...

Because the sysrq code does NOT go through the normal device shutdown
process, you are circumventing it, because it is only for emergencies.
Don't rely on it for a normal shutdown, as that is not what it is
designed for at all.

good luck!

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

