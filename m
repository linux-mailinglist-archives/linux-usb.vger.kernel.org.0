Return-Path: <linux-usb+bounces-23645-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A0AA7030
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 13:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C967D1BA7271
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 11:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B64023C511;
	Fri,  2 May 2025 11:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+NM6reZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1394238C09
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 11:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183828; cv=none; b=FSWdzgIwtUVzPgcv7GKyIGvpibrfCnP2RpLLPwIX6AT5iSpIzoesvV+mbq94EOg2ic73QWl2tUHHdIhjn2rjUyfwuKf03tPG5BqcQ9KguTLavTOaYgNiIi9wJKT7S7zqHh/WaTcrYi6EUarZJKQFZukzPA6xTlsCfIahOznjfzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183828; c=relaxed/simple;
	bh=yEtFHR4GEt4MSKyRL0/SjVxx+L9HVwePJw3qhDNqeM8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBI61PqufZa0IO1+7bSp7z1gHZY6Z2v7sSfz1JuNtXYeZUnulhewaxZ/GqEyR/+yd10zyTiAqDY+Cnh7/cL4STAVDHakI1pBu1gN5qupRQ0GHJKhgMGspe8q0CSI6AMCpnW/6mFSAXyF8OxU8QJVV4CX2ucxGIZxg5IsqSyrzJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+NM6reZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46E3CC4CEEF
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 11:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746183827;
	bh=yEtFHR4GEt4MSKyRL0/SjVxx+L9HVwePJw3qhDNqeM8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t+NM6reZrfXnEWyrwnq+2dLvXr5hsnmEmtVbGObePibC+PltidH3WrQWIxtwCBXOE
	 pXYgHYzYGE38JMO/D0VVhwF56jMliUT17QGXHD5BUhtO6RmSRt7AxFes1tVed74kNb
	 r2IzT1bV8HvOWEERDSxLR9WY2mYbqzT55f8XpzmNQRVafnhQOSDDObSAO/K/SIVx3h
	 rKKRyUli6NlXEGudGBHIpSGH0LUmhxPgWRjJlt9l/07o9D2gkFBpGTWNqfboxIcPAT
	 UcZTgsXzO0FFql9atfQayyIVFI2SLJl0/epre4fn7JbOpD8AcLC9l74rFV4fc8NIYn
	 89gB3m02inmlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40A22C41612; Fri,  2 May 2025 11:03:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 02 May 2025 11:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-igFNlGfavE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #22 from Claudio Wunder (cwunder@gnome.org) ---
> This zip is OK, but it contains current data from normal operation, not a
> failure. A few random transfers on some devices and it looks like the
> familiar 8-3 hub is periodically getting autosuspended, maybe that's what
> sometimes goes wrong.

Yeah, as I mentioned that was after I made the unbind/bind.

> The freeze is a known (at least to me) bug. I believe it's caused by the
> driver waiting for the command abort to complete with xhci->lock held, wh=
ich
> blocks the IRQ handler for a few seconds as it tries to acquire the same
> lock, which apparently causes other random IRQs to get delayed as well. I
> have been putting off looking into it properly since December, maybe it's
> time to alert Mathias..

I appreciate the extra info. Let me try those simulated failures, let's see=
 if
that accelerates the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

