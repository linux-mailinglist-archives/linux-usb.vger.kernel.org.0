Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48619149E45
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 03:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgA0Cgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jan 2020 21:36:35 -0500
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36532 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgA0Cge (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jan 2020 21:36:34 -0500
Received: by mail-qk1-f196.google.com with SMTP id w25so2569191qki.3;
        Sun, 26 Jan 2020 18:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0S2u5EvNWNA5WE8TUj76oT+IRB7+E8zMESAc070uf88=;
        b=nfz0Zw4lkiliOmUdWDYJk2YH1QtvOZ4tOjkEHu++tjyF7fuYCqIoGQr9VvYNaGPYvr
         tqtcQgg6fMOWzunduy2sa23jeRY9Od+mRUmafa0HKvaY40MH8Wko7Jdui89nMZBaRaVS
         GlMiq4m16lA1Hg9k46iszlYBXkIcORAfu8QSY0zxSu5Zb2y9Ik9HJhiU73wD8M7zjKMf
         5EWqSrhsajRncu9jvYOxTQO35SLHfc3p+U//gQfw1acYIaKx3dMVugKxHeygBzGEDu4j
         gr0Cttoi5dzGyKJsoOZB2pS643kr0fxrFQl/OMiaoSxq9xcGdTHyYOflW6eFGVn6huwP
         HuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0S2u5EvNWNA5WE8TUj76oT+IRB7+E8zMESAc070uf88=;
        b=ZXay2PqbeKpdvqkYVzFsLMcXhdDw/k4WAh9pChdwxMG31M7bf46xecatuCVLjlp8ma
         mVBhGOKZgxRNW22bWpnlsIbcpbBK1faSWuxvGCdnMEpFh8Zgk5/1wrTEoH16ExNWruZY
         2ddeEuGaaTayv/1tIvFy/SkYb18qfa6Ksvh4dgV8I9kCHuw4wvHn/GpaCSFmX59jxgAk
         b3XqiKATB7XeP4JQR7m5FX/ydoGT10PLh1ROhtEv/o2qMYEA7I+iJud4bdJBrmLrBEFn
         5ASLBYzueI299tcemktOPR4F4lT4NqGGuby6JRHIHz/5Yim/jGcivU9znMo5tGrTiXrY
         bSKg==
X-Gm-Message-State: APjAAAUgTKaFQPLSqGgkrdX3EB0jwuqqpe0jDQrz+OW1WuKwIF0rIqE6
        FibP6IREAHDZN0rb/s5e5mZaFkgOWutTew==
X-Google-Smtp-Source: APXvYqxrvmMbbUS3jBp+8X6OB262GUtUfAhQgiSq0g4QIa6SbC/hj3Mf8MctBe0YQrcJTS0wOg9MiQ==
X-Received: by 2002:a05:620a:11af:: with SMTP id c15mr4407030qkk.446.1580092593647;
        Sun, 26 Jan 2020 18:36:33 -0800 (PST)
Received: from master-desktop.sparksnet ([2601:153:900:4ad::bf1])
        by smtp.gmail.com with ESMTPSA id h4sm9010642qtp.24.2020.01.26.18.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2020 18:36:33 -0800 (PST)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Peter Chen <peter.chen@nxp.com>,
        Thierry Reding <treding@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH] usb: chipidea: tegra: fix hardlock with invalid dr mode
Date:   Sun, 26 Jan 2020 21:35:48 -0500
Message-Id: <20200127023548.27107-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The ci_hdrc_tegra driver does not currently support dual role mode, but
it does not explicitly prevent its use.
Certain devices support dual role mode, but not automatic role switch.
This can cause the device to lock up during initialization of the
driver.

Detect this state by checking for the extcon phandle when dual role mode
is set to otg.
If it doesn't exist request the driver to only enable manual role
switching.

Fixes: dfebb5f ("usb: chipidea: Add support for Tegra20/30/114/124")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 7455df0ede49..2f6f6ce3e8f5 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -89,6 +89,13 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	udc->data.usb_phy = udc->phy;
 	udc->data.capoffset = DEF_CAPOFFSET;
 
+	/* check the dual mode and warn about bad configurations */
+	if (usb_get_dr_mode(&pdev->dev) == USB_DR_MODE_OTG &&
+	   !of_property_read_bool(pdev->dev.of_node, "extcon")) {
+		dev_warn(&pdev->dev, "no extcon registered, otg unavailable");
+		udc->data.flags |= CI_HDRC_DUAL_ROLE_NOT_OTG;
+	}
+
 	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &udc->data);
 	if (IS_ERR(udc->dev)) {
-- 
2.17.1

