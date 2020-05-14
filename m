Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE511D34DB
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 17:18:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726117AbgENPS5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 11:18:57 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:3694 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbgENPS4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 11:18:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589469535; x=1621005535;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=iHpc9GmpBiWI+DxbxMsA58holdepr2B0aLBRDFt66wc=;
  b=ZxbvB1R9eEcRtGSrgYIfQf/RcdqhcgJNidiDA3o6P3jbAVip7gVk+DlB
   lBG/685cBvz+9fsVGX1L7Q/M+57Gl1XbFKNzuJYfdIPY3hQBwulCDXRlP
   imnOS74jJFAfLNP4QjXrWZaXyATu/9SI1zAtc3HF2WlD8GZmUlljbDOeV
   lPi11qmDpERllzZiefkOGeAfaJScBngbr8UsD+QD9KW4dSEmfVJpRXPpS
   i9rE2bNAXOh8LHZu5FdAevFz/ZUzlmHT4enRLjMicGYLYIWzxIgYaL1QW
   VDcYyivsSSM0U+S9qCED3uHqpbSLuZHyoTTdGrwTSi40gNgFz6q5kNX6e
   A==;
IronPort-SDR: pp4lWuYVfMpy8/blXw8KO5+t4XdNYQYtiO/vWk+yAK4e65o77u01fe3ZXwrmLTWjkkZ0Vm2mqH
 4Bzz+g78CyvjYX+Lq7mFRxm0rvP5So/UFU0BomUTupN5sxtoRFop4CVrvUKFl7K1f5hcxAa+Da
 sCZp/UwsIjeGV1mHKOW4nUV+1HSgJykpGedpsUZX/8vefV8JAjSmchjWU+g7S2alUCoAfR1opm
 boNh2f7ltvqwp/KMNt28vsyHwv7z0nYxtFNHzpBpAPw6QZTixp3HFU6R23hVdZ1fqCeGqCknkp
 MRc=
X-IronPort-AV: E=Sophos;i="5.73,391,1583218800"; 
   d="scan'208";a="76658363"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 May 2020 08:18:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 May 2020 08:18:55 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Thu, 14 May 2020 08:18:57 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH v2 0/7] staging: most: usb: fix issues found in code audit
Date:   Thu, 14 May 2020 17:18:45 +0200
Message-ID: <1589469532-21488-1-git-send-email-christian.gromm@microchip.com>
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

