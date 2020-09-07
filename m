Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85F1925FF62
	for <lists+linux-usb@lfdr.de>; Mon,  7 Sep 2020 18:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729873AbgIGQbF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Sep 2020 12:31:05 -0400
Received: from mga17.intel.com ([192.55.52.151]:19483 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729836AbgIGOYa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Sep 2020 10:24:30 -0400
IronPort-SDR: mFLmvVOEhff8l0ctHXrzFL6bWd9REIAsuKakJgHH24kTBklCOK7Ms6j6iPLNq+FPJpNx8x8Xka
 eC29+ShZ1oQg==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="138058724"
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="138058724"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 07:24:30 -0700
IronPort-SDR: g9TL9lVC4wNicksZkuLDNNGWQSpZguauaMKgBI0LEIaLu5ymuqACllFX/jrWz2SiZ7dBbJyPC6
 1qG4WW32cauA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,402,1592895600"; 
   d="scan'208";a="406851356"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Sep 2020 07:24:28 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 0/2] usb: typec: intel_pmc_mux: Port status from IOM microcontroller
Date:   Mon,  7 Sep 2020 17:24:26 +0300
Message-Id: <20200907142428.35838-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

This is the third version of the series. The original two were send by
Rajmohan. There is now no separate IOM driver. Instead the mux driver
simply reads the IOM registers directly.

This is link to the v2 of the series:
https://lore.kernel.org/linux-usb/20200822040508.23510-1-rajmohan.mani@intel.com/

thanks,

Heikki Krogerus (2):
  usb: typec: intel_pmc_mux: Check the port status before connect
  usb: typec: intel_pmc_mux: Support for device role (UFP)

 drivers/usb/typec/mux/intel_pmc_mux.c | 202 +++++++++++++++++++++-----
 1 file changed, 167 insertions(+), 35 deletions(-)

-- 
2.28.0

