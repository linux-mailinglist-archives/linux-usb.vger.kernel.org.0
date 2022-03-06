Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EDF44CEDE4
	for <lists+linux-usb@lfdr.de>; Sun,  6 Mar 2022 22:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234006AbiCFVNy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Mar 2022 16:13:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232319AbiCFVNx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Mar 2022 16:13:53 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D184CEA
        for <linux-usb@vger.kernel.org>; Sun,  6 Mar 2022 13:12:55 -0800 (PST)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQyBR-0000Nr-IX; Sun, 06 Mar 2022 22:12:53 +0100
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1nQyBQ-009ZVE-PT; Sun, 06 Mar 2022 22:12:52 +0100
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [RESEND v3 0/2] usb: dwc3: gadget: simple refactoring patches
Date:   Sun,  6 Mar 2022 22:12:49 +0100
Message-Id: <20220306211251.2281335-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series includes some smaller refactoring patches to improve the
code quality of the dwc3 gadget. It includes no functional changes.

Michael Grzeschik (2):
  usb: dwc3: gadget: ep_queue simplify isoc start condition
  usb: dwc3: gadget: move cmd_endtransfer to extra function

 drivers/usb/dwc3/gadget.c | 79 ++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 38 deletions(-)

-- 
2.30.2

