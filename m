Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAC595B2E45
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 07:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbiIIFrm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 01:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbiIIFrk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 01:47:40 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 088027F12D
        for <linux-usb@vger.kernel.org>; Thu,  8 Sep 2022 22:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662702451; x=1694238451;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XiDDHnUE/yTK60Wl2/aP5+lgd5KHEy/rJRGA6czObsA=;
  b=b4kdIAhI/ZnOYJpb3zGtTE05RztJy4P46r3iRi5T6VI1DVA0j1lJ2WL2
   QIQNtgIbS7aGhMC4x8/LRu6Jrvgt8jSJL6l2tCjWkhMAaXZtvOzyb1wzC
   JXynwW4QY82yXGTZdRiMtG3dTT/xfHnq/aq/TyJSME9MJkHZMV0IXeGeq
   4Q/V36Y9CbpXvgalhqfuUBhIwc6tQxTJeFk0xLCatCuWiGMJaNd5e1Qqz
   6VVfb0piAi5kW0dLOWH3Nvw59o8xZY9d4Oz/p4WA1QWNUG2LuvNdZAUYM
   3vil087XbVtyAP1HuBxvX1zjGN5FpirJX0eQVA1yHzDKUT6/G47SYEdfw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="284422286"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="284422286"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 22:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; 
   d="scan'208";a="704289418"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2022 22:47:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 9E4A8F7; Fri,  9 Sep 2022 08:47:44 +0300 (EEST)
Date:   Fri, 9 Sep 2022 08:47:44 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH] thunderbolt: Add support for Intel Maple Ridge single
 port controller
Message-ID: <YxrTgG+kAEFbPyLR@black.fi.intel.com>
References: <20220908104320.3409720-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220908104320.3409720-1-gil.fine@intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 08, 2022 at 01:43:20PM +0300, Gil Fine wrote:
> Add support for Maple Ridge discrete USB4 host controller from Intel
> which has a single USB4 port (versus the already supported dual port
> Maple Ridge USB4 host controller).
> 
> Signed-off-by: Gil Fine <gil.fine@intel.com>

Applied to thunderbolt.git/fixes, thanks!
