Return-Path: <linux-usb+bounces-27611-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A61B4661E
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 23:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB81717D910
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 21:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFC42F3C28;
	Fri,  5 Sep 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vmn+yCul"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF82EFDAD
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757108692; cv=none; b=dzSKcc641UERpeDb/9DlxFQVizkI41W8djnbehiq7da8hLK2RjJ/VsKYcE+RLjNz2+KGWo2W6/c/WJjXTwLjC5QL+AKd2PvJRtvI9eq777c9SU/P+BROjS+MMwU3+wmh7KlozJoJkbr7EMoqLa2xA7p+hspU7VWEfzlXN91HKPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757108692; c=relaxed/simple;
	bh=qfaV1nI9qbT5fQ6RxVVI/9Xoj4uRB6F2xUzjcidGxX8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NDRLaPxXHF+oZ/B9j0v/imzPus+z0HOBYkTyz+VVzsmpIkBC7xZrPPRaaJbTxhcaPSuhgYt4xOll+5QXoNLWTXDuwF/qxhQCi8bGgT5m02VSI6sVGqGQd2Fk+AMzIjal7xv6OywsU0cPWxwpdLFm+e0fuBN5ksd5Ao6nvsVAUqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vmn+yCul; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BEA0C4CEF5
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 21:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757108692;
	bh=qfaV1nI9qbT5fQ6RxVVI/9Xoj4uRB6F2xUzjcidGxX8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vmn+yCulLEDSwCxCsh5mVziUknOsS4yNtzPWbHNktTlQvEyYKD5nFIIFlLrut9uSR
	 9xnOyHHQpyy6uKdqIGSA3ZaugziwYZHb0IFeEkxCSsKaGRx6nLMfE8x0t8GvcYcEug
	 EYks6ZLliRxFZNgsB2pQjztqPmsVo9VchHCLDrPSU8/aJyBaSAp0F7dnRVj90rJe3W
	 NP5VaSlMmSobBt7UGEZwny1FAtyOsfWIrCgQZQ2R0ZMWWBeNLuoZSuaL8e6rZZvLcC
	 dIyd8uL3mGpmx9Ge08tpxSGRe6NnKG5OpQuQylk624nli/S2So4+1Khw6hOe5DCZmX
	 AVauwqBqPNH8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4E360C41614; Fri,  5 Sep 2025 21:44:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 05 Sep 2025 21:44:52 +0000
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
Message-ID: <bug-220491-208809-TlqDPrKQmn@https.bugzilla.kernel.org/>
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

--- Comment #45 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Things have taken an unexpected turn. I tested a reset_resume_delay=3D500
together with Mathias' urb queuing patch and my original problem, unmount of
the internal SD card upon resume, returned. I was expecting that I would not
have the unmount problem with this configuration. Right now, it looks like
Mathias' patch somehow interferes with reset. I have again reconfigured wit=
hout
Mathias' patch and with reset-resume_delay=3D500 and have again confirmed t=
hat
the unmount problem does not occur. I will look at this further and post so=
me
traces/logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

