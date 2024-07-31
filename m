Return-Path: <linux-usb+bounces-12733-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B05794328F
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 16:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FC11C2187D
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F3B1BBBFB;
	Wed, 31 Jul 2024 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lp6rWDvS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAEC1BBBD7
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722437982; cv=none; b=oxbUa/8P8MChGDg9ahlw9zkCgIcVCB/+cNj3ERFsyMbPjkCl3NfmJYDmP9EqnKHr401b7elY9dsPPhJQtZpFg7AmqgRMvkDQTj8+IfDLH3wTm+HweLTQtbaWAtt7Ye48U1JwZ5FN/trHlVmxlCGs60t2x7c2BcvPDY94nmh7dU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722437982; c=relaxed/simple;
	bh=yZmyoCJl08K/QOtcXkzt1PvvmtLVlgGFmwAM5sC+YPY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YDSMBZFC9fPsXUeRpvM0NeV0d3CW6l/Xom1C778ZBfIAfRe8rUeMA5Unbb6/FCrh9z13S3kzWmEIwrgqtmqqsRrWma2p41cN+O8b6hcJRpQjkXrufsXo9pZfWrbgzWTGRuL2qG4pKp+B3g3vAmVJWO/xkrUSOTO4SgWaS336xF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lp6rWDvS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10563C116B1
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722437982;
	bh=yZmyoCJl08K/QOtcXkzt1PvvmtLVlgGFmwAM5sC+YPY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Lp6rWDvSFqeQDiPYmGOOqwqdPxIvt5BBfOvIjiRfCoiJuBR81VEDz0Tnte/dO7WiJ
	 kCwXbgIleuoti7Cz0sbfjBKdkwLJwrU+YFKs0QlYnKmkOf09heN4fonTYz17LQxSsy
	 n9/4LGDjjsf1fzktNvzadI6OaD/VC5XIb+s9MRaRL0K1oYohCBAIX9A5e6xdeuMJp1
	 jDZDgJTeP6dqdk/PVdhnBWA2NhQolXczihHhD95ehjsicUUCgM5yf0eJ25KTVFDiK4
	 6nM5VdLL5EOROUSY9bYi0xEu1QN+wvx55czzZWSz1S1abWTEhGPprWhQxiZ8+sDaDw
	 fosB2bDAzfhsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0F3CC433E5; Wed, 31 Jul 2024 14:59:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 31 Jul 2024 14:59:41 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-zuSHC00Fwz@https.bugzilla.kernel.org/>
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

--- Comment #5 from Alan Stern (stern@rowland.harvard.edu) ---
Restarting the computer erases the old_scheme_first setting.  You have to do
the echo Y thing _after_ restarting the computer and _before_ plugging in t=
he
device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

