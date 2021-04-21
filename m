Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D48E6367468
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 22:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245695AbhDUUtU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 16:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245691AbhDUUtU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 16:49:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1FE2C06138A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 13:48:46 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm8-00053r-5F; Wed, 21 Apr 2021 22:48:44 +0200
Received: from mgr by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1lZJm7-00017m-0a; Wed, 21 Apr 2021 22:48:43 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     balbi@kernel.org, Thinh.Nguyen@synopsys.com, kernel@pengutronix.de
Subject: [PATCH 0/2] usb: dwc3: gadget: fix scatter gather support
Date:   Wed, 21 Apr 2021 22:48:35 +0200
Message-Id: <20210421204837.4185-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patches fix the usage of scatter gather with the dwc3 gadget
driver. The driver is currently not using the variables pending_sgs
and queued_sgs as intended. This series fixes that.

Michael Grzeschik (2):
  dwc3: gadget: fix setting of pending_sgs
  dwc3: gadget: fix tracking of used sgs in request

 drivers/usb/dwc3/gadget.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.29.2

