Return-Path: <linux-usb+bounces-159-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 935E07A20FD
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 16:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D4C828316E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 14:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D268111A0;
	Fri, 15 Sep 2023 14:30:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FAD111AF
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 14:30:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED47A2724
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 07:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694788190; x=1726324190;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4VJkSIKaI8cuyV8O7SBUE0D3dTq3sVn2C85gmD1geqo=;
  b=F3osNzCNyaKGJqRODKEFIPyAUZbzfs21OYtTFt1n8i103bpCySDvH20C
   fRqLUhyMPxdgFytcG2CFG35whYzYdiHI0zqrE9kcyv8ZpP2naAweVBL0L
   rKTHUKSkoTYoKytgs1LtNkEZKlTTqnUKtHBonb2uQsZCA6oDZW3ZByvvL
   HhjpoREAQ9HXLjWU7sWRgQr4vaxPJviPIGFti6scN2P2T72Rj9D1vLdx9
   AbOwkwn0UZusEIHE/iBxUnm6bu8LJYdSsB7bpszYVAS6iVy2o1OQ7bD3W
   uLAHBwZsf3bF85Wn/l1HY0IdukF8iHD3QzetICC3jjtChNNqNW0HaUenJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378171595"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="378171595"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 07:29:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="888252654"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="888252654"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 15 Sep 2023 07:29:14 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/4] xhci fixes for usb-linus
Date: Fri, 15 Sep 2023 17:31:04 +0300
Message-Id: <20230915143108.1532163-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi Greg

A few small xhci fixes for 6.6

Use correct dev in dma bounce buffer mapping, fix event handling
issues, and track suspended ports correctly in software

Thanks
Mathias

Lukas Wunner (2):
  xhci: Clear EHB bit only at end of interrupt handler
  xhci: Preserve RsvdP bits in ERSTBA register correctly

Mathias Nyman (1):
  xhci: track port suspend state correctly in unsuccessful resume cases

Wesley Cheng (1):
  usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer

 drivers/usb/host/xhci-hub.c  | 19 ++++++++++---------
 drivers/usb/host/xhci-mem.c  |  4 ++--
 drivers/usb/host/xhci-ring.c | 16 +++++++++-------
 drivers/usb/host/xhci.h      |  2 +-
 4 files changed, 22 insertions(+), 19 deletions(-)

-- 
2.25.1


