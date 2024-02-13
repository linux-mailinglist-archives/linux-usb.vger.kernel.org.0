Return-Path: <linux-usb+bounces-6345-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CAACB8531B0
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 14:22:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CDE92843F9
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F20055C15;
	Tue, 13 Feb 2024 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MTu44b46"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA1C55C08
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 13:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707830540; cv=none; b=bW3jgW0cd/OYF0pnrtwExt0Gj6/qi5ls5DUpWJE43n33HqFn8Sd0Y0A+DQiFRhQPcgDeJl19Z3EnRWVgv8ZOYDv034sQJzEN0PinWvGIpFix953CoSqQ+16hMXVyjR4AWo9Ppt76S18mocfgGcsmNVcdFcn3Pj7APcpTo6r8FiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707830540; c=relaxed/simple;
	bh=PcVXlEljBl2cB/v88i1jS2D1a1NP4dgk69+U0ibbOwU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OtKyDctZzDL9WOPWoIMufPPMhvJENDgedNBUet3va12I/ZQApjZ6pebtqW2VWBokXwnA2eNffA0n8OtmGR3yIse7vaz8IJvZMpYiJie9iVICLM26+quaakaA2qt9tjcmqDgpfebDe7Hp/I12StRHVQJSJIDNCeWbGxtHC2k5rLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MTu44b46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72297C43394
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707830539;
	bh=PcVXlEljBl2cB/v88i1jS2D1a1NP4dgk69+U0ibbOwU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MTu44b46ClByqjTO0adO2xCtVRRNva0jvaX4OXWBz7pWE0JxRQnKLmSQZUI1ehh7L
	 Ilmdlhs4LfN5zm3sim6Xc3Yz2iXxHOhvN7jVX6hc8HFlYYVXba/TVCE7cYNInXhs4n
	 3x7pCTTYNNNMmZbP1hFGtflwMRwMbxjJS06mCa0WvVnNuG0Z4SZPNAgxfjhrvCgDHD
	 V/GEMmstYrTKsrtsFQS8CWL4dkaB3N/K4dRONnGz4eEYjuqkepDSzIr+VzMVlwe0Q3
	 Ywxh/J/wVPNPL7KTosZDb3QR8ONiSamkftWA0BW64abTG4KDtNPwRg7SLEzp8/Vmv/
	 Sz47d0d+Zcrcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 60D4FC53BD0; Tue, 13 Feb 2024 13:22:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218487] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 5055
Date: Tue, 13 Feb 2024 13:22:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-218487-208809-E92IBHORV3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218487-208809@https.bugzilla.kernel.org/>
References: <bug-218487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218487

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305862
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305862&action=3Dedit
Output of `acpidump` with system firmware 1.1.50

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

