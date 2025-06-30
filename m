Return-Path: <linux-usb+bounces-25317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0521AEE4FB
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 18:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D385B3B8A3A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304D428DF33;
	Mon, 30 Jun 2025 16:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igylqqVq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E425D1F7
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751302312; cv=none; b=LVmucSYD+bMb43EYjtxSCExpa6O+AahLPCXAB+Atz+o3Of19rB80bMBtbA2W7soq8Q8PL1gRoTei+xKzaRIN5TXukX46qGhsyBIqec5W6sZDoapNtxEhhEogzYKlZZDP3lxh3toNNaSp3UR6mI59lmYSWnsqeF03s85wGjpzBR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751302312; c=relaxed/simple;
	bh=AyiJQBOx0IQrM3G4pQuFBElRGtEFXdWE4J+K2QbP8So=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WrmKXwXgbgqR2m12GVvlOZ8AgAqrseM76NXkjdlp4y2Rx+nxi776dzcLaDXBVcTRKVlNrHn29ViEJjjgBOdCPkzXV2JJ96JMk9V7MIiPQYV37rbibiwajlB5Kv5Mn1JA7q9vk76xQ7sxefcgBkGvB2249l4gDUaFyQsbRblNhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igylqqVq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 394BFC4CEE3
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751302312;
	bh=AyiJQBOx0IQrM3G4pQuFBElRGtEFXdWE4J+K2QbP8So=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=igylqqVqPN/IU+4gbGoeYktKz7ZurjIMUi3iCFJfs1wNaiQoRWPv50y78aIRXUx1q
	 f7ODJcSRyCR2f43Ybd/uWbt8DdWT6oOsut4RVaB2RiokILy29eOwKfhIkLN/XpfpcD
	 kjumrOVlFTpKTmyJhvgsh4PdTJArfekYaz6tKiaQ3b9AmjPNHy9nC3bxiXx2JaBKwK
	 z7rYTsraZ4VhB2liGISFDeXvy6glVyHn5321k4/3f0Er8Iza0BOzw3Vi78JpBI10ro
	 yjm+BWoP8Mwua3cmBGD6MxAMEFBRVaA1nroLTAWTfYzaez0YIx3J2MFqB9Wa9X9KPR
	 QmFUbtehLJAlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 310C7C3279F; Mon, 30 Jun 2025 16:51:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Mon, 30 Jun 2025 16:51:51 +0000
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
Message-ID: <bug-220272-208809-SK0WZRhi67@https.bugzilla.kernel.org/>
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

--- Comment #20 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
Created attachment 308334
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308334&action=3Dedit
Trace and Trace-Script

I've attached a zip file that contains the output that I gathered under both
circumstances with a neat script that AI wrote for me (also attached) to
automate the process as good as possible. Maybe that script is useful for
someone else.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

