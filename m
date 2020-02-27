Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E46171533
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 11:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgB0KmU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Feb 2020 05:42:20 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50689 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728844AbgB0KmU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Feb 2020 05:42:20 -0500
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcR-0003f5-Ay; Thu, 27 Feb 2020 11:42:15 +0100
Received: from mfe by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1j7GcP-0004nZ-5E; Thu, 27 Feb 2020 11:42:13 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Peter.Chen@nxp.com, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, linux-imx@nxp.com, stern@rowland.harvard.edu,
        jun.li@freescale.com
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH 0/3] USB IMX Chipidea fix gpio vbus control
Date:   Thu, 27 Feb 2020 11:42:09 +0100
Message-Id: <20200227104212.12562-1-m.felsch@pengutronix.de>
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

the gpio-based port power is broken since commit [1,2]. I changed the
core behaviour to to cleanup the code and avoid local workaround fixes.

With this series and [3] I'am now able to disable the port completely
after I disbaled the pm_qos_no_power_off flag.

[1] 6adb9b7b5fb6 ("usb: chipidea: add a flag for turn on vbus early for host")
[2] 659459174188 ("usb: chipidea: host: turn on vbus before add hcd if early vbus on is required")
[3] https://lkml.org/lkml/2020/2/27/198

Regards,
  Marco

Marco Felsch (3):
  USB: ehci-hub: let port_power() override the ehci_port_power()
  Partially Revert "usb: chipidea: host: turn on vbus before add hcd if
    early vbus on is required"
  Revert "usb: chipidea: add a flag for turn on vbus early for host"

 drivers/usb/chipidea/ci_hdrc_imx.c | 10 ++--------
 drivers/usb/chipidea/host.c        | 31 ++++++++++--------------------
 drivers/usb/host/ehci-hub.c        |  6 +++---
 include/linux/usb/chipidea.h       | 17 ++++++++--------
 4 files changed, 23 insertions(+), 41 deletions(-)

-- 
2.20.1

