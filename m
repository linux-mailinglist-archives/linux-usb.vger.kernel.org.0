Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAC45287A3
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 16:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236123AbiEPOya (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 10:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbiEPOy2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 10:54:28 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D4730F75
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652712867; x=1684248867;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RNUfs8ggZ5FanSJ6Nt8y3hUuHdHHk6HIgWZ1YNofu80=;
  b=cKMClqkByY/uleSrQqPNQBsgbDwHi+qCyWlVUHHPeX8/5ifQkebyxhZC
   dj2GPpMVK1rE8sBPRG41IpbbqKMxpYpK3DAsBPmtN4fP/vYcSMoMjPJwe
   yhkZn1ClLs4886dqt6MTeTX55hCrBOKvh8JIzfXjRPW4w3NJn4E639dcQ
   yyN493HUz0m6uJyWedCRbP2ZCwr0zeg4+Jzhl1YpjGpdSCGGS7orlSbXs
   udQpT1gJEgZC4iIpCOiZZ7/QVL1mELbeSPdd6CEpfVpJUs7fmIrqDACGh
   tXOAQE5Siwvjky+rox/GlWmO+XuVOCLFKBLi0CRJwuzdh/CQ1w1vBqg8S
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="331477355"
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="331477355"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 07:54:27 -0700
X-IronPort-AV: E=Sophos;i="5.91,230,1647327600"; 
   d="scan'208";a="522483742"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2022 07:54:24 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 16 May 2022 17:54:21 +0300
Date:   Mon, 16 May 2022 17:54:21 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <YoJlnaFUQBZ6bAmn@lahna>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
 <YoIMh0Di7QtALQ/Z@lahna>
 <20220516085903.GC8368@ccdjLinux26>
 <YoIajuneoVCCcfGZ@lahna>
 <20220516132141.GE8368@ccdjLinux26>
 <YoJPchm9UufxrC6+@lahna>
 <20220516134548.GF8368@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516134548.GF8368@ccdjLinux26>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 16, 2022 at 04:45:48PM +0300, Gil Fine wrote:
> On Mon, May 16, 2022 at 04:19:46PM +0300, Mika Westerberg wrote:
> > Hi Gil,
> > 
> > On Mon, May 16, 2022 at 04:21:41PM +0300, Gil Fine wrote:
> > > > So instead I suggest to put the device_for_each_child() in tmu.c and
> > > > then the tb_switch_tmu_config_enable() static right above it. Please
> > > > also name the resulting API function consistently.
> > > 
> > > OK, got you and fixed that.
> > > Please let me know when you think that I can send out the v4 series.
> > 
> > You can send it whenever you want but I think it can go to v5.20 and not
> > v5.19 since I was planning to send out my pull request for Greg
> > tomorrow. I can pick it up after v5.19-rc1 is released.
> 
> Ohh I see, I was hoping to meet v5.19
> Can't you send it also as part of your your pull request tomorrow?
> Or it is not mature enough yet...?

Well typically it is expected that patches have been sitting in
linux-next for a while before going to the upstream maintainer (Greg in
this case). This is to ensure they get at least some attention from the
various build robots and also people running linux-next on their
hardware.
