Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4E0826BEEC
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgIPIQU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:16:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:38799 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726068AbgIPIQT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:16:19 -0400
IronPort-SDR: 5kEC1FXNRaqam92Bee8WcmSDho8MCaoAPvuKG+/RoP29gASyF01fbjns+XUKD2pvuuF3gEY02p
 LMCSZduLCjEA==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="147174207"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="147174207"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 01:16:19 -0700
IronPort-SDR: YdYmk9n/aZbVJUhn56qkTI5MQ3FnqaoZm7a9qh3PZi0hiUheCopvEvsobUSj4o3vZzwmJbA6y+
 64O0LzBTMl1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409471829"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 01:16:17 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/5] USB Type-C fixes
Date:   Wed, 16 Sep 2020 11:16:12 +0300
Message-Id: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

There are two fixes for the UCSI drivers that address issues related
to the alternate modes. The other three fixes are for the PMC mux
driver. We were missing dependency on ACPI and the port number that
was used with the IOM was incorrect.

Let me know if you want anything to be changed.

thanks,

Azhar Shaikh (1):
  usb: typec: intel_pmc_mux: Pass correct USB Type-C port number to SoC

Heikki Krogerus (3):
  usb: typec: ucsi: acpi: Increase command completion timeout value
  usb: typec: ucsi: Prevent mode overrun
  usb: typec: intel_pmc_mux: Add dependency on ACPI

Madhusudanarao Amara (1):
  usb: typec: intel_pmc_mux: Handle SCU IPC error conditions

 drivers/usb/typec/mux/Kconfig         |  1 +
 drivers/usb/typec/mux/intel_pmc_mux.c | 19 +++++++++++++++----
 drivers/usb/typec/ucsi/ucsi.c         | 22 ++++++++++++++++------
 drivers/usb/typec/ucsi/ucsi_acpi.c    |  2 +-
 4 files changed, 33 insertions(+), 11 deletions(-)

-- 
2.28.0

