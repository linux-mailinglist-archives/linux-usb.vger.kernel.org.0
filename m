Return-Path: <linux-usb+bounces-28864-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8756BB24B1
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 03:51:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD83A7ABE05
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 01:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF42A8635D;
	Thu,  2 Oct 2025 01:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D5PYYwF7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537DA46B5
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 01:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759369870; cv=none; b=Gr0VVYvicdeWRxPjGCYOVzYzKTdi5lJGP5ZYquSD05zDU+Le0zexxTrQNb1OEU8CgNONfrxSZb+RENF5elwVaDHJzhVNvmF1lDMwJuO7iRWxGP+uNd4aMMYeigv/GUonWBzGHq0iluNb1spQQBDt8NQmfkIRC5toD6FvpI28rY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759369870; c=relaxed/simple;
	bh=5YtrmC6BBJUT5qXQyQXl41CxfPkuJeRx3Tpvb0Mx4D0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mY1ljp1p+hy1H6sRySX+wetsZDaIHHMEJuY39Y7eys4sjkclnPFOSS/+YFs4EF4zSUdcC9EGvM9Lj/fZjB1WaJIUeyzcV5UxAE6SeGETpzjKjI4vDN8A07XGM4CBlVI5Z61OYOdP5TWkOFOYfujhzCGWvH9GROE3Zi4dT6jmu60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D5PYYwF7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D58B1C4CEF1
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759369869;
	bh=5YtrmC6BBJUT5qXQyQXl41CxfPkuJeRx3Tpvb0Mx4D0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=D5PYYwF7FZtmer0WWExDGT39nCWOHef72tl54/NRkPnhm8BQ0v/tvQw5sCfNp+KLD
	 TBjDCB+TQUoMqqOdK799tpRk5WOCUgHob9sHGVjksI9G+izCw9D4DE/iRuxu+pgA0f
	 dx9u8dzo0E+Irm6sbMwAl4rsBG9un2iWlFoEdFr+dAmQ31xBvhnnJWrC8zUTC2srvT
	 NXelOUHCYDC1avRM5lpNlXEQUBurnrGupacajDGrpKqSHdKEzOoY6vKqx4q2+q0GH+
	 ltkppcwGpDcpFVlefFr46yV+5YlHhpHahXivcHUesAnCss1XmFumMXMVMXPylEc9QB
	 J60hDAht++QMA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE0C3C41613; Thu,  2 Oct 2025 01:51:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Thu, 02 Oct 2025 01:51:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: remeke3519@tlexes.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219726-208809-58yTElXOkx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

Mitchell Rosenbaum (remeke3519@tlexes.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |remeke3519@tlexes.com

--- Comment #4 from Mitchell Rosenbaum (remeke3519@tlexes.com) ---
You should check in a build between these two and report whether the devices
are present or missing, repeating the process until you find the single bug=
gy
commit. If Bisect is not possible, you should provide detailed `dmesg` outp=
ut
from both the working 6.11.11 boot version and the buggy 6.12.11 boot versi=
on.

https://googledoodlebaseball.io/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

