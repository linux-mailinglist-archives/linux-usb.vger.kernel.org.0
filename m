Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1D3F16150C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2020 15:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgBQOtS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Feb 2020 09:49:18 -0500
Received: from mga03.intel.com ([134.134.136.65]:14573 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728841AbgBQOtR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 Feb 2020 09:49:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Feb 2020 06:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,453,1574150400"; 
   d="scan'208";a="348510132"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2020 06:49:15 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Ajay Gupta <ajayg@nvidia.com>,
        Colin Ian King <colin.king@canonical.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/3] ucsi driver changes (for v5.7)
Date:   Mon, 17 Feb 2020 17:49:10 +0300
Message-Id: <20200217144913.55330-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Here all the UCSI driver changes at this stage. I though the cleanup
patch from Colin would conflict with the patches from Ajay, but there
was no problem after all.

Let me know if you want anything to be changed.

thanks,

Ajay Gupta (2):
  usb: typec: ucsi: register DP only for NVIDIA DP VDO
  usb: ucsi: ccg: disable runtime pm during fw flashing

Colin Ian King (1):
  usb: typec: ucsi: remove redundant assignment to variable num

 drivers/usb/typec/ucsi/ucsi.c     | 14 +++++++++++---
 drivers/usb/typec/ucsi/ucsi.h     |  7 +++++++
 drivers/usb/typec/ucsi/ucsi_ccg.c |  2 ++
 3 files changed, 20 insertions(+), 3 deletions(-)

-- 
2.25.0

