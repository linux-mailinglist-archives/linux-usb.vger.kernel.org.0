Return-Path: <linux-usb+bounces-23737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3385EAA9DF9
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 23:22:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 265D1189F483
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 21:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D8327054C;
	Mon,  5 May 2025 21:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tt8v2ALe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7A1D5CD1
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480141; cv=none; b=ExJtEXepThWjazPIk1dIBZM6Hxta/Mj/o1Mq0q4m6gjjlznSUROwWgQJ7i7SE/tESvXfa78VsP2zK+V0/+6AvgpCdsTBk/I2SKsGWYAEa5DVtTQGxHMnFy9ls1ihd2eaN5hkPY6GUEtiq2G/IsiMvcRqTYsyh+WtOa47/fUzm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480141; c=relaxed/simple;
	bh=LKu1ia98WOdVDRwQtk0Ens3N6Sdpj24iUbadjFG7yqo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nMFDEe4pHG7H4TwSOTFW9R56aiuB8NGcsYS9rLvHe6XBRbS1A2bgYm7XkvjvDg4bpJHA6uMkz8wqRD4Bg7YZap0c7XsCcXkx5CxTmTbhulhfzxtdu74EuiOOUq+MGKI87Y1X6il48xdNPkT1etS8epZh6E3UiYU14LyHXsZ9srA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tt8v2ALe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4572FC4CEED
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746480139;
	bh=LKu1ia98WOdVDRwQtk0Ens3N6Sdpj24iUbadjFG7yqo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tt8v2ALeZuWSO5u4mDPfGcHagdNrqsp36fwLFY8Ojp1NoCnMMPoMzwFILtaAHSRze
	 5ejmrKXxFAVasaekzHUDonbKJwWS/uiYzh6GrB25Elcb+Z81YbpiAid7oknix+Na4e
	 B5KgG9PqDKlfEDqCpAJR99FTSvYcSNIcNOA0sX8pycA35TVg4gRuHi7LKJZHnbjRuk
	 UlhnA38m+B3iWFzWFKC2lm/4DyaCYWjpyXhDAWZwCMZIul9lKMsZBPpRV7nRqgdKhH
	 rAH7vJC0/jGIatZ5469vtIpmKKyhNBG3X6s2krHM2GVo00r7/t18bxrSYIK68gHgE8
	 B3OHrjXgkoZPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3A58DC41614; Mon,  5 May 2025 21:22:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 21:22:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220069-208809-iwId5UvSDk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #44 from Claudio Wunder (cwunder@gnome.org) ---
Created attachment 308097
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308097&action=3Dedit
Autopsy 68

Attaching another crash on 68; I haven't moved the webcam yet; Should I move
the webcam to another Hub or simply disconnect it to verify the webcam is n=
ot
related?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

