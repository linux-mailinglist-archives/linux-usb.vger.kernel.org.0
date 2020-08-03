Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A65923AC2C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 20:13:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgHCSNQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 14:13:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:61474 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgHCSNQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 14:13:16 -0400
IronPort-SDR: OzomcvaCTXg7f6ytVPEC5IFKpvpMkCWSetKDxelpzYHQwJsbxeCePfckIPEw5o2HL4ajuCPcNG
 qM8tb2yZVDpg==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="237036586"
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="237036586"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2020 11:13:16 -0700
IronPort-SDR: ze5bEuwlSyyAEOTRCeIN6YWrqdbF0xG85XOTKe1Ggzki0Y92qSaOtvYbZG6xR+CpUSxNuQiTgs
 K6jxZ5kX25TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,430,1589266800"; 
   d="scan'208";a="324226573"
Received: from swbkc-rack4.png.intel.com ([172.30.249.178])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2020 11:13:14 -0700
From:   Raymond Tan <raymond.tan@intel.com>
To:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Raymond Tan <raymond.tan@intel.com>
Subject: [PATCH 0/2] usb: dwc3: pci: Allow Elkhart Lake to utilize DSM method for PM functionality
Date:   Tue,  4 Aug 2020 02:11:22 +0800
Message-Id: <1596478284-69661-1-git-send-email-raymond.tan@intel.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Elkhart Lake adopted the DWC3 IP from other platforms, thus require same
DSM method to put the controller into D0/D3 state through PMU register.

Raymond Tan (2):
  usb: dwc3: pci: Fix DEFINE for Intel Elkhart Lake
  usb: dwc3: pci: Allow Elkhart Lake to utilize DSM method for PM
    functionality

 drivers/usb/dwc3/dwc3-pci.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.7.4

