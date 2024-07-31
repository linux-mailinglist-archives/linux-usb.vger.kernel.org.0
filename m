Return-Path: <linux-usb+bounces-12746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B969435EF
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 20:55:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CA3C1F23FD1
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 18:55:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10B0214F9F9;
	Wed, 31 Jul 2024 18:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeAmjkjg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B014F126
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 18:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722452034; cv=none; b=EPeYPDtfI7LlYtwOHcsMkivsYknaFVf0Q+T/WAF14bSYjMzHFystLwyJg4Xh4YWrGS0hMUKf7jThOUUhee/Z9FujJDThG6GGjwpF4H7Svkk3sfn8M5cdifyXFepnPkGPvc7VZ1YLbp5nqTJEGEqO076h/c3HO55gq7ths8PHUjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722452034; c=relaxed/simple;
	bh=1q1vyGdbHXmfQtY4/y/6YVnJW5EOkoE9X8QT2eX2/4o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YxGEGvNfTGvGicQqVHB8nrQ35wTexObU7ZMN9nYRcW77RfasCjxNez3keV5H8c4C+84QCsn7YP2HI2NI5Qn4g2YD+PrlRrPOgVOWnk69F7fq86Zdr0mi5A3TkGHcW8xChafR9RKxc7UP1KUDCE89TYHQ/NZsRb6L60j1DdodVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeAmjkjg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14EDFC4AF0B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 18:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722452034;
	bh=1q1vyGdbHXmfQtY4/y/6YVnJW5EOkoE9X8QT2eX2/4o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PeAmjkjgj9bwxUfkQzZQ5Am8jE2iy1EXhXDHFPYTHYhgevg1VscLbcaJ/m5EtNte3
	 UDbGfasefKTN+erCcckL4rNW9+pMUH4C8bHU3pnOYCDq2gUfWmrKNi33kX8Jjzjsr0
	 k3pGPX25w1AJgpD7FzHx4VLmq8JSj62glta/NLr1f0xfdOlS05rjv86GOAJ0X6GCTp
	 SHRWHfRSAn8ZSjpgU5uHKp+Yf/gbHRCgYcxkc0EohJ576vIxY56eyLODOG+kEXvVp9
	 WQD5JX2+Fgm0bykPN0uH7tvE8F9MXZ01h3Ol+mUWguVUJ7qvOskDmXjc1kfFHjlRnw
	 H+NwL3ZX8s7sQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F2961C433E5; Wed, 31 Jul 2024 18:53:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 18:53:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-LCTUJIF9RR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #10 from CH (com+bugzilla-kernel@c-henry.fr) ---
Can you patch against the 6.9.11? That's the most recent source RPM in Fedo=
ra's
repo and I'm safer using the RPM to build and install the kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

