Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CDCB26C031
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 11:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726243AbgIPJLG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 05:11:06 -0400
Received: from mga03.intel.com ([134.134.136.65]:39051 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbgIPJLF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 05:11:05 -0400
IronPort-SDR: LImDOeqQ4c/0Bm0LsKMupzSuHXJd/fw5Syj6ffTvo+T2bCNFGa19VMe7QEfYQ0fEs3rw+tV3Sg
 bVLm2aibIwBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9745"; a="159480570"
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="159480570"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2020 02:11:04 -0700
IronPort-SDR: m17HjJXWvB1GOcn1jdgoNmVvDpG5ZFgvIm0lE52ATO1IQ8SeZKd/HLhtQKQ9KKdxUe7PseYj5G
 ZildIMTZ8BSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,432,1592895600"; 
   d="scan'208";a="409490832"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 16 Sep 2020 02:11:02 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 0/3] USB Type-C fixes for usb-next
Date:   Wed, 16 Sep 2020 12:10:59 +0300
Message-Id: <20200916091102.27118-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

So these Intel PMC mux driver fixes out of my original series [1] are
all for your usb-next.

[1] https://lore.kernel.org/linux-usb/20200916081617.17146-1-heikki.krogerus@linux.intel.com/

Azhar Shaikh (1):
  usb: typec: intel_pmc_mux: Pass correct USB Type-C port number to SoC

Heikki Krogerus (1):
  usb: typec: intel_pmc_mux: Add dependency on ACPI

Madhusudanarao Amara (1):
  usb: typec: intel_pmc_mux: Handle SCU IPC error conditions

 drivers/usb/typec/mux/Kconfig         |  1 +
 drivers/usb/typec/mux/intel_pmc_mux.c | 19 +++++++++++++++----
 2 files changed, 16 insertions(+), 4 deletions(-)

-- 
2.28.0

