Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5C259F55B
	for <lists+linux-usb@lfdr.de>; Wed, 24 Aug 2022 10:33:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234957AbiHXIcv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Aug 2022 04:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiHXIcu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Aug 2022 04:32:50 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D21886C27
        for <linux-usb@vger.kernel.org>; Wed, 24 Aug 2022 01:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661329969; x=1692865969;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=riCTA8JhslnFd7Bi/wv6W6kgOd0zsTl09lB/l0h63iE=;
  b=m2Qs0cy1mfAcpEpu7kBubT1vsLnI0Z0whHgQvgvZWetlaOTjPjkaa0xi
   HHaUQgSQ7aQnCKU/tCc3ZTshTMGMBjgN/sjaYceYBWEk162JyXsaYFe/a
   ix+M7qvEROMkwVuWpXEfX+WGXqaprIf6tJLzy473DT4QK8aDiqk/znSIq
   wTOpWNmb8dAuExrTDZ6Sxh12Wo54Hbm0H4XsHDQJcZ5fLbKFJ3nKySa31
   DP9SB5BqiL0MqUxq1gYDgiPeqvtiCqbBvoL367+24Kj4lna1C+FaVxdDe
   pilBWkxzYLQN7axtrySNGmTOT56F7r9EGS9QJxCcMmvKuGuNX1wPOMRG0
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="295187074"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="295187074"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2022 01:32:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; 
   d="scan'208";a="937817050"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2022 01:32:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EF99219D; Wed, 24 Aug 2022 11:33:00 +0300 (EEST)
Date:   Wed, 24 Aug 2022 11:33:00 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Lukas Wunner <lukas@wunner.de>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 3/4] thunderbolt: Add helpers to check if CL states are
 enabled on port
Message-ID: <YwXiPPRT1brWHCIv@black.fi.intel.com>
References: <20220823105352.56306-1-mika.westerberg@linux.intel.com>
 <20220823105352.56306-4-mika.westerberg@linux.intel.com>
 <20220823140216.GA28421@wunner.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823140216.GA28421@wunner.de>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Lukas,

On Tue, Aug 23, 2022 at 04:02:16PM +0200, Lukas Wunner wrote:
> On Tue, Aug 23, 2022 at 01:53:51PM +0300, Mika Westerberg wrote:
> > +/**
> > + * tb_port_is_clx_enabled() - Is given CL state enabled
> > + * @port: USB4 port to check
> > + * @clx: CL state to check
> > + *
> > + * Returns true if given CL state is enabled for @port.
> > + */
> > +bool tb_port_is_clx_enabled(struct tb_port *port, enum tb_clx clx)
> > +{
> > +	u32 phy, mask = LANE_ADP_CS_1_CL0S_ENABLE | LANE_ADP_CS_1_CL1_ENABLE;
> > +	int ret;
> > +
> > +	if (!tb_port_clx_supported(port, clx))
> > +		return false;
> > +
> > +	ret = tb_port_read(port, &phy, TB_CFG_PORT,
> > +			   port->cap_phy + LANE_ADP_CS_1, 1);
> > +	if (ret)
> > +		return false;
> > +
> > +	return (phy & mask) == mask;
> > +}
> > +
> [...]
> > +static inline bool tb_port_are_clx_enabled(struct tb_port *port)
> > +{
> > +	return tb_port_is_clx_enabled(port, TB_CL1) ||
> > +	       tb_port_is_clx_enabled(port, TB_CL2);
> > +}
> 
> If you change enum tb_clx to use "power of two" values (0 1 2 4 8 ...)
> then you could just pass a bitmask to tb_port_is_clx_enabled()
> and thus need only a single invocation in tb_port_are_clx_enabled().
> Just a thought.

Sure good point. I'll do that in v2 thanks!
