Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD52769A24
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 16:54:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbjGaOyo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 10:54:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjGaOyn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 10:54:43 -0400
Received: from mgamail.intel.com (unknown [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62166C6
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 07:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690815282; x=1722351282;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GZafUb7dXXQ7ETz76zeDZLmN3ulnmHmdEwFgnCcVHn4=;
  b=iBw7Fp/RuMTrO3wqb9A8nm3bJHjTHTf36e6EKsIwbn0DIbYttrGHQ2C2
   bedGoLP+EifwvnHSI142EUl3Aw0BQkK/L5qu+LjsJcZ43vhZliA7ravuo
   07G9N0X8mI9oY8DT3xjJOKY7Bd3LKPzBpBwm3HwUM6yTWEThcSRwRqT36
   LTTs23ot1UHig9BqH1HALDo3inOtHcwjayR0ncSYLNzKLSwfSB8xq9dnp
   NcXhSSZfRaoGGKjYaA+y/itVfzx7ge4tuFGRpCnspm76ay8jBUmMjv52R
   Kh/pfp6WHJIbKL5vuEUoMjhMUBcwE8T2OrPf2g67vWDpE0aXXvGJqZZ8o
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="371746751"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="371746751"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 07:54:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="763410148"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="763410148"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 31 Jul 2023 07:54:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 471ED1E8; Mon, 31 Jul 2023 17:54:44 +0300 (EEST)
Date:   Mon, 31 Jul 2023 17:54:43 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     Sanjay R Mehta <sanju.mehta@amd.com>, andreas.noever@gmail.com,
        michael.jamet@intel.com, YehezkelShB@gmail.com,
        linux-usb@vger.kernel.org, Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH V2] thunderbolt: Fix Thunderbolt 3 display flickering
 issue on 2nd hot plug onwards
Message-ID: <20230731145443.GJ14638@black.fi.intel.com>
References: <1689185779-25648-1-git-send-email-sanju.mehta@amd.com>
 <20230731111530.GI14638@black.fi.intel.com>
 <16994867-0b94-5ec7-f467-6f9fd6261a96@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <16994867-0b94-5ec7-f467-6f9fd6261a96@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 31, 2023 at 06:37:16PM +0530, Sanjay R Mehta wrote:
> 
> 
> On 7/31/2023 4:45 PM, Mika Westerberg wrote:
> > On Wed, Jul 12, 2023 at 01:16:19PM -0500, Sanjay R Mehta wrote:
> >> Previously, on unplug events, the TMU mode was disabled first
> >> followed by the Time Synchronization Handshake, irrespective of
> >> whether the tb_switch_tmu_rate_write() API was successful or not.
> >>
> >> However, this caused a problem with Thunderbolt 3 (TBT3)
> >> devices, as the TSPacketInterval bits were always enabled by default,
> >> leading the host router to assume that the device router's TMU was
> >> already enabled and preventing it from initiating the Time
> >> Synchronization Handshake. As a result, TBT3 monitors experienced
> >> display flickering from the second hot plug onwards.
> >>
> >> To address this issue, we have modified the code to only disable the
> >> Time Synchronization Handshake during TMU disable if the
> >> tb_switch_tmu_rate_write() function is successful. This ensures that
> >> the TBT3 devices function correctly and eliminates the display
> >> flickering issue.
> >>
> >> Co-developed-by: Sanath S <Sanath.S@amd.com>
> >> Signed-off-by: Sanath S <Sanath.S@amd.com>
> >> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> > 
> > Looks good.
> > 
> > I suppose you want this in -stable too, right?
> 
> Thanks. Yes Mika.

Hm, I get:

Applying: thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
error: patch failed: drivers/thunderbolt/tmu.c:415
error: drivers/thunderbolt/tmu.c: patch does not apply
Patch failed at 0001 thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards

Is this based on v6.5-rcX or something else?
