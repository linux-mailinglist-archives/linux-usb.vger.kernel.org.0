Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53005506662
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 09:55:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbiDSH54 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 03:57:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231149AbiDSH5y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 03:57:54 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A9915839
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650354913; x=1681890913;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=afruaZHUDCBIDdGLuj+GkJAq7CRFYx3tUu4aFNoXoGo=;
  b=nfj4QzvQ+wk9/WxfrM5TxWhHnzwPG0n0dSVCtSq5AL2bNmHOd5c9O8YD
   5YxOZE1L4ly5uoksnG+O5+L2nU4F6Z+TH5qHMRoLfWh30CphTt48z5aJw
   DiDWr9+chwfxVA6DV3n0gB2V4aWsiaTV3c+4XkVX3j6/8ybz2iBUHaE2E
   44zBVwigrDj2qXSAKLBZoPBoJ3+uSN/g0kcXC4OcV+GSE7g9u7DUcUFT/
   acsTpvMBTSYmdS00TVil9gZAYLdDZMbX0V2Nyk12NjVIvEZG25Ft67ZOJ
   o4wspV8im2k01Q8dCLxe3FwnTEKjjXlefhFNRZy4keUqyHvV2sba/ZSWQ
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="324147574"
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; 
   d="scan'208";a="324147574"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 00:55:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,272,1643702400"; 
   d="scan'208";a="592693440"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2022 00:55:10 -0700
Received: by lahna (sSMTP sendmail emulation); Tue, 19 Apr 2022 10:55:07 +0300
Date:   Tue, 19 Apr 2022 10:55:07 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Brad Campbell <lists2009@fnarfbargle.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 1/4] thunderbolt: Fix typo in comment
Message-ID: <Yl5q26FjrRJ0y6gt@lahna>
References: <20220411130049.53656-1-mika.westerberg@linux.intel.com>
 <aec54314-6e6a-e295-610e-bbcae98eb709@fnarfbargle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aec54314-6e6a-e295-610e-bbcae98eb709@fnarfbargle.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 12, 2022 at 08:38:29AM +0800, Brad Campbell wrote:
> On 11/4/22 21:00, Mika Westerberg wrote:
> > Should be 'in' instead of 'bin'. Fix it.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/thunderbolt/nhi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> > index 4a582183f675..6221ca4ea287 100644
> > --- a/drivers/thunderbolt/nhi.c
> > +++ b/drivers/thunderbolt/nhi.c
> > @@ -1207,7 +1207,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >  
> >  	nhi->pdev = pdev;
> >  	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
> > -	/* cannot fail - table is allocated bin pcim_iomap_regions */
> > +	/* cannot fail - table is allocated in pcim_iomap_regions */
> >  	nhi->iobase = pcim_iomap_table(pdev)[0];
> >  	nhi->hop_count = ioread32(nhi->iobase + REG_HOP_COUNT) & 0x3ff;
> >  	dev_dbg(&pdev->dev, "total paths: %d\n", nhi->hop_count);
> 
> You can add 
> 
> Tested-by: Brad Campbell <lists2009@fnarfbargle.com> 
> 
> to the whole series.

Thanks!

Applied now to thunderbolt.git/next.
