Return-Path: <linux-usb+bounces-24260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B2AC2B79
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 23:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4ACF59E7346
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 21:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6ED204863;
	Fri, 23 May 2025 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIQI48Bq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99D019CC11
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 21:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748036628; cv=none; b=gmyzNzGDd/UmbVAv4zZNWYEranoo0jLgJBPeUFnpejx2N3krhfVbiJNVzW5PPeyoRuNPMvRtiWZHT4YjtY1rVk0E7kqQG5URlV+w2QaJjGIoANWAMmUufrr3weGURQumJCiolfkszqfFMjmcwfWDwYAkXyla86IZlT4B8tHEb2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748036628; c=relaxed/simple;
	bh=L42xoOL29L/B2DDVaX6QJwzPPTff70xMRHMq5xR/1v0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n4zXWd9EPrOxI3yXXpXVDbNWdcfxig6X/CQD61dosIHomUEgsmbBWqliFe4qRTMCrB2yB9Qk1saI6AJy2hZH3mXk7zugH48IDnFJSlpauSnV753bCPkpAo6slmQ95S5OI20qQJogjuwEHBxvan5WfrhZszjhzuxrr3yAZs2FB44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIQI48Bq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54DEDC4CEF0
	for <linux-usb@vger.kernel.org>; Fri, 23 May 2025 21:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748036627;
	bh=L42xoOL29L/B2DDVaX6QJwzPPTff70xMRHMq5xR/1v0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nIQI48Bq3PT+FvGib9zfAqia8wPHUosIVks0iJ/ndAFIV30FsYbMGA2IAd1Jsbkt3
	 BZRfX3iS1GQEqUKxZLxzwxfd2rjH5f7EUq6bwAh3yOzZhlApbsJdMcPo6t79Xc6WF7
	 nSmVuSetLE+ywcUSBi3ncE/zDU1rtzdRONcvRwPvt1ngc1j4cmiS36sPC437NYVjtT
	 Bjw1MwktfKwJc7oDzpT4ExkY29yphjNTSCVPS1TJ+/8/YAwibzjvJZFcI/6im/0v0y
	 0mrHbJDLvjdvzbmtpVbaJH4mi8taAD68TR7L3ehmxDaPMmheGPSbuZburTA/rd7qxm
	 wRsVvZLEAhsCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46AFEC41612; Fri, 23 May 2025 21:43:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 23 May 2025 21:43:47 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-gb0G0SQmJ3@https.bugzilla.kernel.org/>
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

--- Comment #61 from Claudio Wunder (cwunder@gnome.org) ---
The issue is still reproducible, unfortunately, even with the quirks. Is
another dump log required?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

