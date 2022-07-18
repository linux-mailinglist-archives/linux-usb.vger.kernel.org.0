Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4A557828C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Jul 2022 14:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbiGRMmk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 18 Jul 2022 08:42:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbiGRMmj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 18 Jul 2022 08:42:39 -0400
Received: from maillog.nuvoton.com (maillog.nuvoton.com [202.39.227.15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 055781BE9A;
        Mon, 18 Jul 2022 05:42:38 -0700 (PDT)
Received: from NTHCCAS01.nuvoton.com (NTHCCAS01.nuvoton.com [10.1.8.28])
        by maillog.nuvoton.com (Postfix) with ESMTP id A35521C80F4A;
        Mon, 18 Jul 2022 20:29:37 +0800 (CST)
Received: from NTHCCAS01.nuvoton.com (10.1.8.28) by NTHCCAS01.nuvoton.com
 (10.1.8.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 18 Jul
 2022 20:29:37 +0800
Received: from taln60.nuvoton.co.il (10.191.1.180) by NTHCCAS01.nuvoton.com
 (10.1.12.25) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 18 Jul 2022 20:29:37 +0800
Received: by taln60.nuvoton.co.il (Postfix, from userid 10070)
        id 90A0D63A20; Mon, 18 Jul 2022 15:29:35 +0300 (IDT)
From:   Tomer Maimon <tmaimon77@gmail.com>
To:     <avifishman70@gmail.com>, <tali.perry1@gmail.com>,
        <joel@jms.id.au>, <venture@google.com>, <yuenn@google.com>,
        <benjaminfair@google.com>, <gregkh@linuxfoundation.org>,
        <stern@rowland.harvard.edu>, <tony@atomide.com>,
        <felipe.balbi@linux.intel.com>, <jgross@suse.com>,
        <lukas.bulwahn@gmail.com>, <arnd@arndb.de>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <openbmc@lists.ozlabs.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>
Subject: [PATCH v1 0/3] usb: host: npcm7xx-ehci: add Arbel NPCM8XX support and remove reset sequence 
Date:   Mon, 18 Jul 2022 15:29:19 +0300
Message-ID: <20220718122922.9396-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.5 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch set
- Adds Arbel NPCM8XX USB EHCI host controller support to USB EHCI driver.
- Remove the USB reset sequence because it is done in the NPCM reset driver.

The NPCM USB host driver tested on the NPCM845 evaluation board.

Tomer Maimon (3):
  usb: host: npcm7xx: remove USB EHCI host reset sequence
  dt-bindings: usb: npcm7xx: Add npcm845 compatible
  USB: host: npcm: Add NPCM8XX support

 .../devicetree/bindings/usb/npcm7xx-usb.txt   |  4 +-
 drivers/usb/host/Kconfig                      |  8 ++--
 drivers/usb/host/ehci-npcm7xx.c               | 47 -------------------
 3 files changed, 7 insertions(+), 52 deletions(-)

-- 
2.33.0

