Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1C842C4A2
	for <lists+linux-usb@lfdr.de>; Wed, 13 Oct 2021 17:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhJMPRY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 Oct 2021 11:17:24 -0400
Received: from mga09.intel.com ([134.134.136.24]:19396 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229514AbhJMPRY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Oct 2021 11:17:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="227348203"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="227348203"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2021 08:15:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; 
   d="scan'208";a="491504762"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 13 Oct 2021 08:15:19 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci feature for usb-next
Date:   Wed, 13 Oct 2021 18:16:32 +0300
Message-Id: <20211013151633.67355-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One feature for usb-next.
Allow runtime suspend for xHCI on AMD Yellow Carp platform

Thanks
-Mathias

Nehal Bakulchandra Shah (1):
  usb: xhci: Enable runtime-pm by default on AMD Yellow Carp platform

 drivers/usb/host/xhci-pci.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

-- 
2.25.1

