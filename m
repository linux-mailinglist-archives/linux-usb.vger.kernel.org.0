Return-Path: <linux-usb+bounces-11123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EF5902FBE
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 07:03:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21281B22460
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 05:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13356170835;
	Tue, 11 Jun 2024 05:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYsQfSVi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0FD365
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 05:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718082197; cv=none; b=QpsfgzGG6hyHbvsfnlHt9NuE2hB49c6QAN8dBvD0Sot9vrhE7TzLwhUW3t7JAFohsmO3MJrkf3CIJ13oZBuW+XEpF3qvxnSKJWUk5OF9r5tZcMEQ044QB+fHwgdLQ8thdKLJsUCnbIzQJWZQy0zBxsHUxuU9+Ku9+9QY9b7LuBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718082197; c=relaxed/simple;
	bh=VcEvlEmnHOnkxAhPmsAx9b3rzYbV/lxG+8wqXEXuno0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NKEpQK1oIqi7Btz4lWC+zYYGjRG5U9LuiTCEGfY1wo33vYG+nlQipRoj9aY97Ugi9Ngzg/pRGqk7IzNQWSEaFmDzBElNAMvEjLUbF4NiIrcNJdLOtth2Zqt8hqmX1XTPcJamUvY6C1HNgIBQHTzEBs7frXjVky3cLPWJTMmXz6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYsQfSVi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 091B2C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 05:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082197;
	bh=VcEvlEmnHOnkxAhPmsAx9b3rzYbV/lxG+8wqXEXuno0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HYsQfSViAQiQK9QKXbTgo3oltqQ5nLkAS5eqwRZZaK3R0odJKhV2a0CRh/4NL1343
	 Y4VYqnszjISl/AAvu/05oy/r9xatnmee0hWolyF1Dk4nTKit46cAGcY4M2y0HALECl
	 ZOGRu7OpvrG0xuAxL23lTXOLwjEG/tKWBG1VlA8/rkn+Xwjxr0O6AsaqwJwQjeoW8m
	 lIZrAJQTfKQRpNeeWK+3oDIq+yrZ0LUKuYZWu99K+HN7j+uYx19lF2V9pf+x6ozDt5
	 KCfjb6VNXRvKCwWNfBWvIk+f0DdoDVeRDCg0o0Be4SYgRsP128j9HA0hyHHedoDoLX
	 9/Ywwygv4EQeg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F1CC5C53B73; Tue, 11 Jun 2024 05:03:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 05:03:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-ZikYAtqu1O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #11 from Jarrard (jarrard@proton.me) ---
Just to reiterated again.  I see this behaviour on a AM4 machine and a AM5
machine!  Two completely different computers with identical issue, linux
forcing ports to 5Gbps when 10Gbps device is connected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

