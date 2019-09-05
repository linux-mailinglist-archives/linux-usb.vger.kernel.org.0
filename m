Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57572AA83B
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 18:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388956AbfIEQSb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 12:18:31 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44798 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388496AbfIEQSX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 12:18:23 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so1665002pgl.11
        for <linux-usb@vger.kernel.org>; Thu, 05 Sep 2019 09:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KBEjaWO3Fe2PBzPolu3WMn8NTAUiCD8HB53ny3BQ6OI=;
        b=plmQ8J8hM7P284lC2RlFaPT3UU/0f+9eU9WDxSbYt7bW8T1tbLLfVU8NYjquQ7LNE4
         KnLS0x5VNgK3M6FqfPB2sD3wKmxbXx14Gobu/OwtOpbYXU/IkghbfCOdM1Mm7JXUh+Re
         OGs1MQyDI9D6huwbn+67NCfvpkEUEztWZnuG+dI47z8mROznT1jdRnoaXcW7sxDawxXv
         Prljpk4ow91RFRvrdX2X7chbuX2fROHQ8DJAAJyHeGbf0V0cbS24NfqzYiaVo4TwwtW2
         kTkXUjGOt5qiIylni0ye87NDZ87V7CWg9z4DmQC6OdJUkaVDj8vy3LiXlIYHBzvmnKx/
         lkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KBEjaWO3Fe2PBzPolu3WMn8NTAUiCD8HB53ny3BQ6OI=;
        b=Mew3ilpllw3OSkT8D7q7tFDURsjGbXhtc+pvAB42N9S6jyZmKwCnm02WomfVJQzUSC
         pbFsI1nmfOQbPfKbaVnpj++720TITZJFZ9ooRT/pYHfqrG88O82/xoL6jHcnv2Swi7IJ
         KxylBayBYAQtr9O0ZTRIaFowaUxoc3aQFcy3FsNL3UPrmjOLQmj7F13xJLORxgSMK+Q+
         xvMVSSWXnTnpUlYLOMIjGpipKw2x7lA8Nv92PmGt8txqF249oLLiX2aGTs/fp08Ghh7M
         bajEBKJMc/yjJ9JBW5WvebjJ3Uk0rNFGno7Iu2gUd11jVtcxv5nsYJabI6+7kjbJkK2S
         LHaw==
X-Gm-Message-State: APjAAAVVZnX6l3lyaz4CrdjwUsz9ZM92nMtf5uDLbOIUDtXBMEbngEF8
        v9zOL7Z9VTu5dQxPdee9jWoMcw==
X-Google-Smtp-Source: APXvYqzidpJMrA4iY307wddu1S9Lti1cpjYGyLo/7tWJzFGVVSA/c4srK97ZZ5J4SE3dFJjAXsP6BQ==
X-Received: by 2002:a63:89c2:: with SMTP id v185mr3909722pgd.241.1567700303006;
        Thu, 05 Sep 2019 09:18:23 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id m129sm6324005pga.39.2019.09.05.09.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2019 09:18:22 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     stable@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: [BACKPORT 4.14.y 18/18] cpufreq: ti-cpufreq: add missing of_node_put()
Date:   Thu,  5 Sep 2019 10:17:59 -0600
Message-Id: <20190905161759.28036-19-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190905161759.28036-1-mathieu.poirier@linaro.org>
References: <20190905161759.28036-1-mathieu.poirier@linaro.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zumeng Chen <zumeng.chen@gmail.com>

commit 248aefdcc3a7e0cfbd014946b4dead63e750e71b upstream

call of_node_put to release the refcount of np.

Signed-off-by: Zumeng Chen <zumeng.chen@gmail.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/cpufreq/ti-cpufreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/ti-cpufreq.c b/drivers/cpufreq/ti-cpufreq.c
index 4bf47de6101f..cadc324bedb4 100644
--- a/drivers/cpufreq/ti-cpufreq.c
+++ b/drivers/cpufreq/ti-cpufreq.c
@@ -205,6 +205,7 @@ static int ti_cpufreq_init(void)
 
 	np = of_find_node_by_path("/");
 	match = of_match_node(ti_cpufreq_of_match, np);
+	of_node_put(np);
 	if (!match)
 		return -ENODEV;
 
-- 
2.17.1

