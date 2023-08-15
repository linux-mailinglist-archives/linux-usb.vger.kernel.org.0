Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88C0977CCD1
	for <lists+linux-usb@lfdr.de>; Tue, 15 Aug 2023 14:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235048AbjHOMlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Aug 2023 08:41:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237279AbjHOMlF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Aug 2023 08:41:05 -0400
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDC2F7
        for <linux-usb@vger.kernel.org>; Tue, 15 Aug 2023 05:40:42 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
         client-signature RSA-PSS (4096 bits) client-digest SHA256)
        (Client CN "*.hostsharing.net", Issuer "RapidSSL Global TLS RSA4096 SHA256 2022 CA1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id E001D100D943A;
        Tue, 15 Aug 2023 14:40:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id B4F282ED5CA; Tue, 15 Aug 2023 14:40:40 +0200 (CEST)
Message-Id: <cover.1692085657.git.lukas@wunner.de>
From:   Lukas Wunner <lukas@wunner.de>
Date:   Tue, 15 Aug 2023 14:40:37 +0200
Subject: [PATCH 0/2] Multi-segment Event Ring support for XHCI
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Jonathan Bell <jonathan@raspberrypi.org>,
        Phil Elwell <phil@raspberrypi.com>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Philipp Rosenberger <p.rosenberger@kunbus.com>,
        Lino Sanfilippo <LinoSanfilippo@gmx.de>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Enlarge the XHCI Event Ring to cope with high load situations
by allowing more than one segment (patch [2/2]).  The patch is
lifted from the Raspberry Pi kernel, it has been in use there
for 4 years.  I've taken the liberty to slightly edit the commit
message and the patch itself for upstream.

As a prerequisite for the patch, ensure that the DESI bits in the
ERDP register are set correctly (patch [1/2]).  Incorrect DESI bits
cause an interrupt storm on Renesas uPD720201 host controllers.

Jonathan Bell (1):
  xhci: Use more than one Event Ring segment

Lukas Wunner (1):
  xhci: Set DESI bits in ERDP register correctly

 drivers/usb/host/xhci-mem.c  | 35 ++++++++++++++++++-----------------
 drivers/usb/host/xhci-ring.c |  2 +-
 drivers/usb/host/xhci.h      |  6 ++++--
 3 files changed, 23 insertions(+), 20 deletions(-)

-- 
2.39.2

