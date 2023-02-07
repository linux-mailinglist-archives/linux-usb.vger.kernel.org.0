Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0BB568D515
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 12:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231920AbjBGLFu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 06:05:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjBGLFs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 06:05:48 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A17E38675;
        Tue,  7 Feb 2023 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767947; x=1707303947;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFsWSeYAageVMgP2N8c94C1DwB99H5I9X+J2x2OKYVg=;
  b=d2dmWsMVUvVa/yV70sSu+0MQKMWajnt6cNnLunJYWzBRpVVNPbqyhNf+
   EOWjWiKBdEi9wMXh6uj+avCfRmE3+gBOzjwMIt5maHnawJzct//6EVNQG
   rXxtt+KiUyg1bG0ounaUOxY757kVVaVEoDnJTQzpkDwoY4kWIUgKQTlN1
   bIb5cS15yxhPrkktAWDDU0g4eI/7rG3L/sQ3rjT6M005ShB1q8r5MaVJ0
   r5U4M0Mkaa8eQrKQ9ggRddhg/YnSmF6g+gmYn7C462aHoBZePuCkh0A7N
   O1adZ2ZiiJPN3yQANOAohG+12BvzY6mZgEqWfwNWRVf7RUGip1KDNYWfY
   w==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917154"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 07 Feb 2023 12:05:42 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 07 Feb 2023 12:05:42 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 07 Feb 2023 12:05:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675767942; x=1707303942;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AFsWSeYAageVMgP2N8c94C1DwB99H5I9X+J2x2OKYVg=;
  b=Jksy4O/LzXZHSJYXuHs9hyyMVNFHu8XCiba0vuoCgk0jkBKJFmRsrmPz
   4YTrGkaxUhQBqwMdDWVBbA78AVsoKRtBBtGDM9fkP89z1fkoNgeowdxI+
   3flbn8UF5rgBgtFDCXG6Eupnyf09EUVOOq7ohZT/FHgng5DBJTwWpFoK9
   rplYv9dPGJGsYtNpY9aZVQTTYHZpG/bP5R/LJWPHEUng+blqxWtfc+Zf1
   DXRheAY+IfgvHRPiFAF8B+Xh0MO2Sd7sR7HnE9bSHgki3gSk1+R8QWyxn
   1r885BtotPJJM6nkGmREEpcC2aKa4L6zFBNHI1KsCMS00li9gyRRUekNP
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,278,1669071600"; 
   d="scan'208";a="28917153"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 07 Feb 2023 12:05:42 +0100
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 001D1280056;
        Tue,  7 Feb 2023 12:05:41 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Darren Stevens <darren@stevens-zone.net>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 3/3] usb: host: fsl-mph-dr-of: reuse device_set_of_node_from_dev
Date:   Tue,  7 Feb 2023 12:05:31 +0100
Message-Id: <20230207110531.1060252-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
References: <20230207110531.1060252-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This sets both of_node fields and takes a of_node reference as well.

Fixes: bb160ee61c04 ("drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/usb/host/fsl-mph-dr-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
index e5df175228928..46c6a152b8655 100644
--- a/drivers/usb/host/fsl-mph-dr-of.c
+++ b/drivers/usb/host/fsl-mph-dr-of.c
@@ -112,8 +112,7 @@ static struct platform_device *fsl_usb2_device_register(
 			goto error;
 	}
 
-	pdev->dev.of_node = ofdev->dev.of_node;
-	pdev->dev.of_node_reused = true;
+	device_set_of_node_from_dev(&pdev->dev, &ofdev->dev);
 
 	retval = platform_device_add(pdev);
 	if (retval)
-- 
2.34.1

