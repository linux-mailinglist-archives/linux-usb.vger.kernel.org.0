Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14A08520607
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 22:41:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiEIUnW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 16:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiEIUnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 16:43:21 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F661E0588
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652128767; x=1683664767;
  h=from:to:cc:subject:date:message-id;
  bh=P4aU4HhEZ0WkGmE7zRNvDsiu8O63lxVkzR+rkokn7hM=;
  b=FrriinD0aI6F+95X1s6pzCrZda5gIC9Lw9i2irCPLVGE4AbX1Fh07lg4
   l/TsMUA/WRbHpPUO4vFmTZAZXebFtB19cZ5ldFeDl/EqWpdwFgW0BZUfm
   W04NC2B+b4NtFWdpob8oxafiXaa3rzilGFuMJKGXz3F8/Be0EcTHnp1Un
   myUA0ZPN7QaHTVvuxfRFobiQ2TvTFX3Ro6l/AmHe8WIe1Q128grMlKfLg
   FtIUns/yvTyvdEnbLEFAjhtyPmq3/aGpo5bagD3xmN9jWP/7WUQCc9xm9
   FyY6aUisQ+uCCmbAT0VuHtIWHn8vU1GgRwoJ4pq0XKkIOvI59/yaSK+Y8
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249699653"
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="249699653"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 13:39:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,212,1647327600"; 
   d="scan'208";a="738339121"
Received: from ccdjpclinux26.jer.intel.com ([10.12.48.253])
  by orsmga005.jf.intel.com with ESMTP; 09 May 2022 13:39:24 -0700
From:   Gil Fine <gil.fine@intel.com>
To:     andreas.noever@gmail.com, michael.jamet@intel.com,
        mika.westerberg@linux.intel.com, YehezkelShB@gmail.com
Cc:     gil.fine@intel.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: [PATCH 0/2] thunderbolt: Fix buffers allocation for device without DisplayPort adaptors
Date:   Mon,  9 May 2022 23:49:02 +0300
Message-Id: <20220509204904.8936-1-gil.fine@intel.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

For the case of device without DP adaptors, we calculate incorrectly the
buffers allocation. Here we fix the calculation for this case.
In addition, we add a KUnit test for this case.

Gil Fine (2):
  thunderbolt: Fix buffers allocation for device without DisplayPort
    adaptors
  thunderbolt: Add KUnit test for buffer allocation for device without
    DisplayPort adaptors

 drivers/thunderbolt/test.c   | 92 ++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/tunnel.c |  7 ++-
 2 files changed, 97 insertions(+), 2 deletions(-)

-- 
2.17.1

---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.

