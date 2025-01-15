Return-Path: <linux-usb+bounces-19375-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6E2A12681
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 15:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 64DD3168F9F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 14:50:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF02013D8A3;
	Wed, 15 Jan 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOtbyG4L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85278F57
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736952613; cv=none; b=PqSmykCuEf70KOqnasssXobnIXUzk3eJp+SfJeDyKUDPX3lXLOnHljY/53U5kzUFO77ELK6IwqLXt2xkj7CbQMbVOMKdgr8iQ8Grw7IhBhMboDi3gHccaR6M9sWGcopd0COqzAyRKHUEjCOOk1HrWkHYQ8tYasEItubNN72SyUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736952613; c=relaxed/simple;
	bh=7N6v39VwyoGSmPAAMHNMwrXqPSAYXTki/wviWXHQFI0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DXVJv9yYUodRXVsAlif3Uvd3IfPEz/hp+vr3glBA5RwZB2uziT+zpa+At9u7G27E3dGSrvOUmE3drJGhdybnD7tKmou7iVwhL7MxxiAxwQQHCe1QBTV/lQbico2+v0s/aT0i/N+yy6etHs7C/7roobSmVK0k+hBHNXZy6oT7P5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOtbyG4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00AE7C4CEDF
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 14:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736952613;
	bh=7N6v39VwyoGSmPAAMHNMwrXqPSAYXTki/wviWXHQFI0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eOtbyG4Ltbz8ghsHxQ8RmPB68GKK6H37SRHRvvVgtr+NL5KgDFKqOEDYQl1xa0SZN
	 oeJnyjn2MqQgPf27Ku9XSfoH3LZKiTLcNd9fxFrPAaaBy8xrOxMe4/E4M5D96iIaxO
	 gq9oTX0WqcYi50h7n+LTmlosCEUlOe90uS9XJffBw0tuSWuSNiYuARKUNmOWkS3iBo
	 krjglxWpcM1Rhwzt8HppplRR8nreaZZ8v4BRUeMX8bWh3qJZptfaVh6l96JIXzyaKN
	 smD9u0DyRmClMgnwk7zVrjhEVvuF9BItCDYIjKjV4TCylVrRoOoxh/OQ9F/y12TzaW
	 c1gqSnPn8Kzhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E0ABDC3279F; Wed, 15 Jan 2025 14:50:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 15 Jan 2025 14:50:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219681-208809-0Plbeipg2Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Are the working and not working ports on the same USB bus, or on different
ones? Perhaps two different types of USB controllers?

You can see the mapping between USB buses and PCI controllers with
ls -l /sys/bus/usb/devices/usb*

udisks2 collects SMART data and this is known to cause problems with some
combinations of USB controllers and disk enclosures in UAS mode. It usually
recovers after the reset, so not sure why
[  131.357007] sd 0:0:0:0: Device offlined - not ready after error recovery

The network issue is possibly unrelated, because in this case the hub simply
reports complete disconnection of the device and it comes back a moment lat=
er
for unclear reasons.

I wonder if any of that is preceded by low level USB errors? Maybe try again
with some dynamic debug:
echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
echo 'func handle_transferless_tx_event +p' >/proc/dynamic_debug/control

I presume this is not a regression and there are no kernel versions where it
works correctly?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

