Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B9E53E929
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiFFJ2P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 05:28:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232859AbiFFJ2M (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 05:28:12 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027AEDFE8
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 02:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654507688; x=1686043688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=f0OfECSl5HC/I5/HSjpIq8s+hVz4DnqQxmDYjc8ooNQ=;
  b=V8gO1fzEbxlqz/J0U/7lutvihbgj8Z6bYphoTk53oS/8vQx5dC5+flHs
   H0EeGfh2yVQ7ZO9PDSoO2u1Vnr3wgqpts14vwtJ/qt5IkCDdvLbko9s4Z
   nDvHVEPUIN3JcnkVDBP1Z29vFAWc/mAD2ffwpfxaYvMP7V/+DqF/yEVmw
   RCUX5XMKT1M4WKnxDwN+YsJnyqVCWf9UYHn5IIFlFKXUReujrMC28bLht
   p5LKGZk8Tz65xipx9YNvrhYnGzSi/2iiAeVcGx7I/nfKL5aN1ML/yZXeH
   VdRi6FYFyzOSuLG7qa3b568BCPG0ylhn+88zQgUJRbn/E4Azn158Ubv9e
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="257084092"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="257084092"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 02:28:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="583537448"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 02:27:57 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 06 Jun 2022 12:27:55 +0300
Date:   Mon, 6 Jun 2022 12:27:55 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v4 0/6] thunderbolt: CL1 support for USB4 and Titan Ridge
Message-ID: <Yp3Imyq6Lny7DwvO@lahna>
References: <20220526105921.17214-1-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220526105921.17214-1-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Gil,

On Thu, May 26, 2022 at 01:59:15PM +0300, Gil Fine wrote:
> v1 can be found here:
>   https://lore.kernel.org/linux-usb/20220501203321.19021-1-gil.fine@intel.com/
> v2 can be found here:
>   https://lore.kernel.org/linux-usb/20220509201656.502-1-gil.fine@intel.com/
> v3 can be found here:
>   https://lore.kernel.org/linux-usb/20220511140549.10571-1-gil.fine@intel.com/
> 
> Changes in v4:
> * Remove unnecessary struct tb_sw_tmu_config and fix some typos.
> * device_for_each_child() move from tb.c to tmu.c
>   inside tb_switch_enable_tmu_1st_child().
> 
> Changes in v3:
> * Fix to support the case of enabling CL1 entry after resume
>   from runtime PM (if CL1 supported in the connected device)
> 
> Changes in v2:
> * Handle CL1 and CL0s together since on the hardware level they are
>   supported and enabled together
> * Use device_for_each_child() to set TMU mode of host router's 1st
>   children
> * Use FIELD_x macros from include/linux/bitfield.h
> * Split single patch into two for clarity
> * Fix commit message
> 
> In this series of patches, first, we address several issues in the CL0s
> implementation.
> Then, we add support for a second low power state of the
> link: CL1. Low power states (called collectively CLx) are used to reduce
> transmitter and receiver power when a high-speed lane is idle.
> We enable it, if both sides of the link support it, and only for the
> first hop router (i.e. the first device that connected to the
> host router). This is needed for better thermal management.
> CL1 improves power management that was intoduced by CL0s.
> Also, we add support of dynamic change of TMU mode to HiFi uni-directional
> once DisplayPort tunnel is created.
> This enables CL0s while DP tunnel exists.
> Due to Intel hardware limitation, once we changed the TMU mode to HiFi
> uni-directional (when DP tunnel exists), we don't change TMU mode back
> to normal uni-directional, even if DP tunnel is torn down later.
> Though, after sleep (or runtime PM) resume, the TMU is changed to normal
> uni-directional (if CLx supported in the connected device) to enable
> CL1 entry.
> 
> Gil Fine (6):
>   thunderbolt: Silently ignore CLx enabling in case CLx is not supported
>   thunderbolt: CLx disable before system suspend only if previously
>     enabled
>   thunderbolt: Fix typos in CLx enabling
>   thunderbolt: Change downstream router's TMU rate in both TMU uni/bidir
>     mode
>   thunderbolt: Add CL1 support for USB4 and Titan Ridge routers
>   thunderbolt: Change TMU mode to HiFi uni-directional once DisplayPort
>     tunneled

All applied to thunderbolt.git/next, thanks!

I changed "Unknown" to "unknown" in tb_switch_clx_name() to be
consistent with the rest of the driver.
