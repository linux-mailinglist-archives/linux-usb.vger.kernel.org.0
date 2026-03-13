Return-Path: <linux-usb+bounces-34737-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOxlAqvus2m4dQAAu9opvQ
	(envelope-from <linux-usb+bounces-34737-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:02:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC3281DC7
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 12:01:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 375373016EE9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 11:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71474317148;
	Fri, 13 Mar 2026 11:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="leuuTnUS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E32ED848
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773399713; cv=none; b=ggpnSHr7FU4HJcbqqHyHYFE1WYFnlPG7TzVPEVOPGNtJFsDXXqODnPWImE1sKxC38p/VmwsYxWdbTXPs0vRLrU9wA8wTrer/jIpgQ/gmI4kO4AW7C2GbyCszazxU8FkYZIRC6/uBB9iKvav5n+h4rrtFLPZh2zC1790frSP2X14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773399713; c=relaxed/simple;
	bh=rOs2Zza4iSyQJwpmWEKx1CPHnlVcm2FTrBab/U7r+iI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/6Bv0eK9IPUzePxp8Bz3OL8lynbMOMNdl1daB0P586k5pS6hGY7hHpmS1loMRIGKQ/USgR3WJPrschW9g2ZuoHwDXpfhhOb+KO7WTJ1MObdzSbKrw0RTGUby1FTtRL/U2u69grKnkzHM8knUCndXBnIIY2Ow5O2pQLEYUv596g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leuuTnUS; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a1330ac6c3so2246868e87.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773399710; x=1774004510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1PMrAbDkinAHTnKxhkofv0luVI4+rkj8cn9n8UTgIA=;
        b=leuuTnUSDNx3YoFLF1MIfsMZFS0pAgFWp9PyVWF3wmBpmrjGy1z1EwT5QTm8ycuVU7
         2I2fiPdN/FDnhqZVKVQakp7LIEfOiQM4vHodbNL0dHWUEOH7nMJ40BmiOwhgIXbdGMYe
         VMjwhbjb9N35Bs+tznLln8+R6VcH74w6HdfeGUummTEj0IZAuQhOGEZkTdbvRy3fQUYI
         amvJmmExF+FOhu5Zflhoejxpvj8YP37289bmFC8vfWh8x752tdJWCWqukwRTqhTS83kM
         WWHLD94zL9T3u9xg4xwVQif4kZQG9APHr69nsISXXWwyrWrzLjHb99J5EOf/8j/5bsKi
         ObYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773399710; x=1774004510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l1PMrAbDkinAHTnKxhkofv0luVI4+rkj8cn9n8UTgIA=;
        b=Vj9IgHDxw4UsHsgnyuwQro4FG8oo0lcdQHYO+2wKtlCxDQ/xC9krF4fY3eNPpyZjJB
         zDb8x/7dd2YFCkl2g70RwptZ+TWLuRDKx3JltMu+eI1B1R1gMEMWrf12lJB/Vh8ciEiu
         AKCc+CKQtx1Z35zmNf45FCSvbG7BDDQVJ8NKBS/cgcm8zOVPKINb7qZ2HSoY5mDQYA/4
         ck0f5Q1+A+xdHwF6zJzrT3iD0xfr9vFAcK86Y47DSdKMstVzVYTo7t4G9P7GN7wkr+ct
         9zeT/tFK3rCnmgg8lvYVl2ODU36bcfrzs4fi8taTb7MR1VW8MfzY+XoXXhkk++tyvov+
         8oqA==
X-Gm-Message-State: AOJu0Yy1Q9qwNJSeSeCnjWa3Sh0Dxn7IEr8DRUE/CPLU6JSs/namYSuu
	6GDNop0ipMvRxwC7U57nu+k7KK5etTWVvXm+2kfFKIZEuTpFcTD/bwm/rtNt+Kr63k5tsPV1
X-Gm-Gg: ATEYQzxSQlxxI/ZGrD/eS4sfBoaNCCvnIb4CiKLr1IOprnaVCZnlp+6bExuEAUopyvm
	NTvdWbpRWsfchbfiWsPpJIqXOs6x5PM7ds7LK78PczNN79Ty78txpiQAUfiYUsWn3WDS3szQ9XY
	dKtmRQgTYQopHOtd+Gn8r7Kp+reS87ukZhyKqlrnK7SBJoNw5cc0pxKzrTm8MWJUIdHG1yohOi3
	TilN/odJAeXE2cZ+4rPuFarruQi02BxPnsuoi4FRUgQ6ESZtXbyhy3auLhM2AS4ssWchJC5vK7A
	a9geqvWD9YBdWZ0mya3UQQu29AN0HZBiCKmLuZi20ATqhTuJiLDNBN9fqEpeLumHFHhb4bc8TKT
	07DZxhRgr4CS40kJycrAPQBe26ppIWAI/biri+Hrpwg29KM8jgA+Y7ElZBxovjJCYFUyZMi9abE
	4iMnFGixzHRg0hADLki4Uu2SoNBw==
X-Received: by 2002:a05:6512:145c:20b0:5a1:3207:694c with SMTP id 2adb3069b0e04-5a162b0c23emr689156e87.29.1773399709477;
        Fri, 13 Mar 2026 04:01:49 -0700 (PDT)
Received: from catato-pc ([212.192.203.108])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15981e963sm1057305e87.64.2026.03.13.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:01:48 -0700 (PDT)
From: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	vahnenko2003@gmail.com
Subject: 
Date: Fri, 13 Mar 2026 14:01:41 +0300
Message-ID: <20260313110141.26264-1-vahnenko2003@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026031334-luxury-sheath-81aa@gregkh>
References: <2026031334-luxury-sheath-81aa@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	EMPTY_SUBJECT(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34737-lists,linux-usb=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[vahnenko2003@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RSPAMD_EMAILBL_FAIL(0.00)[vahnenko2003.gmail.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E9EC3281DC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add USB_QUIRK_NO_BOS for ezcap401 capture card, without it dmesg will show "unable to get BOS descriptor or descriptor too short"
and "unable to read config index 0 descriptor/start: -71" errors and device will not able to work at full speed at 10gbs

Subject: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed
Signed-off-by: Vyacheslav Vahnenko <vahnenko2003@gmail.com>
---
 drivers/usb/core/quirks.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 9e7e49712..0010f41a3 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -574,6 +574,9 @@ static const struct usb_device_id usb_quirk_list[] = {
 	/* Alcor Link AK9563 SC Reader used in 2022 Lenovo ThinkPads */
 	{ USB_DEVICE(0x2ce3, 0x9563), .driver_info = USB_QUIRK_NO_LPM },
 
+	/* ezcap401 - BOS descriptor fetch hangs at SuperSpeed Plus */
+	{ USB_DEVICE(0x32ed, 0x0401), .driver_info = USB_QUIRK_NO_BOS },
+
 	/* DELL USB GEN2 */
 	{ USB_DEVICE(0x413c, 0xb062), .driver_info = USB_QUIRK_NO_LPM | USB_QUIRK_RESET_RESUME },
 
-- 
2.53.0


