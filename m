Return-Path: <linux-usb+bounces-94-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8AC7A1107
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 00:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE24F282275
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 22:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C682598;
	Thu, 14 Sep 2023 22:32:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E0CEBC
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA2C3C433C8
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 22:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694730726;
	bh=b0ODSrkNE995mf93KxuTpTDW6gLYzZ1T4eCX7t5MzBA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dAgG5UGzDtp9l/+tzm3FAR/tlAN+LMxi5H2miOKw03sAahYAx7/eiBe7ZZbhKS2TY
	 1xKMoDNoCcqAogPhqbO7hgcYF/YSnZztlu+VxanWsSOYYAgNi5qac1G8lc18b/HvDF
	 KUDZOBvQ0+bw04QJ25FNLsCdg25aEfE4YhgInkYRL8zcoCKlCqM2HkPPh+pfU3Q24j
	 ST6irA/C60sPqtpCqZYQYUszj4/x9niufgeCzu1Y+eb4GUcxNYPwsAq5x7DuikQcR0
	 g2x7i20FUZqmvdv+hjvrU7uqMQO0YbRwAa1m+1VczCZD3e8nTnFQKDXVQXH7hdCufA
	 51xv9ylPorUxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ABD10C4332E; Thu, 14 Sep 2023 22:32:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Thu, 14 Sep 2023 22:32:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216728-208809-o4a4E98G9N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #40 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Created attachment 305110
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305110&action=3Dedit
thunderbolt.dyndbg=3D+p dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

