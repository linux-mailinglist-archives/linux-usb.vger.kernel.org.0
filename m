Return-Path: <linux-usb+bounces-32269-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C29D191D7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9760E3018315
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52C8346AFC;
	Tue, 13 Jan 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="GM2dxYRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFFD277016
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311332; cv=none; b=dOVb7fAahVUXagJ4IRX45nXg1bantkNSrPewpNKZDvBEP4H8IcuOWNI41yoBkh0eX0f/LxGJKjm2+rdh6tVCKFmSL6s7EBwwQl7HK4sug7vnqjfzfp4vkA4pO6PN1JmMoy/ZP0JI9Jc60wsakh0oyxfXtqczX2E/1V5NxX5x4ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311332; c=relaxed/simple;
	bh=Xu+48D12Ip8cxUcIsq3mQuwCnmB/jj1Cb1xnrNfeWG0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=LWA7zL4AMuDSPwxIJJhktkhgf8NMwEMH2HqBttQpIm6fbPcsU6TdyBzMGtd+ALrmejqAMSSgyMVgPrcUOsw4DS6/AHpSx3/6KX/7uzzGQAy+7ElB75OGR6TBbmf7Ee4Amxw/mLyfQxHR3ejxG4Dg8J60b94n0vYpvvQSHV97qlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=GM2dxYRg; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1768311325;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNg4cyT1A0ryDNTVCyPuutdiB+nl1aw6BVDcivrghy0=;
	b=GM2dxYRgIHXk5rZMhppWsCyjt8xs9WYbjKprfP4glFV4bFYvUA1t/l2gn7RXXWJ6sQNdxE
	gXf3zXWVi2SQfCzL8Gm9CohcNZ878PPsd5j767Xzp7CbhmzcXTq+lJwOskc1TTo1bLTSw3
	Ec5/Hm/YnCJ4/t1lxo+DYAkADgs0dNLfKgqV1V7ZsbnB8YHb5YBpr1oIrx8Xy4bQOTSKuu
	5apfcyVYwKhvAOSSJQ8ee0zqIo2yGOg9RRm1Xk6wfB8F+INOhyGG1JKnZPPYA11m7hLKU5
	naJUdgDXB3YbX+w7kxx+J+ZhPd8FO3f7huV2AjL0uhH+rORrFsHju8ZEDkTuXA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Jan 2026 14:35:21 +0100
Message-Id: <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Alan Stern" <stern@rowland.harvard.edu>
Cc: "USB mailing list" <linux-usb@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
In-Reply-To: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
X-Migadu-Flow: FLOW_OUT

On Sat Jan 3, 2026 at 5:52 PM CET, Alan Stern wrote:
> On Sat, Jan 03, 2026 at 12:00:13PM +0100, Diederik de Haas wrote:
>> On Wed Dec 31, 2025 at 7:09 PM CET, Alan Stern wrote:
>> > I can't say anything specific about your systems without a lot more=20
>> > information.  However, I suspect that any problems you are running int=
o=20
>> > are not related to that warning.
>>=20
>> What kind of information do you need?
>
> We can start with the output from "lsusb -t" as well as the dmesg log=20
> from a boot in which something (a USB-2 port, for example) didn't work. =
=20
> If the log shows something going wrong when you plugged in a device=20
> after boot, explain what you did, what happened, and what was wrong.
>
> For now, concentrate on just a single system.

I was almost ready to declare 'issue fixed' when I actually did notice
the issue on a Quartz64-B (RK3566). For 'reasons', that may not be the
best test subject. Then I was preparing to test some media patches and
prepared my Quartz64-A (also RK3566), which is usually online 24/7.

Plugged in my keyboard adapter in the top USB2 port and that worked.
Installed some packages to make the graphical environment match that of
my other test devices and rebooted.
Got my (gtkgreet) login screen and plugged in my keyboard adapter in the
*bottom* USB2 port ... and that did NOT work.

Logged in via SSH and noticed it was indeed not listed in ``lsusb``.
Checked ``lsmod`` and ``dmesg | tail`` ... and noticed the kernel *did*
notice plugging in the keyboard adapter, so did ``lsusb`` *again* and
then it *did* list my keyboard adapter.
I did NOT employ my usual 'workaround' by plugging it into a USB3 port.

So it may be that it would have always worked ... eventually ... if I
had just waited long enough?
While 'dmesg' seems to suggest it took little over 0.5 seconds, I'm
really not that fast ;-P (or that impatient)

Full log:
https://paste.sr.ht/~diederik/34847f5c6873f1fc8d32eeb79f2bf2ff9dd4570c

Cheers,
  Diederik

