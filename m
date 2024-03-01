Return-Path: <linux-usb+bounces-7390-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D943786E428
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 846031F27204
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 15:19:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1ED6BFDE;
	Fri,  1 Mar 2024 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cJq/4sZc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA853A8F8
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709306343; cv=none; b=WoiwZaB6UHx5Gft508tV5fvUAcUZGME91ph29TPMARHrAiRpF5ltgw452ZCo7MfZJXadLPHZMAr2L1P/QPOecDrearETVhJyAkPdKoNASYG0/OhvFPd1fe1AJWQ51xPnwQu4jXiwbHDqvG5h+i3kyQSgw7/yXRyP3yh2vOHcESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709306343; c=relaxed/simple;
	bh=Q0NQZ0ldy6dwDnGycRxVLD7WGylgDWbWabGHwOnfhHo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PhvAoNR8nOOWyShpWn2FCrPe8wDwwb8UbfnamL9kM2NDIAOtfEgMNpZ1rjd4k2ey5lwd/vuO4BbJAQBSFeQvgQzhR4DdMMht1R5m1Gdebmn4maoYpJLELhMV+U909NWSfMWnobl1xMCx+vFC+xktIn4sAcRThtBT5zlj0i6sgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cJq/4sZc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EEC0C43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 15:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709306343;
	bh=Q0NQZ0ldy6dwDnGycRxVLD7WGylgDWbWabGHwOnfhHo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cJq/4sZcsvGW/+RG/gOPd+J5Q0eJt76X2JTZ5rFhyIwDmEecVF+lN5LcwSsCOpHcd
	 jaP0jVNg4lIG0FcHuAWIs8ALlFfvT7ZAGRu3psqnzKC5lw1M78pKs1mdOZCUo1JUmJ
	 kwpGgjyGPTjtCUEj0tbqN23v1Q9o8v3Dja7yyVNvyXPPqh9i/RGUPDi1Sg7PGsmhrC
	 2jhWzZAeZWhcmMzzZx0E3yJAipQI6PwLqKkTt7y3eHJJOWR0wiuHgn1UuvmEScWmzY
	 Gqh4RKUkJKoZs1uPtDaplhr7FQEdzdC7UY7FI3lT6/ACYp3itw9jheaWGdIVQ2wibm
	 WPmNbOMSai+Lw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3AA14C53BD3; Fri,  1 Mar 2024 15:19:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 15:19:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-218544-208809-aNzrE1uYmz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

Takashi Iwai (tiwai@suse.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tiwai@suse.de
          Component|Sound(ALSA)                 |USB
           Assignee|perex@perex.cz              |drivers_usb@kernel-bugs.ker
                   |                            |nel.org

--- Comment #1 from Takashi Iwai (tiwai@suse.de) ---
It's rather a core USB problem, likely an issue about the bandwidth managem=
ent
in the controller driver.  Reassigned.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

