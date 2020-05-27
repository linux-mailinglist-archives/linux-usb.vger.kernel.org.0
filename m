Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 648ED1E3D2C
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 11:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388502AbgE0JGe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 05:06:34 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:2344 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388268AbgE0JGc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 May 2020 05:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1590570391; x=1622106391;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=OJ3jogAcBXoCOIeBSavV874OsXHq0x03huAnCHVD8go=;
  b=DVg/EbnvfqJo5xS83q7Qmd8GVZxPIRg+eHwlOdfMHXPY2J8jWt0YyE50
   Ke0yfqQTMH7HXEF7CdUpW3Rc1bGm8TWjbu3HvFdCsJ3xg9W4MkDZLJHy7
   ztZJel5cNP30QVhqk+ANpCgA4bFp8rMHfn4U41l+LuvDK6FxrQXN3VZ+l
   jaV7XyAnd8LWvj5qJoK6zDt08FcYQdrjNvxcRi/jRpwYNV+9fagxYaa7a
   50mXVnDjJATpjhW28j8yYxDc/1SmgmFXB8cYyMMSqYu2rOOOd/UOIBU/Q
   S1D+ndpGAto++v65YQl71cMKXNDs2kMGC0iFdZ9pNfkAiykJClOzDUFYL
   w==;
IronPort-SDR: Ze6Vd32uZyek0pdsjKXiWgnbh0U9iVpKfgMlYkmBA9xs5VTsKKGTVDnTEwgE6SP4nUvgMiZYPG
 YOXdbRhnpZ9pYm5eHxXzGFkjaVmutf4Y5KmMo0ZRjGdKhuKH196OfDrf5wqxryDYn44mWYUN7R
 evEGIQurZwPXRSXIuzmuW8mPmzVr11EFh6PusUAlPdDaosL9PeFjuKlsDwspvibWdvfsxkHkNa
 mYn29+n0d18x0oeynQjZL+bxSm31uw3hM/TsLmF2TXhkOTNBO4qt30dd622aZLN8teuYkxvbbb
 DJ0=
X-IronPort-AV: E=Sophos;i="5.73,440,1583218800"; 
   d="scan'208";a="74590201"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 May 2020 02:06:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 27 May 2020 02:06:24 -0700
Received: from localhost.localdomain (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 27 May 2020 02:06:30 -0700
From:   Christian Gromm <christian.gromm@microchip.com>
To:     <gregkh@linuxfoundation.org>
CC:     <driverdev-devel@linuxdriverproject.org>,
        <linux-usb@vger.kernel.org>,
        Christian Gromm <christian.gromm@microchip.com>
Subject: [PATCH 00/10] staging: most: usb: fix code review findings
Date:   Wed, 27 May 2020 11:06:17 +0200
Message-ID: <1590570387-27069-1-git-send-email-christian.gromm@microchip.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This series fixes the comments received from the mailing list.

Christian Gromm (10):
  staging: most: usb: change order of function parameters
  staging: most: usb: don't use expressions that might fail in a
    declaration
  staging: most: usb: change return value of function drci_rd_reg
  staging: most: usb: return 0 instead of variable
  staging: most: usb: move allocation of URB out of critical section
  staging: most: usb: don't use error path to exit function on success
  staging: most: usb: replace code to calculate array index
  staging: most: usb: use correct error codes
  staging: most: usb: add missing put_device calls
  staging: most: usb: use function sysfs_streq

 drivers/staging/most/usb/usb.c | 83 ++++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 36 deletions(-)

-- 
2.7.4

