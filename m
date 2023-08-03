Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3761576E52D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Aug 2023 12:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235249AbjHCKBo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Aug 2023 06:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235248AbjHCKA6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Aug 2023 06:00:58 -0400
Received: from mgamail.intel.com (unknown [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714C73A8C
        for <linux-usb@vger.kernel.org>; Thu,  3 Aug 2023 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691056814; x=1722592814;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=msLZ24XFYV4XQUlXbCSAQDG6zgnYK2eCxMQMrazMO+Q=;
  b=bGGTKu0TgBYCYEK2sbnpmvLe/UUDAKQSZpbeZR7lskJk/Oc924hltqhL
   kkTZtC/+RsdvhrsiHIbpGL288SAebw2kSiIn5VlPetzYSqIbOJW/09DJZ
   8b9qhdreYyIwGvawjDwR8h+t8YXCdDb4QOdv1t0ljVDtUaUivWVtfrvsQ
   TBkc1fYivOX+nR9uW7MuVzUSbkHilIUyy1nIHPA8veJcV2VSRacFMw/fM
   5gP7PtiRIYbP0at4UFdAg4RkeJUB/qnQNDZYV/AMWPwaP7Del96SRr0CT
   M5Wnk4lPh8vprGLkY79b/Tbdug89esqEDoFYwRvCDwViC++bpG0zw4yyr
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="456208284"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="456208284"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 03:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="903314666"
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="scan'208";a="903314666"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 03 Aug 2023 03:00:11 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 20BF513F; Thu,  3 Aug 2023 13:00:22 +0300 (EEST)
Date:   Thu, 3 Aug 2023 13:00:22 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanju.mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH v3] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Message-ID: <20230803100022.GY14638@black.fi.intel.com>
References: <1690974709-20848-1-git-send-email-sanju.mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1690974709-20848-1-git-send-email-sanju.mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 02, 2023 at 06:11:49AM -0500, Sanjay R Mehta wrote:
> Previously, on unplug events, the TMU mode was disabled first
> followed by the Time Synchronization Handshake, irrespective of
> whether the tb_switch_tmu_rate_write() API was successful or not.
> 
> However, this caused a problem with Thunderbolt 3 (TBT3)
> devices, as the TSPacketInterval bits were always enabled by default,
> leading the host router to assume that the device router's TMU was
> already enabled and preventing it from initiating the Time
> Synchronization Handshake. As a result, TBT3 monitors experienced
> display flickering from the second hot plug onwards.
> 
> To address this issue, we have modified the code to only disable the
> Time Synchronization Handshake during TMU disable if the
> tb_switch_tmu_rate_write() function is successful. This ensures that
> the TBT3 devices function correctly and eliminates the display
> flickering issue.
> 
> Co-developed-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanath S <Sanath.S@amd.com>
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>

Marked for stable and applied to thunderbolt.git/fixes, thanks!
