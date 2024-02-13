Return-Path: <linux-usb+bounces-6352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64B85348A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29BE2285D69
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDB25DF1D;
	Tue, 13 Feb 2024 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P5tb+zoh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1726422066
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707837943; cv=none; b=RF5Vj9YGSmXGZ7hiTjfhiHQvHiTaulecu2JgvjjjYou8Ud8OQFPZrNKJJSUMcOUcVtIvgfj5ndor6IW6zhuqewjT+Od7Jra1Y3PH3vZkcXmS2e8t8/OVEw+vXz44AhrL86nO8mBvobijMf3ktYuu6I1/iwwPVJvfWKklYl6yW1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707837943; c=relaxed/simple;
	bh=cNVkgf6sYODIyxMYzRumJJvsaXqpnU7FEvtgjYtTAl0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOYj3BC6CtHdGFSbrZ6Y3b9SFiaVj/i9wD446J8snEsiKAvYc3aqskHQkWPinPR4jec5Wmi8TsVUITMqNg/vw9ITFjV9pFv8VG/kPkCZoFNBQOs8dg0XZzbgulr+FXT9LEYo9eff39M2AP/f3ZwdaHOdE3icqIZCStBhn/seUQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P5tb+zoh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9247BC43399
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707837942;
	bh=cNVkgf6sYODIyxMYzRumJJvsaXqpnU7FEvtgjYtTAl0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P5tb+zohA6xgCq6I4A6hCled9B6JxjJsJG4Ln/3J2JT71HTw0ccUD85NG/HaE1f0D
	 NWAkGqumuJW0JbApnQIMrK73zHtNSZI92u4zMEcPc9CcuRu4XXP4DOjQ/QG9oaDMnC
	 J2Z7O7LcUXn6HTpoFsxZOP3vygWjfnVyZ8y9irz1LQWZ+16S3dYdW1P5Z3ciNDq/J1
	 F06/JRRHyUC/JxEjyjj9dd8EHK1cVGg3ZiQWEnygeMnF/wZeqG6874PClD2a/3zo2e
	 Bi6180jqRJyaftN2xioTfKbT6v6aL78pqpet1TDKSJwHx73IOXpS8oqMuTHIPUAs0W
	 HosWwRIkZewSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 81247C53BD0; Tue, 13 Feb 2024 15:25:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218488] Linux warning `usb: port power management may be
 unreliable` on OptiPlex Small Form Factor Plus 7010
Date: Tue, 13 Feb 2024 15:25:42 +0000
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
Message-ID: <bug-218488-208809-GswHPIFb8v@https.bugzilla.kernel.org/>
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

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305864
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305864&action=3Dedit
Output of `acpidump` with system firmware 1.7.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

