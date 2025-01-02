Return-Path: <linux-usb+bounces-18942-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 738969FF7AA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 10:49:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA1D21881AFF
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 09:49:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83ADD19D898;
	Thu,  2 Jan 2025 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRsQd5bf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23F019580F
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 09:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735811324; cv=none; b=JOar2orS4Klewr7DI0wr6C+PhrPi5CsqJKbf7EK5n0sczkk6ZtgtbKoFdr7r39brQDefr6fQi6PtGjNN1UaK7pmANItdgqVe0PILQbt7/Cu7UpH611GwUP/OhN7FtH71xN0u2dLYi/uFhleNYMl6SrqzZKMWRgNEKX6/0h/Zduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735811324; c=relaxed/simple;
	bh=24FF+Ct2XChavdEHqsen3RVxVSJz5nYLHvyHR+H69Po=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H3G809l12S/q8IiSpLb6QA7TAmpCcm/6yaCQsQDVm1BiED0d2ElPsc6ZTq7xyb5Zu4QXKNccwH9OMbnWfybHHGx6aKUzK3kDLPSVPAWgS62LuYYAAruKjshRAIX56k/Nr5+KgvrplNyWBcBAs58e+nLJrCnG/x6re6rossr+YcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRsQd5bf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E25C4CEDF
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 09:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735811323;
	bh=24FF+Ct2XChavdEHqsen3RVxVSJz5nYLHvyHR+H69Po=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VRsQd5bfweTdFtAN74uQbiyZySGs+aIW2EIZfQjYpjseoS1kuSxczOV8ZlZxkPTgn
	 lpaOmq04qjizIk37/eaHBTPYr9D3ICg13l3sojRzeb3HBGd3EVVYxYrGPd7SfuIDYr
	 YesH42/Mp4J+TsNraCTtTOLctdJhrfLSyDrNjkmhhSwLvhVKmrWAHrQkm+YUhZQ4to
	 +5axNhCwo0DEu4WoxV/VwjXpWqSBOIcBePQGd97o9JNF4ZOyY3mFN3BfCU69IjE1Iy
	 QCwaRoZr5ZvRTxhYmkaeKOU1LQzawvbZjvtb6HXdsztjSfca5ZTkuXZgFdtPLz06xq
	 bQkeUA/OGW0TQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70FBCC3279E; Thu,  2 Jan 2025 09:48:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217501] Apple USB-C 3.5mm dongle cannot output 41000hz
Date: Thu, 02 Jan 2025 09:48:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-217501-208809-IP1sPEiKoz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217501-208809@https.bugzilla.kernel.org/>
References: <bug-217501-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217501

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Sound(ALSA)                 |USB
           Assignee|perex@perex.cz              |drivers_usb@kernel-bugs.ker
                   |                            |nel.org

--- Comment #15 from Takashi Iwai (tiwai@suse.de) ---
A good spot after long time!

As it seems like an issue in the USB core side, let's toss to USB devs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

