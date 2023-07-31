Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 922A77691F0
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 11:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230287AbjGaJlL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 05:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjGaJlK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 05:41:10 -0400
Received: from mgamail.intel.com (unknown [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B05E5
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 02:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690796470; x=1722332470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VRDONa3/FWWmTmu/mCflmw38TaFsM4R2f80NdjTJKQw=;
  b=POXI6sS6eu3zUWfqpnJxD+kcUJjgLCnBYS54zZdHgUzoOLpLHSzxQvRM
   Zl1yrZ7p1PfNJTUauLD52JZzQ1VUEJwjeQMI67rLM5BVCPBDtErAc9wGY
   oZCDhaxvILfrBrZ9fp1ZRnnN4F+7ww9Lvl9vvFEVPXnAnK+VtwdDICh+b
   dOa/XLVfED5my1H/ZEcZIAEA0NfDJxcg69lPxApRnyZ+j59Z22BFY7U+k
   OqInW2vSVWJlhNu88+M6FANGGlwv9Bru+y8WAX7ji1FNl5xGgdRG+uFQn
   3o9ZAwjlvPfpDpvZblFaZQiiV95qnwxm5aYbC8CmrTdehA/U0++K0Ob/4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349275226"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="349275226"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 02:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="851958344"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="851958344"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 31 Jul 2023 02:41:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C9AFF1E8; Mon, 31 Jul 2023 12:41:16 +0300 (EEST)
Date:   Mon, 31 Jul 2023 12:41:16 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <Sanju.Mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU
 based on CLx
Message-ID: <20230731094116.GY14638@black.fi.intel.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
 <20230621111525.GL45886@black.fi.intel.com>
 <5fe10a65-4538-cdbd-a0a6-827f9445cee4@amd.com>
 <20230621125406.GM45886@black.fi.intel.com>
 <a1959444-9f9d-5a3e-65cf-abb681d8bc74@amd.com>
 <c1be3001-0df6-68e8-a024-3f0d6d8c37dc@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c1be3001-0df6-68e8-a024-3f0d6d8c37dc@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 06, 2023 at 07:18:38PM +0530, Sanjay R Mehta wrote:
> > Agree. we will have to see what is going wrong in this case.
> 
> Hi Mika,

Hi,

> When an unplug event occurs, the TMU is disabled by configuring the
> TSPacketInterval bits in TMU_RTR_CS_3 to 0 using the
> tb_switch_tmu_rate_write() API, followed by disabling the Time
> Synchronization Handshake using the DTS bit in TMU_ADP_CS_6. The code
> snippet for this functionality is present in the tb_switch_tmu_disable()
> function, as shown below:
> 
> ```
> tb_switch_tmu_rate_write(sw, TB_SWITCH_TMU_RATE_OFF);
> tb_port_tmu_time_sync_disable(up);
> ret = tb_port_tmu_time_sync_disable(down);
> if (ret)
>     return ret;
> ```
> 
> However, we have observed that the tb_switch_tmu_rate_write() function
> fails to disable the TMU rate, and the code proceeds with disabling the
> Time Synchronization Handshake. To address this issue, we have modified
> the code to check the return value of the tb_switch_tmu_rate_write()
> function and only proceed with disabling the Time Synchronization
> Handshake if the TMU rate disabling succeeds. The updated code is as
> follows:
> 
> ```
> ret = tb_switch_tmu_rate_write(sw, tmu_rates[TB_SWITCH_TMU_MODE_OFF]);
> if (ret)
>     return ret;
> tb_port_tmu_time_sync_disable(up);
> ret = tb_port_tmu_time_sync_disable(down);
> if (ret)
>     return ret;
> ```
> 
> Please let us know your thoughts on this solution.

Makes sense to me.
