Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A47702E82
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 15:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241313AbjEONkS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 09:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242164AbjEONkN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 09:40:13 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 653801FE7
        for <linux-usb@vger.kernel.org>; Mon, 15 May 2023 06:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684158012; x=1715694012;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5o+MaGLkIVfqDIeqewK1JIOB3ymWtY1XJZV4fhqiD5g=;
  b=Ja9StQ602l3IZO8VGReHsQuq+dTBBqMtt+1GLfI3suf/PL8W0gbYh9gW
   hehcW1yfiS4dCNHjKXcUKIDG8Eozpp4gEWdm1UUdwOM5XW9GkwDmaaEdj
   0EnaCds1WbWEfcOb52XLjosjFvTCLyaGwHP3KY76NfmolmE3bwexaU7Oy
   e1dkKu4xSnSXKyK4W6jupNphrd2AxLEHxACJRIYLUuZ1leYgUAnVED4M+
   teJanU7y9syhMidvhULo3PPmggw+c5hr2NMBkxlO038vsZOwz70EbIKEy
   /8emOD1Z/xZeRRfUKI3TrUR6yRMpSy4oNX1y1fbWjEGj99Z10TiOxKzgq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="414598001"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="414598001"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2023 06:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="700964221"
X-IronPort-AV: E=Sophos;i="5.99,276,1677571200"; 
   d="scan'208";a="700964221"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 15 May 2023 06:39:54 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date:   Mon, 15 May 2023 16:40:57 +0300
Message-Id: <20230515134059.161110-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

A couple xhci fixes for 6.4
Fixing a S3 resume issue on AMD hosts, and a flaw in calculating free TRBs
in ring buffer which may cause xhci to hog extra memory.

Thanks
Mathias

Mario Limonciello (1):
  xhci-pci: Only run d3cold avoidance quirk for s2idle

Mathias Nyman (1):
  xhci: Fix incorrect tracking of free space on transfer rings

 drivers/usb/host/xhci-pci.c  | 12 ++++++++++--
 drivers/usb/host/xhci-ring.c | 29 ++++++++++++++++++++++++++++-
 drivers/usb/host/xhci.h      |  2 +-
 3 files changed, 39 insertions(+), 4 deletions(-)

-- 
2.25.1

