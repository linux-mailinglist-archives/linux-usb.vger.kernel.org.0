Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4432D4AF0DC
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 13:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbiBIMHG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 07:07:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbiBIMDz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 07:03:55 -0500
X-Greylist: delayed 64 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 03:31:51 PST
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FF7BE00ED04
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 03:31:51 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,355,1635199200"; 
   d="scan'208";a="5431508"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 12:30:46 +0100
Date:   Wed, 9 Feb 2022 12:30:45 +0100 (CET)
From:   Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
cc:     kbuild-all@lists.01.org
Subject: [PATCH] usb: xhci: fix minmax.cocci warnings
Message-ID: <alpine.DEB.2.22.394.2202091228320.52266@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: kernel test robot <lkp@intel.com>

Simplify the code using max().

Generated by: scripts/coccinelle/misc/minmax.cocci

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
Signed-off-by: Julia Lawall <julia.lawall@inria.fr>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e6251ab4551f51fa4cee03523e08051898c3ce82
commit: 5f66f73b9ff4dcabd4e2405ba9c32e80e02f9408 coccinelle: misc: add minmax script
:::::: branch date: 8 hours ago
:::::: commit date: 9 months ago

 xhci-mem.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -433,8 +433,7 @@ int xhci_ring_expansion(struct xhci_hcd
 				(TRBS_PER_SEGMENT - 1);

 	/* Allocate number of segments we needed, or double the ring size */
-	num_segs = ring->num_segs > num_segs_needed ?
-			ring->num_segs : num_segs_needed;
+	num_segs = max(ring->num_segs, num_segs_needed);

 	ret = xhci_alloc_segments_for_ring(xhci, &first, &last,
 			num_segs, ring->cycle_state, ring->type,
