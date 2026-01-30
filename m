Return-Path: <linux-usb+bounces-32922-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T4BPGloqfGnoKwIAu9opvQ
	(envelope-from <linux-usb+bounces-32922-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 04:49:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E2B6E68
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 04:49:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 864BA3004DB5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jan 2026 03:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7EA24887E;
	Fri, 30 Jan 2026 03:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Xmj2wQBy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063401E505
	for <linux-usb@vger.kernel.org>; Fri, 30 Jan 2026 03:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769744977; cv=none; b=uGM6p58zTkDV+lEb3BaY2BErsymvzucJxqTZJCcy2A5CL2q9+FHdEnejvssDfXTK2SlafXYWSAAvy7/NA4s69jXYvqCSuSVaJTbx+6pJOWNnb4V4K9tBHTIOJUUlc0ARAF9gYfSGf3EztBAc7BDp08OvjAoeZv2j3zFqugDLgyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769744977; c=relaxed/simple;
	bh=DoOFZ7b6DZCX7yZzPQHAjXUinVnFVPg244vsU8S6GC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kg4UT4ejXU+amx/wyOUfeZK+2ONoW418AYqSWRd9LFCriDvo6Sbf5aNA15T24bAR6ZgB1N3J9P8DxG8qT+ruAxC65i1XqXrLRP3nxMm1Ooo9xOawdZNCkHMQl6hdwULEesZyh7EYZ7bbn33NEc7D+/wVXNAFDb9caOAAjJo43zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Xmj2wQBy; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1769744935;
	bh=yuVeKMqUbbPQXp7mC9d61O9v8Nzq3j5616Dy2CMnv3A=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Xmj2wQByHnsbEirTdic7iA2LdKaqw/qrBX4YiqOHk6D//yzMXWBlvTvRF8D3M+kib
	 9CF6CGbLJRIa8ESjo/wkIrk8q0lnP/+NHv4Sq5j8vX2QbnmcVCNmFfOpHRuiSHO/Gy
	 jN9PmpgHxjXvFFkvWr0qhzq+qG7/XmUammg+MnR4=
X-QQ-mid: zesmtpip4t1769744929t1634ab20
X-QQ-Originating-IP: 8Va0FouYXcJ1m3A1IO2wZCQ8Jj5Mijom7IysHYiNvX0=
Received: from uos-PC ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 30 Jan 2026 11:48:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 10229827296395907629
EX-QQ-RecipientCnt: 8
From: raoxu <raoxu@uniontech.com>
To: mathias.nyman@linux.intel.com
Cc: gregkh@linuxfoundation.org,
	kenny@panix.com,
	linux-usb@vger.kernel.org,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	raoxu@uniontech.com,
	zhanjun@uniontech.com
Subject: Re: [PATCH v11 2/2] usb: xhci: enable secondary interrupters and route transfers per slot
Date: Fri, 30 Jan 2026 11:48:47 +0800
Message-ID: <0140630012648248+20260130034847.2656706-1-raoxu@uniontech.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
References: <5de1da4b-d8aa-4180-a269-79fd544c2e8c@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Me6Y6peOPbRSOxtADkllPVAbNIqnKl8BHorgXLIWMLTB/R3iq+rNbjqx
	1IMmtJpPuHSpsXg9EwVXYTSKvqe2A+CfxrionKopuu3eUvjIBMG3znJuoaWKB6k4srqqECk
	/QjMjYibo0cpJqGIAW0MMP3BY4VAYeuC6G90kt6+O4JWO0P8oLoa+z3F2RDwaX+aHQQXrGT
	9B9n9HcQQI8Xzo2c3q8hSyFcAUuzMMjimdB1qRddRuek5l7rke5/aGjLGLrO8AB8ldKrKz4
	ZVHB6pyzaqNHoYNN4N4HIIrIVbFmxXZUrvjBSnF+I2iAfq/xowejjniRqpdqj2jem6biWNV
	MoX6V4dHp4wBMsj9uj+l5U/QNgln+Dpi0er5aBxCzzugIFQZcqw4NIFIsw1hXHbLzSPZR4N
	EXjzKooREgRF8SDv0gp/pukfzrWKQ6m9ZNirLHzWjUI1O+bYlFE3A25frtYtKYcvTu1HQl9
	JSSYk3lDtdi8PTqey198PpflAT2LB6ugANCzhYZv/CYdyUxB1VEFjIP+MqVK9J+35tsNR26
	dYnx5Za0ND3E8Oe5Jgaq+Y23uXRSTJiXn1RFOrr7BolehDQpAhv9QhBKwz17mNkgb5pyil0
	ByW5yjuuwOkHPUAgQSzfz4jNDYrZ0CnJZ1GvXxBEPLJRgYEZui1YzOaJ5DXPXBFJB5HeMaL
	HbHpaeMBafQ0eVjbZmUsRnilrhUW2e6TvrmKWc2tUME6c03sqKXk/xZA287bSVupuESh2Zx
	qGq74dMMZx8Kep0btYTwszmKk5UCcbFtVZqRofxKNSRXuukw7M1uXzF0d8lXPYM18+8NaG0
	Au6JW8Ejixa0xMtB4LsHU89HfOUqlYT1XEKS9WAqXUl6i+v1lvCFmq9KD3eoyApigimpOg+
	/5mIRJaEqtEm9LYMUlza2+o9hOKNe/dYi8ZeCeRlTpIZw2T8m6N4n7In9ND5J6koANsgFxy
	zCbu2Qst+jVlb2ubrqrH/ZMxMj0fTo9WSkJrUhwwiwDbKxhKuzblybPn1G1FTjYM8l43zxa
	/0cdZWu8nlq7TOuv066MfoCoIh3cWhTEHmDXKHLw==
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32922-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,panix.com,vger.kernel.org,gmail.com,linux.intel.com,uniontech.com];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[raoxu@uniontech.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:mid,uniontech.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2D6E2B6E68
X-Rspamd-Action: no action

Hi Michal, Mathias,

Thanks for the detailed feedback.

> Xu Rao, can I ask you you run the same test as before with only primary
> interrupter with interrupt moderation the change below?
>
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 585b2f3117b0..9a2a4d17ed68 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -573,7 +573,7 @@ static int xhci_pci_setup(struct usb_hcd *hcd)
>   xhci = hcd_to_xhci(hcd);
>
>   /* imod_interval is the interrupt moderation value in nanoseconds. */
> - xhci->imod_interval = 40000;
> + xhci->imod_interval = 10000;
>
>   retval = xhci_gen_setup(hcd, xhci_pci_quirks);
>   if (retval)

Test device:
ID 090c:2320 Silicon Motion, Inc. - Taiwan (formerly Feiya Technology Corp.) FF952

The results of testing a single USB drive are as follows: there is no
significant difference in speed. Perhaps I can test more devices to
see the differences.

6.19.0-rc6 result:
dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
10611589120 bytes (11 GB, 9.9 GiB) copied, 30 s, 353 MB/s
1024+0 records in
1024+0 records out
10737418240 bytes (11 GB, 10 GiB) copied, 30.3882 s, 353 MB/s

6.19.0-rc6 + v12 patch result:
dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
10475274240 bytes (10 GB, 9.8 GiB) copied, 30 s, 349 MB/s
1024+0 records in
1024+0 records out
10737418240 bytes (11 GB, 10 GiB) copied, 30.7994 s, 349 MB/s

6.19.0-rc6 + v12 patch + imod_interval =10000 result:
dd if=/dev/zero of=./test bs=10M count=1024 status=progress oflag=direct
10643046400 bytes (11 GB, 9.9 GiB) copied, 30 s, 355 MB/s
1024+0 records in
1024+0 records out
10737418240 bytes (11 GB, 10 GiB) copied, 30.2851 s, 355 MB/s

> Agree, commands like 'stop endpoint' would trigger a transfer event on one cpu
> and the command completion on another. PATCH V12 2/2 attempts to resolve
> this by handling transfer events on the other interrupter before handling
> specific command completions. This will get complicated and messy,
> especially if we implement more fine-grained xhci locking.
>
> The reward is too small compared to the risk of turning USB (more) unreliable.
>
> Maybe we could add support for several interrupters but just use the
> primary one as default.
> Brave developers and testers could enable more interrupters via Kconfig,
> debugfs, sysfs, or some other way.

For patch v13, I will make the several interrupter support opt-in via Kconfig,
defaulting to off, so only interested users enable it.

My next step is to try using more fine-grained XHCI locking to attempt a real
improvement in USB performance.

thanks,

Xu Rao

