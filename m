Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 233064F9736
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 15:46:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235974AbiDHNsl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Apr 2022 09:48:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231500AbiDHNsk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Apr 2022 09:48:40 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE8C60CEF
        for <linux-usb@vger.kernel.org>; Fri,  8 Apr 2022 06:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649425597; x=1680961597;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dM5xwuAZsFrANyH1Q7Drd0dOwX8c4fbMEe6WzERhu0s=;
  b=kCAHl1o+dCd1W6TP7ox5fY6YC97RSH9/IML1AZUTNTQDIbB9cH2K9DBC
   WZg0jUHVB8PdYVqhu+8zmgUnwIZeKPpd3SQtxa0118hVb9wPr+0owZtLe
   8zmOY/fv941kbQUXYpYDE2aJGJjbZNCyPHq9ts89Z3L3NNcMzV+WURKvy
   wIr7z5V5PNhK0Jl2NUXub6C+5rOHmGfydsWHMmfQtZdFyftLPML2RQUs1
   gO9cFGpELFe5QvwBQ89qXshNuR3nDec81Tt+FE9LHr2PIXFejW/MPcG5n
   OpqQUaVZuQbWv3u3GnyJ3sYXGmOtVUB0lkQvsrAZOlQSAncsAFc3h/N4l
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="260432079"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="260432079"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 06:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="653263275"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 08 Apr 2022 06:46:35 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Fri,  8 Apr 2022 16:48:20 +0300
Message-Id: <20220408134823.2527272-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A few small xhci fixes for usb-linus

Fixes USB 3 link resume for tunneled USB 3 devices, timers left running
after shutdown, and a bug in how we handle a full event ring.

Thanks
-Mathias


Henry Lin (1):
  xhci: stop polling roothubs after shutdown

Mathias Nyman (1):
  xhci: increase usb U3 -> U0 link resume timeout from 100ms to 500ms

Weitao Wang (1):
  USB: Fix xhci event ring dequeue pointer ERDP update issue

 drivers/usb/host/xhci-hub.c  |  2 +-
 drivers/usb/host/xhci-ring.c |  1 +
 drivers/usb/host/xhci.c      | 11 +++++++++++
 3 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.25.1

