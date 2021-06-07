Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AB339DA73
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhFGLCD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:02:03 -0400
Received: from mga18.intel.com ([134.134.136.126]:16555 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230520AbhFGLCC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 07:02:02 -0400
IronPort-SDR: kh3f7hgiN8mjr/RNQZmpQPiDSFSiD+m6iKXx73UxKBV0IFVRmW+jVeL93YR2XHYyGJAD8LRZBd
 lTUQiGMFYEDQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10007"; a="191928010"
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="191928010"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2021 04:00:10 -0700
IronPort-SDR: cjfplx66BQeUvC6f8Mx8MJGpfv6XteQjG1oLIrmLg+K52Suy8YCI/5MGaJNYPnkFTMuVLyrd3d
 QO6jkFi81www==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,254,1616482800"; 
   d="scan'208";a="634671784"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2021 04:00:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 518D7142; Mon,  7 Jun 2021 14:00:30 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Subject: [PATCH 0/5] thunderbolt: Support for Intel Alder Lake and improvements
Date:   Mon,  7 Jun 2021 14:00:25 +0300
Message-Id: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series adds support for Intel Alder Lake which is the successor of
Tiger Lake. The integrated Thunderbolt/USB4 controller is pretty close to
the one found in Tiger Lake too.

In addition there are few improvements for issues reported by Dan Carpenter
and kernel test robot.

The series applies on top of thunderbolt.git/next.

Azhar Shaikh (1):
  thunderbolt: Add support for Intel Alder Lake

Gil Fine (1):
  thunderbolt: Poll 10ms for REG_FW_STS_NVM_AUTH_DONE to be set

Mika Westerberg (3):
  thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
  thunderbolt: Add device links only when software connection manager is used
  thunderbolt: No need to include <linux/acpi.h> in usb4_port.c

 drivers/thunderbolt/icm.c       | 20 ++++++----
 drivers/thunderbolt/nhi.c       | 71 ++-------------------------------
 drivers/thunderbolt/nhi.h       |  2 +
 drivers/thunderbolt/tb.c        | 67 +++++++++++++++++++++++++++++++
 drivers/thunderbolt/test.c      | 22 +++++-----
 drivers/thunderbolt/usb4_port.c |  1 -
 6 files changed, 97 insertions(+), 86 deletions(-)

-- 
2.30.2

