Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDF543F8A1F
	for <lists+linux-usb@lfdr.de>; Thu, 26 Aug 2021 16:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242799AbhHZOch (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Aug 2021 10:32:37 -0400
Received: from mga03.intel.com ([134.134.136.65]:40917 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231458AbhHZOcg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Aug 2021 10:32:36 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10088"; a="217789863"
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="217789863"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2021 07:31:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,353,1620716400"; 
   d="scan'208";a="598500930"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2021 07:31:44 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ulrich Huber <ulrich@huberulrich.de>
Cc:     linux-usb@vger.kernel.org
Subject: [RFC PATCH 0/7] UCSI work
Date:   Thu, 26 Aug 2021 17:31:39 +0300
Message-Id: <20210826143146.25799-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Ulrich,

This is the series that I'm hoping solves the issue you reported [1].
Let me know if you can test them, and if these work for you. The exact
patch that you are are probable most interested in is the very last
one of the series.

Note. The series is still WIP.

thanks,

Heikki Krogerus (7):
  usb: typec: ucsi: Always cancel the command if PPM reports BUSY
    condition
  usb: typec: ucsi: Don't stop alt mode registration on busy condition
  usb: typec: ucsi: Add polling mechanism for partner tasks like alt
    mode checking
  usb: typec: ucsi: acpi: Reduce the command completion timeout
  usb: typec: ucsi: Check the partner alt modes always if there is PD
    contract
  usb: typec: ucsi: Read the PDOs in separate work
  usb: typec: ucsi: Better fix for missing unplug events issue

 drivers/usb/typec/ucsi/ucsi.c      | 341 ++++++++++++++---------------
 drivers/usb/typec/ucsi/ucsi.h      |   3 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c |   2 +-
 3 files changed, 166 insertions(+), 180 deletions(-)

-- 
2.32.0

