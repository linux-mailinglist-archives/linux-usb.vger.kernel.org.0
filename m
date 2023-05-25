Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15D0B710837
	for <lists+linux-usb@lfdr.de>; Thu, 25 May 2023 11:01:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240451AbjEYJBZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 May 2023 05:01:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240035AbjEYJBY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 May 2023 05:01:24 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB4F698
        for <linux-usb@vger.kernel.org>; Thu, 25 May 2023 02:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685005283; x=1716541283;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xC5nn0BYwo5sWqHggO7VdRmk3fWDkWjd0GnuLq2h0k8=;
  b=Cjag0Nq5Vaui5oym5aBwUiApS2IZwJP4lR35/zw+JrMTLQEvzrJ4gvpT
   lmIEQOKJXy1dFNqrEnaZtusFGaD2YjyoUtFtpJ7McOLS6I9ZEV3093jgP
   y9ynzphSdMHrMkheZFyu8ULzRUlmk53tGsLuvvBBnkI1kBjWuTznKlKcD
   ntbxfdZXhMoMlqdiSO2D4QsFEpOkxKVazr81I8zBy6u7aixZNxorr9GxG
   bn7qjfP9OsGb35K8UvmyniYyPmMp+aYa6+1ct79cbcKVbZESSpi+s/v7n
   VVQX2Dy3moUsgNIQThwU3C/jH8uyY/ne4qKJRGYV1QfPkxg6tYNXgEHgc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="333452071"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="333452071"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 02:01:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="655135844"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="655135844"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 25 May 2023 02:01:20 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B0F7240F; Thu, 25 May 2023 12:01:24 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Koba Ko <koba.ko@canonical.com>,
        Imre Deak <imre.deak@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 0/2] thunderbolt: Two fixes for reported display issues
Date:   Thu, 25 May 2023 12:01:22 +0300
Message-Id: <20230525090124.11614-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

This series includes two fixes for the display related issues reported
by Koba Ko.

Mika Westerberg (2):
  thunderbolt: Increase DisplayPort Connection Manager handshake timeout
  thunderbolt: Do not touch CL state configuration during discovery

 drivers/thunderbolt/tb.c     | 17 ++++++++++++-----
 drivers/thunderbolt/tunnel.c |  2 +-
 2 files changed, 13 insertions(+), 6 deletions(-)

-- 
2.39.2

