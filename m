Return-Path: <linux-usb+bounces-36668-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHG3Ccp88WnohAEAu9opvQ
	(envelope-from <linux-usb+bounces-36668-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 05:36:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41C48EAFC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 05:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 786813014694
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 03:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F293890E3;
	Wed, 29 Apr 2026 03:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="JPuYivBw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975C1225A38;
	Wed, 29 Apr 2026 03:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777433795; cv=none; b=iGcp1ATUhvvTOPXoII+fH2/MnkowLG+YbLb5mWwJ+JimVDLrcibQrrAAeTcjwSgCh06HPevAJGe8kPKPAkNYOv/Bv9kuwuDudQuTpT1w6pZTmX5Ipak9DcTIjQcpJ9w2hTEB1MGyb28jdDdwggUO9N8cKbbkOmoHIVbmo3bh7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777433795; c=relaxed/simple;
	bh=08OmEsr1hCRDH/YORMa9v5Gjh7FzbFNCu850g0aXVR0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CAOQSMbgqkLRBFrGfWacVAZzvRsDcgcxiHPyMf0fpTnGR2cXlVY6w7e+T+Moqp+5jPGWIwQV4aV4rdG3fsWaeoAAjtZ7sqgWftRl2uIjGBRDXxJhpApPrnfJ1nki6Z6jZrYtx+yR4MxfqVHi1lWKnXa+Sr54NXq/AGgSrdm8yI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=JPuYivBw; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1777433787;
	bh=T92eqt1ZCY3opLCeE0wWBQVRlnkO8R7C9G7IEAWn3qQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=JPuYivBwwqklvimbNCYnreXxOGB3QWlh1WGdwWJhtCdXB/nST84d6wnrI1JiMnZ5C
	 Bt2Q/vd5ipxSN9r6KVDJ4sTk2DnvuxOJ3LZhoVQyqICDqfbmTiR7cLqvQRn0BOrxeh
	 UC/Ryeq3adhXshFvXXcjR3xcnhHpAYDhK8mQBRSg=
X-QQ-mid: zesmtpip3t1777433780td3efc152
X-QQ-Originating-IP: OqaDPEAT1Wdwt0z7nXhNiZTObUmblkbnDqWfTxWVa5o=
Received: from localhost.localdomain ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Apr 2026 11:36:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 15583585262135573335
EX-QQ-RecipientCnt: 13
From: Haowen Tu <tuhaowen@uniontech.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: linux-usb@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	laurent.pinchart@ideasonboard.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	pavel@kernel.org,
	lenb@kernel.org,
	oneukum@suse.com,
	kernel@uniontech.com
Subject: [RFC] USB/PM: should USB interface drivers distinguish hibernation THAW from RESTORE?
Date: Wed, 29 Apr 2026 11:36:17 +0800
Message-Id: <20260429033617.1954257-1-tuhaowen@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M3vv73qU6a4uPXcIldRwK9B4UiSgdQBKdeFslIBdSbWPEUBpzKXLYxLF
	21s8R3cyHwacTVaXM5Jnf5sCb0X4eIVR7pgT+50uSEzvQkxKSAVE81aLqO0RUs6DR2ZWcox
	W29QLDWFRtJ5TVMIHohgnbGjoNA5g9z8XIbhrKBqp/GF0pf9+rCfFFcqmbhl5rKybU0IYIx
	DuZ5VP9i1rCJKfV5j9v3HFzdST4H8jFgum0GihVaSPCPIM/x8YPMr44vi7dGeSfznucXhbP
	ETCAH2TtPJS/iSM4SSPr3KHGKHRMRjVpmnXJRo8tLQi4x4JnGEW4hyDRL3WwwfYHV+QXwZ8
	Q9Csv9v6orA17T0AJXkJa7pdRHLLgUDk5PKATRBsQkGGOwOILFyYff3zTVTp5km7XNHzW9o
	wDUEJizHDv3x+LRibpbCePT3ZOCtUCQn3Ia1ln02/Sldv+qfAIYFL4ra0m6nauD1N2mQpjk
	FUmIAg+JbqAXHH0gW5DuFQnMFy/1dpMp/jPatEv/phgoUFPqW16B7aL6ZscN4e/Ook+1j3h
	m4iE7DxxGXlyWo+MHpC2tRTGQRg+5mdsuejJSLxgsb86ZlZYJ2h8g68hbkpoGycY45GkNJ8
	t7qTqUz0ZvcQQ/90opSmBMxQvFiC1lR9Q0CVWSy86RuwosgedR4mbjY7Tn7/609NAdEey+W
	x6YTD3wq+4KsX5X+ZrKXHSWNSpdU3rpRvdljSLUbmsysMGSMmAIBEdgBwIQwEEe6cMFxcnc
	UO4+Fy66kxtnxsPwvArmgsxlttQBd+nkf+xvLDkItTUeqqefuG/WAl7+cLO32qW6gVjkHDA
	oXVM0f1XRFp/cwaMqFmmmHuuI/9JoaR5hAy3E0+ayTfP/7EFQI5gqs1JghKmYpIRL7r0vPM
	JCWdfvGd0ORmuoLIDgpj5WAiIXSr23pHBnEle11ijJ7DfCBfYJstxsnsc5PtCGDisuST7yX
	cNBV/Csh6IeN7lsXdB47nn9q293he0yVuYQBSwj0KmKw5JTd818QD19ZCfVMdZm0RoqLNuv
	B5yNvLFFLgZRptVyzv
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-Rspamd-Queue-Id: AD41C48EAFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36668-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[tuhaowen@uniontech.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[uniontech.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

Hi,

I'm looking for feedback on a USB/PM design question that came up while
investigating a UVC hibernation issue.

In the hibernation flow, after the memory snapshot has been created, the
kernel briefly resumes devices in order to write the image to storage.
On the successful hibernation path, the system is then powered off. For
a USB camera that was actively streaming before hibernation, this means
the USB resume path runs during that intermediate THAW phase, even
though the final RESTORE path has not happened yet.

From the driver's point of view, that THAW phase is not semantically the
same as the later RESTORE path after booting from the image.

The difficulty is that USB interface drivers currently get

    int (*suspend)(struct usb_interface *intf, pm_message_t message);

but resume-side callbacks are only

    int (*resume)(struct usb_interface *intf);
    int (*reset_resume)(struct usb_interface *intf);

so by the time a USB interface driver's resume path runs, it has no
direct way to distinguish a hibernation image-write THAW from the later
RESTORE path.

The immediate trigger here is UVC, where resuming the streaming path
during that THAW phase can turn the camera LED back on and cause other
visible device activity even though the system is about to power off.
More generally, review feedback on that patch was that solving this in
individual leaf drivers would not scale well if other USB interface
drivers ever need similar behavior.

So the question is whether USB interface drivers should be able to
distinguish these two phases, and if so, what the right interface would
be.

Possible directions could include:

  1. Exposing the phase distinction to USB interface drivers
  2. Handling it inside usbcore
  3. Adding a USB-specific callback or other mechanism for this
     transition

I'm intentionally not proposing a concrete API in this RFC yet. I'd
first like to understand whether this should be considered a real USB PM
interface issue, and if so, which direction would be the least
intrusive and most maintainable.

Thanks,
Haowen Tu

