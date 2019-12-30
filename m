Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDB112D050
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 14:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfL3Nee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 08:34:34 -0500
Received: from mga02.intel.com ([134.134.136.20]:7640 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727445AbfL3Nee (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 08:34:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 05:34:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224226675"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 05:34:32 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: ucsi driver changes
Date:   Mon, 30 Dec 2019 16:34:29 +0300
Message-Id: <20191230133431.63445-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm sending these two patches separately (instead of together with
other USB Type-C patches). They only affect the UCSI drivers.

The first filters out bogus Connector Change Notifications
(interrupts) on some platforms, and the second makes sure the
DisplayPort alternate mode is exposed and handled properly with GPU
cards from NVIDIA.

thanks,

Ajay Gupta (1):
  usb: typec: ucsi: add support for separate DP altmode devices

Heikki Krogerus (1):
  usb: typec: ucsi: Store the notification mask

 drivers/usb/typec/ucsi/ucsi.c     |  94 ++++++++++++++-
 drivers/usb/typec/ucsi/ucsi.h     |  14 +++
 drivers/usb/typec/ucsi/ucsi_ccg.c | 191 +++++++++++++++++++++++++++++-
 3 files changed, 292 insertions(+), 7 deletions(-)

-- 
2.24.1

