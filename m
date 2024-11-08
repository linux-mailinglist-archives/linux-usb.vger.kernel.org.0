Return-Path: <linux-usb+bounces-17373-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C5E9C20C9
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 16:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478E01C22D9F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 15:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A24221A706;
	Fri,  8 Nov 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTYgn9nR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225721E7C26
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 15:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080467; cv=none; b=s426aAtDDvL+oK9BlLlSmRkrNLSDtp9vZshAeljfYHmv572Vae0nWYHwP3O/sknBis9rCUMGE9unMhQT1NQx2F2tNE9jNAMcY6Wo4VcyHEYpJwKAGb8YX4i1fWdneHI8cjzPXovWNBYyoOORRBlUkug+k3oXQ3sbY5Q9HuJyLpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080467; c=relaxed/simple;
	bh=Q5hlZpMMhHjZI7GrK8/322y0TUieng4c0cMzE9dgeec=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MwsPjLflJDUAw3KGhVjeTU7Oaf1y+pqYNplsBb6kfb9cNMOQIVPxjsKhzglejCPWMmhcVSgknIRqcagsuH9o/4h6ZV8JAaQtjxwd++dauoiwvbG1Fm0Ql1M2WCNhEAEbkDTy7ZLNa0qemP2W8HdnAHVJJqMDmPKfrxUlgQdRldI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTYgn9nR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB615C4CECF
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 15:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731080466;
	bh=Q5hlZpMMhHjZI7GrK8/322y0TUieng4c0cMzE9dgeec=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jTYgn9nRKZRzJhjQLjMP2I/sT/eryv0WrcweSYtn01oGYESPGLHwpiKFhfS4vT6i5
	 Vkk6PrSX0KMmUyl5kJkbRANwIdqjD6gsQaz9B/u47AWky56XgKF9lcUaruZrBlrSNh
	 uxRGBXxhC9d3ne9FdYCXctVLNtJGCdz3vAHO2NxRB0muPlh741DkAJFpsdamXoCQyZ
	 gUasicOqG4useqwTauVsMq11Xl8bH+x5fkRPq0Eqhdnp7ughesGtPWxORTfPZ6M+aW
	 AxbE2lJuXVtPumRjkH1GrRLOD3BRkeE/ElbxdbXzjOqX/hgHqJx1oxOjBzY77UWbcl
	 NhXQZJrqUxVNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B8C7FC53BC4; Fri,  8 Nov 2024 15:41:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Fri, 08 Nov 2024 15:41:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-CdvhPv0ouj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #7 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Anyway, is there anything that can be done for PCIe errors except
> pci=3Dnommconf?

If you want to ignore the errors you can use "pci=3Dnoaer".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

