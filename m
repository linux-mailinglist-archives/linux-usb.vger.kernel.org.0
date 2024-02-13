Return-Path: <linux-usb+bounces-6353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B584853496
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBBC0282EE2
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289975DF26;
	Tue, 13 Feb 2024 15:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONmhUEsr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355543AC7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707838066; cv=none; b=fDKnAMUfeW7RMOLVGimFYE5idZfsO4DCYJLtLTDBe19JAd4gpLGmcCwnv+H2fG7e+aOBoA2EK9xgs3NeOdLgnOxbmT/RcWe7R2t8sZ21vAJSyWSb/RzcuBGM5au2/Dmb9x5tFeCIKDANahUNajQaJPS+WqNQTedDdEiePjpn/wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707838066; c=relaxed/simple;
	bh=qYLg7MEn8WnbZpcBmTONWsM2bJq4cGpTeEVHNL3jWYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EQyNSyRmjgaGefz0AUa4wzntXu+rnLot/9ltiPhrcZtE8soeaUamapmbvINk/ixDwuR3XzIHKrlVj/sJQP+GkP1V1Ceu6gmnPLfhmA1Ec4UR3ZfS6xNH3ECru+Yu4UZquCOdF9LZi7mIR8k6bAOq2/DRa2ML4HLr3GM2foOjstM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONmhUEsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 320E8C433C7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707838066;
	bh=qYLg7MEn8WnbZpcBmTONWsM2bJq4cGpTeEVHNL3jWYg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ONmhUEsrE8MfGFjm50krrnK8Xw9lsBFU+oXda18MRwxXwaoxwmb/6B/JWaXY50wcR
	 JxSQzDt8t31wB54Ifb1TVxopyBpYpoZcqK48gjgRtP6oenjyXdDgPxx82mvbZrXVWd
	 AIzQZrm6u/i5fDPe9/NcKXky11XI7Gjz2PTEs0UFNwzCXnvQ6Vs0874eW7R0TDJQbS
	 OgYyleMZwFhA1kyMwYJ/u+96AjIHqPgcG1HY3j+mWwcdAIoETW6sezwPANhdwYpeAT
	 RenE8sSIuLLTDJ0o6LYzq0XQzcCmSFN3q/qoiYTJlTQ0XjpiC3/Cv1NrX/IOqpu1aO
	 HDhDPrNqEFoVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13383C53BCD; Tue, 13 Feb 2024 15:27:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218488] Linux warning `usb: port power management may be
 unreliable` on OptiPlex Small Form Factor Plus 7010
Date: Tue, 13 Feb 2024 15:27:45 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218488-208809-bQqEifYS8A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218488-208809@https.bugzilla.kernel.org/>
References: <bug-218488-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218488

--- Comment #2 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
(This device still has Dell support until September 2026.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

