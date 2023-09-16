Return-Path: <linux-usb+bounces-231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFF47A2D08
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 03:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 697DA283AE7
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338A920E4;
	Sat, 16 Sep 2023 01:23:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDA9A2A
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 01:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E13AC433CA
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 01:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694827425;
	bh=KaBLIl4j8O/sOvor1VkpBUBbe4XwfKQe+S6YHBqVeR4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BSureV5W2HADv0YF1ElIEw2Sn5mQ3LiG5v1N3bbr61ON6x9W8NvIWtzNHpWUQavDx
	 DV+Kg5wVH48lb13KujmZbTHqIDs2rM2HkPdfl5OoR6IOkq6y6ed3KKzH0ftfwPVpzx
	 PUJ+ipD4ZXlQ2QTVahUg8y6DXNzPXtvpG9gNGyynuYczdpFgFTu/m79xIkFt+MvSx/
	 k7W8LQbO7abA3C+8tT0Taaebr7vJqoar2rBmdaV5HuE1DeEv0LF8G9Va8xB7jf5gU+
	 HEAjmQBimxAk8B3Fpq4AxJ+SzpyJbtcDzeqsu0wl1+0J+k8152R5xbBvVu6K+3vlWU
	 8H0/WJiQ/UOfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D9C6C53BD3; Sat, 16 Sep 2023 01:23:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sat, 16 Sep 2023 01:23:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217915-208809-iOaEN2afWl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

--- Comment #5 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Recompiled Arch kernel 6.5.3.arch1-1 with CONFIG_PCI_DEBUG=3Dy and then rep=
eated
above steps to create the attached dmesg output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

