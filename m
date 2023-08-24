Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8DFC787537
	for <lists+linux-usb@lfdr.de>; Thu, 24 Aug 2023 18:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242504AbjHXQYI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 24 Aug 2023 12:24:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242505AbjHXQXv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 24 Aug 2023 12:23:51 -0400
X-Greylist: delayed 397 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 24 Aug 2023 09:23:48 PDT
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5fcc:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC7D31BE
        for <linux-usb@vger.kernel.org>; Thu, 24 Aug 2023 09:23:48 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by mailout1.hostsharing.net (Postfix) with ESMTPS id 7CAC3101920CC;
        Thu, 24 Aug 2023 18:17:09 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by h08.hostsharing.net (Postfix) with ESMTPSA id 4EDA4603DADA;
        Thu, 24 Aug 2023 18:17:09 +0200 (CEST)
X-Mailbox-Line: From e47eee6551e5866d586fa8d223e3d81323f81fdc Mon Sep 17 00:00:00 2001
Message-Id: <cover.1692892942.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Thu, 24 Aug 2023 18:15:00 +0200
Subject: [PATCH v2 00/10] Multi-segment Event Ring support for XHCI
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>,
        Peter Chen <peter.chen@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enlarge the XHCI Event Ring to cope with high load situations
by allowing more than one segment.

This second iteration seeks to address all of Mathias' review feedback on v1:

* Patch [01/10]:
  Use ERST_DESI_MASK instead of ERST_PTR_MASK when constructing the new
  ERDP value to avoid carrying over a set EHB bit.

* Patch [04/10]:
  Only use up to 2 Event Ring segments by default (instead of 8).

* Patch [05/10]:
  New patch to adjust segment numbers after ring expansion.

* Patch [08/10]:
  New patch to clean up ERST_PTR_MASK inversion.

Several other issues caught my eye and I'm including fixes and cleanups
for those as well.

Link to v1:
https://lore.kernel.org/all/cover.1692085657.git.lukas@wunner.de/


Jonathan Bell (1):
  xhci: Use more than one Event Ring segment

Lukas Wunner (9):
  xhci: Clear EHB bit only at end of interrupt handler
  xhci: Preserve RsvdP bits in ERSTBA register correctly
  xhci: Set DESI bits in ERDP register correctly
  xhci: Adjust segment numbers after ring expansion
  xhci: Update last segment pointer after Event Ring expansion
  xhci: Expose segment numbers in debugfs
  xhci: Clean up ERST_PTR_MASK inversion
  xhci: Clean up stale comment on ERST_SIZE macro
  xhci: Clean up xhci_{alloc,free}_erst() declarations

 drivers/usb/host/xhci-debugfs.c |  2 +-
 drivers/usb/host/xhci-mem.c     | 68 ++++++++++++++++++---------------
 drivers/usb/host/xhci-ring.c    | 17 +++++----
 drivers/usb/host/xhci.c         |  2 +-
 drivers/usb/host/xhci.h         | 18 +++------
 5 files changed, 53 insertions(+), 54 deletions(-)

-- 
2.39.2

