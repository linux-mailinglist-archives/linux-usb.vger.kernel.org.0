Return-Path: <linux-usb+bounces-13258-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5E994C818
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 03:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28F77B22C84
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 01:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF68C125;
	Fri,  9 Aug 2024 01:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BS3Ja/sL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABA68801
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 01:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167510; cv=none; b=qFHA8Vpv84OtvI8NkC/zPSlJR4Kcj/mTysIX5UUcqCych7EoNaSe8PmEHnfQCOWsbryKePokk6loIdt9WfX+CRis2XQJoqEBd2sJWwWFuIgui1jLxgohPGJLPK3ou2N9480K8RoeotGhTuSu+14TRaLMdoyGG9yQdvnQ0LGcG1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167510; c=relaxed/simple;
	bh=E3U0Fad9jh0EeA9ezZGpAr0A1M9w6V44wrY0usCtEVg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eHe5ffb3tKofalkwpcX1TIlvZQpX8gXIRqRTsj7nIUq7HV6APhT3ugNErq3hlwDFO1lbANEpv9+3j/LLFT4aZD8GibQsbsW8EoOV6IKS//BTbzA8e4JDl30kL+BD9gcjrla75hmCPW5Y7a63pKTmMcYNwqlp+6n/VflCBTlHI8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BS3Ja/sL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BEAFC32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 01:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167510;
	bh=E3U0Fad9jh0EeA9ezZGpAr0A1M9w6V44wrY0usCtEVg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BS3Ja/sLSuWOUqEviDUBZxLyyyrafxufQuPETYCAKF+mZu7xioJAE1kBHpbE+MVkr
	 E7IEcx88R8eeR2PmFVOkm/dObVpg3kZ2FtMSdBC1UvJckbzLu8P+dp+3Gunz3CvWeI
	 RV+67aBi5Hd9L/hVtHNTti/w+oLGxppTQ0dZZVB1wgzNE2PpXhBykMP3z1stIQrigi
	 0/gad4WTUfzeyp7bZUkAWfvJltpMO5BAb98ggSHx8Z6hjWVVrjxY/4Z1pvkrcrL8zy
	 ewssdfSx2R35Er6gkOEXSP2FCkddaH7BISdqdmndWlAihXSUjVrSY3FKZImIK/p3I/
	 m42ZLCRBpWFog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4BE1CC53B50; Fri,  9 Aug 2024 01:38:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 01:38:30 +0000
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
Message-ID: <bug-219111-208809-KXwC96xvpP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #42 from Alan Stern (stern@rowland.harvard.edu) ---
"Unplug" is clear enough.  What do you mean by "restarting" the device?  Is
this something the kernel could do automatically?  Would a usbmon trace of a
restart show anything useful?

What happens if you restart the device while old_scheme_first is N?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

