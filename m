Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 327905BFDF7
	for <lists+linux-usb@lfdr.de>; Wed, 21 Sep 2022 14:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiIUMdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Sep 2022 08:33:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIUMdd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Sep 2022 08:33:33 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 781FE97EDA
        for <linux-usb@vger.kernel.org>; Wed, 21 Sep 2022 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663763612; x=1695299612;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rRgq1ym4AVKUFR3Dn/1RMbrX6jLKHKVdsnmdZGHinCg=;
  b=cZpRScuDoQWiaDvPYivdupnfCEpPKks8ieiGtmYO59Y6SLeC/HwVzrQM
   sOTa5vlvzcW6TcY94MjxCgX7xDRrhMY93OrXSb70dzwmeGTXU/6YJhJiM
   eESmcXYx3QXEqHeZUJ+Hk2YUHNDtdiC2rfTw+p8Z4vJvjjNTxtFiFr3bo
   AVEKBoJ89LjemMkO93Hik7ABa1oqGdZGHZSdNIwp3kMSKpqRsVg6C1eaq
   G/RL8N2fA6u20bVP9U9ENi2n9Il+u+g3GpHZ8XSkAjw7YypvWn2YZprAC
   w+qv+SFG9ZoiS+JwpNjjU788fZJj9gVwavhIaAFxpJTECgXMkU9lxAvuZ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="363965088"
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="363965088"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2022 05:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,333,1654585200"; 
   d="scan'208";a="708429443"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Sep 2022 05:33:30 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/6] xhci features and fixes for usb-next
Date:   Wed, 21 Sep 2022 15:34:44 +0300
Message-Id: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Some xhci features and fixes for usb-next.
Both fixing some possible memory leaks that are too late for usb-linus,
and simple code cleanups for usb-next

Thanks
-Mathias

Jianglei Nie (1):
  usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()

Mario Limonciello (1):
  xhci: Don't show warning for reinit on known broken suspend

Mathias Nyman (3):
  xhci: show fault reason for a failed enable slot command
  xhci: remove unused command member from struct xhci_hcd struct
  xhci: remove unused lpm_failed_dev member from struct xhci_hcd

Rafael Mendonca (1):
  xhci: dbc: Fix memory leak in xhci_alloc_dbc()

 drivers/usb/host/xhci-dbgcap.c | 2 +-
 drivers/usb/host/xhci-mem.c    | 7 ++++++-
 drivers/usb/host/xhci.c        | 6 ++++--
 drivers/usb/host/xhci.h        | 3 ---
 4 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.25.1

