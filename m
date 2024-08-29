Return-Path: <linux-usb+bounces-14264-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5309A963EBF
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 10:36:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062611F21E92
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 08:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BEDB18C347;
	Thu, 29 Aug 2024 08:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sdl1bBWM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021318C32B
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724920590; cv=none; b=ajEQDVWK6gbQiyNdYdUb6BNx527YnLsQksmSyBkubcquGB41HRWbjD2s+EcrM1SMnEoKKPkVvxRjvX8Vx1CFD3icEmkl3AkZ7LhheUbFuiHsoS5RNaVax6YmkZmlkXrz7qoi0y/+8UGjo7nnGTrlgfctIfrwinjQHX4TniBFPwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724920590; c=relaxed/simple;
	bh=eKWqbkWPmYnZQV6hsMgfRvk5ZwO3N773zD8+EC/4CfI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nrw9hhn4zp0fQAa9utVn6w51FcNZENIzlyX3Hnv7QZbNrlSlGjgz/RHou95FFiIOcxtacy1drT7B4cgSLERKg7iizqCQYFcXCHXAaILfhpgS60nVlY6XTfJfqv+gOvtmApIZmcFGEBI+vx87e/UQAN/Cm5amwe8R3hbRFUZkaqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sdl1bBWM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59D25C4CEC6
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 08:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724920590;
	bh=eKWqbkWPmYnZQV6hsMgfRvk5ZwO3N773zD8+EC/4CfI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Sdl1bBWMewSvBRAK8XMxmatFKr7L+3qSzNWsF88UN1NhesMFsfQNOhBCY8q/iyKly
	 9OsM26o8cJcrEAVCnZyN0QOU2YU+GQhA9vas+H0g+2bhfE5At5SCwCKEfN3UfXKutR
	 +gYPEp7HzyGSIZWk4lXEuktaSUiDE+d7Gc2MTFvXS80EyuBAGn6D4QIS3cunBg88di
	 tM3nEuT3E2W+5EpB9N9U9slUWiRE4ajgCSvhA6N+xg0RV3QCSxbiL3wjMn7kSHrXO6
	 2P38jdsFx/uhEzlYcJ69y6bl++OMFYcbcFzH6leS4GJm49wCeGlmyun9J6146+QUb4
	 fDvbGMeK4q0fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5031FC53BC5; Thu, 29 Aug 2024 08:36:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Thu, 29 Aug 2024 08:36:29 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219198-208809-TNKXfXp8D4@https.bugzilla.kernel.org/>
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

--- Comment #27 from Markus Rathgeb (maggu2810@gmail.com) ---
Created attachment 306788
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306788&action=3Dedit
0001-fix-iommu-vt-d-Add-helper-to-flush-caches-for-contex.patch

This patch fixed 6.11.rc5 for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

