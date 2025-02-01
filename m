Return-Path: <linux-usb+bounces-19945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E7FA24BDC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 22:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DABA87A2BCC
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 21:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04FC1CDFB9;
	Sat,  1 Feb 2025 21:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KV7GarhO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D92139D1E
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444566; cv=none; b=i0/sRqdicNcXQYRyLoJdx3cn2NllQsAEiichh3GOJue33agi7E78PaVxpltdMmzPJSQzDvP9qeZ9X7CvHvV1CUIxhF8K8NoxfHol4SAq6bnUrLQA9P88HI2mydaMN/n2t5mJxzFK/FxOwkuiicjOyijhyNhGnn63T/7PXxbf27M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444566; c=relaxed/simple;
	bh=eDk0LChyxdwe3a3s1ICJVxoYVMyz9RNc9hXQTXYW23g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Y8igP49Kjv3DFGMyQU+2mwvC7ayu4a0ZBD2P9Zw2gaPQQ8iKd1xCJqojFFqnvRbNwhOQmpsi/PtTPeiXuCUlklb2Ugl8msQiEN3qlPexIH+jeNzPn8BEeemz5stPuu9l8i3GVZUp6i6D4WYXGrKXRjmDl9d9xnjN7L4sNH7mS2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KV7GarhO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CAAF9C4CED3
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738444565;
	bh=eDk0LChyxdwe3a3s1ICJVxoYVMyz9RNc9hXQTXYW23g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KV7GarhOGT2GW3iBYd1JFgzrUWS4z0yif4eFoTXdYRfUwfjfUvwTs/zhjAl8if5Ll
	 ZXTyZFI837AKX2CHJ8b/8jJxGTei+y4GFInU/jtxacpVdrZPNo75QWGliXne7/09je
	 GjUhG5pwjGSVSQdaGg+YXBxeCtHFpAhqVyVvs/+08jEiCwPt+1dUWIkDKjEs4OXRrb
	 2J71YkwGFp4pTU7tVKAG/U02YUaX7Ad3uykVm8/7X/ST5Kple2jbZE5OXGQjHJ+u1m
	 +WfTOhIFA31x/3s6tiarjziamsfCiozMAYsNon69VIOKI2RjU1dLaYylwf1hHrJMbE
	 7b/UyeONxKAoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C0669C3279E; Sat,  1 Feb 2025 21:16:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Sat, 01 Feb 2025 21:16:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219590-208809-06F6cggaUh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #8 from Fedor Pchelkin (pchelkin@ispras.ru) ---
Created attachment 307567
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307567&action=3Dedit
[PATCH] usb: typec: ucsi: increase timeout for PPM reset operations

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

