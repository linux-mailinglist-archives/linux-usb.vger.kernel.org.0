Return-Path: <linux-usb+bounces-11354-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C64F90A319
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 06:42:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9C0AB21095
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 04:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85E81178363;
	Mon, 17 Jun 2024 04:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qmVkHYJK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D60819
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 04:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718599370; cv=none; b=B0BcbXweLqnADrZ0ZLyDduqn5NmbBlDSGqQicBYsp4foZptkGZlD/mYF8rRzftNIyCfYuo0MkqKM/hJdvrRipzjsOERFwK9JR086VtYuziVajIjjglcN8hzL2HI2TKytyyXbL8nFlZvzvu05m9UcUFuQnb3zwsgKEBvad4gtNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718599370; c=relaxed/simple;
	bh=A5PI8n/TGpV/Ogu1OA0KHmeX0u6H5FQg1LY2bSoWR6U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PzvIkPKzkgJoVd3otkAcSrxbEaigDr9yzIw3VfOztziRNoJlvLIIfWYhNcod+suZui9snHoI1xOh+WL1i+qFvDpD1CdM5EUAj6bEwvuazQWlbf8+Li0YKfouvvW8FB6ODF1OWPyRn1wBuzVQ+cCdgtMjujAVCEhvCdCb/W0Rl38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qmVkHYJK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 610E6C4AF1C
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 04:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718599369;
	bh=A5PI8n/TGpV/Ogu1OA0KHmeX0u6H5FQg1LY2bSoWR6U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qmVkHYJKKZrXLXWhp0zMIUEEe3rot7y2MbBYp8g9jwBSJ2EShXtj4u0lelfgNMZmE
	 qy9pQPoCAAPaCNDa2t/m3jjC9cYCLQhzdsjiQIk2iJTjwtWahelgh6dEjGHe+cxg/Z
	 FM2pEyTOyO5Y/iF5RGzMvbox669rPVGudiTodgxmHLmdSt9iJxmtXDdgNvxu2/ekGy
	 rX2Wgufg5pJN1zvMKBFRNdUcq+JoMMBne4IkiU2HGOx92LUW5KXtXwyBota6Pva7us
	 OWqNwQyNFgFBlUZLO73KMikOXN/PVV8cUQRZ1L/M+skzXOA1RqAcIKzYDGCgD3q1O5
	 qQjSWfJl5dYqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C842C53B73; Mon, 17 Jun 2024 04:42:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 04:42:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: larsm17@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218943-208809-tB4Ugnofsp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

Lars Melin (larsm17@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |larsm17@gmail.com

--- Comment #27 from Lars Melin (larsm17@gmail.com) ---
(In reply to Jarrard from comment #23)

> When the HUB is connected it does show as 10Gbps but AsMedia device is st=
ill
> 5Gbps.  HOWEVER here we clearly see the VIA hub is 5Gbps which is confusi=
ng
> to me.

I can't see any AsMedia device, maybe you mean the AVerMedia device?
What do you mean with the hub shows as 10Gbps?

I can only see one hub, the ViaLabs VL813 and it is clearly a 5Gbps hub, it=
 is
identifying itself as USB3.0 (55Gbps)  and the mfgr specs also says that it=
 is
a 5Gbps hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

