Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4412D12731A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 02:56:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfLTB4R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Dec 2019 20:56:17 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38982 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfLTB4Q (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Dec 2019 20:56:16 -0500
Received: by mail-lj1-f193.google.com with SMTP id l2so8315043lja.6;
        Thu, 19 Dec 2019 17:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RdRgeWTtviiIWS4YZZN2UoUeCEyNPX48xbOaYwnMDFE=;
        b=dcS1TlxAOy/1bGVnMXVpE+SWtXzV0w/w3yEAu6hMpfXuYmlTkV4sUi8KVzS5hmGysN
         Qw+r+dKjngb882nDf555o4voGsyrWxs3fkNnk4vqKOXQH7wMjrfL3zdeAMGwK7LWOPSz
         EwMgHpzGo+23dY5Vpm8Px50FjMC+Oq6JbMBkhJN/dUAoFht9I5jBP1FFqqN3xPJ6/N0n
         dH923D4CgrsDx5MRpkN+2AkYOVYs21+aY1h4A/I7JXpmFnixmJ8sguKtsgg4VxJYH4VL
         thQdXq4uPG2pwSJqeZqlAlO3HSSYdP1du8B/AcAops7EIQ9KnsdyV88Hs73q1hu72MCa
         +YfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RdRgeWTtviiIWS4YZZN2UoUeCEyNPX48xbOaYwnMDFE=;
        b=k1bnEjJc/Ll7xl6fETxLpo35+SdwjVIfFTYLe5bVyLONFGgudRzm6sElxdQhV+kQIH
         N20IjSI386VZmyqtpVonYN43yL91tVGwczqIIqQKGWu9P9hamhgR0zc2C7B4YLtaZk5y
         DBaIQ3jku+P1GV7t5vH8oF/gCc7ZvaAf+qEBipkl1UxokxQz3QFEjd4t+X14D83QWBzs
         u15NCK6yE/+CVWH7688GgPerhsVu1L4vBmnpvyYetTfASZaNV9B1puLHhox+fb8MFgS/
         oiGtZudV301ceZYJ7asSm5UA4UaXU2RBTUCCNicIBkJY67Za5dSVSQvm1Ly8Ab6zq+qa
         T2cg==
X-Gm-Message-State: APjAAAVraOU9lSI2i2mnRUliDG9AnN+fS9/A8V4FK9pp+a5pF6q9C3uo
        sogfKABqmq5tu8nz+jzHy+8=
X-Google-Smtp-Source: APXvYqwHB2ubVpnJ68AxDl/uLyNqcPLfnu5LbydQhPsl6C6kNHP66ITjL4WSOOYmi0vbLh2TwfFTsQ==
X-Received: by 2002:a2e:914d:: with SMTP id q13mr8262950ljg.198.1576806973842;
        Thu, 19 Dec 2019 17:56:13 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru. [79.139.233.37])
        by smtp.gmail.com with ESMTPSA id m13sm3270901lfo.40.2019.12.19.17.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2019 17:56:13 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] usb: chipidea: tegra: Stop managing PHY's power
Date:   Fri, 20 Dec 2019 04:52:37 +0300
Message-Id: <20191220015238.9228-10-digetx@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191220015238.9228-1-digetx@gmail.com>
References: <20191220015238.9228-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tegra's USB PHY driver now provides generic PHY init/shutdown callbacks
and thus the custom PHY management could be removed from Tegra-specific
part of the ChipIdea driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 0c9911d44ee5..7455df0ede49 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -83,13 +83,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	/*
-	 * Tegra's USB PHY driver doesn't implement optional phy_init()
-	 * hook, so we have to power on UDC controller before ChipIdea
-	 * driver initialization kicks in.
-	 */
-	usb_phy_set_suspend(udc->phy, 0);
-
 	/* setup and register ChipIdea HDRC device */
 	udc->data.name = "tegra-udc";
 	udc->data.flags = soc->flags;
@@ -109,7 +102,6 @@ static int tegra_udc_probe(struct platform_device *pdev)
 	return 0;
 
 fail_power_off:
-	usb_phy_set_suspend(udc->phy, 1);
 	clk_disable_unprepare(udc->clk);
 	return err;
 }
@@ -119,7 +111,6 @@ static int tegra_udc_remove(struct platform_device *pdev)
 	struct tegra_udc *udc = platform_get_drvdata(pdev);
 
 	ci_hdrc_remove_device(udc->dev);
-	usb_phy_set_suspend(udc->phy, 1);
 	clk_disable_unprepare(udc->clk);
 
 	return 0;
-- 
2.24.0

