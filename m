Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8F53382BA1
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 13:58:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236884AbhEQMAG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 08:00:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:60652 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236862AbhEQMAE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 08:00:04 -0400
IronPort-SDR: jDxrG0sQsqBvtf946HW5n5MDzbwJqxH6fp25pgb00uJEJpZ/lz4Z3PKHCYwAGB9udVzhNJV8n8
 KWMDVu10AxYA==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200497506"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200497506"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 04:58:48 -0700
IronPort-SDR: kDYt+ONWHsPj+YtssbvnBebI3QdD0elRNGk0YlLP0IRTnU2mfy1YqmWSywrqKemwIfbQHgicoW
 ufYxxPCYtKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="472376091"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 17 May 2021 04:58:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4F6AE12F; Mon, 17 May 2021 14:59:07 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/4] thunderbolt: NVM fixes and consolidation
Date:   Mon, 17 May 2021 14:59:03 +0300
Message-Id: <20210517115907.52503-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series includes two fixes from Mathias on read side of NVM. These will
go to stable trees as well.

The rest will consolidate NVM read/write functions to get rid of the
duplication.

Mathias Nyman (2):
  thunderbolt: dma_port: Fix NVM read buffer bounds and offset issue
  thunderbolt: usb4: Fix NVM read buffer bounds and offset issue

Mika Westerberg (2):
  thunderbolt: Split NVM read/write generic functions out from usb4.c
  thunderbolt: Use generic tb_nvm_[read|write]_data() for Thunderbolt 2/3 devices

 drivers/thunderbolt/dma_port.c |  93 +++++-----------------------
 drivers/thunderbolt/nvm.c      |  95 ++++++++++++++++++++++++++++
 drivers/thunderbolt/tb.h       |  11 ++++
 drivers/thunderbolt/usb4.c     | 109 ++++++---------------------------
 4 files changed, 139 insertions(+), 169 deletions(-)

-- 
2.30.2

