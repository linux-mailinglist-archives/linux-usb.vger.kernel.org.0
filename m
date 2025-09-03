Return-Path: <linux-usb+bounces-27494-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E305B42331
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 16:11:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DCC7201DA2
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB88030EF6B;
	Wed,  3 Sep 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3U8NvbM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281962FF64B
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756908599; cv=none; b=gvalBqJP6bG7GHhzU3xSjzOnnal2pYuUVys7IJPU5ye75XLPwxzo20UIcHS9ClA80TTRVFzOhdUEzHcEeoASc/LchbhSIeIErGEybxgXS1fBQvYUKvABHBRyYzffqV2djlEVJvR+3OoipvOZhfIglM6fo++yv1x53LR1H7tOU78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756908599; c=relaxed/simple;
	bh=f7P1WIEb+eVOJywoMMIUelk0Ytrm6wqye+Zd0AbW3dE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hamMpc2DzdpG0B0TGypqNOZqKzWkG7qr6tI2sxeEY1u5SF/97Xo4bAieZWNGwGU6TVFWewRY4shkUxshNasyFgCSLWK+CHif2Ti5uSPHum1AA8Fl3jhsHcCtkrbf+1iXWwfkkxQA3LCF2AV8aqcDB4Q3s/kjdKyX3Hr54bpqjY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3U8NvbM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBDE7C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756908599;
	bh=f7P1WIEb+eVOJywoMMIUelk0Ytrm6wqye+Zd0AbW3dE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K3U8NvbMnNGuwLyhrylbW4jzyFQmFoUof0AGJOof2vEOxKzXnpI9LMrW0UsUsUcD9
	 fUrBXBlfF2i1sdM+ptmHTJgOsf9VgqPPWHWog56kd+N6PCV5UrHkZIaCzmV52OXtqc
	 17z6FaQjjMh/houQb4JJEsKGcKocZLCgQQUUGqkteJ0D0Wqyw+oHGdVWoQgqUFg7PB
	 wLet+B45LEjz7ofOPM5if9I5teYZ5eIXq7v+AH0EMnVoILNcVNgBhbHFZk+kMtMFzY
	 2h0QGIfCoRCpYG5YDN8OveJseA58JVo8RVPMcu4MNKmYJLZbo6SKBlB014ZSgb9086
	 YqZ+V92ifnWRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE91CC41612; Wed,  3 Sep 2025 14:09:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 14:09:58 +0000
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
Message-ID: <bug-220491-208809-IWRl69qkZz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #24 from Alan Stern (stern@rowland.harvard.edu) ---
Mathias, your analysis looks right to me.

I suspect the whole problem comes down to two things:  (1) The card reader =
gets
disconnected during suspend, perhaps because of lack of power.  (2)
Re-establishing the USB-3 link races with the reset-resume processing in
usbcore.  That's why I suggested adding a 10-ms delay (maybe it needs to be
longer) at the right spot might fix everything; it would give the link time=
 to
come back up before all the resets and other stuff start happening.

On the other hand, it might also be possible to resolve the races by change=
s to
xhci-hcd.  After all, re-establishing a link is already part of what our re=
set
routines do.  That would be preferable, if it works out.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

