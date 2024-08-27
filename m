Return-Path: <linux-usb+bounces-14171-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1151960674
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 11:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 203931C2017C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 09:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF461A08CA;
	Tue, 27 Aug 2024 09:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nokouWO/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F7319D896
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 09:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724752578; cv=none; b=R+fBSTheb6fMZwWBKRJFcZuno4fYwlU0nIOmDnGmJV5GB7rMeIIfxEIpdSFZA4wP7Hk50b45bo0F05yiyyZ97Ns6Lr3zuUSspAUAihkhsf5yoPBrnw+oLUYinKYjHxN0UPqu/7qpiloL9JFqvyiyMSNaFwtmssOtKsh/hpmpxr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724752578; c=relaxed/simple;
	bh=y8k1SEExuA70O5oKV8X1eXlGSzECr7HHn+DaC8PW3Pc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YBLdobGjIQvdx9dAJvI2IVlEh1ulbRtO40kbFFPjWtU95bl0hdcnUh4cWiK0YlmNiZPqERNqF9K6i/bIXwsRD/uVPLvqhV2LFM2RHftGP4WFyvCzZRIYOK2+XuHXEvJ4AKwolGCPYnWEfBGrN6ialxCXKitQlbVl57OtcvRbyNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nokouWO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5EF4C8B7B4
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 09:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724752577;
	bh=y8k1SEExuA70O5oKV8X1eXlGSzECr7HHn+DaC8PW3Pc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nokouWO/ErxUlallvj9f6T/ghrax4sI9TnZZ7D+7AH0e0HTq1STbwcLy23Oibgv9C
	 gK0N1KRsRJVdh5XhdmaV+U71RU8N6+UbwG0JBhkrK2tjLZ1JCXox6rPMIAkw4vAUQB
	 H2raOdrshZ/5n+5evqIi0SS+lGVaHyffzjXgmT9e1hW1PQkRxu8BqSf723cU4MmqLf
	 N1d8b7V0tf0QkLaJVpCohegv/FYTHRODL4RrszulA1hdprW4LFpADDOq5Ds09vDlSc
	 KWS0tEGdfDElM78ewppQLcFPaGGRGEKDRlpUD7q3FPAI18Tnn/hEJWXcKQj2lTdNEa
	 6ifhMD9zKsybA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BB078C53BB7; Tue, 27 Aug 2024 09:56:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 09:56:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-j0lgoskgI3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #10 from Markus Rathgeb (maggu2810@gmail.com) ---
Forget the bisect.

I currently tested the another commit.

I started the laptop without the dock attached.
In a Wayland session I opened a terminal to look at the kernel messages.
I plugged in the dock.
All loooks good.
The USB keyboard attached to the dock is working.
Before I entered "git bisect good" I had the idee to test again.
I disconnected the dock, waited a moment
I connected the dock again
Now the lines
Aug 27 11:51:07 b0v9by3 kernel: DMAR: DRHD: handling fault status reg 2
Aug 27 11:51:07 b0v9by3 kernel: DMAR: [DMA Read NO_PASID] Request device
[04:00.0] fault addr 0xffffe000 [fault reason 0x0c] non-zero reserved field=
s in
PTE
are part of the kernel log
additional the USB keyboard attached to the dock are not recognized again

So, we need to disconnect and reconnect the dock at least once to run into =
the
error.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

