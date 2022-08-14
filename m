Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E10C5922FA
	for <lists+linux-usb@lfdr.de>; Sun, 14 Aug 2022 17:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241758AbiHNPwN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Aug 2022 11:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241998AbiHNPux (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Aug 2022 11:50:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD08A1CFFC;
        Sun, 14 Aug 2022 08:36:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 475D0B80B48;
        Sun, 14 Aug 2022 15:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEFEC433C1;
        Sun, 14 Aug 2022 15:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660491376;
        bh=dYGbQYEVSg+7i9OX+zbS1WofhspkrL24iXLAfO+kxgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oFmpIF1wT+wlwk/3gDae4nyvh3yPWyjMUrqcBUAyh8hlR0qJyNOd88VyOGmnUiqtU
         GyUbGx1Ssa7qW7FBK/b4hjqCQrgNHEAS8+WaOCbNS1HkrA3crSmHezw/eZ+CsnXtPV
         gBNZtkWLtPvDalw+9hu0bJ3MIZPydsRKL/iDAUB3sps1/tUFiR+3MpUw/rR7I3uqBK
         mYP1pF3D62ikGXuQfEZAdF1BpgnsoggVM1xZ5i+EocoeBIxrWZcMlrz8g/VLSyImUX
         ZAwJjnVQY+ju9eR1l4tTp8eFC7TMRQ8756F0XaCs9BPOnPLVz6Rg7CqE8r1dfq5Uqt
         vS4vwlKlEYWdw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Liang He <windhl@126.com>, Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 03/13] usb: host: ohci-ppc-of: Fix refcount leak bug
Date:   Sun, 14 Aug 2022 11:36:00 -0400
Message-Id: <20220814153610.2380234-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814153610.2380234-1-sashal@kernel.org>
References: <20220814153610.2380234-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Liang He <windhl@126.com>

[ Upstream commit 40a959d7042bb7711e404ad2318b30e9f92c6b9b ]

In ohci_hcd_ppc_of_probe(), of_find_compatible_node() will return
a node pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Signed-off-by: Liang He <windhl@126.com>
Link: https://lore.kernel.org/r/20220617034637.4003115-1-windhl@126.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/ohci-ppc-of.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-ppc-of.c b/drivers/usb/host/ohci-ppc-of.c
index 76a9b40b08f1..96c5c7655283 100644
--- a/drivers/usb/host/ohci-ppc-of.c
+++ b/drivers/usb/host/ohci-ppc-of.c
@@ -169,6 +169,7 @@ static int ohci_hcd_ppc_of_probe(struct platform_device *op)
 				release_mem_region(res.start, 0x4);
 		} else
 			pr_debug("%s: cannot get ehci offset from fdt\n", __FILE__);
+		of_node_put(np);
 	}
 
 	irq_dispose_mapping(irq);
-- 
2.35.1

