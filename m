Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36E0210A95
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 13:56:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgGAL4W (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 07:56:22 -0400
Received: from mga07.intel.com ([134.134.136.100]:8600 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730374AbgGAL4V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 07:56:21 -0400
IronPort-SDR: pEgcKRmXaquLn2vRIBcVCIm26xdbn1cCR835xdWxI1FTR1c6xtCu1KakdcXAS/+nC0p/vEKol2
 VsZMwcdjyB6A==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="211607994"
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="211607994"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2020 04:56:21 -0700
IronPort-SDR: 2HRkzlC33o/v4wJysgEW1gh2NIemFZMs9rCqLD3FZN1JUiHNh4obzjIZeUfyGyoekkFkg/ivWA
 kM84bVF39jZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,300,1589266800"; 
   d="scan'208";a="386988127"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 04:56:19 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH 0/4] usb: typec: USB4 support to the Intel PMC mux driver
Date:   Wed,  1 Jul 2020 14:56:14 +0300
Message-Id: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

These include a couple of USB4 related improvements to the USB Type-C
class on top of the driver change.

FYI. I will be on vacation starting from next week (July 6th).

thanks,

Heikki Krogerus (4):
  usb: typec: Combine the definitions for Accessory and USB modes
  usb: typec: Add data structure for Enter_USB message
  usb: typec: intel_pmc_mux: Definitions for response status bits
  usb: typec: intel_pmc_mux: Add support for USB4

 drivers/usb/typec/mux/intel_pmc_mux.c | 75 +++++++++++++++++++++++----
 include/linux/usb/typec.h             | 14 +++++
 include/linux/usb/typec_altmode.h     | 14 ++---
 3 files changed, 83 insertions(+), 20 deletions(-)

-- 
2.27.0

