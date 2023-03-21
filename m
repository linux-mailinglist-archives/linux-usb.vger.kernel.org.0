Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 952D36C2E8E
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 11:19:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229606AbjCUKTZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 06:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjCUKTW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 06:19:22 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB2B2711
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 03:19:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5I-0000qx-7w; Tue, 21 Mar 2023 11:19:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5H-005fIa-3P; Tue, 21 Mar 2023 11:19:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1peZ5G-006iob-H7; Tue, 21 Mar 2023 11:19:14 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 0/2] usb: host: u132-hcd: Two cleanups
Date:   Tue, 21 Mar 2023 11:19:09 +0100
Message-Id: <20230321101911.342538-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=750; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=itnFsBn05xnSGqUmvLj7oCMJIXbVYzVeTRO7EZweUVQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkGYSNxmnyenH+Tzvf377ppG+OqmKAhFTsqRB+x vtJslAusRKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZBmEjQAKCRCPgPtYfRL+ ThmdB/4ivuPhwJIn7BgF3Fo5RCLI1X/AXAX5MT1UVQRo2s+HTSuEx49vwbw8dHwwE0ANYbfICWg FbjATdEI/F2NK6PETUOn47x9wdHzF5x2GCnmHqRxBnkqMqpWH7uyUR3zMenqLKU+TTbaGHLSUex 1iWPhuf/cn7O6TK/MqOJ2reb85AJLrztEhYgo+Sv7hHjFbMRgkSmP38PTUizvGGav0qcp01n9PK EgrtskXGS6mnGV01bRzqb0NzA2OUbKu48uEn7kvxDwOWW52V2iSOPnwPmbeQrNip+/xyf59ztuT WbDoqErZdoW+gws4j0QChTpZu2UQkPgdTbvsSTA9OHmmaUlQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

this driver is horrifying. I made these two cleanups but there is more to do:
 - Drop the explicit kref handling (or at least only do it in one place)
 - Simplify .remove() further (I think at entry ->going should never be > 1 (or
   even > 0?) Also "u132->going++ > 1" means the device is already gone, not
   "being removed".
 - Fix .remove() not to return -ENODEV;
 - I'm sure there is more.

Uwe Kleine-König (2):
  usb: host: u132-hcd: Various style improvements
  usb: host: u132-hcd: Drop if with an always true condition

 drivers/usb/host/u132-hcd.c | 452 +++++++++++++++++++-----------------
 1 file changed, 236 insertions(+), 216 deletions(-)

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.39.2

