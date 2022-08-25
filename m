Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A875A1538
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 17:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236396AbiHYPHd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 11:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237360AbiHYPHc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 11:07:32 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A940A7EFD0
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 08:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661440051; x=1692976051;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=q0ID/2UoE/y+AF7jod32wQ5q5PZAMzEq4aNsc8gUY9A=;
  b=Gxi64OnJDfIlNpUeIk3HPsmlVbHQy0LlEIE23DgQhJHLyLtrpVX89ZDx
   6xm0/1LMi1dWRE2jLOu41A/nos9dS7+aIj3ylCoBzVLr2lom7SYmlEtFV
   ruMo3N1VQF2Ym5jlVqquBETA2jaSGZex8j6wKKtUQCL8RE6adN3iKuwpU
   2G/73IEP3uURD02D8S62ZuRSRZclkynaC/LYYKKB9lekmPDVWUq5TULlR
   w9aq9UwO80bcRsNZTrDhds5oRrzpoTlawufp5e7DD86C7wk3GW3VwWrK6
   0unWOcIrQnc8EoHx8ljbJi7fctgv50GoaaykXSOTBiXt+jB0Td0fDG6KQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="355981776"
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="355981776"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2022 08:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,263,1654585200"; 
   d="scan'208";a="643284819"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 25 Aug 2022 08:07:28 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/3] xhci fixes for usb-linus
Date:   Thu, 25 Aug 2022 18:08:37 +0300
Message-Id: <20220825150840.132216-1-mathias.nyman@linux.intel.com>
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

A few xhci fixes for usb-linus.

USB3 devices aren't visible immediately after xHC reset, so don't
stop polling the roothub and suspend too early after xHC reset.

Also Revert the port poweroff patch due to regression,
and fix a null pointer issue for xHC hosts with just one roothub.

-Mathias

Mathias Nyman (3):
  xhci: Fix null pointer dereference in remove if xHC has only one
    roothub
  xhci: Add grace period after xHC start to prevent premature runtime
    suspend.
  Revert "xhci: turn off port power in shutdown"

 drivers/usb/host/xhci-hub.c  | 13 ++++++++++++-
 drivers/usb/host/xhci-plat.c | 11 ++++++++---
 drivers/usb/host/xhci.c      | 19 +++++--------------
 drivers/usb/host/xhci.h      |  4 +---
 4 files changed, 26 insertions(+), 21 deletions(-)

-- 
2.25.1

