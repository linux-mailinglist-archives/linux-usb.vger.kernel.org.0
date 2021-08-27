Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FED73F9963
	for <lists+linux-usb@lfdr.de>; Fri, 27 Aug 2021 15:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245178AbhH0NNA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Aug 2021 09:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245175AbhH0NNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Aug 2021 09:13:00 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 462E7C061757
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:11 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id x6so2113631wrv.13
        for <linux-usb@vger.kernel.org>; Fri, 27 Aug 2021 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bx8Arm/Vs5CpHd4yeLjhHeHRFARmgA3I8g7M84xbgA4=;
        b=JllIXhxfnezKGwuaTcszEytlK5AJM5uR/+wrElrDGPM2GtP0TuSGBQMilstNMoMBu/
         BjX2N8zJvxkAmiohzRtkeU/hc9kzcllX7C/IfsyNcAwXdPOo/h3l/n0o78RxAjfqlHNr
         Mwv7DMg57f3uFxyzEOKwcs0bNlmqFi1xnvCQBgfhiJ0dFAc2U9mkRbcaDBCm4uvYnXvV
         1H9ZaIV5MX3bHr3z8qF+k+MiqsxTS4rtpM/tO+ggb2/+qWTpDis1LY+h+JLHTCLgyNus
         gVcRnI9Ttc9wK8sEh1GsCsmrGyre3vtRpdXK5VdRV+v7UWWfDCWpWakylREUJ7dopb+P
         uumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bx8Arm/Vs5CpHd4yeLjhHeHRFARmgA3I8g7M84xbgA4=;
        b=VIR5LG/cixnfOlEZHf74FwIJvmdEECk8rttM6CZCtIF26qea34iN97KTPWnGVVUbSo
         FEOwFHSa6RR4rl72+Dwrhx8PkIXJgiCslcqwOvDkd78dCgnoz+xe7wPTMZZC5gFyb/qH
         8BQjWn2t5opMjiyraLE0EoxqJqQgtpBXa8pl8HqFPzznqdfFkvBlWln1YeVPg2ceUVOl
         ezSNH3LDD9StcyqxzXVk45gJgUqJoEFzcnghvORQjVJO8IuZcgyW0HFfEqKypBtRtw5b
         fDSWZKu7TvhJIVpZ0xmoQMeVDf2tG40ZWhP4ml9kv/kj+KG8fjScdeHNPPGNKZ5+awXZ
         4C3g==
X-Gm-Message-State: AOAM532REwhoT5wxzmn8U8RhKoYRjmcJZVoZqcEPpVY9wpffFdSILq59
        aV+eEopKpHgojkZkHN2NbRQIrw==
X-Google-Smtp-Source: ABdhPJwSSdL67Ad7dMYB1qgx0DcFPZNKl5vfByBPAJUxzPT6leWQhgIT543tIpB73KLujpmnMGz/aQ==
X-Received: by 2002:a5d:634f:: with SMTP id b15mr10095883wrw.220.1630069929823;
        Fri, 27 Aug 2021 06:12:09 -0700 (PDT)
Received: from arch-thunder.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id c7sm5279349wmq.13.2021.08.27.06.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:12:09 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     linux-usb@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v2 1/5] usb: isp1760: fix memory pool initialization
Date:   Fri, 27 Aug 2021 14:11:50 +0100
Message-Id: <20210827131154.4151862-2-rui.silva@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210827131154.4151862-1-rui.silva@linaro.org>
References: <20210827131154.4151862-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The loops to setup the memory pool were skipping some
blocks, that was not visible on the ISP1763 because it has
fewer blocks than the ISP1761. But won testing on that IP
from the family that would be an issue.

Reported-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Tested-by: Dietmar Eggemann <dietmar.eggemann@arm.com>
---
 drivers/usb/isp1760/isp1760-hcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp1760-hcd.c
index bf8ab3fe2e5a..b3a55c5d2155 100644
--- a/drivers/usb/isp1760/isp1760-hcd.c
+++ b/drivers/usb/isp1760/isp1760-hcd.c
@@ -588,8 +588,8 @@ static void init_memory(struct isp1760_hcd *priv)
 
 	payload_addr = PAYLOAD_OFFSET;
 
-	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++) {
-		for (j = 0; j < mem->blocks[i]; j++, curr++) {
+	for (i = 0, curr = 0; i < ARRAY_SIZE(mem->blocks); i++, curr += j) {
+		for (j = 0; j < mem->blocks[i]; j++) {
 			priv->memory_pool[curr + j].start = payload_addr;
 			priv->memory_pool[curr + j].size = mem->blocks_size[i];
 			priv->memory_pool[curr + j].free = 1;
-- 
2.33.0

