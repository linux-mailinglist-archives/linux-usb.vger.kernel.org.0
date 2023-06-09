Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD90F72947F
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 11:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241231AbjFIJPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 05:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241191AbjFIJOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 05:14:42 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319F33ABF
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 02:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686301838; x=1717837838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yaHHGtJmMgTjEFbl/CVW/WfYXhmhf5ThIgNR0Tji4ns=;
  b=DGhdt14iRsKM23/9H02/bwnkWt9Vc+d8zGEaQsfXNwPHZMWfjLPm/0nW
   kYE7HNjHON40KjMta0N5OV6TzOs6yijdWem46BEMP1n8AXuskM0iz1yl8
   MGSGWyIhejKK3alrEIuAgYij12I0WCfC47dMwRyqGDiC0Y5+m5JGv5sMw
   accGuQd/I8NN1NHiEOjSsFqP1g8Fvd+b6Xm5gaJPli8hm4tojtuwZQYAm
   9HFpsLxzCAbRNz41PLpVYyQC09gqJ+FcfXsdC9WIY0qxp75OiwdmzHohy
   ml/XrzZw8y9c426JipYpX3JlcgWeiiGhBedmqGFJoCHG3MfOmdYHHI8M9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="337914585"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="337914585"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 02:08:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740104759"
X-IronPort-AV: E=Sophos;i="6.00,228,1681196400"; 
   d="scan'208";a="740104759"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 09 Jun 2023 02:08:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 89BA334C; Fri,  9 Jun 2023 12:09:01 +0300 (EEST)
Date:   Fri, 9 Jun 2023 12:09:01 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 00/20] thunderbolt: Rework TMU and CLx support
Message-ID: <20230609090901.GP45886@black.fi.intel.com>
References: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230529100425.6125-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 29, 2023 at 01:04:05PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series reworks the TMU and CLx support code to match better what we
> do elsewhere in the driver and prepares for USB4v2 adaptive TMU support
> that we are going to add in the subsequent series (I'm sending that out
> later this week). I've split this part as separate from USB4v2 support
> hoping that it makes reviewing them easier.
> 
> Gil Fine (1):
>   thunderbolt: Introduce tb_switch_downstream_port()
> 
> Mika Westerberg (19):
>   thunderbolt: Introduce tb_xdomain_downstream_port()
>   thunderbolt: Fix a couple of style issues in TMU code
>   thunderbolt: Drop useless 'unidirectional' parameter from tb_switch_tmu_is_enabled()
>   thunderbolt: Rework Titan Ridge TMU objection disable function
>   thunderbolt: Get rid of tb_switch_enable_tmu_1st_child()
>   thunderbolt: Move TMU configuration to tb_enable_tmu()
>   thunderbolt: Move tb_enable_tmu() close to other TMU functions
>   thunderbolt: Check valid TMU configuration in tb_switch_tmu_configure()
>   thunderbolt: Move CLx support functions into clx.c
>   thunderbolt: Get rid of __tb_switch_[en|dis]able_clx()
>   thunderbolt: Move CLx enabling into tb_enable_clx()
>   thunderbolt: Switch CL states from enum to a bitmask
>   thunderbolt: Check for first depth router in tb.c
>   thunderbolt: Do not call CLx functions from TMU code
>   thunderbolt: Prefix TMU post time log message with "TMU: "
>   thunderbolt: Prefix CL state related log messages with "CLx: "
>   thunderbolt: Initialize CL states from the hardware
>   thunderbolt: Make tb_switch_clx_disable() return CL states that were enabled
>   thunderbolt: Disable CL states when a DMA tunnel is established

All applied to thunderbolt.git/next.
