Return-Path: <linux-usb+bounces-5196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2378483108D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 01:38:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE7A4283D4E
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 00:38:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D50E1C2F;
	Thu, 18 Jan 2024 00:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b="Exwsw1Ug"
X-Original-To: linux-usb@vger.kernel.org
Received: from endrift.com (endrift.com [173.255.198.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEED4184C
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.198.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705538291; cv=none; b=Fnb5qwjFWgRdM7jU7QxzCQy6IDx8dpSJEcPKv607HCAU+uJfpeZNz2uglZz4x9JChUf4NbrIsYMVDOGBw2ejY7fX6WYXh6IpVsT1ZHzWHbe8arax3SQS7+GJ3luEIqnkB8DX6a/Ste8FL1npjZG7P8CHrrQJLTK87o+iBc+vzmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705538291; c=relaxed/simple;
	bh=orSYUDYdhZHvsBhvQBa+VW9QbqW/XmMxXOUeUFM9geg=;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=LBufhEdCZnfR/r6omSi0e9bn/Xtc04ZJ0FZJSx+jKFVTOj1NXrCdeR1MCl8PevgRnl73ZcQmrN38toOeMDEYpCZIRf0nNnzmp/an/gDniP79gD2DFiIUeelAPsGPgG1WoR+ufOOS0gCNPwRWDvWjjnLPv6yq+VshMspDiGK2swc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com; spf=pass smtp.mailfrom=endrift.com; dkim=pass (2048-bit key) header.d=endrift.com header.i=@endrift.com header.b=Exwsw1Ug; arc=none smtp.client-ip=173.255.198.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=endrift.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=endrift.com
Received: from microtis.vulpes.eutheria.net (71-212-26-68.tukw.qwest.net [71.212.26.68])
	by endrift.com (Postfix) with ESMTPSA id 476B9A124;
	Wed, 17 Jan 2024 16:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
	t=1705538283; bh=orSYUDYdhZHvsBhvQBa+VW9QbqW/XmMxXOUeUFM9geg=;
	h=From:To:Cc:Subject:Date:From;
	b=Exwsw1UgXsszK8MerhKrqoWo/Qdr/tGGcji01KuhaIc2CSM1/fC18GDVnbRHZ2gW6
	 iU62Fl/X1+RKnlfJtpQ7kE7vRIXKvTWfSkWcsOOveqt4BSITGJCwQFQmTMLiY/FY6m
	 bQjt5O3xmPI5rBoLfGpiflRTMU6R6nlbR9L+ALMyFc6HSiZgoID5ZG3URxWAp4RfQJ
	 VLCwaR5JupYNt5kQC5n1URbDllhapC8jUvw6XTJoAGbDuYHtQR/eML4EpNPjtzUPJc
	 yTlKNC7zbQb7GcIp/r4OHlc6S2LgswML9sDRWccjkhAvppyNLMU1xtuqNDaF7eqSbY
	 GtGLBaN1JVQGA==
From: Vicki Pfau <vi@endrift.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Maxim Devaev <mdevaev@gmail.com>
Cc: Vicki Pfau <vi@endrift.com>,
	David Sands <david.sands@biamp.com>
Subject: [PATCH v2 0/3] USB: gadget: f_hid: Add Feature reports
Date: Wed, 17 Jan 2024 16:37:54 -0800
Message-ID: <20240118003758.1870691-1-vi@endrift.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds support for Set- and Get-Feature report handling in
the f_hid gadget subsystem.

Following up on a patchset from mid-2022[1] which stalled out due in
part to neither Maxim Devaev nor I properly testing the interaction with
the use_out_ep feature he added at some point, I've revised it based on
Greg's original feedback.

Unfortuantely, it was never quite clear to me how to properly test this
patchset per Maxim's concerns, so I was hoping to resubmit it with
Greg's feedback addressed and see if Maxim is able to test it now.

Note also that this is based on my original patchset, not the revised
version submitted by David Sands[2] at a later point. He may have some
opinions that would make sense to address before anything exposed to
usermode lands.

[1]: https://lore.kernel.org/linux-usb/20220726005824.2817646-1-vi@endrift.com/
[2]: https://lore.kernel.org/linux-usb/20230215231529.2513236-1-david.sands@biamp.com/

Vicki Pfau (3):
  USB: gadget: Move gadget-related ioctl codes to gadget-ioctl.h
  USB: gadget: f_hid: Add Get-Feature report
  USB: gadget: f_hid: Add Set-Feature report

 drivers/usb/gadget/function/f_hid.c   | 231 ++++++++++++++++++++++++--
 include/uapi/linux/usb/g_hid.h        |  19 +++
 include/uapi/linux/usb/g_printer.h    |  23 +--
 include/uapi/linux/usb/g_uvc.h        |   4 +-
 include/uapi/linux/usb/gadget-ioctl.h |  39 +++++
 include/uapi/linux/usb/gadgetfs.h     |  27 +--
 6 files changed, 279 insertions(+), 64 deletions(-)
 create mode 100644 include/uapi/linux/usb/g_hid.h
 create mode 100644 include/uapi/linux/usb/gadget-ioctl.h

-- 
2.43.0


