Return-Path: <linux-usb+bounces-30133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1572BC3999C
	for <lists+linux-usb@lfdr.de>; Thu, 06 Nov 2025 09:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A94981A2332F
	for <lists+linux-usb@lfdr.de>; Thu,  6 Nov 2025 08:35:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922F308F1E;
	Thu,  6 Nov 2025 08:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDQpxEfO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B939308F0B
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762418112; cv=none; b=rs7brxQlw4HE9Z/bNVDdhKE8hy5Mxj6tljCYXxBWGLYHnfrrVzpR+hnqAcbqv+UXYeH3t488R4FkjiatdOba6hv6Yo07NoKl9rKzuCfvNUV2xZhmcEQmmKZ6muLU5+Sb0qLG508BLC2drQw2QkH5r5F3x8udvj2rh9/nTPgsvzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762418112; c=relaxed/simple;
	bh=BnsNTV8xJl0ySIYnp8Q1ZIB28F7qhtRzfJB0dwiZdTg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BetZH0bHHQvdwDxojn2A0+cwV77EQzmBqMcgv8Z5ShPwFGfVzTRZE/bauQzN55wxQ1oOLWHTX0yfZFtOnKPiTt6iIxgF9GS/YsX212sf2U04W7rMBFFUkR3zB5u8zsHekDv1UdP+9TW4DONScRd8Y2+33coipxIOmqTrMobMp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDQpxEfO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8677C19421
	for <linux-usb@vger.kernel.org>; Thu,  6 Nov 2025 08:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762418111;
	bh=BnsNTV8xJl0ySIYnp8Q1ZIB28F7qhtRzfJB0dwiZdTg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oDQpxEfONR/BktT0a4WuLqG9qQo3/eELmk7Vd9LrtIvwLA8LVoDeI1VfNEVmcR2sC
	 hjYe6o3mEOBBTjL9Kh9qcu/xp8+R4tV46IIo0Fx9xalfaxJ3+yjKEDhna9UUztD8I9
	 JfsTBbCT2cHgFk1p3c/tORl/T326jGZuHpHYymUBo2DxQId4iARaetKVZDX5l+EnLd
	 lkMdjhG3qcf9rs90KC/e1fiohicWP7jjRVaRGIpihWsgw/p3+1hxaSQPPs7T8X3qa9
	 qhcKOwtUKM6kK4bwHTGlssG5ggu1B+Z6tuEVeCgGqtSV870JX7nzWSdqmF30TOZP9n
	 EvpSWmP8km1gQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A205DC4160E; Thu,  6 Nov 2025 08:35:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Thu, 06 Nov 2025 08:35:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-PJk4tP4d8t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #12 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Oops, sorry for accidental post. This was meant to say that the solution to=
 not
changing polling interval mid-stream already exists in UHCI and isn't very
hard.

As for bandwidth reservation, the problem could be ignored ("you are reques=
ting
something really weird, deal with it"). Or in case of xHCI I think it could
also be solved - changing BW allocation involves similar steps as changing =
the
interval, so they could be done both (as long as there are no pending URBs).

BTW, purely for testing purposes, I suppose one could hack the kernel to mo=
dify
device's descriptor and reduce polling interval. If this helps, then there
would be grounds for wondering about how to implement interval switching mo=
re
cleanly.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

