Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D5D5280FF
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 11:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiEPJru (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 05:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238210AbiEPJrq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 05:47:46 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0200A34B9C
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 02:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652694461; x=1684230461;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yKSqt/38lBClcvRMa98eDn8/QIPm+qHZDMhyZjB+CYs=;
  b=ZyHCBEE7gg2po5WzVhuXEqiZss4ZD73Wx8D+9dDD3fUARRAkVj9+/phz
   BCROyeeZlAlOGEMtVicJNTpDIP8DopO1jIn8xJ4RFWQjVK/QCQ+vssD9F
   qZ9h9ccnN2EY2QgPc7vGmfuty88j1jEvKxqIX7hVGDEm59/TNltnASt+K
   sQDf20HqEYHuTxsEEHFHNB/vkFrR0YN5Poq/vR97vQ3lhAIVQSI7K7t9U
   XiYT22jwq1p96qWz6VlKaDOHSAs4ZfMRl4WGp2tjxTASQ0gM2ofe89urQ
   6aUmeOYHK+vQXulYthRR3NPKRHPR6QGqLygfo10Me2RkkSJWOLmhx+jcT
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="252854291"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="252854291"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 02:47:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="816313225"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 16 May 2022 02:47:38 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] fix xhci feature merge issue in current usb-next
Date:   Mon, 16 May 2022 12:48:49 +0300
Message-Id: <20220516094850.19788-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Two different conflicting features touching xhci got into current usb-next
for 5.19

One adds support for xHC hosts with just one roothub,
second adds support to defer first roothub registration until second
roothub is added.

commit 873f323618c2 ("xhci: prepare for operation w/o shared hcd")
commit b7a4f9b5d0e4 ("xhci: Set HCD flag to defer primary roothub
registration")

We ended up trying to defer roothub registratinog for xHC with just one
roothub.

This patch fixes the issue and goes on top of current usb-next

This patch shouldn't be needed for stable as the new feature to support
one roothub xHC isn't marked for stable either, but setting Fixes flag
in case someone later picks it up for stable.

Mathias Nyman (1):
  xhci: Don't defer primary roothub registration if there is only one
    roothub

 drivers/usb/host/xhci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.25.1

