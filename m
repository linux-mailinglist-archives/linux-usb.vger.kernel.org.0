Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50C8561A99
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 14:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiF3Mpa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 08:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234403AbiF3Mp2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 08:45:28 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D642A416
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 05:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656593126; x=1688129126;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lh1DkGjUMgl3flqSD1Le1F1Jh5/iO110pl8Ubi1029M=;
  b=IHkkhiDKL/dJn9JCeB1e0VqZZ87JrOcObSMHlYHSLZApwgK2Zi9Zvd5P
   KRnsuFGU4lrCXhCOpzY78Bptn8VMLBZybQ7BrJS7lfSHLwROl0CueKGuT
   tBYRBI0BBUvvMsLRgDcfG1DgBqMlAMYyTMLeEXwAPnsHqufrLaT+J1q1+
   WyKsnzZdEHGi+ffJ+O9hjYIJDA9QKMmThrYwj2BIifb/ubu5W6+kPl2GP
   P2NbRDAn1pDoS0lxEMkJz3t/PycnJOsBXhfNnxDlLkHxrkNtgmh+4BMak
   MH9aZnYX2ojbkSK8wkwBqGRYpb5V+p+W5gQPIYGOTjHA+lpgA457edMiG
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="307844535"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="307844535"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2022 05:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; 
   d="scan'208";a="565839560"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 30 Jun 2022 05:45:18 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/1] xhci feature for usb-next
Date:   Thu, 30 Jun 2022 15:46:44 +0300
Message-Id: <20220630124645.1805902-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A very small change that was sitting in my for-usb-next branch for a while.

Thanks
Mathias

Sergey Shtylyov (1):
  usb: host: xhci: use snprintf() in xhci_decode_trb()

 drivers/usb/host/xhci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

