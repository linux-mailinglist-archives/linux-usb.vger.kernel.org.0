Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 489BFB50A3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2019 16:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728542AbfIQOoz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 10:44:55 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:52751 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728511AbfIQOoz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 10:44:55 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEip-0005y2-7H; Tue, 17 Sep 2019 16:44:51 +0200
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1iAEio-0000WF-GR; Tue, 17 Sep 2019 16:44:50 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     richard.leitner@skidata.com, robh+dt@kernel.org,
        fancer.lancer@gmail.com
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 0/4] Add simple-pm ops
Date:   Tue, 17 Sep 2019 16:44:45 +0200
Message-Id: <20190917144449.32739-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

this series adds the simple-pm ops to reinitialize the hub after a
suspend. For this reason I added the vdd-supply to ensure that vdd is
ready.

Regards,
  Marco

Marco Felsch (4):
  dt-bindings: usb: usb251xb: add documentation for voltage supply
  usb: usb251xb: add vdd supply support
  usb: usb251xb: simplify reset helper
  usb: usb251xb: add pm_ops

 .../devicetree/bindings/usb/usb251xb.txt      |  1 +
 drivers/usb/misc/usb251xb.c                   | 49 ++++++++++++++++---
 2 files changed, 42 insertions(+), 8 deletions(-)

-- 
2.20.1

