Return-Path: <linux-usb+bounces-15855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A63F994FB8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 15:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CABCF1F23E79
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 13:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9508D1DF98F;
	Tue,  8 Oct 2024 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="foqQEb90"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD371DE89A
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 13:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394053; cv=none; b=aHTIFrG+Jh3hYu7lecS0QNBFwD7wetlbWIRp7EtHTHO5LqTE7YBZ2IR1fE3xATLgJpCwcrw5JqhGVuXtNJFV5HRihWoI3XjZwiOVtBXTOuNUK+y1fQg+g/qyjlJM34jWF/sEdszYewCYMQ4yg3/hXWFldVMIoeBXUR9SGvMnyss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394053; c=relaxed/simple;
	bh=CdoX/NOLD2hbDoqizxcfyirZMGhFEs77KY3jVO0WXQQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DM6EaOxvyJfIcSFAkPDb9GAO5qe7Fk8e393Rvh9PHwGeumfPi4Lf3NMyKQlu7743qb+JX7Ok+6DpCO54w+9Sm9Gh4bagIDAERy2Nqw4/WpbkOQ/uxC6NPnhoIX8QZC6SNVZ/gFIEzuTwPxMHmbdAcinRFjx8gsH9Zy7Za3KcIoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=foqQEb90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDA3CC4CEC7
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728394052;
	bh=CdoX/NOLD2hbDoqizxcfyirZMGhFEs77KY3jVO0WXQQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=foqQEb90ozZ75MrMH36+3LV6A6QUkR6c6c+ACS0uM6bDjhErLQ7/VO1QPq5v6r8C8
	 2ETAfZQqwuxd6AqVFr900iB37CyDPyi014MEPd+TUO8IZ3O6eNDkopEjmeHaZNhLiF
	 qbUSdCkOAA8Y0t/7PKopdWV87pL+HkbHmbTFRlotsywV4vhV3wygh0EpklNvienE0m
	 ApaVgyMZNfEn+e8io0k3mkwG+DMuWkWmWRY/pKbrC08RLwGastOAJJgMRnfqlqX9PH
	 n7tVANVOpaJSmhpBmc/tZFJpirqVUBkq4tmuSSNeLr8tnyx8n8UWbNEFMeH7dZLc37
	 L4suGGCMGdSPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C081CC53BC5; Tue,  8 Oct 2024 13:27:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 13:27:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oneukum@suse.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-oxbxzmVg8V@https.bugzilla.kernel.org/>
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

--- Comment #5 from oneukum@suse.com ---
On 08.10.24 14:22, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219362
>=20
> --- Comment #4 from Tomas Mudrunka (harviecz@gmail.com) ---
> Anyway... My coworker says he triggered the same error by proper shutdown=
. He
> gets sata command fail somewhere near the end of the log when shutting do=
wn.
>=20

Then please provide full dmesg. We need to know what is happening.
You should definitely get a cache flush command during the shotdown.

        Regards
                Olver

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

