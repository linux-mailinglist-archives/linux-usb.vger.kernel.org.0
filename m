Return-Path: <linux-usb+bounces-13248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB54194C587
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 22:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87E92284E89
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 20:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6465155C8E;
	Thu,  8 Aug 2024 20:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hfaqC2p+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0464A1E
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 20:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723147886; cv=none; b=MRz4ho4YUlP7A8ikRFtVxp0pj2WlEgQBEePnlm/Jewc1xam+ZQxlLx7TqcoAXQ8+8rBFjvvqX+BHkZ4cjppctguLvJoBoqSOtStnp/UGp+cyowwqhIz6NdZpwAZxy0GKjGDIgr2a/P5fhZPzoSaluhW02/VZDxSSZx5Abn3yZho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723147886; c=relaxed/simple;
	bh=CYErxuhx/N44FttUqaPg+zXgrC+uqWC2YmDAEuWmcqg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DiGYF3f194vtNRtNWjT0NWRAkFzwy1kJDweGE3db0euuYTJyw6UdRapScutQoNUk3FkEOf9ZAYNPZyj0zqpGUhiJq0ysmcDjxWJxaQj6Xv4hdfLfiWYUOV+vLDV2C9OuRW1otOP+xBO96pmn+qY1VHz2h7O9SobkLMD/RlS5Shc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hfaqC2p+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B78F2C32782
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723147885;
	bh=CYErxuhx/N44FttUqaPg+zXgrC+uqWC2YmDAEuWmcqg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hfaqC2p+JWKQx84KBD+cBQmPoBPCcRCEYNMbQjDKmJMKW0DuIIc8DRO2OORZUUYl5
	 rqyQ/qHP4d05okcADuJUCgq3ZY7pEQZaj4PsXCg6zCGxHrOW45RFVQdgXeYe/TTMrT
	 TORepvYQsG453ied5sOGGSetvP79IzQQFWsKrdtXwA//xpXpEqpvBY4D2Qteu+B3Om
	 fTKbD+ePn4BJ9X4H0OX/4tAYWpDoS8tg0b4La7xx8rEwSRiQnnXh8VMRwLjuBP3UxB
	 EZGOnlB0/WE9i5M18QzYyQcBwW0sq2bNxFoJcyiV6hCaiH6TdfmgAf4Y+If25aw961
	 5cP0c5QlGY9QQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AF4E4C53B50; Thu,  8 Aug 2024 20:11:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 20:11:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-vKchRAVYxL@https.bugzilla.kernel.org/>
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

--- Comment #41 from CH (com+bugzilla-kernel@c-henry.fr) ---
> The idea is that you start with old_scheme_first set to N, plug in the de=
vice, check that bNumConfigurations is 1 in the "lsusb -v" output, set old_=
scheme_first to Y, and then use usbreset to reset the device.  If bNumConfi=
gurations changes to 2, you'll know that the reset caused the device to go =
into its other mode.

Unhopefully, that doesn't seem to work. I really need to turn off/turn on t=
he
device to get the proper `bConfigurationValue`s

```
# echo N >/sys/module/usbcore/parameters/old_scheme_first
# cat /sys/module/usbcore/parameters/old_scheme_first
N
# lsusb -v -d 22f0:0008~ | grep bConfiguration
    bConfigurationValue     1
# echo Y >/sys/module/usbcore/parameters/old_scheme_first
# cat /sys/module/usbcore/parameters/old_scheme_first
Y
# usbreset 22f0:0008
Resetting Xone:23C ... ok
# lsusb -v -d 22f0:0008~ | grep bConfiguration
    bConfigurationValue     1
## Here, I unplug the device without restarting it
# lsusb -v -d 22f0:0008~ | grep bConfiguration
    bConfigurationValue     1
## Here, I restart the device without unplugging it
# lsusb -v -d 22f0:0008~ | grep bConfiguration
    bConfigurationValue     1
    bConfigurationValue     2
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

