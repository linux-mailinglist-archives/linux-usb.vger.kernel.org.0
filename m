Return-Path: <linux-usb+bounces-9915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE308B5DF1
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 17:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7930B2B065
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 15:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0912F84D2A;
	Mon, 29 Apr 2024 15:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUwtEm+6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A40823CC
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 15:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714404593; cv=none; b=lgOKAnr4HkUKzTWf01kaoVIceen4S/NihHQ3U7Oi+7sX7cMdXv1wyrgIPtEnztfuEBqqNBal9dcjjgGgsh6aTzwPqlro1PR/RGgBIKswXzbTKuP6FwhykTRVR8gmgA83gHtHTCgTb9+K0Il4xnNW/FTZ+aKeKVsAcQ9PEM2pEO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714404593; c=relaxed/simple;
	bh=cR4ofG78zLXKStRwsfw+WBjb6WGb3Vag+O4+Vgn48iA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QlvW1+7QG59PCxK/Ch9nK50pAoRdUfdi07yJmpP5RFxYEvL/BVA/lL+lr7c05KCoL7t+kraKTLPZV/njkNSGnZMEL9On3hd6Go/2HIZLJa/8Q+o2Z4E8PdayaoyKsih1tFc6HoP21C1e5CsHnu2CjmoejanaXCBCZ7GS6Suf79I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUwtEm+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23666C113CD
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714404593;
	bh=cR4ofG78zLXKStRwsfw+WBjb6WGb3Vag+O4+Vgn48iA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZUwtEm+6Bb47zz07JueGpgei+dZJI3ebbE7qJSt9F6CWs1tgTa+OX3mUS+T94aC7M
	 UAJsrT9H/zBrLEzZ8ElPdCKkfL6lw6bnE1hMEaXsC0KS5ODZoyB+XAd8iiufqRsyPC
	 1VtWh5l7v31mz3kw88Flvfh5LSzxDOyc5pUpMNFeiGZds83Mt8PUQraJ6CfY5sqRVg
	 bsgHlLQJdg/Q5P01+in+WFb5eekRAaMo+PVEIiPOYoTpMYdBWy1rkdWTA5Ys14YWR0
	 LwUjmkxoWKZFqwyfZFhvVz6VTl7vfGnetSnN5O9z700EwULDVb2W4RAqhXpRYVQupR
	 j5nPjvycy2apA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1300EC16A72; Mon, 29 Apr 2024 15:29:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 15:29:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218789-208809-DPuNqaZrUw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #8 from webcaptcha (webcapcha@gmail.com) ---
@Heikki Krogerus,
Thank you for joining to this report. Appreciate it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

