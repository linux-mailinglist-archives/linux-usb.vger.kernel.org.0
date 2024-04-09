Return-Path: <linux-usb+bounces-9124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 953A889D7CD
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 13:25:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F144B229E7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Apr 2024 11:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14088614D;
	Tue,  9 Apr 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZPGlxxw/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3D185924
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 11:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712661893; cv=none; b=YI7EV8tbPr3ttGRN/eDSw3xlMYtteIYUlMzRAu8ZcuKeKl6Se3Ucgk1Cwk6lwpCovbMl24I99+TwMTUd9XAoTadR5PUwzSGMSAwsyVm+2qDyw6Imb4T5uLjP6OehjcC/55M1kORqoOFEJ871OugdMLAFL5WvB6RgTyVvAZYpZ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712661893; c=relaxed/simple;
	bh=OXvGNjAXZE1wwSQBtm40XXJV+qfcpeEgUJAT1DVtO+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlaZkym2FBj7kVV19hY1ZtxH0tt11FGiYupI5realaCMkepcPcDzI5czctAY94SMoMyL7Qfh9p3zNt9uVGbdqEM6Et6gNRpU5N1/y670KJ8sACnsX3gP/21z3/eQMSfTGr2z8LbJyXEGhMX+uzYGylDpuW27qTi8fRxfZox7e1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZPGlxxw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E690C43394
	for <linux-usb@vger.kernel.org>; Tue,  9 Apr 2024 11:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712661893;
	bh=OXvGNjAXZE1wwSQBtm40XXJV+qfcpeEgUJAT1DVtO+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZPGlxxw/2tHXcGPbk6y6UqNzUN3mpe5faK6Y8RmmnD80hNG96hES3s3H+GtXcIOC2
	 WB9vlxaXGSroEYCgBFJHfEdMXubXCnFL0SsDy50ubOwII65jBCGrSmPVucaK1PMmt4
	 MDx6+ZrS8RASUKLhpmF3UhzBZGdWU+PrLtwmnaG1u1BFbqc+UcQIWEn6nKvNfgrj67
	 jhfSS8py9KgsqBiy3OCSOZhQR2LLqiyAK0X4PYKWdr0m17pR+gq+JZDa9rsatB5QPL
	 wEijANvQopLgDr5nAETlBpRnn99zsYMT7udcoSKTag5IGZlHcs0wUVFwB0xvg3y881
	 LgSYm+pwDjNXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 03716C53BDA; Tue,  9 Apr 2024 11:24:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218695] Datadump for error `ERROR Transfer event TRB DMA ptr
 not part of current TD ep_index 1 comp_code 1`
Date: Tue, 09 Apr 2024 11:24:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218695-208809-8wSzgthLh7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218695-208809@https.bugzilla.kernel.org/>
References: <bug-218695-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

--- Comment #2 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The trace shows hosts sends duplicate transfer events for ISOC TRBs
after a Transaction error on same device. This transaction error is probably
due to device disconnect.=20

Transfer events for TRB ..a1c0 twice, with a transaction error in between:

 <idle>-0       [000] d.h2. 33819.709897: xhci_handle_event: EVENT: TRB
00000032959a1c0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Event' fl=
ags
e:c
 <idle>-0       [000] d.h2. 33819.709904: xhci_handle_event: EVENT: TRB
000000041547d010 status 'USB Transaction Error' len 4 slot 6 ep 15 type
'Transfer Event' flags e:c
 systemd-journal-395     [000] d.H1. 33819.711886: xhci_handle_event: EVENT:
TRB 000000032959a1c0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Even=
t'
flags e:c

Transfer events for TRB ..a1d0 twice (the next TRB)
 systemd-journal-395     [000] d.H1. 33819.712001: xhci_handle_event: EVENT:
TRB 000000032959a1d0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Even=
t'
flags e:c
 systemd-journal-395     [000] d.H1. 33819.712059: xhci_handle_event: EVENT:
TRB 000000032959a1d0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Even=
t'
flags e:c

Transfer events for TRB ..a1e0 twice
 systemd-journal-395     [000] d.H1. 33819.712139: xhci_handle_event: EVENT:
TRB 000000032959a1e0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Even=
t'
flags e:c
 systemd-journal-395     [000] d.h1. 33819.712871: xhci_handle_event: EVENT:
TRB 000000032959a1e0 status 'Success' len 0 slot 6 ep 2 type 'Transfer Even=
t'
flags e:c

etc..

Driver can cope with these extra events, but if this is common we should
probably handle it silently and not concern users with that ERROR message.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

