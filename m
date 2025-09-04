Return-Path: <linux-usb+bounces-27547-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F81B4404C
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 17:18:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D2F618875E6
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 15:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DBA6211460;
	Thu,  4 Sep 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GlLh7Nct"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C19823DE
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756999079; cv=none; b=M8Pz9GFOzKjK3PhYAc4aJ88VoMoKzIGk3Ini+2bCHjCPd99tUQ7Ju4xendwS8YiKjzmJ5MVOXb4D1JjN4wQtcSBNGP/dCrGq+7JDpmx1lukcG5JcRyXdLXH8cDpBUuLKQ5JkrW18lnRxHkTnVKJeecaiKSrY/5RGrHprGlq+EeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756999079; c=relaxed/simple;
	bh=33jG8MHaZPNWWYd9M0/v1dKRD1O1+eI9b6+Pl8ngG5U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ebUNtRTuviEdeeLT5eECJWvks5rrqrgZOVoWmEUwesmyW6fuJzLZP0iCdJWBBfq2GtVsu49e65nS3RFOL5FFxzGNNeKRDNLgCEVeYK2ewnVh35S+p5NSqsmObhBrADfzDoOBJiGqICw2FE34XTgMu6QUP0GYHU4BLUeKkLoob5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GlLh7Nct; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECD33C4CEF8
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756999079;
	bh=33jG8MHaZPNWWYd9M0/v1dKRD1O1+eI9b6+Pl8ngG5U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GlLh7Nctj+EdbkVeJqCKIDtxr+ExTiLwWlWYXoBVeKfgsWfuNaik3XHWwLsUlZpLu
	 +0USW76RBl9/1WsGmFWWrBPmqMb5QGlmeGrBSt/iIARSJzU7G7G9Hz6Pg80Uvg6OBQ
	 lG61KQSeJLdo2ugvv9JYo0TwdyEiXgexwMS7oMQquBNy1fgLJ+65bIIm5ebZ5bBLoj
	 b+/xIFdgD/EosPK8E2al4ncIiHKFfv51eAWFOsoHkBAn0RMHpjfds/AsfIHSREy9fw
	 6aNXude1BWRmj7kKjVVxSf83oRQGlKmJ8UR4CJdnK8W1OBOgEHdRhe7hNdOIln2753
	 iT+XlO00q6cMw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8684C433E1; Thu,  4 Sep 2025 15:17:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 15:17:58 +0000
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
Message-ID: <bug-220491-208809-Qk4Oawsphp@https.bugzilla.kernel.org/>
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

--- Comment #40 from Alan Stern (stern@rowland.harvard.edu) ---
usb-persist doesn't care whether a port has an overcurrent condition.  But =
it
also doesn't check for overcurrents, and so it might not work if the condit=
ion
is present.  That's not a common thing, after all.

As for how allowing a disconnect to propagate upward allows a device to
reconnect later on...  There's nothing special about it.  That's what happe=
ns
every time a device is disconnected.

When usb-persist fails, there's nothing it can do.  The only possible cours=
e of
action is to allow the disconnect to be processed by the kernel's normal
mechanisms.  Once that's done, there's nothing to prevent another connection
from occurring -- no need for anybody to "allow" anything.

You might just as well ask how unplugging as USB cable allows another devic=
e to
be plugged in (or the same device to be plugged in again).  And when the ne=
xt
device connects, it will naturally receive an incremented device ID.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

