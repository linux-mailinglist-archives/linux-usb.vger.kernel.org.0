Return-Path: <linux-usb+bounces-8016-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C48BF87DC1A
	for <lists+linux-usb@lfdr.de>; Sun, 17 Mar 2024 01:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BAB6282360
	for <lists+linux-usb@lfdr.de>; Sun, 17 Mar 2024 00:20:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E67836F;
	Sun, 17 Mar 2024 00:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F2YVn50z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EBC367
	for <linux-usb@vger.kernel.org>; Sun, 17 Mar 2024 00:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710634852; cv=none; b=Hd07rJHrzQ2QZrP2IWPvizVcEQTH/34fiiWj1QjnV0OM3WJ9YC66VA1n+9ApcqBOmqDN5+YbrUPds9kafhO+EiVkkNLfnQlN3dOKqrlURg6tdUPM+Lzefgv4ZyMHcpsEDiTaQKCotA0AueOBvZGemB880DRIZqc9nw8EM/rlSmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710634852; c=relaxed/simple;
	bh=iFqzLL/kK3EQjduaeGD4idwioXWU0GVKsGL4VQ+aA1o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o/rYm+fhwGXK6ir7MXQ4FUwa/X8W8EkKgCcUgZfga3N5YFXjIoyR0OL7+QgiIoOu0tucpRzkgmEmk2YxSIpUqw9HojCfJLXOBeN8BY4VnrE/vWPUoXXTRYzdi0bw3eYMXlD0m+6+RGSBY7IVKnuTzBWuxKdb6iTmSyqo7cA8RWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F2YVn50z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0630BC433F1
	for <linux-usb@vger.kernel.org>; Sun, 17 Mar 2024 00:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710634852;
	bh=iFqzLL/kK3EQjduaeGD4idwioXWU0GVKsGL4VQ+aA1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=F2YVn50zwwiQoM/O4dUiD3ruK6WLoPCQyq3vNSPyhRKnMKd2jtUmuDgbZuH4IoArc
	 38J37PTW/R8IyhR8yz6gp14DYelf7rt0T74VDwVeKDdIStUFfZTKA3+MStLLxXsPra
	 d+l3AksftmQVAIBLzs+tA0ksJ2Ghd6c1Rvpj3S4zSc7DGPancuPCZR+WQ74+Itrz/S
	 AU1uok6oNgyb7/krbJ5xUjI1m327cQ2tF7fuqeqOque3+zSzFA4EWpcP5TiLC7TYfz
	 nulPfZM8xI0tBqO1AP2nKA1ubQ/u8m3ZtB/J2YHFocKLoHsId3/EKbTusFJGyJEXOc
	 Cqj/xRjPAQ9cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E9FCBC4332E; Sun, 17 Mar 2024 00:20:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Sun, 17 Mar 2024 00:20:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: corngood@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218546-208809-ABcozkLqP9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

--- Comment #8 from David McFarland (corngood@gmail.com) ---
I think I tracked mine down to this happening during hibernation:

[   37.511141] ACPI: PM: Waking up from system sleep state S4
[   37.529656] ACPI: button: The lid device is not compliant to SW_LID.
[   37.529657] ACPI: \_SB_.LID0: ACPI LID open

So it's probably unrelated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

