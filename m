Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3E3C897E
	for <lists+linux-usb@lfdr.de>; Wed,  2 Oct 2019 15:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727758AbfJBNTp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Oct 2019 09:19:45 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41580 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725999AbfJBNTp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Oct 2019 09:19:45 -0400
Received: by mail-qt1-f195.google.com with SMTP id d16so5661472qtq.8;
        Wed, 02 Oct 2019 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WVO8uUPQ71ZC9HmcGL1pN05hQSDmpUzzYx3VXeyX+Gk=;
        b=V4wQ/cKpKnA9Z1CHknRsDjxyFfCB5Y4DmaDDSRR0+PTBWIPPewWriTXWK+9WO2h+X3
         cxU4TxOepglP40asv1NulUX3NMX1MNr3jz0wlLbNiANqQVJFC8+iO737hULTmzAsZS8W
         xwPJ40wkHb+vLikXiz7ovINRGAq3jwLKRm12+f5iW5VFBoLkGMJYzb31493wLeUrDj/T
         lCAK5kFMRIRi/odjrV1uGCYOkYxPddf0G+Co15SPDP5a28t1uMH8rZ9tzcgdomkIf2cw
         S2oJhz36Wwc6Es+/mG0ASeVS9cGm2qZQgY/fYVrghHYsaYsuFiXdrYiDTVwfvbR34XA5
         s85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WVO8uUPQ71ZC9HmcGL1pN05hQSDmpUzzYx3VXeyX+Gk=;
        b=YCZVe+7ipq5UYT4zgK6D2DqdT6PAQJTW+b5TclSVb+9LGrYZ1mSS1qXu8qE0dnVU3N
         7EdbhpsTAs/cwsCFuYxG+DNhbYvpNiBBgYQ+xtGpYR8Z+YD31DvGoGRR5L73caCiU4aP
         OTj8EFUFGtKUnsLdlluZOerz3KTIhq7ZL/pQ7dOPH89IJw0NIk56mAo4mui/6MkXwzkX
         sol7LRGNwwb61IEWwjyPkxvLZ1Z4/kOebPBSj2S71l1FpVVeq5jGysDCdDkFhfY6CpEg
         g8LP5vsA4hiYwtTp3Sg7AS3QRAuGqsjkzYRnNibOyPiIXNmmquf5LXBOrpoqzGxRofJT
         dChA==
X-Gm-Message-State: APjAAAXmyMXdHyRpr/DXHw/knfHgUmmYBDnZUiSORZYGXOdWptfNIhKf
        JHH6sVUweNeiSAB1rwqoJ7cA8WLoGO2Rtg==
X-Google-Smtp-Source: APXvYqwVXHQZa2dsa6BIu+V6QNJJ7Mw5sL+dZCV89EwXxks8tYoS5S6yPnf9RRbkJA6gArPPqcX5PA==
X-Received: by 2002:aed:2a3b:: with SMTP id c56mr4017338qtd.343.1570022384164;
        Wed, 02 Oct 2019 06:19:44 -0700 (PDT)
Received: from master-laptop.pgwipeout.duckdns.org ([2601:153:900:a52:cd17:1dcf:8657:164d])
        by smtp.gmail.com with ESMTPSA id h184sm9545194qkf.89.2019.10.02.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 06:19:43 -0700 (PDT)
From:   Peter Geis <pgwipeout@gmail.com>
To:     Peter Chen <Peter.Chen@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] usb: chipidea: tegra: clean up tegra_udc flag code
Date:   Wed,  2 Oct 2019 09:19:33 -0400
Message-Id: <20191002131933.6206-1-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

All Tegra devices handled by tegra-udc use the same flags.
Consolidate all the entries under one roof.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>

Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 12025358bb3c..0c9911d44ee5 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -24,35 +24,23 @@ struct tegra_udc_soc_info {
 	unsigned long flags;
 };
 
-static const struct tegra_udc_soc_info tegra20_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra30_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra114_udc_soc_info = {
-	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
-};
-
-static const struct tegra_udc_soc_info tegra124_udc_soc_info = {
+static const struct tegra_udc_soc_info tegra_udc_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA,
 };
 
 static const struct of_device_id tegra_udc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra20-udc",
-		.data = &tegra20_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra30-udc",
-		.data = &tegra30_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra114-udc",
-		.data = &tegra114_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra124-udc",
-		.data = &tegra124_udc_soc_info,
+		.data = &tegra_udc_soc_info,
 	}, {
 		/* sentinel */
 	}
-- 
2.17.1

