Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A5E592F42
	for <lists+linux-usb@lfdr.de>; Mon, 15 Aug 2022 14:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242645AbiHOM7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Aug 2022 08:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbiHOM73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Aug 2022 08:59:29 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B4B11A01
        for <linux-usb@vger.kernel.org>; Mon, 15 Aug 2022 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1660568368; x=1692104368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BcBekFQ/lMAJQ0+UfzfVT8V5VWIpM3b28AeZpuX8mYE=;
  b=kgMQDR2zshoEokh6RTrOsutoOXzkF3K/cLFsZ47Wuoqu9y9CsHlLk9MV
   m9bWYB+T1EcxgotveOB+J0eorprXWm2iiuefmPoGz2XoZoqBuzSMcToJG
   pe3CV+9+IBQmI6vyUw9btKtjuBUZ0Xq0Ebcm2FxCCNPrBbIpd+htPMeml
   2DxQcc08THc1WhNzxLOQby51N88FFqMI6FDPuS/AFdfP2AckndkgV7UnH
   Zrt87qmqfNKxgO2bMOKnijxy4CHGAWDxbatK+xsKSshWx4YttU3U81TjI
   ut1iCl24sYvnNVunMnLsDiNoVMhW+CvfQ5W2KcS4cSZIzdCWViCZUQ6kH
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="291948068"
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="291948068"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2022 05:59:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,238,1654585200"; 
   d="scan'208";a="557279061"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 15 Aug 2022 05:59:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 69DA5248; Mon, 15 Aug 2022 15:59:38 +0300 (EEST)
Date:   Mon, 15 Aug 2022 15:59:38 +0300
From:   "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Pananchikkal, Renjith" <Renjith.Pananchikkal@amd.com>,
        "Mehta, Sanju" <Sanju.Mehta@amd.com>,
        "andreas.noever@gmail.com" <andreas.noever@gmail.com>,
        "michael.jamet@intel.com" <michael.jamet@intel.com>,
        "YehezkelShB@gmail.com" <YehezkelShB@gmail.com>
Subject: Re: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP
 tunnel is discovered.
Message-ID: <YvpDOkLHuRgnhqVm@black.fi.intel.com>
References: <1659610118-119104-1-git-send-email-Sanju.Mehta@amd.com>
 <MN0PR12MB6101A4EC593D70D7D3FC3EADE2659@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR12MB6101A4EC593D70D7D3FC3EADE2659@MN0PR12MB6101.namprd12.prod.outlook.com>
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 10, 2022 at 09:52:46PM +0000, Limonciello, Mario wrote:
> [Public]
> 
> > -----Original Message-----
> > From: Mehta, Sanju <Sanju.Mehta@amd.com>
> > Sent: Thursday, August 4, 2022 05:49
> > To: mika.westerberg@linux.intel.com; andreas.noever@gmail.com;
> > michael.jamet@intel.com; YehezkelShB@gmail.com
> > Cc: Natikar, Basavaraj <Basavaraj.Natikar@amd.com>; Limonciello, Mario
> > <Mario.Limonciello@amd.com>; linux-usb@vger.kernel.org; Mehta, Sanju
> > <Sanju.Mehta@amd.com>
> > Subject: [PATCH v3/RESEND] thunderbolt: Add DP out resource when DP
> > tunnel is discovered.
> > 
> > From: Sanjay R Mehta <sanju.mehta@amd.com>
> > 
> > If the boot firmware implements a connection manager of its
> > own it may create a DP tunnel and will be handed off to Linux
> > CM, but the DP out resource is not saved in the dp_resource
> > list.
> > 
> > This patch adds tunnelled DP out port to the dp_resource list
> > once the DP tunnel is discovered.
> > 
> > Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> > Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> Another one of my colleagues validated this patch this morning, here
> is a tag for him.
> 
> Tested-by: Renjith Pananchikkal <Renjith.Pananchikkal@amd.com>

Applied to thunderbolt.git/next, thanks!
