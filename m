Return-Path: <linux-usb+bounces-30128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CD0C39063
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 04:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C223434FF9A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 03:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC20722423A;
	Thu,  6 Nov 2025 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzR+WOmb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6A018EAB
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 03:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762401169; cv=none; b=Lof57Oq3/2eG7SwOqY+eZxTdVwxdcwZC4YaQ9WWfLVnkGO49Na3o5c7xZAoIaxkWJHLihQRge/G04LDbq2IjdVPAVZENLO92RtdBOhsuf0EYie17CfLkdA2Gp0gmLUAJBjCd+HCzF30k6u/WCQpMPX9FOU4bDglOku0c7E6Evt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762401169; c=relaxed/simple;
	bh=x4o9wpV5pvcCyXWyeeqqM71i3UD0E6rXxzw3fqINVKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=G97u8VzLIfZBpImejK33pxcbn366ER3Tkz9muKMSpOeXTWfh9bOGobtkipANYe3zeKl/mYeWksLz4OKfPeuOplb4TOiuUbd82rTWfbX4OHB/8H1JLvgSAzx3pxpDVAp6SnBfSQ0p9Qsk2Ee/v8caa/nQVx+FLdI7dO8LYY7lYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzR+WOmb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6CE2C116D0
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 03:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762401168;
	bh=x4o9wpV5pvcCyXWyeeqqM71i3UD0E6rXxzw3fqINVKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hzR+WOmb6WPSmD0TZK7CYohgPo84IqgKaQRaeTSDFMcFLlpGFdzm2lvuvH6+ILksO
	 w2YzWoFcKG+0ENp8bAT3ruJOwz/phUu1eMdTorj2xopGaAuIqw7OCxiGzIbfYqXA1t
	 zIA9eMseJ0y3pA/4He6yp8w+OZTkLpbfHLcjlaJB+fq49dSkqKQ5O/wJ9nrm2lesho
	 MwJbXg31F/YTCZHzyFdMZNLbqJ5hDBtTDw4GDGu/u+EkV67oN2/isYil/8XnpIGCx2
	 sqRidgLiVW5hXMjKSe1bscZ8aA6R+lfJSXdTIvWTw8gce+NF5P/sF7AVUbSzAzg+R/
	 9K4My+SWw3AFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E30D7C4160E; Thu,  6 Nov 2025 03:52:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Thu, 06 Nov 2025 03:52:48 +0000
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
Message-ID: <bug-220748-208809-loEwOHrV1o@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
Figuring out how to handle isochronous transfers has been very difficult; i=
t's
not obvious what scheme would work best.  Compounding that difficulty is the
fact that different host controller drivers store their (micro)frame numbers
differently, so drivers will never know exactly what to expect.

You say that uhci-hcd used to work "the intuitive way", but in fact experie=
nce
has shown that no way is truly intuitive.  Or to put it another differently,
what's intuitive for one person is not intuitive for another.

And don't forget that host controller drivers have to handle isochronous
endpoint queues that can be in three or four different possible states: emp=
ty,
partially or completely full, and partially full but totally expired.  It's=
 not
at all easy to come up with a set of flags and values that can handle all t=
he
possibilities in ways that drivers will find convenient to use.

The matter of specifying polling intervals different from what the endpoint
descriptor says is yet another can of worms.  For example, host controllers
generally can't change polling intervals in mid-stream.  And some might res=
erve
the necessary bandwidth at the time when the alternate setting is installed,
before any URBs have been submitted -- how would one go about changing it f=
rom
the default value then?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

