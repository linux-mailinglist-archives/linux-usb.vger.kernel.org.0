Return-Path: <linux-usb+bounces-17142-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A84719BD9FD
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2024 00:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9991F2266D
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 23:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C1D5216A1A;
	Tue,  5 Nov 2024 23:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="baq4zl7l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A7149C53
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 23:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730850947; cv=none; b=OFBZl6/VX866jmEbjM3SM7IAzeEynLBuMlOfQuifQ29EpKmM5I2F9+ws0FWleYFZVlNf9XIyZYihhgg0VXcnC4MUhmN2lcpi9RSmHLsr7+5NzdCis2SGTA8029vkEuN4QzTGW2ujyuMagGHtYjjVXj8oYxdD+Zp4pDjCmdCW+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730850947; c=relaxed/simple;
	bh=6BtDQh0Ob26MPDEDgcEPyWgjzFVU0bUrpEGipz8cAvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iZ34VpyZqD87YwKXPvWF60Vdf6yZoJCXxq9rS6er6pn2S4GeulYwm5gNLcJ3583Qgzt9IJcQiceHfFyUulcB15x1ZV2av8ZZD4JFHpHw8zRktc/mwUAJJvjavGbsm4aSUeUpBsDH0K1GxReS26Yw8bpNG6I0qFZ7R9W+UbjRtVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=baq4zl7l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E6FCC4CED5
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 23:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730850947;
	bh=6BtDQh0Ob26MPDEDgcEPyWgjzFVU0bUrpEGipz8cAvM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=baq4zl7lZ0zYbDz/zT0p2oBYd+vOa7OR/IIwGYwELXsPkEzV2P0v20won/8CXLCTJ
	 nQ0DGd94NGDZA0CRbyJ/mYpLR8kfRB5qhT1DZkB1d0r4ACdz1iBA0RevPs+yqm1lok
	 y1hg1IKQqwgPKnunuqAs8bB3HQPUw+No4ugux0m+PJ0JsVnk7/swJw61Z4iDGNBJvs
	 v4xhciYJjTZ4sAI/wLkNrqnT0/nGo9XzIdQX2dAmhGO4Y7LhkDAuvXRK5XlhO5o2eS
	 XyqSV9BH8juF8RsvNuMbeKa/uZb+NmzGcTeJETVCBVDO6Kmh6G8cF/1AbSHn4HXpNx
	 zRK5oCg+7NYiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 17994C53BC4; Tue,  5 Nov 2024 23:55:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219470] Add support for Apple USB-C Magic Trackpad 2
Date: Tue, 05 Nov 2024 23:55:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Input Devices
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_input-devices@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-219470-208809-vV6kilj1yE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219470-208809@https.bugzilla.kernel.org/>
References: <bug-219470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219470

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |Input Devices
           Assignee|drivers_usb@kernel-bugs.ker |drivers_input-devices@kerne
                   |nel.org                     |l-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

