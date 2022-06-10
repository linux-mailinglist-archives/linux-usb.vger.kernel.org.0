Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75421546612
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 13:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346769AbiFJLw0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 07:52:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343932AbiFJLwX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 07:52:23 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 154644A92C
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 04:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654861943; x=1686397943;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pxSAbV0LeBmZUQMijdTHD8ao56QP21PyhNbh2yK+sOk=;
  b=ItHoR9F7QxRLKmsPWubR3BgPgg04xVigmhOp6OrAO0mM7WowTOYhPNaV
   TheZ+yqaVz/GF4JIcRZUF6TTCtgTl6hlvXPT7gPkks4oZ2dT48h9gCtYf
   xz0zNjt1Ec/1xJLTvPcwEZRJmxzRvfTz+xapngkLuNco0Zv8YDHjmnfkn
   Wu8/8QbTZ3+XQCnPrZwi/NnUxeRueSIVJrAhWcQDoBdk2niXlGwlg2LPm
   UPDn0UePWno9hR7WC5oqkBGNZoGOTf76w8a2GrAVOsOUMtQ0HsiX1wffp
   zKw2/T7sjQoVbN5MhWitw064ZCL9gUYIT8vEdQbld9Uv1JVly9tZb3jB1
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302983858"
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="302983858"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 04:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,290,1647327600"; 
   d="scan'208";a="671815270"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Jun 2022 04:52:21 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci fix for usb-linus 5.19-rc
Date:   Fri, 10 Jun 2022 14:53:37 +0300
Message-Id: <20220610115338.863152-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Small xhci fix for 5.19 rc
5.19-rc1 added support for xHC hosts with just one roothub.

Fix the null pointer dereference these hosts hit.

Thanks
-Mathias


Mathias Nyman (1):
  xhci: Fix null pointer dereference in resume if xhci has only one
    roothub

 drivers/usb/host/xhci.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

-- 
2.25.1

