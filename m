Return-Path: <linux-usb+bounces-37559-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBHHKSQRCmpRwgQAu9opvQ
	(envelope-from <linux-usb+bounces-37559-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 21:04:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A774563703
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 21:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 04162300D611
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 19:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC84C2989B5;
	Sun, 17 May 2026 19:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9zhI8rS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321C92F5313
	for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 19:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779044639; cv=none; b=amZZp9AW9DsE7lqBSB5tCOa1ZER0wyqgc3J6Om2RKAZtV2SoWaYRz99jfhielPPTRaaNEOYmR0MDfj9FgNyJ2oSIytz8QJXC/UHSorY4wnQyeRNdca3wn5gg2HjbyyO6Wx8CtwbsNajPuMY7VWzPWPnaZ+0KPc/o10r7mz0YBSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779044639; c=relaxed/simple;
	bh=RsGiYPhzHUvX/wiDftLIoes6CeFK985lMua0I8GvI18=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k2O08Kqsmq7/V9MqW1Z9mRxQob8jWZrUYrzoclz+H6DbNu02ww/pc+6Glm4j+krgtsfp53Qar+HN1rwLNbYm27QwyCt31j3WGjac3vIMEI7I6VYIvRvUOseo0qo2rZgMeOgPOKzVCbXyrDQDYziDWRykNr8ez0qAg4POAxgPdPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9zhI8rS; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8c7154725easo24331626d6.0
        for <linux-usb@vger.kernel.org>; Sun, 17 May 2026 12:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779044637; x=1779649437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3+4hEFwMySiettho6mwubbSIEJWv42YwhXdMezuDCw=;
        b=r9zhI8rS8RQM55Gobx2VOqAHHPZKs/sCrebD8V9moTpPvAAE/ydhcV/HTy3u7CbQlr
         ofjuHcgtmqRtTcjoR1Cmi5EyjZkgOhYbS+fqI3/rU/aXcrP1vRlPireyS92eL0pOHNRK
         uYkONdNXPk43l/JW/L0KIKt1uWqCEDIvkhZ9brQT4hWKgvyT1gT2BZG+b4Xt+PiwHM7r
         IHH/zQVtoFItm1bhVEN+5t4hPmEvvoADQGxpT88e/NyhF7Evjrg3VnK0JHZJa76qMB7U
         zVMDdgsunPgsd15BNBcSB1Zm02V9MfNpIvkhKKhFq11iRfLPhIMdO8/Qmtyal5irWoWH
         xMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779044637; x=1779649437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3+4hEFwMySiettho6mwubbSIEJWv42YwhXdMezuDCw=;
        b=HT1q3g10HpWg4c1vHia6Yc6qGeanT5dYcJSWKpDy09JANj66ZK050o17Z6UzqgPrn7
         yp03rldHRP/W83lDCKkoOVpzllDPVDBafs7UXSw/FU0sjG7zW+2yQbvCz3TVMjtd85Z+
         cCBhIKtfiiXyDc7BsPP/EecmmAh1FtXfCefvQj4jy8Y/h+gnWcqteHo8bGr+OsFCJ2MU
         vWhsww9LTxeAY+geXNu/bkSO4aaJHzkhrZk3LgLGe5/+IEZSJs2YAu29HwTFeoPSces4
         Nqi/82JI3/yMZb+HaJK34gh2Jf4ujRlAiMH0xhMMKkAXgD/yUNZxg5OkK4Gf5AnTTsJ2
         N20g==
X-Forwarded-Encrypted: i=1; AFNElJ8yjjzYXtv8MoJXlRO7F7BiiIMVEVpnSfkDmHqlwQ8ViNm4jRLIkSqFVrPv+Qn7ZW5zKIVS4nKBQ6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm5q/jp5N1WW8e22MV8LgWYE14tmSe80XLx/qLIGSeysasfdUU
	9pg2AqSlugYV7BMo1qB/hMI49VGvnfBpC1qqmjH7f0TZJiMrWnN8d7nR
X-Gm-Gg: Acq92OFlFWmEWC1gz5K1BHiQeyXEklhhRqe/3oXtmGMxCkNxppZha6eMV+KOzDf//WG
	lb68sAAzfulfZ6qAaNBbCspUtxLeXK/9+KSzbiToZgcWKOPjxV+yx4HFUA5jR1vdz0mDtAwOcJV
	AUITZFjnFD//mldOovrEGi92M2mn/X8AA4qHUBiYa5bkX9wBDOvQ+JVVsHAUrAB0M3wdsk11Mbm
	pNVj2TsgqAp3sLqNT/qXJ+xu9ZxByogveOCVwg/eMnFtSehKhZXyRgiI4luSyw+iRs2vPZFdetS
	dPGYMqutwxTTxydYSANeOWEjn03r0HwjbS7+rrBgzVl7Ewb1PH6lJ08y548swkdaCX2IKAiHkhX
	Wd4hBp35TGMngnfofZ1ci7l6wP/6FFmrjfoxlDMPrFwe1JerBahdFMsNMVex+TdEVVdhVb+vLGc
	72dpOYTZpVrelo6hJvwhtN63hAcZdkzV0jKTCxyRFsdnqKUSqNFDsoaoxnoyooDCvPjGk9Cs8=
X-Received: by 2002:a05:6214:5544:b0:8ca:23b1:f4a9 with SMTP id 6a1803df08f44-8ca23b1f923mr126212316d6.2.1779044637136;
        Sun, 17 May 2026 12:03:57 -0700 (PDT)
Received: from mango-teamkim.. ([129.170.196.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca361b8b10sm30473686d6.46.2026.05.17.12.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 12:03:55 -0700 (PDT)
From: pip-izony <eeodqql09@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Seungjin Bae <eeodqql09@gmail.com>,
	Kyungtae Kim <Kyungtae.Kim@dartmouth.edu>,
	Alan Stern <stern@rowland.harvard.edu>,
	Kees Cook <kees@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	David Mosberger <davidm@egauge.net>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] usb: host: max3421: Reject hub port requests for non-existent ports
Date: Sun, 17 May 2026 15:03:08 -0400
Message-ID: <20260517190308.1876316-2-eeodqql09@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260517190308.1876316-1-eeodqql09@gmail.com>
References: <20260517000145.1868817-2-eeodqql09@gmail.com>
 <20260517190308.1876316-1-eeodqql09@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3A774563703
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,dartmouth.edu,rowland.harvard.edu,kernel.org,linaro.org,egauge.net,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37559-lists,linux-usb=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eeodqql09@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-usb];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,harvard.edu:email]
X-Rspamd-Action: no action

From: Seungjin Bae <eeodqql09@gmail.com>

The `max3421_hub_control()` function handles USB hub class requests
to the virtual root hub. The `GetPortStatus` case correctly rejects
requests with `index != 1`, since the virtual root hub has only a
single port. However, the `ClearPortFeature` and `SetPortFeature`
cases lack the same check.

Fix this by extending the `index != 1` rejection to both cases,
matching the existing behavior of `GetPortStatus`.

Fixes: 2d53139f3162 ("Add support for using a MAX3421E chip as a host driver.")
Suggested-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Seungjin Bae <eeodqql09@gmail.com>
---
 v3: New patch in v3, suggested by Alan Stern.

 drivers/usb/host/max3421-hcd.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/host/max3421-hcd.c b/drivers/usb/host/max3421-hcd.c
index 3d6b351dcb1a..73e76d0e6973 100644
--- a/drivers/usb/host/max3421-hcd.c
+++ b/drivers/usb/host/max3421-hcd.c
@@ -1685,6 +1685,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 	case ClearHubFeature:
 		break;
 	case ClearPortFeature:
+		if (index != 1)
+			goto error;
 		switch (value) {
 		case USB_PORT_FEAT_SUSPEND:
 			break;
@@ -1728,6 +1730,8 @@ max3421_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
 		break;
 
 	case SetPortFeature:
+		if (index != 1)
+			goto error;
 		switch (value) {
 		case USB_PORT_FEAT_LINK_STATE:
 		case USB_PORT_FEAT_U1_TIMEOUT:
-- 
2.43.0


