Return-Path: <linux-usb+bounces-32598-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePBXDbAOcWlEcgAAu9opvQ
	(envelope-from <linux-usb+bounces-32598-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 18:36:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E74425AA17
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 18:36:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1083176B56F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 16:48:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863C547DD44;
	Wed, 21 Jan 2026 16:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QG0U62PW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146F4314A95
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769013447; cv=none; b=traHaa32bdZSmxQWij/p27olNFVJDH43mMf8HbP2JRN37rXwo3n45ZTgOhF8kVSXhN68/ekfTLGzxrv7wHTjbfGqC8VhB5sDu7NWJtsGjLbyMwEu6wJnk3KkglQpUdd3bfsS5d9c/mB3VLHhM4h3P7NWE+pYheO3d9mzXFFDEyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769013447; c=relaxed/simple;
	bh=ORLqTIWPIiuat4QwAVPOZnmfmYJ6ZMYHUtl8Rmgnqow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEzx/GLqErlbrhuS3G4GNx21F5QAmD/6tS78Hjb2KeMqJEe63FVmWAd10TtPcs7BDjx91l8LLm+iF4Q4vHn8sx72+TOpL+97e/tLCSRduSDmyAbplEeij9pQijv5xhV1bqXE0/jhZMcJxyN+Ghh6WuLEV3nNFEmY7Qi3AHtRUSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QG0U62PW; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-45c8984fac8so21429b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 08:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769013444; x=1769618244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4lAhXN1HmnaRMb9l7lSPcYI4Yng0ZWppyulkwxG0+k=;
        b=QG0U62PWou++RfoIQtB+2zUV7C0ybnOyT3T/Z8sTqdSJtdrTHXqKGUSGIVRGCKzhRJ
         OoDuCySjxC/Q0wH85x17QUiuwNawsUIDjPPnyQvuuh3LstXqVSnJDVi0JbRUhhLkZ2pi
         HXEG5PRsW7ED10n1leC6vPfNerc8kr3o4+CZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769013444; x=1769618244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4lAhXN1HmnaRMb9l7lSPcYI4Yng0ZWppyulkwxG0+k=;
        b=lLkE6TchOvPGW2Z3SMKCqMhi3TW0JwLVXNGaMkiT0hm4Adq3lmY+QVBehlHPAha2dF
         lztNeYanhtpN53/Y/7X38pZVo8h9We58zj5/HlbUwq+OVNliNlxbRuNtvWNW1NKvkjIG
         +ebqZz1aDZmdymRSnfJz8MUGZtPEU6iY2K4tDqBj/OmdFFGrmiIyEr6QqFD9VgQ9fpPV
         owlgd9w2/N3RjLOLb/2gomXSZVrYZxmT8vOU+pJ84kNbyasQC7V1O8M0FZ3PwytilmEl
         +3yVkIctVtgwkmluxN28/MWPlhZkBcd/5p6DpFhkGwdnqBqr1dHnv1Mrf2eEbLLSoa40
         aFlw==
X-Forwarded-Encrypted: i=1; AJvYcCV77d+5WYOBtLZaIUlO1iaAh0RIdHHiKHMbbcfTEc7gmEuEekkkE8ZSuEMStDTgePGQqPSj6C6oJ/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxceteg7ggC91hX2ttbNq46NNcARupOP5u3Q+ZufxO7he+pPBpf
	illVQwnxtk+0i023XCpaAuFLVZqZHKeI/iwDJkJU9xJINsaZD4iho7B+tW1LNYV5zoQ=
X-Gm-Gg: AZuq6aKMoIvny7wsf1JfHQeB7/S5G8W+4qODKefezD6eqFClsgJuMmoMIiMPGAIlJsZ
	RlQNqzbLYskwh2zHUt4NJP7EC30yQFOTwsYcHhV1CcrxiEYtEkwmbC62X/r3ZDlB80hvIy8sxaI
	YEz+MWPt+lsylI4EgEvNMnBQQuKsHYOD8/SYiX5devbm0kXQWYAlQbjTJYnswXb52HpShj3C7TF
	H1sikNdg8a9I0Zw8Ma77BjbSVJoE0tXsMZtbD7rUPUmXh/STK4TS2849YU+GFddBxAyyd31tGdg
	C+PTjKQu0OO+ArRZq28+0hWvptD6Kz2lotbrbqVBZyJ8maMIRpAyN2conVggOK0ZrJQiExk7w6F
	QuwIVaj6zvTI2XZdMH55DuEuizNjdHzWGCRGUPITeoD14Zo1n/2fuoqAaMPbyuhTd1EBpyxJs4A
	t4brxu6Id7/8Afl7MS1dE1UqRcOXr3xLoGCZXb
X-Received: by 2002:a05:6808:2507:b0:450:bcc7:18ea with SMTP id 5614622812f47-45c9c01ec83mr6437125b6e.29.1769013443911;
        Wed, 21 Jan 2026 08:37:23 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03e924sm8441674b6e.19.2026.01.21.08.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:37:23 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	ignacio@hernandez-ros.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usbip: Reduce CONNRESET message noise in dmesg from stub
Date: Wed, 21 Jan 2026 09:37:19 -0700
Message-ID: <20260121163721.11933-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[linuxfoundation.org,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32598-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zenithal.me,linuxfoundation.org,hernandez-ros.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,linuxfoundation.org:mid,hernandez-ros.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: E74425AA17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

stub_complete() prints informational messages for each urb unlink
filling dmesg. Change the message to dev_dbg() similar to vhci
reports the CONNRESET condition.

Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
Closes: https://lore.kernel.org/all/0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 drivers/usb/usbip/stub_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 55919c3762ba..4cae452bfadb 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -55,7 +55,7 @@ void stub_complete(struct urb *urb)
 			 "stopped by a call to usb_kill_urb() because of cleaning up a virtual connection\n");
 		return;
 	case -ECONNRESET:
-		dev_info(&urb->dev->dev,
+		dev_dbg(&urb->dev->dev,
 			 "unlinked by a call to usb_unlink_urb()\n");
 		break;
 	case -EPIPE:
-- 
2.51.0


