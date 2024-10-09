Return-Path: <linux-usb+bounces-15911-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4488D9966A6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73A3E1C21415
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39E0318E03F;
	Wed,  9 Oct 2024 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq0/bajV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CC018D640
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728468521; cv=none; b=Lm6VnllmYZ2inPWt5d+t4xVv7zbjSQi74YLzIMWnHcSv9f5LtG114vdyEyFD51EDO90AoYJYRfS7rj6uhOiN0TZ7HT6t0G52aAxrcVs9AJNdMA80WkBK8MbdEaSaNwo1IBg4rTzAE64fr0VjGe3jE/QklrvWKG1A/9wv1FbJKn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728468521; c=relaxed/simple;
	bh=mGBSq4OGecDVadJ8ek+9bK0TjPtcyezUGCD1EFRoS58=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=octHUu4DAbSLkz551Z4GPqH31omuISXlQVi9axrt6hf5m8f79/GcBpCSeGE8VyIPT7q+VeVlXTEJSZRNLGABbAt06ZG0HMYZRqMszVjfP49r5WANtZxEZsl+m/dYt1WrtqmkkEd2ALXHh4ZHuNDbarbIgOTR0heh9CWT0OIoA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mq0/bajV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 972A9C4CECC
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468521;
	bh=mGBSq4OGecDVadJ8ek+9bK0TjPtcyezUGCD1EFRoS58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mq0/bajVaPpkf+Ip/GPgoV/mjOB84a8TCDQsUT4/yTGG3bcUOQa2dAkANVgizcMLl
	 wzPHgOPfQxXXo1bIBbWLB9XJoZ9WrWNWCV4+8uin5l3m28vPlshzmlqFeRwSyuzvqV
	 3teXGfn7N84IF8VLD5rdh8CdYjeLIbBON8nTlO3ZRic2W9n9rpn/mh2ymhCC+F3h0H
	 0i4G+HtiJGXZra8fDs8q+YvJdcp0Y0SXWZVjmEYcykcx6P/zxJZRizMIzXETHNmDF4
	 d/5O0f8iqwRRBimbmoqtDLxPoKHedCZC20QP7cL05l8SHd+cnFPeRusReI55Zxy+Vd
	 BIWCTelQrEzhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9147EC53BC1; Wed,  9 Oct 2024 10:08:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 10:08:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-PS6oMieydH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #10 from Tomas Mudrunka (harviecz@gmail.com) ---
Would it be appropriate solution to add new sysrq command to call
device_shutdown().
defined in drivers/base/core.c

or perhaps call it directly in 'o' and 'b' sysrq handlers?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

