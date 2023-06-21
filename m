Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22A867382B4
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbjFULPd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 07:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230426AbjFULPT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 07:15:19 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE1B184
        for <linux-usb@vger.kernel.org>; Wed, 21 Jun 2023 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687346118; x=1718882118;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QRtL9JTm+0l06zN4o+QiG4BHA4UzZhP3BKPPB9L5thM=;
  b=Z0i7p1Br8LK4FWU7Cwa7hx9vzIevl2dZktzWnTW1niAYbPcHMV/bTIOT
   +2f7MH2vuV3jLZG+9LBG049sJLijmLidD47XA3Qq3tOHIYwRSm+3n3yX7
   rK8R0En5ektRsa3rG0WM9imQrij9FgjvbmrpI1EBhMfaFzgrP4fPmQu2A
   gw2QS3WAnfmtyZMYA+yB4StFs0cLBbG/+BvgEluiIwRCxSJYngssq3X1D
   DHe4seEcjySMB373Wnr4TqGfEZSJLDnEzTzEGd1ksZyGQFgotsd2uskKM
   mGuY3CLxGM+dfb7PR+lm6EMH7Nmur6lk4r3qWiqmE1Ifw/Np8UGPl5Re0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340484069"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="340484069"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 04:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="779819305"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="779819305"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jun 2023 04:15:15 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 503FC1FD; Wed, 21 Jun 2023 14:15:25 +0300 (EEST)
Date:   Wed, 21 Jun 2023 14:15:25 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org,
        Sanath S <Sanath.S@amd.com>
Subject: Re: [PATCH Internal] thunderbolt: Remove enabling/disabling TMU
 based on CLx
Message-ID: <20230621111525.GL45886@black.fi.intel.com>
References: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1687343842-17881-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 21, 2023 at 05:37:22AM -0500, Sanjay R Mehta wrote:
> From: Sanath S <Sanath.S@amd.com>
> 
> Since TMU is enabled by default on Intel SOCs for USB4 before Alpine
> Ridge, explicit enabling or disabling of TMU is not required.
> 
> However, the current implementation of enabling or disabling TMU based
> on CLx state is inadequate as not all SOCs with CLx disabled have TMU
> enabled by default, such as AMD Yellow Carp and Pink Sardine.
> 
> To address this, a quirk named "QUIRK_TMU_DEFAULT_ENABLED" is
> implemented to skip the enabling or disabling of TMU for SOCs where it
> is already enabled by default, such as Intel SOCs prior to Alpine Ridge.

If it is enabled by default "enabling" it again should not be a problem.
Can you elaborate this more?
