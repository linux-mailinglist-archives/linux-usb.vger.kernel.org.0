Return-Path: <linux-usb+bounces-29979-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EC4C29250
	for <lists+linux-usb@lfdr.de>; Sun, 02 Nov 2025 17:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9762F188CF21
	for <lists+linux-usb@lfdr.de>; Sun,  2 Nov 2025 16:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0341C22B584;
	Sun,  2 Nov 2025 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b="mGw8Zo36";
	dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b="qDBPK3ex"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.tty42.de (mail.tty42.de [94.130.190.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD589224F3
	for <linux-usb@vger.kernel.org>; Sun,  2 Nov 2025 16:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.130.190.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762101555; cv=pass; b=tHvj59qgiiwEnT4hDcI3LkQu26eFTNnPfAuJftbckvBKWAep4i3ifpFhmWSEcbxvHWBvRna2BRGIwMd0B0D1y1xOgvn3O1KxfAA/VuCFx//6+uMRT4RgQiaVkUAWfr5vn8Z3rosPvoRIxfjsakEz0H40VnDbSZD4l/ycw5icjvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762101555; c=relaxed/simple;
	bh=SPS1R2qMbgEiTGlDqR8evgzjxG5nX47ycasAPgbCYkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MAUelf1cFQ0GNwGOZhfn8zhSU2teNXn3GhasC0XK7BN8BYBKAQCOzCnx9uLXRTXmdv1Q4JKHIyEa4X56Sb+EiIbA8D86pIiAMO1Y/0haOVG1l/mDtFyHCIVv01WA/mmHrMff2jeYoYyRBn/joSvJhYHwz92f6TuBGNCkLQGMmFM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de; spf=pass smtp.mailfrom=tty42.de; dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b=mGw8Zo36; dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b=qDBPK3ex; arc=pass smtp.client-ip=94.130.190.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tty42.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de; s=rsa;
	t=1762097948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AQ9RN7oaL72mEqmkR+lMG1kqnrzeAY6MZVNe7fkeW7M=;
	b=mGw8Zo368o/alD/WImRHmoeKKi19OLUPYPF+a+nVP8aZ/q52DIHpyW4N1WZQ1gzd0666W+
	J6ooxvJYd2ZMCJTshimx1J3ZXMo7d/dUCoNJ+Qndetp9+jOzwzOpf5GT4KoxzhTiRke/EA
	eQQ0PXqI0CBM4ebsZrHbaFA+ALMqCKmDDEDKPHyBY5tAN5O2R2QB0TbjiAUErcKucaARIo
	MVK3vjXQJUJrzzghTXf2WFmakT1SQNryutovcbag+WfTm4xr3AFxy3zepv1sm+8ROmkPvY
	i69qF381hD+DJKEzNDmhz6E417Deb5nEclNwPo7stJIQQ45kcBN9YRT/9w7tcw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tty42.de;
	s=dkim; t=1762097948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AQ9RN7oaL72mEqmkR+lMG1kqnrzeAY6MZVNe7fkeW7M=;
	b=qDBPK3exOuIUwDj1D+T0eFlFZ8IMIefF5ql29rywH9QtgnfbpVMPgOkcyZ/zcnJtMp2uIC
	M7LN3R/CKCNXStAg==
ARC-Seal: i=1; s=rsa; d=tty42.de; t=1762097948; a=rsa-sha256; cv=none;
	b=xDIOv1iEEhM6PP4m2xhiL56scQly7dMLlvuUPONQfWnOMT+dtQzi34E96d82FB2if0soel
	WbV/Id8futFIvAIAFxy8NpGFsrFkNv1jwlHJjaof1Il56yQibMaUeDbHjqewXgaop99MIZ
	Nb+R4n89BmE6rrAWMYdn15hMrT2lGMjEYJuN+0Y5opIHxg93FSU42z63Jih20B0UcD4yXp
	quoxV/xpIIvEGmP58dgArEyEBHTKwkkb/pX4AIBa+yhkT5GWfFxVM6z4KTk5ioEJSEYWRz
	77211SsaVqKfcn8siygicAGkHW2d2oCdEA9JiMR0UT8m4/WE3EsHFioIq05tqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de;
	s=rsa; t=1762097948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=AQ9RN7oaL72mEqmkR+lMG1kqnrzeAY6MZVNe7fkeW7M=;
	b=UiF0xf1SUUvJ2NLrXwnyUEX2bzlYJkxcK5PYJeBvk/x4CXPtDZIJsXiRHNotamZ5DV4DfI
	MluYOe2fXJkcUYLs8cAlFJWs9M3z8nIrrIv/nHtyZhxnYiz0J1i/O/uYmrQNIUzPH+KAnW
	mz7JEULh1UIAduaHFYS1Jh7IEqPqOytJHN2e0HfXAcTcKclWrTf6tQImU+vPgMo/il4UYR
	RUDZWcXxVLu1WmuifwR8MRzwP5yCKXBh/LHDtV49gZM6GoaIgx8p7tWpHIpzLbs/x+W7tv
	XTo2UNn2L9CpLShpKShdfiox0ZNXM9UAuD6DJjNXkdP14ofyhDy+zy1YOr67uA==
ARC-Authentication-Results: i=1;
	mail.tty42.de;
	auth=pass smtp.auth=frederik@tty42.de smtp.mailfrom=lists@tty42.de
Received: 
	by mail.tty42.de (OpenSMTPD) with ESMTPSA id 01d89ba0 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 2 Nov 2025 15:39:08 +0000 (UTC)
Date: Sun, 2 Nov 2025 16:39:07 +0100
From: Frederik Schwan <lists@tty42.de>
To: linux-usb@vger.kernel.org
Cc: Andreas Noever <andreas.noever@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>
Subject: TB 5 Dock DP-Out non-functional
Message-ID: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
Mail-Followup-To: linux-usb@vger.kernel.org, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ktwojdhv27toua2w"
Content-Disposition: inline


--ktwojdhv27toua2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello linux-usb,
Dear Thunderbolt driver maintainers,

I just tried to swap my TB 4 setup with TB 5 hardware.
USB devices and power supply works as expected. Displayport does not.

Setup:
TB 5 Host (Lenovo P1 Gen8)
  -> TB 4 Dock (0108:2031 reports as "ThinkPad Thunderbolt 4 Dock")
    -> USB Devices, two 3840x2160, LAN attached
  -> TB 5 Dock (0108:234d reports as "ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA")
    -> nothing but power supply

Now I just move one of the dp cables from the TB 4 dock to the TB 5 dock and best thing I can get is a quick flicker
with a good signal but from then the monitor is black turning on and off continuously (seems to get a signal that collapses instantly).

I attached the dmesg debug log for this scenario.

This also happens if I use the TB 5 dock alone (with all USB stuff attached) but the behavior is way more inconsistent, with some monitors not coming up
at all or loosing signal after a few seconds.

I have no clue if this is the right list to report, I'm happy to report this to the drm subsystem if I'm wrong here :)

Best regards,
Frederik

--ktwojdhv27toua2w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tb5.log"

[Nov 2 16:09] thunderbolt 0000:8a:00.0: acking hot unplug event on 3:14
[  +0,000111] thunderbolt 0000:8a:00.0: 3:14: DP OUT resource unavailable: adapter unplug
[  +0,000006] thunderbolt 0000:8a:00.0: 0:13 <-> 3:14 (DP): deactivating
[  +0,000779] thunderbolt 0000:8a:00.0: deactivating Video path from 0:13 to 3:14
[  +0,000755] thunderbolt 0000:8a:00.0: 3:1: adding -18 NFC credits to 18
[  +0,000111] thunderbolt 0000:8a:00.0: deactivating AUX TX path from 0:13 to 3:14
[  +0,000784] thunderbolt 0000:8a:00.0: deactivating AUX RX path from 3:14 to 0:13
[  +0,001048] thunderbolt 0000:8a:00.0: 0:13: detached from bandwidth group 1
[  +0,002719] thunderbolt 0000:8a:00.0: 0: released DP resource for port 13
[  +0,000003] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000378] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000301] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000158] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/36000 Mb/s
[  +0,000243] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +0,000001] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[  +0,000047] thunderbolt 0000:8a:00.0: 0:13: DP IN available
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13: no suitable DP OUT adapter available, not tunneling
[  +0,000145] thunderbolt 0000:8a:00.0: 0:14: DP IN available
[  +0,000000] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter available, not tunneling
[  +1,730897] thunderbolt 0000:8a:00.0: acking hot plug event on 3:13
[  +0,000280] thunderbolt 0000:8a:00.0: 3:13: DP OUT resource available after hotplug
[  +0,000008] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[  +0,000142] thunderbolt 0000:8a:00.0: 0:13: DP IN available
[  +0,000185] thunderbolt 0000:8a:00.0: 3:13: DP OUT available
[  +0,017354] thunderbolt 0000:8a:00.0: 0: allocated DP resource for port 13
[  +0,000007] thunderbolt 0000:8a:00.0: 0:13: attached to bandwidth group 1
[  +0,000741] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: available bandwidth for new DP tunnel 34650/34650 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): activating
[  +0,000820] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000250] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation mode supported
[  +0,000966] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000256] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): maximum bandwidth through allocation mode 8100 Mb/s x4 = 25920 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): granularity 250 Mb/s
[  +0,000255] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): estimated bandwidth 34650 Mb/s
[  +0,001663] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation mode enabled
[  +0,000001] thunderbolt 0000:8a:00.0: activating Video path from 0:13 to 3:13
[  +0,000002] thunderbolt 0000:8a:00.0: 3:1: adding 18 NFC credits to 0
[  +0,000253] thunderbolt 0000:8a:00.0: 3:1: Writing hop 1
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:  In HopID: 10 => Out port: 13 Out HopID: 9
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
[  +0,000000] thunderbolt 0000:8a:00.0: 3:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000252] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 9 => Out port: 3 Out HopID: 10
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000125] thunderbolt 0000:8a:00.0: Video path activation complete
[  +0,000000] thunderbolt 0000:8a:00.0: activating AUX TX path from 0:13 to 3:13
[  +0,000127] thunderbolt 0000:8a:00.0: 3:1: Writing hop 1
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:  In HopID: 11 => Out port: 13 Out HopID: 8
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000000] thunderbolt 0000:8a:00.0: 3:1:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 3:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000253] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 8 => Out port: 3 Out HopID: 11
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counter index: 2047
[  +0,000000] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000125] thunderbolt 0000:8a:00.0: AUX TX path activation complete
[  +0,000000] thunderbolt 0000:8a:00.0: activating AUX RX path from 3:13 to 0:13
[  +0,000127] thunderbolt 0000:8a:00.0: 0:3: Writing hop 1
[  +0,000001] thunderbolt 0000:8a:00.0: 0:3:  In HopID: 10 => Out port: 13 Out HopID: 8
[  +0,000001] thunderbolt 0000:8a:00.0: 0:3:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:3:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 0:3:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:3:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000254] thunderbolt 0000:8a:00.0: 3:13: Writing hop 0
[  +0,000000] thunderbolt 0000:8a:00.0: 3:13:  In HopID: 8 => Out port: 1 Out HopID: 10
[  +0,000001] thunderbolt 0000:8a:00.0: 3:13:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 3:13:    Counter enabled: 0 Counter index: 2047
[  +0,000000] thunderbolt 0000:8a:00.0: 3:13:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 3:13:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000126] thunderbolt 0000:8a:00.0: AUX RX path activation complete
[  +0,000644] thunderbolt 0000:8a:00.0: 0:14: DP IN available
[  +0,000123] thunderbolt 0000:8a:00.0: 3:13: DP OUT in use
[  +0,000000] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter available, not tunneling
[  +0,005509] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): DPRX capabilities read completed
[  +0,000315] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
[  +0,000013] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000368] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000512] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
[  +0,000145] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000494] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
[  +0,000006] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/18720 Mb/s
[  +0,001017] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000658] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000006] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000101] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000004] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +3,085528] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 00
[  +0,268467] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000041] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
[  +0,000311] thunderbolt 0000:8a:00.0: 0:13: DPTX enabled bandwidth allocation mode, updating estimated bandwidth
[  +0,000012] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000006] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000876] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000126] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000255] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000131] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
[  +0,000406] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000361] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000514] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
[  +0,000125] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000517] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/17280 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/18720 Mb/s
[  +0,001006] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000014] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000632] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000009] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000006] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +0,000011] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
[  +0,000360] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 8500 Mb/s
[  +0,000513] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/17280 Mb/s
[  +0,000382] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/8500 Mb/s
[  +0,001797] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/8500 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000821] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000725] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000309] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000273] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
[  +0,000383] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
[  +0,001024] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000673] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000006] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +3,217408] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 04
[  +0,828792] thunderbolt 0000:8a:00.0: acking hot plug event on 1:12
[  +0,000123] thunderbolt 0000:8a:00.0: 1:12: DP OUT resource available after hotplug
[  +0,000005] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[  +0,000119] thunderbolt 0000:8a:00.0: 0:13: DP IN in use
[  +0,000146] thunderbolt 0000:8a:00.0: 0:14: DP IN available
[  +0,000127] thunderbolt 0000:8a:00.0: 3:13: DP OUT in use
[  +0,000128] thunderbolt 0000:8a:00.0: 1:12: DP OUT available
[  +0,000641] thunderbolt 0000:8a:00.0: 0: allocated DP resource for port 14
[  +0,000002] thunderbolt 0000:8a:00.0: 0:14: attached to bandwidth group 2
[  +0,000765] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000643] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000638] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000384] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000001] thunderbolt 0000:8a:00.0: available bandwidth for new DP tunnel 31500/103500 Mb/s
[  +0,000005] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): activating
[  +0,000745] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DP IN maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DP OUT maximum supported bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000256] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation mode supported
[  +0,001023] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): non-reduced bandwidth 8100 Mb/s x4 = 25920 Mb/s
[  +0,000258] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): maximum bandwidth through allocation mode 20000 Mb/s x4 = 77575 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): granularity 500 Mb/s
[  +0,000253] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): estimated bandwidth 103500 Mb/s
[  +0,001665] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation mode enabled
[  +0,000007] thunderbolt 0000:8a:00.0: activating Video path from 0:14 to 1:12
[  +0,000003] thunderbolt 0000:8a:00.0: 1:1: adding 6 NFC credits to 0
[  +0,000246] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 10 => Out port: 12 Out HopID: 9
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000251] thunderbolt 0000:8a:00.0: 0:14: Writing hop 0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:14:  In HopID: 9 => Out port: 1 Out HopID: 10
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Weight: 1 Priority: 1 Credits: 0 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:    Counter enabled: 0 Counter index: 2047
[  +0,000000] thunderbolt 0000:8a:00.0: 0:14:   Flow Control (In/Eg): 0/0 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000125] thunderbolt 0000:8a:00.0: Video path activation complete
[  +0,000001] thunderbolt 0000:8a:00.0: activating AUX TX path from 0:14 to 1:12
[  +0,000126] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 11 => Out port: 12 Out HopID: 8
[  +0,000000] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  +0,000000] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000254] thunderbolt 0000:8a:00.0: 0:14: Writing hop 0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:  In HopID: 8 => Out port: 1 Out HopID: 11
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000000] thunderbolt 0000:8a:00.0: 0:14:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000156] thunderbolt 0000:8a:00.0: AUX TX path activation complete
[  +0,000020] thunderbolt 0000:8a:00.0: activating AUX RX path from 1:12 to 0:14
[  +0,000826] thunderbolt 0000:8a:00.0: 0:1: Writing hop 1
[  +0,000004] thunderbolt 0000:8a:00.0: 0:1:  In HopID: 10 => Out port: 14 Out HopID: 8
[  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000002] thunderbolt 0000:8a:00.0: 0:1:    Counter enabled: 0 Counter index: 2047
[  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Flow Control (In/Eg): 1/0 Shared Buffer (In/Eg): 0/0
[  +0,000001] thunderbolt 0000:8a:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000310] thunderbolt 0000:8a:00.0: 1:12: Writing hop 0
[  +0,000006] thunderbolt 0000:8a:00.0: 1:12:  In HopID: 8 => Out port: 1 Out HopID: 10
[  +0,000002] thunderbolt 0000:8a:00.0: 1:12:   Weight: 1 Priority: 2 Credits: 1 Drop: 0 PM: 0
[  +0,000002] thunderbolt 0000:8a:00.0: 1:12:    Counter enabled: 0 Counter index: 2047
[  +0,000002] thunderbolt 0000:8a:00.0: 1:12:   Flow Control (In/Eg): 1/1 Shared Buffer (In/Eg): 0/0
[  +0,000003] thunderbolt 0000:8a:00.0: 1:12:   Unknown1: 0x0 Unknown2: 0x0 Unknown3: 0x0
[  +0,000035] thunderbolt 0000:8a:00.0: AUX RX path activation complete
[  +0,004199] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): DPRX capabilities read completed
[  +0,000302] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
[  +0,000012] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000628] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000354] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000292] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
[  +0,000367] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000125] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000402] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/44580 Mb/s
[  +0,001023] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000639] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000004] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000891] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000651] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000365] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000125] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000263] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000124] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000147] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
[  +0,000365] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000398] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000899] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
[  +0,000111] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000909] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/8500 Mb/s
[  +0,000021] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
[  +0,001012] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000615] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000006] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000004] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000137] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000005] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +2,246846] i915 0000:00:02.0: [drm] *ERROR* Failed to get ACT after 3000 ms, last status: 04
[  +0,003041] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000031] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
[  +0,000330] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 0 Mb/s
[  +0,000639] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/8500 Mb/s
[  +0,000384] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/0 Mb/s
[  +0,000010] thunderbolt 0000:8a:00.0: group 1 reserved 8500 total 8500 Mb/s
[  +0,001816] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/0 Mb/s
[  +0,000008] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000004] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000808] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000662] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000362] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000147] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000257] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000149] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
[  +0,000382] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000477] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,001078] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000050] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000910] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000008] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
[  +0,001011] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000962] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000004] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000157] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +0,019318] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000022] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
[  +0,000332] thunderbolt 0000:8a:00.0: 0:14: DPTX enabled bandwidth allocation mode, updating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000903] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000632] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000382] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000255] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
[  +0,000409] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000367] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000894] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000891] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000010] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
[  +0,001012] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000648] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000009] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000878] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000641] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000384] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000130] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000009] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
[  +0,000373] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000637] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000383] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
[  +0,000393] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000121] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000384] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/25920 Mb/s
[  +0,000005] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/44580 Mb/s
[  +0,001019] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000005] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +0,000008] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
[  +0,000368] thunderbolt 0000:8a:00.0: 0:14: requested bandwidth 0 Mb/s
[  +0,000776] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocated currently 0/25920 Mb/s
[  +0,000340] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): corrected bandwidth request 0/0 Mb/s
[  +0,001967] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation changed to 0/0 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000819] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000108] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000259] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000147] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000110] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
[  +0,000399] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000894] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,001386] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000007] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/27500 Mb/s
[  +0,001000] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000660] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000004] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000886] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000639] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000109] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000161] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000369] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000110] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000166] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000003] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
[  +0,000362] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000778] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000382] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000767] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/70500 Mb/s
[  +0,001023] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000702] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000023] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,509004] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000022] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocation request, retry 0
[  +0,000362] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 12500 Mb/s
[  +0,000555] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocated currently 0/0 Mb/s
[  +0,000385] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): corrected bandwidth request 0/12500 Mb/s
[  +0,000768] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000383] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000253] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000130] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth available for allocation 34650/26150 (+ 8500 reserved) Mb/s
[  +0,001688] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000361] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,002212] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000146] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000963] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000004] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
[  +0,001021] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000580] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): bandwidth allocation changed to 0/12500 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,001966] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000656] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000384] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000109] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000146] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
[  +0,000383] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000895] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000897] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
[  +0,001021] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000894] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000130] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
[  +0,000384] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000638] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000385] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000769] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/0 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/70500 Mb/s
[  +0,001026] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000637] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done                                                                                                                                                                          [  +0,761329] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification on 0
[  +0,000012] thunderbolt 0000:8a:00.0: 0:14: handling bandwidth allocation request, retry 0
[  +0,000341] thunderbolt 0000:8a:00.0: 0:14: requested bandwidth 12500 Mb/s
[  +0,000688] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocated currently 0/0 Mb/s
[  +0,000337] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): corrected bandwidth request 0/12500 Mb/s
[  +0,000768] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000385] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000002] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth available for allocation 31500/103500 (+ 0 reserved) Mb/s
[  +0,001699] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000604] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000430] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000141] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000770] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
[  +0,001026] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000637] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000006] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): bandwidth allocation changed to 0/12500 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000002] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[  +0,000885] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000385] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000113] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000256] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000144] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000112] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 26150 (+ 8500 reserved) = 34650 Mb/s
[  +0,000400] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000383] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000895] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000112] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000912] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/15000 Mb/s
[  +0,001022] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000639] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000892] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000626] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000654] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000112] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000143] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000390] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000111] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000142] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000007] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
[  +0,000376] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000114] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000783] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000113] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000782] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
[  +0,001020] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000641] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000003] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[  +9,075811] thunderbolt 0000:8a:00.0: group 1 released total 8500 Mb/s
[  +0,000005] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-calculating estimated bandwidth
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 1
[Nov 2 16:10] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 220/220, scale 0
[  +0,000577] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000464] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000096] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000282] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000127] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): consumed bandwidth 1350/1350 Mb/s
[  +0,000037] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): re-calculated estimated bandwidth 34650 (+ 0 reserved) = 34650 Mb/s
[  +0,000403] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): reclaiming unused bandwidth
[  +0,000382] thunderbolt 0000:8a:00.0: 0:3: link maximum bandwidth 36000/36000 Mb/s
[  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 3:1: link maximum bandwidth 36000/36000 Mb/s
[  +0,000896] thunderbolt 0000:8a:00.0: 0:13 <-> 3:13 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): available bandwidth 36000/23500 Mb/s
[  +0,001028] thunderbolt 0000:8a:00.0: 0:22: scaled bandwidth 2198/2198, scale 0
[  +0,000636] thunderbolt 0000:8a:00.0: 0:22 <-> 3:16 (USB3): increased bandwidth allocation to 9000/9000 Mb/s
[  +0,000001] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 done
[  +0,000001] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimation for group 2
[  +0,000893] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, scale 0
[  +0,000640] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased bandwidth allocation to 900/900 Mb/s
[  +0,000640] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000129] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/108000 Mb/s
[  +0,000137] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed bandwidth 3000/3000 Mb/s
[  +0,000104] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000001] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): re-calculated estimated bandwidth 103500 (+ 0 reserved) = 103500 Mb/s
[  +0,000406] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming unused bandwidth
[  +0,000633] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000128] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000768] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000383] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/72000 Mb/s
[  +0,000138] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for PCIe
[  +0,000863] thunderbolt 0000:8a:00.0: 0:14 <-> 1:12 (DP): consumed bandwidth 0/12500 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available bandwidth 70500/58000 Mb/s
[  +0,001059] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, scale 0
[  +0,000583] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased bandwidth allocation to 14738/14738 Mb/s
[  +0,000002] thunderbolt 0000:8a:00.0: bandwidth estimation for group 2 done
[  +0,000001] thunderbolt 0000:8a:00.0: bandwidth re-calculation done

--ktwojdhv27toua2w--

