Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D184D73281C
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jun 2023 08:59:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242189AbjFPG7A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Jun 2023 02:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241031AbjFPG66 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Jun 2023 02:58:58 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CAC297A
        for <linux-usb@vger.kernel.org>; Thu, 15 Jun 2023 23:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686898736; x=1718434736;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qIK8I6x+79zFhys1xD1iyUAhSQieLV4DooGHU66L7yk=;
  b=GXeveuV8YuypeLNXhm0G+RT1B83pBH02zWapJVl3eNJp9GZcAvJ2gEaO
   5EcdI4PnE7Xm0h4rA1PzJRmJ/SrfoqHnCwUywy57Vilh/c+4KE+OpppCK
   1+vhV9E7ORCNACLdFjVeQpzbEl9gfWFaMQ1yFDpScMz1bw1/1aFNvtCht
   ckRNpVAdyuficbf/mC99huLcOX8lanTaZ1Iup0rJQrJWe9EE/2gQ/kQpn
   M8aS6mTpPudq+iW1eKJdhqG98XBbHHbEh88vnaSwny1yygm+SQrXzvVJC
   a4agHo6SZ1cIKvrky4yVkwMmExTsCwBJ8qzsDFhDAh2m4C0ZnwyNj6dFj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="358020119"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="358020119"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 23:58:55 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="746070194"
X-IronPort-AV: E=Sophos;i="6.00,246,1681196400"; 
   d="scan'208";a="746070194"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 23:58:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D78EB403; Fri, 16 Jun 2023 09:59:02 +0300 (EEST)
Date:   Fri, 16 Jun 2023 09:59:02 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH v2 00/20] thunderbolt: Initial USB4 v2 support
Message-ID: <20230616065902.GX45886@black.fi.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 12, 2023 at 11:21:25AM +0300, Mika Westerberg wrote:
> Hi all,
> 
> This series adds initial support for the next USB4 version (USB4 v2) and
> the Intel Barlow Ridge discrete controller. This includes support for
> the 80G symmetric link, the necessary configuration needed to bring up
> the router in v2 mode, adaptive TMU, PCIe extended encapsulation, and
> CL2 low power link state. We will be sending the rest of the USB4 v2
> support, including asymmetric 128/80G link support later on once this
> one has settled.
> 
> These are based on thunderbolt.git/next.
> 
> The previous version of the series can be found:
> 
> https://lore.kernel.org/linux-usb/20230531090645.5573-1-mika.westerberg@linux.intel.com/
> 
> Changes from v1:
> 
>   * Make tb_switch_is_usb4() use usb4_switch_version() as well
>   * Set TMU mode off by default in tmu_mode_init()
>   * Log TMU mode change only if it is actually changed in
>     tb_switch_tmu_configure().
> 
> Gil Fine (9):
>   thunderbolt: Identify USB4 v2 routers
>   thunderbolt: Add support for USB4 v2 80 Gb/s link
>   thunderbolt: Announce USB4 v2 connection manager support
>   thunderbolt: Enable USB4 v2 PCIe TLP/DLLP extended encapsulation

Tweaked this slightly to use str_enabled_disabled(), and return -EINVAL
in case of non-PCIe adapter. Updated kernel-doc accordingly.

>   thunderbolt: Add two additional double words for adapters TMU for USB4 v2 routers
>   thunderbolt: Fix DisplayPort IN adapter capability length for USB4 v2 routers
>   thunderbolt: Fix PCIe adapter capability length for USB4 v2 routers
>   thunderbolt: Move constants related to NVM into nvm.c
>   thunderbolt: Increase NVM_MAX_SIZE to support Intel Barlow Ridge controller
> 
> Mika Westerberg (11):
>   thunderbolt: Ignore data CRC mismatch for USB4 routers
>   thunderbolt: Do not touch lane 1 adapter path config space
>   thunderbolt: Add the new USB4 v2 notification types
>   thunderbolt: Reset USB4 v2 host router
>   thunderbolt: Add Intel Barlow Ridge PCI ID
>   thunderbolt: Limit Intel Barlow Ridge USB3 bandwidth
>   thunderbolt: Add support for enhanced uni-directional TMU mode
>   thunderbolt: Enable CL2 low power state
>   thunderbolt: Make bandwidth allocation mode function names consistent
>   thunderbolt: Add DisplayPort 2.x tunneling support
>   thunderbolt: Add test case for 3 DisplayPort tunnels

All applied to thunderbolt.git/next.
