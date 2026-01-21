Return-Path: <linux-usb+bounces-32608-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLgsL71YcWkNEwAAu9opvQ
	(envelope-from <linux-usb+bounces-32608-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 23:52:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 632025F17B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 23:52:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 141155650E2
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 22:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AD0427A13;
	Wed, 21 Jan 2026 22:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cp3U4ohx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E6342B73E
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 22:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035926; cv=none; b=HVlQEblRTqmcPR3nz9nKINGQkfvOdnh0g1r7cfGgFf97yLAFTGIV3i2Pz2I5cu0eujvOwTKg4Q7iGSTCLnICd/B3DjoR+rtDP/hNkCd3f9yuWulkMCGXSwJ884K3y7U+DUIo8wtw/YvjOWZ6oVQ2aZmV/+B/SICoCkXjza6gwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035926; c=relaxed/simple;
	bh=ItPSlQZd1y/zJgQw0pOBu9tXYh38m3Max/y+GSSpoEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RpkjJNmVvp0Ipo2VMB9i+zVRgwMFbuzqyXaJ1b69SiOgQZRCWVxkUqf6X33nuanRGaip95PEJYb8mlI10aPVzyawIEH5zsXt/gfT67Mi172KSwRgIvtL1h4+OmnC9HzMGbKgL1oqJL2ZvPtRqptY8n+MyUYXfZm1Ivplv3LWtxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cp3U4ohx; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-66103641d76so105001eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 14:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1769035919; x=1769640719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8vM12+V8pXWLIN7VAxlqlrTNFOODAD6xyJ8ZKKrB16U=;
        b=cp3U4ohxh8CBnlHM95Zdp1+VqWr/VsdwKmL2jK8JYzAJPfoeRGZ+x7fEaO0uTA2J4p
         UcVbsc47IvwbLxz8fTSASuPX59Ee8xAmI3/0bhxY6mSF/UnirH+GCLV4mG6W+egfEtao
         V0uX1StldHoI2Pl/duujwTunPjha81xEYB4R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769035919; x=1769640719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vM12+V8pXWLIN7VAxlqlrTNFOODAD6xyJ8ZKKrB16U=;
        b=jQz5ANxQHbAH4u3ySOJIgfvtUV/05VoW/z7r939aY/LmicdPvC6sPFS4VqvescRqYR
         QkHMsx3IoVN/OUQq11dlfoX74t0CF1UI9ERaG7C77UDtfONsC8nC+87OC4r6xdEbVFMe
         VdhPBGs66adyp0A0m3ZH+LLXvJqld0j0OC7nAU/tY4e2zKkNmVtOeevrfE+2sPs7eYQs
         b1fCy+Bnnr1DqV1USAqjvY1B4/dnIq04pv2WIcqrJL9Ca8mtf5Cq5ZmsR85TsFUhZeOm
         e2veyGGNa12nb6USrm0/Oq+Dt7ITwEOkltfOXXuu9nbW6GxzC8t0n+b8peJncov36fhZ
         YCoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeEx5wN/pO/Q3sTSWzqy1gpkXWC8UlBui3+811gIT0MxrqnSEov9R7laGoOYdJeep6Q1MtglVu8HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZcVkx9y+0rd7mgtWvltfHSKQCWscUsHP2rp9S2WmWOQB7dv2
	ZKlZ2MDmBmw5hUw6eJEOsyulXvyT5+4byyjKVpBPTaGn+SN9W6TCdT0CN20kf5ZsysAT79YA8+k
	oMGO074E=
X-Gm-Gg: AZuq6aJX2bdZUaa2JcbZ1arBNqEOXNmS4/cNHJGOfAylkKlOvMt5kyQ4jGBGkPlYdJq
	CyFCB0ndlmOpxRste/iAMUavphzJiQVLY9KnWv/Sjlr4EA0DJKDmirG0s6Gt2EO9+7aeiWd3nMq
	g8sQnsTw1plhVQ/ztkDYVUW2ASEBnn9fEQ+clZHNfRHWjdXuaVyNZk2VA/qSrrMFNCo2BF15PJK
	AZxVQWkmhPAgqfeiQM27E6li/fsAUbVsM+4VhkGxNuBS4ipWvRwNrucz8EK4iOyvt8ZFJdjEK6p
	PERSQaFGq+EMnrHEVj5ZCvU7Z4+v3Nl7ATUpXVSrhMU+hofdnJVJm03lD/bgbYrl9UcV+VueSLe
	oX/b2uSAtQOTsw5V1RLqY5o9O302NiCGNazaCeC0NBe62jte5XL2OhRwtZCbcyOHLRTi3RBS2yN
	ViggaEmj4UWmfzrHsb5Xxl3Zp0g/2o38rZ/Gho
X-Received: by 2002:a4a:a683:0:b0:65f:6c6e:65d8 with SMTP id 006d021491bc7-66297cd709fmr4117263eaf.20.1769035919586;
        Wed, 21 Jan 2026 14:51:59 -0800 (PST)
Received: from shuah-framework.internal ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-661186ca6c5sm8266407eaf.3.2026.01.21.14.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:51:59 -0800 (PST)
From: Shuah Khan <skhan@linuxfoundation.org>
To: valentina.manea.m@gmail.com,
	shuah@kernel.org,
	i@zenithal.me,
	gregkh@linuxfoundation.org,
	ignacio@hernandez-ros.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usbip: Reduce CONNRESET message noise in dmesg from stub
Date: Wed, 21 Jan 2026 15:51:56 -0700
Message-ID: <20260121225157.34635-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-32608-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,linuxfoundation.org:mid,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,hernandez-ros.com:email]
X-Rspamd-Queue-Id: 632025F17B
X-Rspamd-Action: no action

stub_complete() prints informational messages for each urb unlink
filling dmesg. Change the message to dev_dbg() similar to vhci
reports the CONNRESET condition.

Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
Closes: https://lore.kernel.org/all/0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com/
Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---

v2 addresses review comment - align message to the start

 drivers/usb/usbip/stub_tx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
index 55919c3762ba..cd92d9fac327 100644
--- a/drivers/usb/usbip/stub_tx.c
+++ b/drivers/usb/usbip/stub_tx.c
@@ -55,8 +55,8 @@ void stub_complete(struct urb *urb)
 			 "stopped by a call to usb_kill_urb() because of cleaning up a virtual connection\n");
 		return;
 	case -ECONNRESET:
-		dev_info(&urb->dev->dev,
-			 "unlinked by a call to usb_unlink_urb()\n");
+		dev_dbg(&urb->dev->dev,
+			"unlinked by a call to usb_unlink_urb()\n");
 		break;
 	case -EPIPE:
 		dev_info(&urb->dev->dev, "endpoint %d is stalled\n",
-- 
2.51.0


