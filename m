Return-Path: <linux-usb+bounces-24462-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 761FFACCD81
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 21:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB52C188D766
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 19:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701EC216605;
	Tue,  3 Jun 2025 19:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBdB8YCN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42941DE3D6
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 19:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977781; cv=none; b=qRwCWdkJ578BNNpVLeHvoOx6SS5QrN7UviHcO1+1ZqIAwDy9m+kU+9BEcFuXl8rqqW7HtwKBpUzEnZ86HG0xxRQQefEugem8jgL03GPBP8IupPZAcarjCBwTflOt3WShuA0o49mYu+9DZQxqTF2WRXiQaRRzJbggNAuC3GsjEws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977781; c=relaxed/simple;
	bh=REXzQXnsRnk41CgyfOgL8lsm+oDzIEcWZmgE50ptzDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XciS5xs0R5bM2QOwV/dd5zVkb2oW3deFUJgIvNJ+9ho6tm1+Jn8FxmELStz64HTf4pv0YXsva1FbA9Bm9xPKcLKgCFp/40mrr6fd4q1dvxaUJQDz8drtbNUg4/lrLcVR+Us1v7dTkIaI+rz0DxzCFc/fjDeMsO/2loPNfw4eI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBdB8YCN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56EBFC4CEF4
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 19:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748977780;
	bh=REXzQXnsRnk41CgyfOgL8lsm+oDzIEcWZmgE50ptzDg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LBdB8YCN8a1mdwLpbydtkQIhfqM09Lgx6iEHOUTGZ481mj0xO++Fe91DVBQmNCSWI
	 JMGsA72VBu0y8769U79Eomsj2Kjs4tPhNZ8lh8L4Lo3GkN4jjm8qWB7tyVINEQUB2N
	 xn+PAp3RzHOqYZDeAc/XWKdVe62JadvW1K4xRD9rDqFS+9BARh8n12N6iQSUAglRrb
	 aNw0gG/ChSl7Ilb5tow4Lqk0rQXwtJeH4wTToWsEUMEJ910N/8WKIB0ME0f3S3LiS4
	 qJ82Hvc/e42HyZxzs7mJcwBIDXkXD4Z+2kWF4oxC03gqEAuG2HbtKbqgRobkb2Y1Yw
	 dURYAtnQuIZww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C3EAC41616; Tue,  3 Jun 2025 19:09:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 03 Jun 2025 19:09:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-vJtwCqkZ9S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #44 from Alan Stern (stern@rowland.harvard.edu) ---
That seems reasonable.

Some people may object, on the grounds that turning on debugging should not
affect the way the kernel (memory allocation in particular) behaves --
otherwise what you're debugging isn't the same as what normally happens.  B=
ut
given the way the DMA API debugging is set up, I don't see any alternative.

Can somebody test this patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

