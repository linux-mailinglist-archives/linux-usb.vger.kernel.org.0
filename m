Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503BB70B4B9
	for <lists+linux-usb@lfdr.de>; Mon, 22 May 2023 08:00:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjEVGAY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 May 2023 02:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbjEVGAX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 May 2023 02:00:23 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 117EEA2
        for <linux-usb@vger.kernel.org>; Sun, 21 May 2023 23:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684735222; x=1716271222;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4bAD/RnAw4pffUXdkqHS2NyzEN4jZABpuVfXsw8G1Sc=;
  b=cRqT/buICpUoj/Uxye+X0OoWdUGV/cylhwySznWynoo+RV2ndie0/3HR
   frej3HlICvKLNDIL5bhC70mqsfi57P6mOUwKgn5sSKOccTEqfmHrqPhFA
   LVsvPU+Ez3BIb0YxVzUefv89nDHxiWo3JnSzgEmWnph6z/ASOp4caOJIF
   XEWuMvhO6/Oi6niY3M/xOOR78G6T7PT1mkqjKghxl6ecapfK3Htay2fty
   mU9dC7IHkqcvmj+zKgSPYHYA+P3MRpg7YfjhSdSMWiMvbYfUGm83Xn8gz
   wKpxrW6HEJW3fKe97pAgXssoNqf2aDB3fDp860rU3hNvngFY4Y2Blj0Q7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="355179184"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="355179184"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2023 23:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="827584994"
X-IronPort-AV: E=Sophos;i="6.00,183,1681196400"; 
   d="scan'208";a="827584994"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 21 May 2023 23:00:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E39E61CC; Mon, 22 May 2023 09:00:22 +0300 (EEST)
Date:   Mon, 22 May 2023 09:00:22 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH] thunderbolt: dma_test: Use correct value for absent
 rings when creating paths
Message-ID: <20230522060022.GJ45886@black.fi.intel.com>
References: <20230517082919.34821-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517082919.34821-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 17, 2023 at 11:29:19AM +0300, Mika Westerberg wrote:
> Both tb_xdomain_enable_paths() and tb_xdomain_disable_paths() expect -1,
> not 0, if the corresponding ring is not needed. For this reason change
> the driver to use correct value for the rings that are not needed.
> 
> Fixes: 180b0689425c ("thunderbolt: Allow multiple DMA tunnels over a single XDomain connection")
> Cc: stable@vger.kernel.org
> Reported-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.
