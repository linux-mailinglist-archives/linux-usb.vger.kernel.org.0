Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5444642D8E9
	for <lists+linux-usb@lfdr.de>; Thu, 14 Oct 2021 14:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhJNMMz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Oct 2021 08:12:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:24834 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231267AbhJNMMy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 Oct 2021 08:12:54 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="225120134"
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="225120134"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2021 05:10:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,372,1624345200"; 
   d="scan'208";a="659945529"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 14 Oct 2021 05:10:43 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH v2 0/1] xhci feature for usb next
Date:   Thu, 14 Oct 2021 15:11:59 +0300
Message-Id: <20211014121200.75433-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Second try, fixed the #define PCI_DEVICE_ID_AMD* aligments.
Allow runtime suspend for xHCI on AMD Yellow Carp platform

Thanks
-Mathias


Nehal Bakulchandra Shah (1):
  usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform

 drivers/usb/host/xhci-pci.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
2.25.1

