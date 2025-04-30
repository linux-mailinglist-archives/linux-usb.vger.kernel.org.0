Return-Path: <linux-usb+bounces-23566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41175AA42B9
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 07:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A127C466BBF
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 05:57:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAB61E5729;
	Wed, 30 Apr 2025 05:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9+NT5RR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F21E51E0
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 05:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745992627; cv=none; b=jEI30btV+R9FcvAfneqKYP+DolaEpMl6X7SsmR7UhJW314TSA3xflIkFqcb4En7qIW5kHy7rAEyc+lC20hsajM7EEsevrSh5wsCIkk6lpLewzJkYDfSGDY6z1dgv8+srISBkSXVsovDKpHXSIEik0CkTZ6kQrKl55SrsTHQm2/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745992627; c=relaxed/simple;
	bh=Gk1cIWe4gsRRfJBw7iPHFhfyPp3ZSbAxGL4cn/ggpwo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bvqCvXYqu0SyDSlv+e3G/GF9GaHO5JqGp8YJxDYdqkM0j6+y+ZManzUIAKVzzw0aujq7sk5ZKiWWr6+0GLZmQeOAJMyh/fh3lOaqrDtUc4dhzCbErFcmA6STT2DvZrZkiI1ORXp+WNb2fNo+x2jjGzm8GMhY4nn2qI7BYxqlY0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9+NT5RR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F40AC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 05:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745992626;
	bh=Gk1cIWe4gsRRfJBw7iPHFhfyPp3ZSbAxGL4cn/ggpwo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k9+NT5RRcDRFiJQEkTSHWTwiuUhT6VbB9UjdADrc0KD5ZZqfkmdqht11W8vCwoPeH
	 7e7LiPpyQcIW+QZ2T+h/sFpupN3BK939hvtgbRGroOT6ku3MdGqW8FC+y+JE/zmd6N
	 eG5sqHlR7CjCeD7v5l3rAnQODgWMY4lVIURkqkdEfeOUz5MziPgBT3/+b/n3kkEyx0
	 HVjQ938RVhtLB5nVSGKajxpo2doGqAO84ufYiR5+NT9wyc5S+IYNbrjrXPjE6I/RUN
	 zUy/ivmfDHxYJk9B6naAepuM79+/MHwHTQXgko3947DkatG2+rNC1HpPe4zk91iaHX
	 mJOrhzfjU+mZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 71B66C433E1; Wed, 30 Apr 2025 05:57:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 05:57:06 +0000
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
Message-ID: <bug-220069-208809-efelfi3kJE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #4 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #2)
> xhci_hcd 0000:6a:00.0: HC died; cleaning up
> xhci_hcd 0000:6a:00.0: xHCI host controller not responding, assume dead
> xhci_hcd 0000:6a:00.0: Abort failed to stop command ring: -110

If "abort failed" is what starts everything, this looks like a genuine case=
 of
hardware going bad for some reason, unlike the February "hc died" regression
which was a trivial driver bug and the HW worked as designed. This may be
harder to solve and HW specific, possibly including connected devices.

Actually, a regression could conceivably be caused by a change in some devi=
ce
driver. And distro regressions can also be caused by changes in kernel .con=
fig,
so you may want to ask them about that too.

> Regarding `dmesg` would you like a full output? The logs are... long.

Well, at the very least, it would be nice to see complete and unmodified ke=
rnel
log from the event you are complaining about ;) The snippet quoted above, f=
or
example, appears to be in reverse order and I don't know why. Timestamps can
useful too.

If you can't or don't want to post full kernel log (from boot to "hc died"),
please at least grep it for '0000:6a:00.0' since this will show PCI IDs of =
the
culprit chip and maybe some anomalies previously logged by xhci_hcd.


Going forward, does your system support dynamic debug and/or debugfs? Please
try:

echo 'module usbcore +p' | sudo tee /proc/dynamic_debug/control
echo 'module xhci_hcd +p' | sudo tee /proc/dynamic_debug/control

If this produces dmesg noise on a completely idle system, post a sample. If
not, you may leave it enabled (changing +p to -p disables it) and collect d=
mesg
with this debug info included next time something happens.

If you can mount debugfs and access /sys/kernel/debug/usb/xhci/0000:??:00.0
(all as root), please save a copy of that directory after the next crash but
before unbinding and rebinding the driver. This will contain information ab=
out
what the chip was doing when it went belly up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

