Return-Path: <linux-usb+bounces-25193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA27AEBE82
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 19:36:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC42E1C479A0
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 17:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5F22EA753;
	Fri, 27 Jun 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrbObif+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1912E5D
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 17:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751045800; cv=none; b=HenSpQTNAQZS2MUtiDF1lX68+NCu2gvsK3eb99tDGHcy+b5hsJ+nrQx3MV9t3d5VU2eXu/RhxI/gm8W/0EZRifV/9xeE1ac8aGc5HsVmwau+xVrdQMEzOm/Gz+9OqYx55Z84A4cXy9aZziREMFrevlcjHrLfIby1C/0KeZ3g8Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751045800; c=relaxed/simple;
	bh=B5Iwrpg/6pqO6mi8n7048EQncMNG49/5VkJmiggFTyo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BERgVhFwEX8r3nkpCbbduTUzf3d/jvN0cgesxh5LIXZK6j0fKSg9iwONRi1IUQQQCaaRKoL1fxpOGaLlQqfy9rGt+qZswVXrcJg0hvJw7t5NoRdgzrkxtbMpKDN/RBUK7FF5CqxnY1H7p9PFUEAWoZCCEubVnNcGb7p9Ij3cKw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrbObif+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 191BAC4CEE3
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751045800;
	bh=B5Iwrpg/6pqO6mi8n7048EQncMNG49/5VkJmiggFTyo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DrbObif+aDU5hHZ1ZSW0z5KuD0tVji0GG7ukn+2wKOyi6ScCfgfBsWlYTWYvIlnEZ
	 da8L4jeagfLYkC6C7oAsQpocZ61m/JC0FVrSfb5GRfMpgmdu7oJsa9pKD7QwIK/oRH
	 X+q1yY503wPuoYsrMLGJbW10rsGIwWJ7OEIPaylbYkqNowBWJdiHG2VLYsK2KWthLg
	 wz2ZfqZf4OwqrzNYsi7J9J85rEgAx+XezpexV4jkimUU489YmD+M5GmStCWhHTu/C4
	 lq9VGklhlRkkC9ZopUgrgzYjS4e5/ucAZB2xnOZ8mt/02eMLcrXP+YsfFLOj9+6XUv
	 ZMGeNmCvLnT0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0580DC4160E; Fri, 27 Jun 2025 17:36:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Fri, 27 Jun 2025 17:36:39 +0000
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
Message-ID: <bug-220272-208809-zAYWs458qo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
What happens if you boot with the mouse plugged in, then disable it with:

   echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue

and then enable it with:

   echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue

?  Does it work after this procedure or is it still non-responsive?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

