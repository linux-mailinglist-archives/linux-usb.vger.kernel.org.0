Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9738D3031F6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jan 2021 03:40:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730648AbhAYQVi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Jan 2021 11:21:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730170AbhAYQVd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Jan 2021 11:21:33 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1AC5C06178B
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 08:19:40 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id p15so6685471wrq.8
        for <linux-usb@vger.kernel.org>; Mon, 25 Jan 2021 08:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=boundarydevices.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q9skQfAW6mvkX2OZYvMTD2P/DTOJaRYGHpGb9rH9Irk=;
        b=ic75epSwm04koj2KNME8R6MTYgZxodqaksoi2qh/9aBdGXWBRoIxrCUlt50bi6FWtl
         nwjVftA1JWERZAIq+yvnAd/D78aS05J0YnRHw3JLTtMjlNocvTHYEQVaPEs/Qfbonow+
         0eSX4qriD4u8Oq0ZBMPDyJ6HSepS+ztJxdZ48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q9skQfAW6mvkX2OZYvMTD2P/DTOJaRYGHpGb9rH9Irk=;
        b=D77zdVkIaOGrwffRIds1tc1dWUUP4MR0jikxeHpmQNTxFAbPFmVQF0lYZW3NJAkqOc
         Wkq2LPPIdQPHb04lcSowb12TGqxPyZcJi0PBW0RinbjXxLCzj7aWJqlqsB0ioThayBQF
         Hm2Y0fKOB3g7K+6EYUASEMv0DpZykc48eEmV4MC02hHmtPb0BWOKBhPXd2G/B5u+1XBw
         93kQm186yo/xc5gLbp4HE75rDK43Y9bjchORqGn3gsNvLpp+4BonhuDY9Ma4MCXLpFix
         GBAIwONgfeoxKgHh4bOHrpkK4AVje5jGH1UgBlQmO5B986qnyvSfe31fSrW2ADlLbe8o
         1wDg==
X-Gm-Message-State: AOAM531vGVhSCGaiMjpP/JriCiabc3bXeuqqaff6QVg/eVDC5hRpbPsb
        o8EU18MWq25qlUVdU3Rwxkjo0jAjwL2vqV9Q
X-Google-Smtp-Source: ABdhPJzCEIhG+xkhbAQCDa90/NEtdNjVAYlKIwknDRb0e9tAYEAJekD2nIC5tTDk5r2/aUOeCvR3RQ==
X-Received: by 2002:adf:9261:: with SMTP id 88mr1782812wrj.227.1611591578048;
        Mon, 25 Jan 2021 08:19:38 -0800 (PST)
Received: from p1g2.home (2a01cb000f9f0e008f0bd0d6ec94dd0e.ipv6.abo.wanadoo.fr. [2a01:cb00:f9f:e00:8f0b:d0d6:ec94:dd0e])
        by smtp.gmail.com with ESMTPSA id a130sm21299198wmf.4.2021.01.25.08.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 08:19:37 -0800 (PST)
From:   Gary Bisson <gary.bisson@boundarydevices.com>
To:     linux-usb@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org,
        Gary Bisson <gary.bisson@boundarydevices.com>,
        stable@vger.kernel.org
Subject: [PATCH] usb: dwc3: fix clock issue during resume in OTG mode
Date:   Mon, 25 Jan 2021 17:19:34 +0100
Message-Id: <20210125161934.527820-1-gary.bisson@boundarydevices.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit fe8abf332b8f ("usb: dwc3: support clocks and resets for DWC3
core") introduced clock support and a new function named
dwc3_core_init_for_resume() which enables the clock before calling
dwc3_core_init() during resume as clocks get disabled during suspend.

Unfortunately in this commit the DWC3_GCTL_PRTCAP_OTG case was forgotten
and therefore during resume, a platform could call dwc3_core_init()
without re-enabling the clocks first, preventing to resume properly.

So update the resume path to call dwc3_core_init_for_resume() as it
should.

Fixes: fe8abf332b8f ("usb: dwc3: support clocks and resets for DWC3
core")

Cc: stable@vger.kernel.org
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 drivers/usb/dwc3/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 841daec70b6e..3101f0dcf6ae 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1758,7 +1758,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
 		if (PMSG_IS_AUTO(msg))
 			break;
 
-		ret = dwc3_core_init(dwc);
+		ret = dwc3_core_init_for_resume(dwc);
 		if (ret)
 			return ret;
 
-- 
2.29.2

