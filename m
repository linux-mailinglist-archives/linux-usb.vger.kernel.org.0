Return-Path: <linux-usb+bounces-7293-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AC86BE98
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 02:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008181F22BD9
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 01:55:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980DE3612D;
	Thu, 29 Feb 2024 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nlLUz4Ph"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8136113
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709171724; cv=none; b=ZszdH4UqKSXXpvjGKMiGNrybIgSjW+mkC/sz381s45gnOsL3BNBYK/eNEX9ovYT/SPI/X2xkgDNXgMNcxScdwI0+hZjWdfseVW2bUzuD4wRji+XUZ0VxTFXbwX1+9XOLajjU0/xPNUzopfLhriF3PVkqacb8EL3aUtmOVyclMXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709171724; c=relaxed/simple;
	bh=TZZBGv6WZlF7JHR379QG62rsJE3RGUb/36ooOM/wnR0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eel/DsTx+K+30Q1yCEee540FCe0fS1HuMKTGGx7hs2fnvnyXU7tGP2HIGMf8XhmcOJt6l4tKq3dh0+9RDuKt52x8s7Z8Eapc4BR4nRUL6Bc5iWUFGsY07bZL03D33pnxIKUF9ELSF0ceP9BN4EYJhpzjvnrkm64D4Um3YIjeYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nlLUz4Ph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFE7AC433C7
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 01:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709171723;
	bh=TZZBGv6WZlF7JHR379QG62rsJE3RGUb/36ooOM/wnR0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nlLUz4PhmxYWbmpl8mTRO/7In+z/+j3Y0sK6i4HVvyRYRhMnl4Uh7t4CttdxK+ZII
	 HMoHmFKkKBGZwSQYrPJNpH3EAbf8t6iHOhJJkF6aJ9ivPQWTdjKU0RmZ4K0lNWeDZl
	 8yaHvkI+X7Jc4KqF9TWjPP6NQw7pwLdHXPMRlXJL/BXOqfd3eH3PcQxWJeJhDy9Yxx
	 ICUwuSyexQQNYMuIA2CpEQycwcx8yIg7spidu5Zq8Lkp3jbeJ/jtJjEgwtErxbFm+M
	 yPuaw4AWwtEIw/r5FNk15lJk5cijVEcH37cXP8H8ajtJ5sghAiOUYjHFiA/v5ysiun
	 3lEGxQE6wwoEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C212C53BCD; Thu, 29 Feb 2024 01:55:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 01:55:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218525-208809-REe6l1W5iZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #6 from kaukov.peter@pm.me ---
Created attachment 305924
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305924&action=3Dedit
RTX 4090 dmesg log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

