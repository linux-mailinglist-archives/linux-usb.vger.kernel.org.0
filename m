Return-Path: <linux-usb+bounces-20729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A82A388A7
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 17:04:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA46D3B7837
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 16:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D363A2253F7;
	Mon, 17 Feb 2025 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIgR2J82"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C152253A8
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 15:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739807594; cv=none; b=nmpnPwPBBnXh+3NiOJ8ONpR1ki+J3FZ1Kn3nkocgFjCxJK+7KuyEdazS1RiPw+SFtpZsGl+CPD390q59UgOSQyU1Vwuy8I582E0IMNilP+cE6N4kizhD6IZdDcQI4+RZsp+zluf6SGoJ71B4e4vSg0B+PTID3Nsy3U/IuYZdjXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739807594; c=relaxed/simple;
	bh=5buGbR00zTL1zdNted3G2DW4VYZagv+erzK5Eb/qVm8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jITDGcZz3fnELm61MhANRRzquuv5fAF8X/BJe/LY+WTUCOKEKq4KKsehaoEJYaQ5cpfANNLzq1qzXme/9cyOk2SfnmAyrnWPUXhe3RwTqajcb1T4lGmlt/oaKYI9+78E0k7ADklMWwe/fSFRBAV3bY1J9O1rBfV/4Ya8n7in9cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIgR2J82; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC7CBC4CED1
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 15:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739807593;
	bh=5buGbR00zTL1zdNted3G2DW4VYZagv+erzK5Eb/qVm8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OIgR2J823GrQwaQXIs6EXEL0w79R7en2oTV8F/iSTKtmch6nuRE9ycnBZ2j/5xLj8
	 WncmyLR33ewy7D+Z1CF8Y+f6DRkhgFNzLp9OeKcWnWCIRIFE6ThYZLJkPGQN8BydUz
	 FQLTvJuuafj5LQeW2ujGoQB52sp3NPa4Iz/hK8qEUv72RXi7CrxS/rmdYbXmiVcLvM
	 58p19uhTLLSezlrQ/TUUQ7njFQCKoNbFoHBp6FS7zViYroBmB1fy4F7CVjPWzwFe4k
	 mE6pNuvnFcHeb0O/yZHEEgwDPbSoWQoXRYc2CV3CfKfyK0fIQn3UU0/x+YOcSlPdvn
	 aTnVG+PUQnFxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE5D6C41612; Mon, 17 Feb 2025 15:53:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Mon, 17 Feb 2025 15:53:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-hUL2TPAD40@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #16 from Frederic Bezies (fredbezies@gmail.com) ---
(In reply to Alan Stern from comment #15)
> One possibility is that the SSD doesn't like LPM.  You can disable LPM by
> writing
>=20
>    0dd8:0562:k
>=20
> to /sys/module/usbcore/parameters/quirks before plugging in the drive.

As I said in comment 9, I don't any have access at all to the external SSD =
with
the usv reset spam in dmesg.

>=20
> If that doesn't make any difference, you can try collecting a usbmon trace
> that shows the error occurring.  Warning: The usbmon output file is likely
> to be enormous, and the interesting part will be only the stuff that gets
> written when the error happens.

I will need to buy another external SSD and see it I still see this bug. Bu=
t it
will take me around two weeks to do so :/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

