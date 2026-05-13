Return-Path: <linux-usb+bounces-37382-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WPdGCk1jBGq6HgIAu9opvQ
	(envelope-from <linux-usb+bounces-37382-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1AB5326CD
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9DAF23041332
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 11:40:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445F401480;
	Wed, 13 May 2026 11:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b="l4CWWQCP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800E23FE67A
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 11:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778672423; cv=none; b=r6bwun70DeKVIPDP3vWxiqjj6ABvN0jB67aNvzUBE06CbSyWdT+zCqIEEZAYY13BEoizKFO4MNQhk/Zr+IjgdzgCkdeIGF4HnhTCC2HmJSdTP3USzJuuYUJGvTIfu1cSErW59sjcEqp6QRC9Z8UCATcs/f/6YDHlXZe13f87CP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778672423; c=relaxed/simple;
	bh=eMf2CLDG44C1jZ2p7u/edjuiS9xo64r85ao5+r/5ux4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVPKj75xhZkitYH38GC6rB9R2LlLqmFGCUAsS/6SHPZ6X/ziEiIRZb1/XtHGoxa6FDnfjAOpehtJbfPDzwwAryYoViuwE5lX2mmLu4ZQmE6A8oGBFObddnFGFyBWF1meUXlv+yNaLcdTBjquPcJLLwWDRc+G/s1WbhoAY8IYYpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20251104.gappssmtp.com header.i=@starlabs-systems.20251104.gappssmtp.com header.b=l4CWWQCP; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so80470255e9.3
        for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 04:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20251104.gappssmtp.com; s=20251104; t=1778672420; x=1779277220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQFvj5LmJIGIKjgLPEHd0VQ/ZMItSCOV0/e8nhf5n6k=;
        b=l4CWWQCPcZu7yzn0CNg+J78xhQ1MJumppuDVdKvB3ZSESP/0igH+6wdDyANWFqrlz/
         2tg9mrl2rVuy/V2CM9JvJylxKNyzvZEmhQAqxXgbUIZK1sNHBSoXdKwnE0PVOdv36BOP
         KXjMY3axE/H1eq/LltiRpPLLy3Ry6nr4xUYKK9XSq7H7wjac7Skh02I/NX0H2jehvigN
         tOOTjAtB2x6MPJZRSa7j0IJ5A/h2IeoVIVCVNtvo/uFTPqoCaYubCzc9SK6rnn0tkQbk
         Qyb00Cdy5nNpvJ412kE2agc0KrdgZc0bczbd2oAGHu/+6RnJG2QnSfC4ovNaan1dPJce
         6L+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778672420; x=1779277220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kQFvj5LmJIGIKjgLPEHd0VQ/ZMItSCOV0/e8nhf5n6k=;
        b=c3fYMIDCyfNmYOyLW5ZW4y2rL2yCHWDg2w+WZL3fOxa059yTZrCSgZY3pLV9PePPh7
         tzdZCOEy/i5rNwwm4U6AMLNxBdYC/kz6HkMcHxDG6hAEP6E1woO8eVZY3aT3EvZAD2m7
         hzMPZdNxyAJDY6Jt2/GDij9JMw9DSMmQbzGMRbjrRPSSq5k2I3XGkmR7K/OR0+VoQ/Wk
         qQOdbbBCNg/Sy/tQWHa+RKtKiJPC5ylMC6xhZOnw/0eIdws/AzA+JKYkq24wJ4WM1eo9
         zT4RLsDqDiO2Fpg+4Ms56KLBpMxgIIYQv9fg64k0FA9Gb1rYsFk+4jK8v+cJJPvo/QJV
         6sow==
X-Forwarded-Encrypted: i=1; AFNElJ+qt6eLzzQ4aRNrrqz+2WadIyxSDOGmi00Ryhcv0NdnAN8l9RvFVrTKTB2o9pNF4BUqNIWfE/Kcn34=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc8IRGFIHjvyVhZ2OQLp2FK86ZPEO1Og2bpTzxMZIAPR5W3t9y
	/qMaO3S5nNKOGzkSi2TirYgu8I74uyAIcHlKfg9LJyV+0C9Y9nJCvcIl1aPWCWGveA==
X-Gm-Gg: Acq92OGWQiJBEIwjfRAysGefpGZxlsEAbuRdSIa6QaLLYi5Iy9zAvRZwwknqiM5Z1mE
	cMW+1zGDMSXzC5BVqgpOwsuVGIOI8hLAv6xbBn5PwdN16qKQxmMUAYSDvDnq31VaxovaoMoHOuf
	b1/AWeQNEl/6gcUEviNTufzciRAl9lKbFry5B0W6vKtWevlKcQefEvGo/y9pFalNtRX10pllkJO
	Mt7S5ayZ9gFyL5V46NMKCygwwo8DRcm8PEjY6Lq0UV4hxMGTeExK5UwqJ917JjrNaf5z5xdOGdc
	qGSfc+DN3rdZw2hTDJWXWhKe1qbOK1Kdi3Zg1QorAGUDYWslqEkKjQlLPIpt37ybid3OuQLx7GE
	eNHc+nZsywbCJYJana8DsF2YMgLdnLWl5TUANmhv1+jo34taca/EvKQNZZPazhGpZtD7al+T+6z
	SkcsplVDOmaMInR0r/1dz3doSu2XqEStK1nxNP6tqR4ZhHvWhJc37GYf1hGLk/L8JOjmxq
X-Received: by 2002:a05:600c:6303:b0:48a:592c:e632 with SMTP id 5b1f17b1804b1-48fc9a2b921mr44740155e9.16.1778672419876;
        Wed, 13 May 2026 04:40:19 -0700 (PDT)
Received: from horizon.localdomain ([212.105.128.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fcdf64013sm53508475e9.2.2026.05.13.04.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:40:19 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Ricky Wu <ricky_wu@realtek.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Sean Rhodes <sean@starlabs.systems>,
	Jisheng Zhang <jszhang@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <error27@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-mmc@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	rogerable@realtek.com,
	matthew.schwartz@linux.dev
Subject: [RFC PATCH 2/2] mmc: rtsx_usb_sdmmc: start card power-up at 3.3V
Date: Wed, 13 May 2026 12:40:13 +0100
Message-ID: <7de637dbc99f1c2dc40cd255b078de9f1efd1ccb.1778672403.git.sean@starlabs.systems>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1778672403.git.sean@starlabs.systems>
References: <cover.1778672403.git.sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2A1AB5326CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[starlabs-systems.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[starlabs.systems : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[realtek.com,sandisk.com,starlabs.systems,kernel.org,gmail.com,loongson.cn,vger.kernel.org,linuxfoundation.org,arndb.de,linaro.org,intel.com,linux.dev];
	TAGGED_FROM(0.00)[bounces-37382-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[starlabs-systems.20251104.gappssmtp.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@starlabs.systems,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[starlabs.systems:email,starlabs.systems:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Some tray-based readers keep SD_CD asserted even without a card. The
rtsx_usb_sdmmc driver now validates insertion with a minimal probe
sequence. That probe must start with the SD pads in 3.3V mode.

Like the old rts5139 driver (sd_init_power()), force the SD pads to
3.3V and tune the SD18 regulator to 3.3V before powering up the card.
This avoids spurious probe timeouts when the reader is left in 1.8V
from a previous UHS session.

Tested: Realtek RTS5129 (0bda:0129) + tray + Lexar 2TB SDXC
Tested: cold boot detects mmcblk0 (2026-02-24)
Tested: hotplug insert enumerates mmcblk0 (2026-02-23)
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/mmc/host/rtsx_usb_sdmmc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_usb_sdmmc.c
index ec3eeea78e95..6be98926387d 100644
--- a/drivers/mmc/host/rtsx_usb_sdmmc.c
+++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
@@ -1108,6 +1108,11 @@ static int sd_power_on(struct rtsx_usb_sdmmc *host)
 	}
 	dev_dbg(sdmmc_dev(host), "%s\n", __func__);
 	rtsx_usb_init_cmd(ucr);
+	/* Start SD init at 3.3V, like the old rts5139 driver. */
+	rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, SD_PAD_CTL,
+			 SD_IO_USING_1V8, SD_IO_USING_3V3);
+	rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, LDO_POWER_CFG,
+			 TUNE_SD18_MASK, TUNE_SD18_3V3);
 	rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SELECT, 0x07, SD_MOD_SEL);
 	rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SHARE_MODE,
 			CARD_SHARE_MASK, CARD_SHARE_SD);

