Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6583B67DD6D
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 07:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbjA0G1y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 01:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjA0G1x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 01:27:53 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA996196
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 22:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674800872; x=1706336872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4RnK2epm+5yz1d24MZn1Q1V1hbA14fzvY37tev/p68c=;
  b=D+uJb9Sxf8NwUD6nGTTxSnXOUEpzx/p8kFDnR/b/dkw+QomdO6CdEIGw
   Vg478nEMMm42xhyekSfU5Vj+DnzJ3l2NO8d41U1Q/O3GAjRSuNrsYOZv1
   TGFiCSzGUIz9Ma+BhNXXZjniUxkXAB0ncYPJna6tWh2Yk3sN4CwbGW343
   scmmoEPd/NNAKMqIP2VdAww/ovcZqP9eJPpXQi7D5yBbSpM8ek/T5V/vw
   1Z0BWVKMyXyUaRlOVmvVqqjzv26xut3K8EYYp+jPIuw0SDwJyxi6mDf5s
   rWn5TYBig1D/LzAcXp93NZkfv2/vfUCHkF8LJHhyN8QqI1st7YycCByRQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="328315123"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="328315123"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2023 22:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="663172058"
X-IronPort-AV: E=Sophos;i="5.97,250,1669104000"; 
   d="scan'208";a="663172058"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 26 Jan 2023 22:27:50 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id DC6D8154; Fri, 27 Jan 2023 08:28:26 +0200 (EET)
Date:   Fri, 27 Jan 2023 08:28:26 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 1/2] thunderbolt: Handle bandwidth allocation mode
 enablement notification
Message-ID: <Y9NvCkmjYr7kis72@black.fi.intel.com>
References: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230124090938.58825-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 24, 2023 at 11:09:37AM +0200, Mika Westerberg wrote:
> When the graphics side enables bandwidth allocation mode the DP IN
> adapter sends notification to the connection manager about this.
> Currently the handler misses this and tries to allocate 0 Mb/s that then
> makes the graphics side to think the request failed.
> 
> Fix this by properly handling the enablement notification.
> 
> Fixes: 6ce3563520be ("thunderbolt: Add support for DisplayPort bandwidth allocation mode")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Fixed the typo and applied both patches to thunderbolt.git/next.
