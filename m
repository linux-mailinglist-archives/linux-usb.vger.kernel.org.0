Return-Path: <linux-usb+bounces-18946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 194FF9FFA6F
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 15:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FC3F3A0FE3
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 14:22:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C533A1B4226;
	Thu,  2 Jan 2025 14:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXffP8B3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2F01B140D
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 14:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735827693; cv=none; b=QKx2ZU5FHERWe1W8tf1/s5Hdos2+nQYz8lfAC6U5gRtxX0RUHOZaKiUVdRKw+DN/naPACzlFJSVd3302W0/VRGJPXUTEh/Nl3SbnPVFzqRLIIJ7Xb/NUk/H2XV+OSmEJEsiEUpbHQp0MVMfc/DyxZRRIf8wHkjKvG7NCaKOAG+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735827693; c=relaxed/simple;
	bh=k5x4GzFuL3yLFvkKNvZlhT3eYG1hFDWz6i4uAnLM330=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fbOg3F/KLK28LDG4MXtHxvLNmjzsRVK6BiRHUW0ZOy+uyrZZDZAPU7Qz8L5fLuvi8GTuTy2CpUhd0kn2t8+o0uJlxtP0lZj4neGJxShq92exTTOAYXYg855xL5ikwiQk39yaSxEAyJQNyi6vqotQDd8XiBLR4ZOpY/6KfqCixWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXffP8B3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8370CC4CED0
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 14:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735827692;
	bh=k5x4GzFuL3yLFvkKNvZlhT3eYG1hFDWz6i4uAnLM330=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iXffP8B3R5dB1AiapX1swDlgsUDGr/w2+Sd+CA4mA2EV+62msbZ/PF3G1IITdwLQx
	 PU7FgbxcF2zq5TcJXl/k/H83/+DXKWihEVVV9gtq2sxHW4masInQuwhAD7sc1Txjwp
	 EnORiH18T0z5GQZXvVeLTnIVzD33xsuNoSOdMTDCAeFRsv7/vh4i5J1Uy/JIWTaQds
	 8IrD7nRqHNxu+fPPUQAKV4molWSlRPv33u/nb3tjZhxsTNCNA2+GZfE0x5VEKdUGOk
	 UDUqmAHMJ9rZ6HzR6/aZMuW8S9mk83zkUn9695Ha3Veoq8v1Gy6WTqX+IlWRPXDN7P
	 3drqqlFRRg2MQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7B6C0C3279E; Thu,  2 Jan 2025 14:21:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219626] Infinite udev uevent stream from USB-C port
Date: Thu, 02 Jan 2025 14:21:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hegel666@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219626-208809-9mUj5Bt8DQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219626-208809@https.bugzilla.kernel.org/>
References: <bug-219626-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219626

--- Comment #2 from Marcin Bachry (hegel666@gmail.com) ---
Created attachment 307441
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307441&action=3Dedit
minimal reverting change

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

