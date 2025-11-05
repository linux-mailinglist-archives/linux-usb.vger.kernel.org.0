Return-Path: <linux-usb+bounces-30116-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7BDFC37AB4
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 21:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B333A3725
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 20:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809BC346798;
	Wed,  5 Nov 2025 20:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZwZB1DT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C496E1E32D3
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 20:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373815; cv=none; b=V/42so3P9XM+8hPuOd751OKxyriuWRdIOgzCc5/wvd32BOicpjZewKiv4T89lVOboXZkapwBWMO0oguqYXwh6MGVV4laS46aY9EwIchcOD0bdfydrcQ0Wj3vONQviesUWujy0rWL4gJDGHKgGw0RFKe3jPh2cZu6wYv8s1jv+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373815; c=relaxed/simple;
	bh=GH6a6bz+dzVuiCyuQQDGGa55hsVGdy0pm8h6/IIKXh0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SCfmzk3/DZ8L/Pozz6WDRUSdYthYdDMDi2biOb+8TQgMxfrrAawr6jjQsRHTxt8e9IAHVo8XnqFl5V48j3brPSBFg+3QPSYOx1eMufGxCJErPyrKJQ5BpmANQ7I5RAjebeG+1vlEsdKOR56RvddwQYP/QdYYGe1Tt9nJSJ/1iyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZwZB1DT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 532AEC19423
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762373815;
	bh=GH6a6bz+dzVuiCyuQQDGGa55hsVGdy0pm8h6/IIKXh0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lZwZB1DTLAyL6f5UstOVssvFcgNqkCPjHreGzRMIUudbZlKvCSJWPJbGv0lu3SM+6
	 3AUVrQ3tpSPrBqE1Pt0P7i/hsiYCMED2f/MpFrHT3q+UnHXj8KfcVZJg0D+2abr/7X
	 mzPeQWgQqT5sRJYTIYdGpZtgSBEczoe17zbDUDZiZQDqzq+3fG+1hJTELFfV+M1xcF
	 ODFkwxk4L6XfCb61CsbK/MYTaqmPUK/xffeNxbiKy/tglwEsABM8ogdQ8c0kKbBUtf
	 b97+MyQNW5LhIr2eQJktzXw1wxl101a0m5OhSotapZs5P3MpqHhWP0aHu1TfFIAN4O
	 9VvVyVIbMKcDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D76FC433E1; Wed,  5 Nov 2025 20:16:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 20:16:54 +0000
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
Message-ID: <bug-220748-208809-vlEuxTaNp4@https.bugzilla.kernel.org/>
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

--- Comment #8 from Alan Stern (stern@rowland.harvard.edu) ---
Sorry, yes, urb->interval and urb->start_frame do get modified during
submission.  Drivers are allowed to read those fields before the URB comple=
tes.

The documentation from Intel is irrelevant.  It discusses the xHCI hardware,
but we're talking about the Linux software interface.

As for the considerations at the start of this bug report...  xhci-hcd is
indeed supposed to ignore urb->start_frame during submission and overwrite =
it
with the actual starting (micro)frame number.  And most of the time, xhci-h=
cd
is supposed to ignore URB_ISO_ASAP.  But it's not supposed to ignore
URB_ISO_ASAP in cases where the URB was submitted too late.  By "too late",=
 I
mean that at the time the URB was submitted, the (micro)frame that it should
have been scheduled for -- one period after the last frame of the preceding=
 URB
-- had already elapsed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

