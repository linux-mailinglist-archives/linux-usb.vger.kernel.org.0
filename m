Return-Path: <linux-usb+bounces-11616-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AB8915ED9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 08:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 673D9282EE6
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 06:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBBD146006;
	Tue, 25 Jun 2024 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ridPjmwv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53964143889
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719296558; cv=none; b=VpNk+f1WroML/13p/pkSOxWXQ1kO9HVlOnzc9jrpijbnND0CMVDlbCVxxjF88dOhFXqyTofVEAPZJL16XD4AY/Ct+DhEZGgjvGozjJKEe4DJ8mbfaoHzPQc30Zc6wY0pb/RPF4laVsshee5VEPiv92ZMW+CPvO47ey8q1Fiz1vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719296558; c=relaxed/simple;
	bh=LDhCz3EezznKRWBrOaP+glB3YtmcAfXCLfL3/fo+LWM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n/+wFrWCAboiwBkC+HWBaLCd31i5RCH70mfkJZSFDQJAOB5DkcyVgKbjiNIihbobjnwcyT+VeqdddtphPUXPomfsiRFyf7dj987r9lF7GXw2+SQdr2S6AjegSTYIas2qrEMNOY+GdmniogUkwSRWUngkWP680FbsD5X/CVDfM00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ridPjmwv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA571C32781
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 06:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719296557;
	bh=LDhCz3EezznKRWBrOaP+glB3YtmcAfXCLfL3/fo+LWM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ridPjmwvA3SKVwYirHT7SV3XtH/gQtajTuc2BAgClYAduZshH17Z2XKveyRjSa5gX
	 iJ75SHy/hd8Q00m/obb/X6VN7fKtJoPFTxoTjEaywXGu/BcE9y3dhydGe3qxm5dZsD
	 Fbl0tiYpYi8kFPVZ1Ig4VuENDc/5gzx/pNax1ozbqKvZawDeXp6Ol26aLf/mHujrh9
	 R9EXJQjtULVgYrL15PukZaqLbqooncHRoQviHjBzIqDaCDgZRxALkTdAm/eFn3A9h8
	 LnaKOyR+75vy8oNF4gCynFLxwExyqBYHzRZgKPQSO5BlzQWTnFHe3Plr4jXNfIEAao
	 ZtC5TKyW6YROw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C693CC53BB7; Tue, 25 Jun 2024 06:22:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218977] new dtb break orangepi's usb gadget
Date: Tue, 25 Jun 2024 06:22:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plusls@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218977-208809-NjsXzUp3hd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218977-208809@https.bugzilla.kernel.org/>
References: <bug-218977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218977

--- Comment #2 from plusls (plusls@qq.com) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #1)
> You are unlikely to reach the right people here. Best to write a mail to
> Andre Przywara <andre.przywara@arm.com>, who authored that commit; ideally
> do so as a reply to
> https://lore.kernel.org/all/20221110005507.19464-1-andre.przywara@arm.com/
> while keeping the list of recipients.

Thank you for your reply, I will write a mail to the author later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

