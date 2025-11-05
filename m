Return-Path: <linux-usb+bounces-30119-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9A2C37FF7
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 22:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3308F3B6274
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 21:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 171692652A2;
	Wed,  5 Nov 2025 21:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrX/G+HA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2323F424
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 21:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762377509; cv=none; b=mKFAnrJYZTKy2FfGLKx5QLbaMJ6woQGal+tFL20Caf/mnG8e6Co05E685Xvf5qEgboZ4ShCG6vlrm30tT31XYEScoHgV/Ml2TTS8qKAQS0UOzsX2kCcnOHfzoIFXYaa2+dyFUD+per30hHXZpmhZjhPi/vWpM8p7zeCFbPzjVvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762377509; c=relaxed/simple;
	bh=jgJanJDq/uAJzRdZnbfYOBZ0uvfGpBdHGQ0qW3pMLSE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pTVRXzGZ+XAqLMj2TuKoE67ff2bfC0vF1mxk3bFAcmDrEewBrqWNNH5n2X2VkMScsUAHXpEJHxvAPCj9mnK7b+BsZKsYx23AY8hTCcR7CebHAx8YzJawDBOetC7/5uo/HEuHQVjZETMboSTY3n9+dV6V9Hd7Ql8sXj7k0IF4t2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrX/G+HA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32E3AC4CEF5
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 21:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762377509;
	bh=jgJanJDq/uAJzRdZnbfYOBZ0uvfGpBdHGQ0qW3pMLSE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PrX/G+HAY0ofvPabjQ6oixReYlx5GsRhAEoI+rWPfgodLqO+SKqIwLA6decN0/FNn
	 0rs2MVfIMnl5UmQ/mi1kpxbJiIHLac1S6oZh9bsq3+dqJ5toOfcsvcXVhTXJZvZoZp
	 cnDy5ULJ2sm3tK1e0Df5ga2ScEJm3hNPDNgdTsfZSsqhZafKNoDudfjxVFcE+WMH4l
	 FNQIkG+hknIDWRyBXVuGdgC4VtWjXOtqB5Q9UGuM0GmnEFr9TB2dtfV8rAfHWl9MQ9
	 gcZb6RIbTAhjdn9JIZOCULZdHrv+5QJdf8sf9Joq7TfHk4jvbZMTsz5lII++w36+3a
	 MdKWyDqvtrW1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2C3E8C433E1; Wed,  5 Nov 2025 21:18:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 21:18:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-GIZLDrcqdD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #9 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Thanks Alan, that's good to know, because Documentation/ is horribly out of
date and the kerneldoc doesn't really say that this field is ignored as inp=
ut.

(Also, it says that if the whole URB is already expired, it would fail to
submit, but this behavior was apparently later changed to completing with
-EXDEV).

After a bit of digging, I see that urb->start_frame and URB_ISO_ASAP used to
actually work the intuitive way on UHCI in early 2000s, but then EHCI began=
 to
act as if ASAP is always set, xHCI got the same behavior, UHCI was converte=
d to
EHCI behavior, and ASAP got a new and different meaning.

So today it is unrealistic to expect host controller drivers to respect
start_frame, class drivers aren't setting it to anything meaningful, and the
patch I suggested earlier would likely break some class drivers unless a new
flag separate from URB_ISO_ASAP is added to force using the requested
start_frame.

I still wonder if providing means of overriding the polling interval wouldn=
't
be easier overall (less changes to snd-usb-audio required to support this n=
ew
HW).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

