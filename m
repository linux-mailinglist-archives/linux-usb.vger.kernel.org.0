Return-Path: <linux-usb+bounces-4299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC6D8167AA
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 08:47:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52A701F22EF7
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 07:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25FCDF41;
	Mon, 18 Dec 2023 07:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OeggXBJE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB34E563
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 07:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4259024f6daso18505531cf.3
        for <linux-usb@vger.kernel.org>; Sun, 17 Dec 2023 23:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702885662; x=1703490462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fpBHAIOBdRsagWR9tkNOIFvuNKDSz3FE8gew41GQK/4=;
        b=OeggXBJEPsXmGb69tigjdsEWojQnffRMrTbZ+GfjCdnEIXE6UeiiAMKHSS7xKIOvWE
         v/SK2pFSC2oyoMx51s7D09axFEp2kzzpi617kGkuZU1kslrP7asb2eZ/c9MTUciMwAhw
         /DDAPOf92RI6CPpn9a8B+B+SqEGMU+tZoz7FtKcXf0QkooqvRli1B+CHIxDJ1NYnkt6h
         xEOouj8QaIctDXhfE5S2oJ+8Iigujl61Rw7ARu4Lj7qWusIrJanZMzxtxrLFbzleM1Wp
         ufNIbmHz2Taqurpxs0Bwdt5i2t79LG+QdfPHPL2jovlSaOCU93P+dethoaiRQnRD06kQ
         oFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702885662; x=1703490462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpBHAIOBdRsagWR9tkNOIFvuNKDSz3FE8gew41GQK/4=;
        b=s9H8tgC/1WpwS7QHcyE2iBXqZNNy/l+mzkSlbnYOSDWx48ns4D0TC1B5bs9c4jsRAz
         3UTGvYGNAP3F0xpu4Zaf25kH0CGOJoBbwrX/ydl1OvNSoa+gB5u4XQkUkoQD3HH8rdp/
         EgUyRTTUWsxvmSx+e9uSHstxgmRFH6kYMRfx3pOHtrJMNQgC1K/gjbNX3sts563jmVkS
         ogyMCYDIPdw2q4xuioGyMI1JrePLpXbrkIjnQEJKb8fFbmNpHylofOrshwlUcXO69DK/
         EdvsFifCpSyP4aYsPsBKmStB6e4SMJaOvtG1c8pRiILLctdPo1rPaz9pMrJ+rQLQqBx3
         Ap9A==
X-Gm-Message-State: AOJu0YzQ0Dp9DUToSRbR8wdp7154Pg2BJpvLmw5ajDJe4VtiIt48JSdw
	D0B6qq5YKy82j5P6qBzeZF8=
X-Google-Smtp-Source: AGHT+IFb8EMMD/PgkKesKcUq/MtIzx9Ruyj73avs8lRR2CFL36zV8n042WvmWqfLzXoQy45XA70/4A==
X-Received: by 2002:ac8:5c01:0:b0:418:1c96:8ae9 with SMTP id i1-20020ac85c01000000b004181c968ae9mr13971890qti.11.1702885661751;
        Sun, 17 Dec 2023 23:47:41 -0800 (PST)
Received: from pek-lpggp6.wrs.com (unknown-105-121.windriver.com. [147.11.105.121])
        by smtp.gmail.com with ESMTPSA id l3-20020ac87243000000b004166ab2e509sm9027043qtp.92.2023.12.17.23.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 23:47:41 -0800 (PST)
From: Kevin Hao <haokexin@gmail.com>
To: Matthieu CASTET <castet.matthieu@free.fr>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>
Subject: [PATCH] usb: ueagle-atm: Use wait_event_freezable_timeout() in uea_wait()
Date: Mon, 18 Dec 2023 15:47:30 +0800
Message-Id: <20231218074730.1898699-1-haokexin@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A freezable kernel thread can enter frozen state during freezing by
either calling try_to_freeze() or using wait_event_freezable() and its
variants. So for the following snippet of code in a kernel thread loop:
  wait_event_interruptible_timeout();
  try_to_freeze();

We can change it to a simple wait_event_freezable_timeout() and
then eliminate a function call.

Signed-off-by: Kevin Hao <haokexin@gmail.com>
---
 drivers/usb/atm/ueagle-atm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 8d5580d8d20a..16703815be0c 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -546,7 +546,7 @@ MODULE_PARM_DESC(annex,
 
 #define uea_wait(sc, cond, timeo) \
 ({ \
-	int _r = wait_event_interruptible_timeout(sc->sync_q, \
+	int _r = wait_event_freezable_timeout(sc->sync_q, \
 			(cond) || kthread_should_stop(), timeo); \
 	if (kthread_should_stop()) \
 		_r = -ENODEV; \
@@ -1896,7 +1896,6 @@ static int uea_kthread(void *data)
 			ret = sc->stat(sc);
 		if (ret != -EAGAIN)
 			uea_wait(sc, 0, msecs_to_jiffies(1000));
-		try_to_freeze();
 	}
 	uea_leaves(INS_TO_USBDEV(sc));
 	return ret;
-- 
2.39.2


