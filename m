Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910ED51B7F9
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 08:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244400AbiEEGe5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 02:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244380AbiEEGe4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 02:34:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E20811162
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 23:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651732278; x=1683268278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zjn33QgR0ko4S6iCUDwease4Iru7c5OBfLDQ23sFajs=;
  b=C6yF6eukQ+KyWF+VTdBTSL9EIXPIvo7mxHk288PibMWccOqg9XUkaQlC
   Mi/tCHTHtj1St0IwLQ6/T0fKbWcIdTQqwQV9bLLdLIkC4TAGMsnZi4dxl
   KoxvnVYeRaBNnWHjYslbmOHD+1d3G6rWUAueULrNIYCBE0X6NVSNvxbkJ
   8OFP97bZLO7fmEXot8zQxHuAjgHKeW+lL/YUEiqU5ZilfBEziCow0u3SS
   49eTa7nxQAEkLxHiG8m1eGNZGP8ohscAMH0JixNbNnuCcyfnJXRsvF3gT
   5XzL6zu87Lj0/dr/Nvz78xnjpLWK2jE9iTehrzeGYo7ac0nXyYo600Amo
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="266857243"
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; 
   d="scan'208";a="266857243"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 23:29:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,200,1647327600"; 
   d="scan'208";a="563093882"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 23:29:11 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 May 2022 09:29:08 +0300
Date:   Thu, 5 May 2022 09:29:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 0/5] thunderbolt: Add support for XDomain lane bonding
Message-ID: <YnNutBuOzsc1tzyY@lahna>
References: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220426112540.6053-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 02:25:35PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> So far connecting two Thunderbolt/USB4 domains (hosts) the high-speed link
> has been using a single lane. The reason for this was simplicity and also
> the fact that the host DMA was not able to go over the 20 Gbit/s even if
> the lanes were bonded. However, Intel Alder Lake and beyond actually can go
> higher than that so now it makes more sense to take advantage of the lane
> bonding. The USB4 Inter-Domain Service specification describes the
> protocol and this patch series implements it for the Linux Thunderbolt/USB4
> driver.
> 
> If both sides (hosts) of the link announce supporting this, we will
> establish bonded link. This is only possible on systems with software based
> connection manager (so Intel Alder Lake and beyond).
> 
> Mika Westerberg (5):
>   thunderbolt: Add debug logging when lane is enabled/disabled
>   thunderbolt: Move tb_port_state() prototype to correct place
>   thunderbolt: Split setting link width and lane bonding into own functions
>   thunderbolt: Ignore port locked error in tb_port_wait_for_link_width()
>   thunderbolt: Add support for XDomain lane bonding

Series applied to thunderbolt.git/next.
