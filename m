Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D88C720493
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235620AbjFBOi5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbjFBOiz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:38:55 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6774EBC
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716734; x=1717252734;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qg55vSEAYuPp26KDafCW8X0t4nrbDbjIXivZWi1SYAU=;
  b=lumKuTne76mGIrzMoQqoC5MhGTXLgSguhMpEBqDcS4VQ6ksISs8Dk2AN
   qRJOWVRnnEetAFGZo83uiiSPG9Kn+70g6t7Q+a99atOUEk3v91fhp0qI3
   Zkknn+Hcuxj6bGXQqtK8jHg4rHt/+Y9LWusLb3gXbLfG4n5vCTW4LJ+zE
   LtrrS0RhnT9wao17Gq8rC2QuNlorT1jcEQ1eqZQ6A7TuZSmF7K9bFkIG6
   gPOH8tLuh1zIU1FAMxSq3iZCliUpNbPd79mYzHGy9aSldc5hIMqFvtNIT
   qnbv1tYu17F7ZuittTe45zuwxXDzubpKqvc93pUaTgvD1ylYPeDoH27hT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311204"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311204"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877434"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877434"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:51 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 00/11] xhci features for usb-next
Date:   Fri,  2 Jun 2023 17:39:58 +0300
Message-Id: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg

Some xhci features for usb-next.

Among other small changes add support for a xHCI controller by Zhaoxin,
rework free trb and ring expansion code, and get rid of obsolete
XHCI_PLAT quirk which was used to prevent MSI setup for non-PCI hosts.

Thanks
Mathias

Mathias Nyman (6):
  xhci: Add usb cold attach (CAS) as a reason to resume root hub.
  xhci: Don't require a valid get_quirks() function pointer during xhci
    setup
  xhci: get rid of XHCI_PLAT quirk that used to prevent MSI setup
  xhci: split allocate interrupter into separate alloacte and add parts
  xhci: Fix transfer ring expansion size calculation
  xhci: Stop unnecessary tracking of free trbs in a ring

Udipto Goswami (1):
  usb: xhci: Remove unused udev from xhci_log_ctx trace event

Weitao Wang (4):
  xhci: Fix resume issue of some ZHAOXIN hosts
  xhci: Fix TRB prefetch issue of ZHAOXIN hosts
  xhci: Show ZHAOXIN xHCI root hub speed correctly
  xhci: Add ZHAOXIN xHCI host U1/U2 feature support

 drivers/usb/host/xhci-histb.c |  12 +--
 drivers/usb/host/xhci-mem.c   | 132 ++++++++++++++++++--------------
 drivers/usb/host/xhci-mtk.c   |   6 --
 drivers/usb/host/xhci-pci.c   |  20 +++--
 drivers/usb/host/xhci-plat.c  |   7 +-
 drivers/usb/host/xhci-ring.c  | 137 ++++++++++++++++++----------------
 drivers/usb/host/xhci-tegra.c |   1 -
 drivers/usb/host/xhci-trace.h |   9 +--
 drivers/usb/host/xhci.c       |  48 ++++++------
 drivers/usb/host/xhci.h       |   7 +-
 10 files changed, 189 insertions(+), 190 deletions(-)

-- 
2.25.1

