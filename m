Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CF82C3F8D
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 13:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbgKYMGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 07:06:45 -0500
Received: from mga04.intel.com ([192.55.52.120]:40146 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727409AbgKYMGp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 25 Nov 2020 07:06:45 -0500
IronPort-SDR: nmZWZj6pYScw5bniHoSpWcrQWMy126lb9bVItXnwtlKzduT9/uPBpaPvC3DTnDi0iguLncKIqe
 3ML15Jk5P44Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="169559217"
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="169559217"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 04:06:44 -0800
IronPort-SDR: cTu6ckH2G9ehQxPKEzcBKRTh67N3pRHCjOcbSnebcHyWmfx0xPJpafK7ajtAEESm2JZ8yw/F4U
 uFVuT5ht6RNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,368,1599548400"; 
   d="scan'208";a="432936346"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 25 Nov 2020 04:06:43 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>, linux-usb@vger.kernel.org
Subject: [PATCH 0/2] usb: typec: Expose the partner USB PD product type to the userspace
Date:   Wed, 25 Nov 2020 15:06:40 +0300
Message-Id: <20201125120642.37156-1-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I think this was OK to everybody. The original RFC:
https://lore.kernel.org/lkml/20201118150059.3419-1-heikki.krogerus@linux.intel.com/

thanks,

Heikki Krogerus (2):
  usb: pd: DFP product types
  usb: typec: Add type sysfs attribute file for partners

 Documentation/ABI/testing/sysfs-class-typec |  53 ++++++-
 drivers/usb/typec/class.c                   | 147 +++++++++++++++++---
 include/linux/usb/pd_vdo.h                  |  15 +-
 3 files changed, 193 insertions(+), 22 deletions(-)

-- 
2.29.2

