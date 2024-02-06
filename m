Return-Path: <linux-usb+bounces-5921-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD38784B0B1
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 10:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766CC2886BB
	for <lists+linux-usb@lfdr.de>; Tue,  6 Feb 2024 09:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A9A12D765;
	Tue,  6 Feb 2024 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WkYdiL7R"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6212E1FF
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707210121; cv=none; b=kJRt+yUSD9n/ABY/llvDmVk5rV3P9aHedJYgOOnZAMUHLN3z4B4yo63k/GdejU23fzfTEHyHNUCzdqx3rzNRwUIhQZI9o/RDeBDep7CIHkLNI2Tn1rHc3VdOemUskqjiwgHp4y/jDN4ulqQTd6c2BMrGcMQyBznGDbk2TbLx6RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707210121; c=relaxed/simple;
	bh=TJ5eIvSh2kacJNBiZeXugilB1CfkBuRDlAqsU2qCTRw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MNVtjxSjIcuNNZZ8Z36xifYyu+SFvt3SBgiecpFsdEKLuxdI42z9mXBRu1iUKuQKHWWQCbqHg9gxLEjYwOMV9QY8gQthSRAHGvDmptWD5D/rY/XGFSue3pxDGi9NTnCMtANoDTI0m5AnOi9GN/DiAJwhXxmIxjc+pmNnmSaay8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WkYdiL7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3303C43390
	for <linux-usb@vger.kernel.org>; Tue,  6 Feb 2024 09:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707210120;
	bh=TJ5eIvSh2kacJNBiZeXugilB1CfkBuRDlAqsU2qCTRw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WkYdiL7RDOzIm/j1NYd3NoEIRUvtivLyb0Fkg21KExTdUq7/n9ZijLKx+MqQgB90W
	 J9vDMLX6aoMEi3evVQVo4WIuMgGs8d2K1NRJPKObkXOy2TPTfOo1JFqgRsSCJHbxV7
	 xQg1zFapN+kq8GGKv7UsJd8OOy5+OZPTnxQGUKphjSl3oFy9+LQ1p3D7gA5T1KSwTq
	 59WiU/477CeVTm2Bp3VlIsV4JexMQxducuWXlEwtRGu5IjW/VnAHy1UMD2iH8zPQ0d
	 ELitFQNmxd4cyQZ0wcI7frS+VU5djTZD+ezyp9K74170RhkJX0+fEliN7FS49WBh1K
	 6SWSI+HGCHW9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B2184C53BD0; Tue,  6 Feb 2024 09:02:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Tue, 06 Feb 2024 09:02:00 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218465-208809-IF4xKXMbLy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218465-208809@https.bugzilla.kernel.org/>
References: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305840
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305840&action=3Dedit
Output of `acpidump` with system firmware 1.21.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

