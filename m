Return-Path: <linux-usb+bounces-19542-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E55EBA17118
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 18:14:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B0E916299B
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 17:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D968E1EE02F;
	Mon, 20 Jan 2025 17:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QWzB2LEh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9861EE024
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 17:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393233; cv=none; b=cHkuvcJ7k6B+ajQJRUVMsPXQtpDAF5C0lQuY43xUYFc4DZUVcTjChuXBwkTVHiE8UHPyzlaePLhlH02N9cycdHJpmPU6yJL6JwqZL7fHKSXKr4CHhpeJFhzcla8tcuIwCZK9Zx9Yvme5+a5YmycyzW83YdzUApcWQQMwQCgIPQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393233; c=relaxed/simple;
	bh=1IOqTB42YAvnhjezP/zOmHss0NYW4BaFifp8zhbuIiI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S0TbR81GhN/Vtu2HAfrNSFcmgmAM8/spWvG+QKAI8S6PND8tZCtxEA0hregTeJVCUMOK1FHkRDDfHvVULPxxJT2S1W3xKkexXoZTa8lFkQpehO6cGzX7P8v7htCcrQ7XMt9FAx8YjvujRMhoVr+YTwma8tBLbAgDJcPmobDv7DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QWzB2LEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D61BFC4CEE3
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 17:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737393232;
	bh=1IOqTB42YAvnhjezP/zOmHss0NYW4BaFifp8zhbuIiI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QWzB2LEhvdVVFYgoOyMXMTtZLxQRDkuHYpu5XOogGNxdAz/WKsN9TLXYtUlkJ7ivW
	 Gy9pAPV/DoyhKQPm2XzZhw48WuwiYaFqGDMWNIjfO+kHi5rC+gRQAzwg/8ud9Q0H1L
	 qUsZBBlfMmKqIBIDorw0EiiGU6y52VsaxEnt62YFsCaUvFyhrCDj2+fULQcFerwazT
	 GHNFHGB54HN95tuT4bL/qzH6myzupZojDtg9pIJQ4XYA/EY7FyqIygu4QHIp8vJO2u
	 vc+fAVPbh5brcoPbAKD6eBCIdZrq8Q/cpgiGH9bKln9xDNHxIY8+3rc6qgsSC0/yrb
	 R5Ds54hUVUqlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D15D7C41606; Mon, 20 Jan 2025 17:13:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Mon, 20 Jan 2025 17:13:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219681-208809-iUcrUijZ0I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #8 from dantmnf2@gmail.com ---
Created attachment 307510
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307510&action=3Dedit
trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

