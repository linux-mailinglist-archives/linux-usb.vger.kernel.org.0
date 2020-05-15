Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A90E71D4951
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 11:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbgEOJVW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 05:21:22 -0400
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:42418 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727938AbgEOJVV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 05:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589534482; x=1621070482;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=Wpc2Ubd7jxe20vWKldyIQapLjZWeAIR+myyeB2Nv59g=;
  b=J1RlxtPZsjH/zrr92qteh1wuOzXoUb/IcY/koZBVcYmJnRHxJZaO4yKO
   hHxaOiCohBKw4fcNbplpg+4ypYnL6mIXZS+YwklNHYPNcQjQM1B24/H4A
   UPNWUKu+e8J+f88Y1W5vw/j6um0g9qdsHau49SrG/nlKBddv4msL3iEU5
   Blfhu8DbdZ8ftALtusGFgen9YooDIZqJbhSn+nlSJnp3mIynEqr8s+lkl
   t6q9HXX8qnQvvW60lQ0OvLZOJk8T+RIXDTxK3Es8HEhdGbJ1KIqlIMOiw
   3Za8dqXa6+eFU6BWShCuxb4lSTL8MpeUdCM1cOxAV4xTx3c2M4hDfrq4t
   g==;
IronPort-SDR: 6z7GK07rqAbGInFCPmB0m2kxoHCwhjm1QlaLl6QBQXARG8febrY9GRKFilj1bPU6DEHeVgfcss
 C7P8hvUJh4Fg96SF3aZrEvvInfnam+u6ZhQUPqFX6jik0Q+KtkVuKVM2pEUGThEekQCcaYNMp5
 SQ0D0HMuy6p0A6OOhwBdx2MADGnRGEDbTrNZneHWDbXhUungox6OAv1e0diJsa1UZ42miNaulg
 IHUOtz00KOH1m7K5Zq3zbstAwDzJhbQf/xWy5Qsjb6JJrMS/oDZf4+aJnIQ8N4QxIHEtIZtnfa
 v8A=
X-IronPort-AV: E=Sophos;i="5.73,394,1583218800"; 
   d="scan'208";a="76018826"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 02:21:09 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 02:21:12 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Fri, 15 May 2020 02:21:07 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v3 0/7] staging: most: usb: fix issues found in code audit
Date:   Fri, 15 May 2020 11:20:58 +0200
Message-ID: <1589534465-7423-1-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes the comments/findings on the previously submitted code
of the USB adapter driver. The fixes should be applied in staging before
moving the driver out as one patch.

v2:
	modded patch 2/7
v3:
	modded patch 3/7

Christian Gromm (7):
  staging: most: usb: use dev_*() functions to print messages
  staging: most: usb: remove reference to USB error codes
  staging: most: usb: check number of reported endpoints
  staging: most: usb: use dev_dbg function
  staging: most: fix typo in Kconfig
  staging: most: usb: use macro ATTRIBUTE_GROUPS
  Documentation: ABI: correct sysfs attribute description of MOST driver

 Documentation/ABI/testing/sysfs-bus-most | 104 ++++++++++----------
 drivers/staging/most/usb/Kconfig         |   2 +-
 drivers/staging/most/usb/usb.c           | 159 ++++++-------------------------
 3 files changed, 81 insertions(+), 184 deletions(-)

-- 
2.7.4

