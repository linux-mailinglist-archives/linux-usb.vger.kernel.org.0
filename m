Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110D8333A8A
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:47:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbhCJKqk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:46:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:7688 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231800AbhCJKqT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:19 -0500
IronPort-SDR: Uw7KYmcI2CDaLWyPmY2dmeMX/ExsJ+JY0jqPL5tjEnHOy5ew08ByNJ9gEpu29hHnHPUJ6H30fM
 5fwuvG7YdApQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273475498"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="273475498"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 02:46:19 -0800
IronPort-SDR: AGx4zCPnX+GAtFOHchDDlj7uJAiAe5UmFg0Ij3Yml+GjZ5dPfw0f7TdJuyBqrZhIKmbuRaxj2k
 Z+Xi101MAc2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="509624560"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2021 02:46:18 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 0/3] usb: typec: tps6598x: Move the driver under its own directory
Date:   Wed, 10 Mar 2021 13:46:27 +0300
Message-Id: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

The driver is going to be getting new features at one point it seems,
features like alternate mode registration, and firmware upgrading.
Some of those features will need to be implemented in their own files.
Because of that, and because the driver already consist of multiple
files, creating a separate folder for it.

The first patch is a minor fix.

thanks,

Heikki Krogerus (3):
  usb: typec: tps6598x: Fix tracepoint header file
  usb: typec: tps6598x: Move the driver under its own subdirectory
  usb: typec: tipd: Separate file for tracepoint creation

 drivers/usb/typec/Kconfig                         | 15 ++-------------
 drivers/usb/typec/Makefile                        |  5 +----
 drivers/usb/typec/tipd/Kconfig                    | 12 ++++++++++++
 drivers/usb/typec/tipd/Makefile                   |  6 ++++++
 drivers/usb/typec/{tps6598x.c => tipd/core.c}     |  6 ++----
 drivers/usb/typec/{ => tipd}/tps6598x.h           |  0
 drivers/usb/typec/tipd/trace.c                    |  9 +++++++++
 .../usb/typec/{tps6598x_trace.h => tipd/trace.h}  |  6 +++---
 8 files changed, 35 insertions(+), 24 deletions(-)
 create mode 100644 drivers/usb/typec/tipd/Kconfig
 create mode 100644 drivers/usb/typec/tipd/Makefile
 rename drivers/usb/typec/{tps6598x.c => tipd/core.c} (99%)
 rename drivers/usb/typec/{ => tipd}/tps6598x.h (100%)
 create mode 100644 drivers/usb/typec/tipd/trace.c
 rename drivers/usb/typec/{tps6598x_trace.h => tipd/trace.h} (98%)

-- 
2.30.1

