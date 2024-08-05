Return-Path: <linux-usb+bounces-13105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B09947D4F
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 16:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 379561F22201
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 14:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DB613C67E;
	Mon,  5 Aug 2024 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDx61LkO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A875381A
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 14:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722869754; cv=none; b=nBFT6RFMv/iVtvPB0ESRu7CT0fDUC8uDLskSI0M17uujR8MSRVH30vURUK2DWo/xCcCa0gLfkEzGJX0BQC7UPAhM7PypQTaLygo9RiN8kCk8dCunWT4EH4BmxDAo+UduOp6f0eklO9Z+fY7cFCoZdXuXxhAakCMjM+aXt3mdxHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722869754; c=relaxed/simple;
	bh=/wG3X0jm7xsmmkGBlSDT/4x8I8sHb0b47pC+vUvuT6c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMtMiL5xbVodT5Y3uNffIXSjahJ5CE2NKNTUn89CRUeg7PfqCS/Wks4hIH92t9FmT62dbNfg6+Hz3dYLbyXslkInyKVFBEkufjgEhhHJbP71AeGfAcUvGQ6h2alUexzHvwsH7GYlXzBL0Ji6wt7hZAJmS31rUIyoqVsLTnPMCtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDx61LkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08DEEC4AF0C
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722869754;
	bh=/wG3X0jm7xsmmkGBlSDT/4x8I8sHb0b47pC+vUvuT6c=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iDx61LkOvqSCFQ4saOAXAtwcChGKt65oRXrHaSi9o6iVyMeiim9Z+BjhfZx/+mL+l
	 l825Gw6sznQqWlvR9XQWYdHWvK25INkx5mqvJKh7BTrn1Wf94YMf1VI/3Y77pMFcKD
	 MjH3MgrlHKMPAc62ouKF1sEHv83DEJvGX/lGoxd1SN2Spvpedoc4V2NX1/EYgjBJzu
	 tbRM7X1nDFUzcfNTdHGZDqNrtElcZ2tEhRKGwiX7PmxblTz21yYc3hKk/uUW0Uo6Pi
	 kpdCuplzwyudVwokmqpInaVURTU69Fu1fP6LHZ7Hiiuvt9a8ToCiZA3bfHcXepLpA5
	 ugtbwRkNf7EMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6E18C433E5; Mon,  5 Aug 2024 14:55:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Mon, 05 Aug 2024 14:55:53 +0000
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
Message-ID: <bug-219111-208809-GUSkNYbP81@https.bugzilla.kernel.org/>
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

--- Comment #22 from Alan Stern (stern@rowland.harvard.edu) ---
It doesn't help.  It shows that the device provides one input and one output
stream, plus a MIDI connection -- no more.  And it also shows the device cl=
aims
to have only one configuration, not two.  (Plus it shows Windows setting the
data rates to 44100 samples per second, whereas your earlier Linux usbmon t=
race
showed the data rates being set to 48000 samples per second, but I assume t=
his
doesn't matter much.)

Are you certain that the device has two input and two output streams under
Windows?  The USB packet capture gives no indication of it.

Also, how does the device behave under Linux if you set the old_scheme_first
parameter to Y?  In comment #6 you didn't say.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

