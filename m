Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDF9E305A41
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jan 2021 12:48:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236995AbhA0LsI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Jan 2021 06:48:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236670AbhA0L2R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Jan 2021 06:28:17 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997CCC06178B
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:02 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id s24so3110734wmj.0
        for <linux-usb@vger.kernel.org>; Wed, 27 Jan 2021 03:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eaLLflOnKxP3ffgsiKs11jelhSBcLmsQ05hbA36SRWk=;
        b=mop6sJKsuKx109i4wFRGzFHjuny65TlVpW/7jqa/q7gNTSVaUSOSdZ3d1poYKmgZnZ
         LFfIDPqBNfwkj809/WBG0/EPIbR91wJ0pZv2VkttW8wfp3PI858ttY5oqYaStU92ulC0
         DTFAQS/CSfXFPx3pUYfdA93oroFJ1ttmFgdRoW9bZQrTZhyxGjI9zrnMcc1yY12eMlkn
         JOcrizBGsX3DzwOgb78uWR3SExVaTr0lakUgb/gy63zB7TVQud6x8KwFHTzaHSn2acSB
         FbMYD/wo0N/kXS+k3zUAEDBJxCJxJGQEeafDMfYrQKBSevW3TQYGo2cD0MkpktIku3mL
         t+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eaLLflOnKxP3ffgsiKs11jelhSBcLmsQ05hbA36SRWk=;
        b=qenQxtysGt69JrcH+8cEVsnhglVZEBE6r86NuZylyVgq1SYQ5MlkXVuP/Qfqm9n4uU
         xsV8uoZ+a496u/7R+K+dR7r4HWf7Rn5TDWaHFqQ4Xg6mvFEyckdCpKV4i/3abxXhveeI
         6d6xAjzKO+0WWgH7Z4bT+b68fxPeGEOj7mwSoWeFQlt6nTO+d2wK0npzKI6o7Q3QnE2F
         AFunyVO2Gac7wTDyAgnknK1Z2euZ3AbFe4JNNkIbckSXkC6caqiPrHEB6K0GBVlABLHZ
         aKawYRpNJdGF2xVEvDkosKoUEbU11VsQZMT1xVKPohZM1aQGCB7ok+fq1HU1aIYHbLP+
         IKQA==
X-Gm-Message-State: AOAM530UpdE82fnb8gEEMUzGDPaT4qZhsvBjKHrwt5xkfxUzQuMfG7W3
        Q33lM1zb63ykBW3TFdDtAdL6rA==
X-Google-Smtp-Source: ABdhPJxszX1z1YoVOvKrPQMaHwIfewhwrriy4HtebjVjpjgLl2GWclwbcMjFkzPxFOv2GciQaXRU/Q==
X-Received: by 2002:a1c:6486:: with SMTP id y128mr3965686wmb.12.1611746761314;
        Wed, 27 Jan 2021 03:26:01 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m2sm2040065wml.34.2021.01.27.03.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 03:26:00 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 02/12] thunderbolt: cap: Fix kernel-doc formatting issue
Date:   Wed, 27 Jan 2021 11:25:44 +0000
Message-Id: <20210127112554.3770172-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210127112554.3770172-1-lee.jones@linaro.org>
References: <20210127112554.3770172-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/thunderbolt/cap.c:189: warning: Function parameter or member 'sw' not described in 'tb_switch_find_cap'

Cc: Andreas Noever <andreas.noever@gmail.com>
Cc: Michael Jamet <michael.jamet@intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/thunderbolt/cap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/cap.c b/drivers/thunderbolt/cap.c
index 6f571e912cf21..8ecd610c62d50 100644
--- a/drivers/thunderbolt/cap.c
+++ b/drivers/thunderbolt/cap.c
@@ -178,7 +178,7 @@ int tb_switch_next_cap(struct tb_switch *sw, unsigned int offset)
 
 /**
  * tb_switch_find_cap() - Find switch capability
- * @sw Switch to find the capability for
+ * @sw: Switch to find the capability for
  * @cap: Capability to look
  *
  * Returns offset to start of capability or %-ENOENT if no such
-- 
2.25.1

