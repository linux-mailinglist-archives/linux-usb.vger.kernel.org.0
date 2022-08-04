Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16E0C589826
	for <lists+linux-usb@lfdr.de>; Thu,  4 Aug 2022 09:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238997AbiHDHIP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Aug 2022 03:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbiHDHIO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Aug 2022 03:08:14 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E12F861D5D
        for <linux-usb@vger.kernel.org>; Thu,  4 Aug 2022 00:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659596893; x=1691132893;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jij6uqEbSZiCIELlG0NLopdorqcATkUF2LZZUQACsBE=;
  b=GU9Usot9xlxqXWDa15rsrOeWxdQPWImKOAO2E+NBKsNzYJ86cJA/sFAK
   wCJoDO5qxCCjPZvaTV7Qbfem2PefnNRsgzXWyQg9iBGhOhDd/7RnhGVHn
   EUVWvp9Ue/e1x5i4N3oZPgAawp04pXLpKhmDZcMlDmxRcBr2US8Xuziif
   2oxnOjU/e/lhU9MtCwhmJc5imHMX0PNdiGd7yzPxB2k4UdzHQTAbBoygR
   rJiUMtisiXoJDg+3OUacD4pfw46RBjigvYXOza9LzBso06esK2vtjGAMx
   zme43nDSY0omaVp/8SBHAV5YVIJRsmzCD/asDDSW9D/qOxu4cS/xXgztS
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10428"; a="272904214"
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="272904214"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 00:08:13 -0700
X-IronPort-AV: E=Sophos;i="5.93,215,1654585200"; 
   d="scan'208";a="745355221"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2022 00:08:10 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 04 Aug 2022 10:08:08 +0300
Date:   Thu, 4 Aug 2022 10:08:08 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <sanmehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Add DP out resource when DP tunnel is
 discovered.
Message-ID: <YutwWI8xENDkAtg9@lahna>
References: <1659587394-115256-1-git-send-email-Sanju.Mehta@amd.com>
 <Yutnjq64OO07QbAR@lahna>
 <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5b6e0a1-a334-1bc5-46fa-b9ee5f53688f@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 04, 2022 at 12:34:09PM +0530, Sanjay R Mehta wrote:
> >>  			tunnel = tb_tunnel_discover_dp(tb, port, alloc_hopids);
> > 
> > Here tunnel can be NULL...
> > 
> >> +			tb_dp_resource_available_discovered(tb, tunnel->dst_port);
> > 
> > ... so this will crash and burn.
> 
> Thanks. Agree, I will add check here and resend the patch.

Please don't add the check here but move this to tb_start() as I
suggested.
