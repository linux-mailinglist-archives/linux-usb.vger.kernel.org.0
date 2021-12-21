Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7548147BED9
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 12:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbhLUL1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 06:27:11 -0500
Received: from mga01.intel.com ([192.55.52.88]:34177 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231459AbhLUL1K (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 21 Dec 2021 06:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640086030; x=1671622030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/PBmsyvrLnAz5mQlOvQDkaP1i0ezFpZcS059KYCSU3c=;
  b=gC7yPy5zIqlvEQhQEND9WBsN1WGeLWLI95B2pmHWjT/EyBiEx+JHnLoH
   7vKn5VOZgheonsW45Rnjt0gfdsXDvr4sufDcUOxyXsi7GwyTCxhdEILZZ
   zWt/4LZv8RNmwvrGk0TrcTiHdoIdoXYPapBiYq1VnJa4N0WXdi5/yGCcN
   coR27t9Ya8doEh0QnVItHQvZ/wmxfi+Uigv1kGUnmymklk68v+wCs3YmD
   6iE4XZ2EanPb3LAFU+4fXq3SF99zFS4D7wDdyfuoRQWt1kCash5/khw+x
   +oVtULidehIFDQUjYPxOEdsalt0KD14N99u5lFKrMtuXDsOw3rTPgDxeE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264566354"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="264566354"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 03:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="467759706"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 21 Dec 2021 03:27:09 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus
Date:   Tue, 21 Dec 2021 13:28:24 +0200
Message-Id: <20211221112825.54690-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

One small patch, remove an extra quirk set for Fresco FL1100 controllers.
External docks with this controller have issues enumerating usb devices.

Nice if it could still make 5.16, if not then 5.17 is fine

Thanks
-Mathias

Mathias Nyman (1):
  xhci: Fresco FL1100 controller should not have BROKEN_MSI quirk set.

 drivers/usb/host/xhci-pci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.25.1

