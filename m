Return-Path: <linux-usb+bounces-33241-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHODBrz8imlyPAAAu9opvQ
	(envelope-from <linux-usb+bounces-33241-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:39:08 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E622D118F8E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E41E3303A8F3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A381340DB2;
	Tue, 10 Feb 2026 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b="JnZTETUz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx9.kaspersky-labs.com (mx9.kaspersky-labs.com [195.122.169.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8B233FE30;
	Tue, 10 Feb 2026 09:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.122.169.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770716244; cv=none; b=N1TV+39WSzFdu6aYgIsc7omqQPszD1fIOZqVsW2Ft5JH5lv4qIBJfKnUdVD2rqMHNzYHV86icwLs6R7fF07vbu91ignNVpoB4LkQZDixmJrOV5/8M1jVrPXQi44pntWVX3+jOqC1O0XxAuedf4ra7q+1NuTy6jXnBWuP4RYhs94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770716244; c=relaxed/simple;
	bh=6GL3FznrH2bGYH4SqtKV36sZUmpSOdzmiCZ1kjXlKWU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OFD9pdH9gxW85HeqzYlvnDtKWkRurNliABpFGGegQIv6qw/f+PoKb4FipS74GYHeaI4CFT2aG9fc/coNpLZV+BrOO1vLlEsCkTPGGEcZoTwA2dj4wvjt+1nMM4a9GTAlVEaIoYH2ikBBLEesq79BZ1/zwFUdjVctGPsL+bUNo5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com; spf=pass smtp.mailfrom=kaspersky.com; dkim=pass (2048-bit key) header.d=kaspersky.com header.i=@kaspersky.com header.b=JnZTETUz; arc=none smtp.client-ip=195.122.169.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kaspersky.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaspersky.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaspersky.com;
	s=mail202505; t=1770716234;
	bh=vQgB7KFTtp/QzBLgJ1N4M/cMNcL8ejsimJ1jeRCopyA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=JnZTETUzYe3xkEpyzzzjWX7Io7ckBty9UB0SgmAfwDKVN0xYI+S0TMxG6Sg/6jtCx
	 vBbXMBRMZH3IwsmNFr9ATLVr649OANvCKTDPogiVhvv5OsotJkUrHuDQsiFpfEIIsy
	 XNMsT6ScnzDCTYJ9YAKNZXX2zkBMIjCRhGoaKUah8WtGwQqie96r8OdY8uMNjoQ7j9
	 nznXzRalR1l6kmbv+baZbkc8UWH98SzTP9aCFM+XcPQO7H68V3BhrJv7kr5NREZUIM
	 QCGLm/p/fWRNCxd2JCfnkerSDG10Cf+qBG6qPaFtBCqOlQtAQhYi9PbdQ+wmMZI5YE
	 L+LHWZcAIextQ==
Received: from relay9.kaspersky-labs.com (localhost [127.0.0.1])
	by relay9.kaspersky-labs.com (Postfix) with ESMTP id CE19E8A0A71;
	Tue, 10 Feb 2026 12:37:14 +0300 (MSK)
Received: from mail-hq2.kaspersky.com (unknown [91.103.66.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail-hq2.kaspersky.com", Issuer "Kaspersky MailRelays CA G3" (verified OK))
	by mailhub9.kaspersky-labs.com (Postfix) with ESMTPS id 7D1A08A06D3;
	Tue, 10 Feb 2026 12:37:14 +0300 (MSK)
Received: from Votokina.avp.ru (10.16.104.187) by HQMAILSRV2.avp.ru
 (10.64.57.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Tue, 10 Feb
 2026 12:37:13 +0300
From: Votokina Victoria <Victoria.Votokina@kaspersky.com>
To: <thinh.nguyen@synopsys.com>
CC: <Victoria.Votokina@kaspersky.com>, <gregkh@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, <rogerq@kernel.org>
Subject: Re: [PATCH] usb: dwc3: am62: handle usb2_refclk enable failures
Date: Tue, 10 Feb 2026 12:36:59 +0300
Message-ID: <20260210093659.2268056-1-Victoria.Votokina@kaspersky.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260210003034.twbkgavdegwlnsvo@synopsys.com>
References: <20260210003034.twbkgavdegwlnsvo@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: HQMAILSRV3.avp.ru (10.64.57.53) To HQMAILSRV2.avp.ru
 (10.64.57.52)
X-KSE-ServerInfo: HQMAILSRV2.avp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 02/10/2026 09:25:41
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 200328 [Feb 10 2026]
X-KSE-AntiSpam-Info: Version: 6.1.1.20
X-KSE-AntiSpam-Info: Envelope from: Victoria.Votokina@kaspersky.com
X-KSE-AntiSpam-Info: LuaCore: 87 0.3.87
 7430d8ffafccd8879e1d8370e5b501352446c2ba
X-KSE-AntiSpam-Info: {Tracking_cluster_exceptions}
X-KSE-AntiSpam-Info: {Tracking_real_kaspersky_domains}
X-KSE-AntiSpam-Info: {Tracking_black_eng_exceptions}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;kaspersky.com:7.1.1,5.0.1
X-KSE-AntiSpam-Info: {Tracking_white_helo}
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/10/2026 09:27:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 2/10/2026 7:05:00 AM
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.1.8310, bases: 2026/02/10 08:14:00 #28196691
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 52
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kaspersky.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kaspersky.com:s=mail202505];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-usb];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Victoria.Votokina@kaspersky.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33241-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kaspersky.com:+]
X-Rspamd-Queue-Id: E622D118F8E
X-Rspamd-Action: no action

Thinh,

This was reported by static analysis (SVACE), not from a runtime
failure I could reproduce. The analyzer flagged that
clk_prepare_enable() return value is ignored in dwc3_ti_init().
Since clk_prepare_enable() can legitimately fail (incl. -EPROBE_DEFER)
and the driver continues to touch controller/PHY registers afterwards,
this can lead to operating the IP in an undefined state.
Many drivers treat “enable clock failed” as a hard error/deferral
and bail out; that’s why the checker considers the pattern suspicious.

Regarding dwc3_ti_resume_common(): you’re right — returning
dwc3_ti_init() directly changes the current logic and is not correct
as-is. The intent was only to check and propagate the error from
dwc3_ti_init() when power/context was lost, while keeping the remaining
resume steps (e.g. wakeup handling) intact. 
I’ll respin this so it becomes:

ret = dwc3_ti_init(am62); if (ret) return ret; 
and then continue with the existing flow.

I also suggest enabling usb2_refclk before touching USBSS_DEBUG_CFG.
Accessing USBSS/DWC3 registers assumes the refclk is active;
if clk_prepare_enable() fails (e.g. -EPROBE_DEFER), returning early
avoids partially programming the block while clocks are off.
This follows the usual “clock first, registers second” ordering used
across drivers.

I tested compile/build only; I don’t have AM62 hardware to validate
runtime behavior. If you prefer, I can drop any changes beyond 
return-value checking and keep the patch minimal.

Thanks,
Victoria

