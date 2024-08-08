Return-Path: <linux-usb+bounces-13243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC2494C43D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 20:22:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA51B1C2087D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 18:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3472147C86;
	Thu,  8 Aug 2024 18:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmb/QZz3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A3C140369
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 18:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723141361; cv=none; b=kfqxYN7tHhE4uUuM3ivk8+fJHG0mWFVK0gpHnAjk86Fsft0asjaUmxhM8wJ7O+9T1YEBTVBPUJEuSzs85i0x+3pHxtziG7icNfQxudxeZ4HLPpc2OK+2zcvf4tmVCHrxVtVMR24trtHcX1H4ESU1j47oypF+CC9xkf0v2jZzDhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723141361; c=relaxed/simple;
	bh=E8DRfzFbpN/N83PBp4f4/es+HZsC7cEmbH1lA/2uT+0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pWXx+mi8Q/r90tK+hKe+J5uQbrU93eEqREBW1H5ayElYMqp9UNfqEcvZtXlFPdjMaGgLbB8LwnEVGRUb/bML6myIE1JhQzdjSI7bbssSAgahIxUu/H6f7TmSflYeacXnntlunOilL0GHcEYlfDPkY4/9UVJ+bqzNiBzbC72Pxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmb/QZz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2C93C4AF10
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 18:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723141360;
	bh=E8DRfzFbpN/N83PBp4f4/es+HZsC7cEmbH1lA/2uT+0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bmb/QZz3m49uz1/crxaN06C3lzyEKe1qEgdSOlUtOPXhutnNwXGFs4KpTPg5gM2Xd
	 +RCCYzUg4cMTDBP8TzqcDQkSl+2YjiXnH2CjkcjJkoxIQY+S+fIaR1RrryssISyMPj
	 +wgRfXQz16TS8wxWhGNbEUq7shEUrH/4WvojebSYtkPce2kIPQnakXR2D0GYL0b9s7
	 jBo0bRvFD0XiC5wYUcQ3AbXyhwDd4Rf1D7dNNsGvfqEk9FWIiiuDrvODThELEatsR+
	 zXTliB7Cq2eygq2weYxt8FVSA7h6OI0nHKV8Sq6Re6v5wOrYMjftv0PpEpQrb5nHee
	 AOR2koV//ZoiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE60DC53B73; Thu,  8 Aug 2024 18:22:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Thu, 08 Aug 2024 18:22:40 +0000
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
Message-ID: <bug-219111-208809-gn1ERFC4L8@https.bugzilla.kernel.org/>
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

--- Comment #38 from Alan Stern (stern@rowland.harvard.edu) ---
It's more than just the driver knowing what configuration to use.  The devi=
ce
has to be _told_ to use that configuration; until it is told it won't use a=
ny
configuration at all and won't function.  Your usbmon traces and Windows pa=
cket
captures all show the computer telling the device to use configuration 1.  =
(If
you made a usbmon trace with old_scheme_first=3DY, presumably it would show=
 the
computer telling the device to use configuration 2.)

The configuration matters because the data sent over the USB connection is
formatted differently depending on the number of channels.  No matter what =
the
driver may know about the possible configs, as long as the device is using
config 1, it will provide only two-channel stereo.  And as long as it is us=
ing
config 2, it will provide only four-channel stereo.

The difference between the old scheme and the new scheme is rather technica=
l.=20
It has to do with how the device is initialized when it is first plugged in
(and also whenever it gets reset).

With the old scheme, after performing an initial reset the computer asks the
device to send just the first 8 bytes of its device descriptor, then the
computer tells the device what address to use, and then it reads the comple=
te
device descriptor and all the other descriptors.

With the new scheme, after performing the initial reset the computer asks t=
he
device to send the first 64 bytes of its device descriptor.  Since the devi=
ce
descriptor is only 18 bytes long, the response is always a short one.  The
computer then resets the device a second time, tells it what address to use,
and reads all the descriptors.  (That's why I thought skipping the second r=
eset
might cause the device to make both configurations available, like it does =
with
the old scheme.)

The old scheme is what the USB 2.0 specification recommends.  The new schem=
e is
what Microsoft implemented early on, however, and as a result quite a few
devices would work with the new scheme but not the old one.  In theory any
device should work properly with either scheme, but in practice they don't
always do so.  As in this case.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

