Return-Path: <linux-usb+bounces-7620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE2874173
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 21:37:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D401C231A9
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 20:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB78F12E7F;
	Wed,  6 Mar 2024 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PmApm0DK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFAB1373
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 20:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709757452; cv=none; b=Wghiilal89Nyz4wr7DpfjeuTKlMkzRxkMlDJTFnmMjMvBpguWWXRKb3c6OjNngJrOOt2xm+K4N0w5uCLuyx+H8oTd0szihNjiReraC+895a3948wz740ECpFHmRgt8JTlY4pxtRTB2icGN5eeSaj3vSu+BXhdLHIXFkxwj/P9Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709757452; c=relaxed/simple;
	bh=piWR/wk6PEK58e2lGwA30alp4qzCJjfG5AgybpPWwUs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QZruOfwfoECT62DBYRor85SDkfyrPIvrF4wXmw1It5zzHUqpEvctAQ6k9KVL5VK069Ys4NtKChDGEPbus7kjCuK21bfQoJCxf0zjxzM8GR9NTfjWp6RjMOFW6FwJq8puSKuLnm8M1rYclhEB14g/5QSSdbeelmaa6rK0khwqu7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PmApm0DK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6042C433C7
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709757451;
	bh=piWR/wk6PEK58e2lGwA30alp4qzCJjfG5AgybpPWwUs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PmApm0DKvjYiersLRTXN3oQd5lK2v+M2WSru4D06RojzX4uF0lB8d8TAK2EGgTdq3
	 O9AjTtSRholGOOGeqSfkl+IwHXWDzyrH5lpviZI+x31ngAvvK3l9+MsuEQ/PVcJZwu
	 pMXKCX3Xelta5C2dP4IdvRoM7mpUHWIX25lREBw+RMY3R8DOd50MeT+73U8qutVIUR
	 E8M2VCT440Xm4Kx7P93hbj70mwRnjKYppT9tmKd4qhf+ffEK9Uv3osclyuqwen81wG
	 eXBSAyPcN4hYy/ZY3DUS3eWJSiKRAkdEsHr+Fuj+1h1h1E2o8FScsBe3kaUWFHZvz9
	 J7icYaYkXmI+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D02C3C53BD0; Wed,  6 Mar 2024 20:37:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Wed, 06 Mar 2024 20:37:31 +0000
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
Message-ID: <bug-218544-208809-QHDD7DzyvD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
The most obvious difference is that the "good" device requires only 85 us/f=
rame
for its audio-in channel whereas the "bad" device requires 234 us/frame.  T=
his
is the difference between 16-bit and 24-bit captures that you mentioned
originally.  (The 39 vs. 24 for the interrupt endpoint wouldn't have a
significant effect.)  There could be other factors in play, but that differ=
ence
is likely enough to tip the balance.

The times in the bandwidth file indicate that audio subsystem is using the
device's higher bandwidth setting.  Using the lower bandwidth setting inste=
ad
could well make a difference.  I don't know how to tell the sound interface=
 to
do this; maybe Takashi can say.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

