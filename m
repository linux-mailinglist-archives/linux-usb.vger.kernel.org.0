Return-Path: <linux-usb+bounces-7987-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D284287CB23
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 11:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 106DC1C21252
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 10:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02932182A7;
	Fri, 15 Mar 2024 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vsg5AFy0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAB17BCB
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710497279; cv=none; b=P9U/35z9vX2fam1Or6UjYseFofeN8UlFHLGVvnyOONtRM5v7V8j2ZhJMXKD6Zb7vRyCastbLQ80slkUpdLHprJWpHSpdDfkYOJ7cTD8XonloRVnotNrYLqKw+Ja1Ug6VwlXFoihBiHW1tlXgCKHXr9nOd8oOj3PKqLfJLQkg0CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710497279; c=relaxed/simple;
	bh=Qim3DTxdYiHE/6eNSYU4MQ5GZaxqU9s/i54pDkbNIYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8s7gOv+pS9CjDcMdmNLB9fa2vSs7q8YoGnWDXm8EK/Fh9DO7ds/5OjGL3PDvBfpFlTNFctBc/n47R5u6p0buxeyZFTZdsHS2dqZ5fFZn9mgCB9TslpmapQ5Kk8711mP0L90lL6lh71yKV338h52wo/Plt4vsBGc8/3B5zdIVL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vsg5AFy0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01123C43390
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 10:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710497279;
	bh=Qim3DTxdYiHE/6eNSYU4MQ5GZaxqU9s/i54pDkbNIYM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vsg5AFy0RO+mVBIjB4Lduwd1r5c7K10WiITfdnDtQ/9pgyEt9J3LEOO8d0/9eqwfm
	 ZktEmddOPzOr9QU3VhmrAqoj8ZJxxPemlBC7dz15/ev9qUnhCVUGpgIXawnYJVdxWB
	 NtnqfQWZPqrPC3KaAOjFT+BUCTRXiC42ZRniojMa+SQLxZnph0EM6IAhRlDLlWB6tq
	 otiY+OQi6OQ4+Ib4aX/FHOzU+UqsEXxzuKRsIf1mD7ams98c/QdFuNNc0Hf7VweczJ
	 iLeTlxXRgONPGKapnlj1dR8hw+CMLPsuziTVBi+3TKm9JHZhoUk9Lj09Dfo9rhekmA
	 tjkfNK/J2yTdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E628AC53BD0; Fri, 15 Mar 2024 10:07:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216422] BUG: kernel NULL pointer dereference, address:
 0000000000000000
Date: Fri, 15 Mar 2024 10:07:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216422-208809-QOj8K1quFB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216422-208809@https.bugzilla.kernel.org/>
References: <bug-216422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216422

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aros@gmx.com

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---
Is this still an issue in 6.7.9 or 6.8?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

