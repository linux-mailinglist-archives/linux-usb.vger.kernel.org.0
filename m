Return-Path: <linux-usb+bounces-18222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8A99E7E21
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 04:48:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA1C286960
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 03:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A1D2BAF4;
	Sat,  7 Dec 2024 03:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WX+pCBz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEEB1F602
	for <linux-usb@vger.kernel.org>; Sat,  7 Dec 2024 03:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733543330; cv=none; b=rc2Agv5bb0ebs8ztDOtY9rR0pgPs7Xg/jneQpSUPW0v98GNx1LSh2g4WNshYiAt1ieoxZyaK6B7QbmNAQkdM7WYhAWa0PHFE6GjyycXQQgCyCmJxrOzmKeISy0IRm9fHJlKAa9QpayOIrTP0buBuyjyvXzJqflx5un3R5qAu43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733543330; c=relaxed/simple;
	bh=0yt3T6jTJ2ZkuhxFhPgJgZrvEl7ed9rrrgbIDLEQyTw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oWBzvjvFK450MY0L52Sm0vRLM0zUW0Ppt1At9SSA3B536yGMOUhOUAVlB5R7FNuK1dH/Hx2PHr/0wSOvQ5o4n4MXxd32dUMZ8P01HCNj3/CZkshjvsAM8X7dv/jLCQnrulMcg9n9jpSfFiiKB9+9/lYS1zSjO8Y+L5ZQnIWT344=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WX+pCBz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A8A9C4CECD
	for <linux-usb@vger.kernel.org>; Sat,  7 Dec 2024 03:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733543329;
	bh=0yt3T6jTJ2ZkuhxFhPgJgZrvEl7ed9rrrgbIDLEQyTw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WX+pCBz2hysXlz+heK/g/lkMxwvxtd1CJ31HNEa/fkmRrTHeV3Zei9F5EsweRNtwr
	 Qedf6/wBKrPKmrIcnOSpm6GcsdA1+44qOejFe36p8Um9swyu9X1b7gFuUEcHq1P3NW
	 YFgFOcMjBvfn6iu4MqBa2/PHz4zjwmUW40gGNAoR76vrlKE3gwVUig3IkAJiW8mn9a
	 6anaR7AoqGSG9XGzn4c31fQk8jWvsUiRjmZ/x6ZDMqeEKdHMJpEHqS8HbbjbDk/ny4
	 /d3lWV99tRTXf7UugBHsAe1PEQcbBzU4jB+QxmQV1FCJgCFymgU8Y169QYqJMyv29H
	 Bh/Lp9QQNqySQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69746C41606; Sat,  7 Dec 2024 03:48:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219569] The 0c45:671d camera fails to initialize despite being
 visible in USB.
Date: Sat, 07 Dec 2024 03:48:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: v4l-dvb
X-Bugzilla-Component: webcam
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: v4l-dvb_webcam@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-219569-208809-3gKj9DzLlT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219569-208809@https.bugzilla.kernel.org/>
References: <bug-219569-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219569

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |webcam
           Assignee|drivers_usb@kernel-bugs.ker |v4l-dvb_webcam@kernel-bugs.
                   |nel.org                     |osdl.org
            Product|Drivers                     |v4l-dvb

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please try 6.12.2 and if it still doesn't work, post your `dmesg` as an
attachment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

