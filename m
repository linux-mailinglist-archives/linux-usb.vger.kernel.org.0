Return-Path: <linux-usb+bounces-25135-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99509AEA3E4
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 18:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 996594E0979
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:56:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63D072E92BD;
	Thu, 26 Jun 2025 16:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCCNgR0A"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4B220D519
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750956801; cv=none; b=tCs9bykVp91bBARY7KpqU7mILScPLJC5xLEP1oiCLWhphmJv+WiinKec1GRY3YcnVhnTpYDikwW+wRjQ63jFTATKxjaCV2wLHo0KYeohjJLbbaV+u5mkEv4DM2Eq1bJXoEcFtPm4n8/qn9SBCbWfUMtCQh/mS1SaWH5BCRtRsjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750956801; c=relaxed/simple;
	bh=b4fH000Og5MCPIz+7RqjFMSyUT/eEix46myoRRKk5N8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDanYpUrwgZUb5axsY89uySt6Snj82XMkvNNXvqNIL2HVO7u8u5n9VBwMVxe48NabSC24R3iWowRiucvIh8Ef+/La2uppLmfKBeAHJ9VCPdryf8aMPx1gLVq424eW7DL3s//SigrsoqajRPgD59Y8pq0cIu+lxPxe1talINrnL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCCNgR0A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E916C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750956800;
	bh=b4fH000Og5MCPIz+7RqjFMSyUT/eEix46myoRRKk5N8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UCCNgR0AAcZZ29In8I5zlQmHjm2ag7DVMR7g9mRpW/enZLzpieQ9wn1wl5ofTy6m+
	 5cTuTxTjVXB/skcodwnjAoznQjENUbTgxGfZ3jPvv8F9BzNfguzBpZcHf8lctIDYkm
	 nBVld64dWH1uAnTpcxrfMm6BzBt/qqLlZRevptD+F6hVHquFkHUZRtsbOsPly3ApCk
	 rnrRoG5UaUkL7OF+u4hqF2VBjLJsX5RXnwxgVsokDrn7CqkjIRIXZQ5SwwyQxGRYxP
	 wucI5NEumwboIHgszFrCzFSks1XRZWK9QMadmCqWqIOrS7ehKrFTOLASG+g5CBYuaM
	 UzO0qTjCMFCRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74C8AC433E1; Thu, 26 Jun 2025 16:53:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 16:53:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220272-208809-sVWhk9knc1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #6 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308316
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308316&action=3Dedit
Added logs after plug event

Added logs after the plug event using this command:

sudo journalctl -b | sudo tee /var/log/usbcore_debug.log >
/home/marcus/usbcore_debug.log_after_replug2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

