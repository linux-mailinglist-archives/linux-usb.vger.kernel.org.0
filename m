Return-Path: <linux-usb+bounces-5026-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8912982CF98
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 04:41:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F2EAB1F21BC1
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jan 2024 03:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8479D1852;
	Sun, 14 Jan 2024 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esSEYANC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC441845
	for <linux-usb@vger.kernel.org>; Sun, 14 Jan 2024 03:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1d3ea5cc137so63910825ad.0
        for <linux-usb@vger.kernel.org>; Sat, 13 Jan 2024 19:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705203664; x=1705808464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvTtdQ7WNvHoGY4nuLrjefZXV0spudIkQ8d2YaEfteg=;
        b=esSEYANCnkhOQGeEU4e2kS9XtD2NVR1JFaiIm91YvnIS6PFKHwFQYTHhKB2Bklqsrj
         R+qDdDpwQTXFV5j1k9kJylYmnZN06oWLpCP57+UAfnRJ9w9wRE1ZyGkNhKwpB70ON82E
         WkVJJLuLIfyVFBwyMzSBpsb0j8QWRuEEPl3i3xzQSQTO9m6+tKecMnZAXwOuf/6NZRpJ
         n9cboWJL30XS+VhkPJxFppA6VL005TUXOEUr0is1Qjd98YnTyBJ85LaYQH8UKIgpg4ya
         UywJ/+IQ9snZ36WI4IPpb/qpkyYG974GfMc4F4O926FlJyZx9rx79sehvLm4Hi1jE7T7
         DoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705203664; x=1705808464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvTtdQ7WNvHoGY4nuLrjefZXV0spudIkQ8d2YaEfteg=;
        b=VAGxzGp2g3jhjUKTx9BQINzMi+AeuUdsZc/nJxirpbuoOC4/AcgUXnrKwrB1zGJtRT
         QDOQNW7co2gTarEhzKCdc1uk0MUc15V/IC70FJeMAvCjSlJ7y178Z6ZVP/zrDf7tBIOO
         rImMLPwjacsO9bP5yHBFq+RNmUP4zn6rH2JGvh6WOH1zrkFOn/D+QRJ+CNDr8lLQkXpm
         zJOTYq1SrME07kWHwxtULv0m2HWgtlOgbrq/HgbGf1qe5xKF6nB/oYTtuwKUFB6Kcqbm
         sahUPVt1WjgaGc8Vql4xgXvHUcMeTqnM5RS958jx6Nitr50YZu77mqV0Uu1K/Aci0j7P
         JUEw==
X-Gm-Message-State: AOJu0Yx9Yg5jLzSPO5CJKJsGDND92oPxaxqe5vES6MxYs8MGuhJmhI7b
	wJJMbGdLB/oZmDT3XYWG4zw=
X-Google-Smtp-Source: AGHT+IFaxCSV0Vpen8FHgJyDeV0jCXHor4rFCM8eI7huq6KME+QExg1EJ5og/AZEVPp1zrLlYLlh8Q==
X-Received: by 2002:a17:902:d504:b0:1d5:c281:f1b6 with SMTP id b4-20020a170902d50400b001d5c281f1b6mr1044835plg.93.1705203664126;
        Sat, 13 Jan 2024 19:41:04 -0800 (PST)
Received: from debian.realtek. ([115.135.24.14])
        by smtp.gmail.com with ESMTPSA id c10-20020a170902c1ca00b001d492055303sm5415632plc.279.2024.01.13.19.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jan 2024 19:41:03 -0800 (PST)
From: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
To: andreas.noever@gmail.com
Cc: michael.jamet@intel.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com,
	linux-usb@vger.kernel.org
Subject: [PATCH] thunderbolt: Fix xdomain rx_lanes_show and tx_lanes_show
Date: Sun, 14 Jan 2024 11:40:54 +0800
Message-Id: <20240114034054.28562-2-rahimi.mhmmd@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240114034054.28562-1-rahimi.mhmmd@gmail.com>
References: <20240114034054.28562-1-rahimi.mhmmd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the Inter-Domain link is operating in asymmetric TB_LINK_WIDTH_ASYM_TX
mode, the rx_lanes_show should return 1 since there is only one receiver
and tx_lanes_show should return 3 since there are 3 transmitters.

Signed-off-by: Mohammad Rahimi <rahimi.mhmmd@gmail.com>
---
 drivers/thunderbolt/xdomain.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 9803f0bbf20d..3e5c8aa06bed 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1786,13 +1786,13 @@ static ssize_t rx_lanes_show(struct device *dev, struct device_attribute *attr,
 
 	switch (xd->link_width) {
 	case TB_LINK_WIDTH_SINGLE:
-	case TB_LINK_WIDTH_ASYM_RX:
+	case TB_LINK_WIDTH_ASYM_TX:
 		width = 1;
 		break;
 	case TB_LINK_WIDTH_DUAL:
 		width = 2;
 		break;
-	case TB_LINK_WIDTH_ASYM_TX:
+	case TB_LINK_WIDTH_ASYM_RX:
 		width = 3;
 		break;
 	default:
@@ -1812,13 +1812,13 @@ static ssize_t tx_lanes_show(struct device *dev, struct device_attribute *attr,
 
 	switch (xd->link_width) {
 	case TB_LINK_WIDTH_SINGLE:
-	case TB_LINK_WIDTH_ASYM_TX:
+	case TB_LINK_WIDTH_ASYM_RX:
 		width = 1;
 		break;
 	case TB_LINK_WIDTH_DUAL:
 		width = 2;
 		break;
-	case TB_LINK_WIDTH_ASYM_RX:
+	case TB_LINK_WIDTH_ASYM_TX:
 		width = 3;
 		break;
 	default:
-- 
2.39.2


