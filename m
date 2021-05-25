Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4343738FC3F
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 10:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhEYIKc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 04:10:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:31557 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232049AbhEYIJ3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 25 May 2021 04:09:29 -0400
IronPort-SDR: 5I+rW76qT0jecNI1r+jmg0zBn/xplL62kBZfB6v2skpPeynXW6NbSPyCvVg88Q7gHZrQBolMLt
 lbHDtiXoCQVw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="181767643"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; 
   d="scan'208";a="181767643"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2021 00:38:54 -0700
IronPort-SDR: C5pSrs8E5yUEZPEIwPvGInwfjwLdbwXRmaJfjy6XElwVok7cKVehJnTdPEFb+F2vt1BHIITJaV
 e6eMR5mmMmsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; 
   d="scan'208";a="546464435"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga001.fm.intel.com with ESMTP; 25 May 2021 00:38:53 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Tue, 25 May 2021 10:40:58 +0300
Message-Id: <20210525074100.1154090-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

two patches for usb-linus and 5.12 stable
xhci changes in 5.12 caused a regression in stall handling.
Due to this some usb card readers failed to work with 5.12

These two patches fix that regression.

Thanks
-Mathias

Mathias Nyman (2):
  xhci: fix giving back URB with incorrect status regression in 5.12
  xhci: Fix 5.12 regression of missing xHC cache clearing command after
    a Stall

 drivers/usb/host/xhci-ring.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.25.1

