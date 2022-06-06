Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E89953E81C
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbiFFJhz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 05:37:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbiFFJhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 05:37:51 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0002D165AE
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654508264; x=1686044264;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fpOVRtdaazRedXZm6nfBMCQwzxUFaHkPVSjVIM2bwa8=;
  b=FlKTpsMphu62HVbLOJQJvZyveJToX99YsTtJ/U1VPAConYLE3EetigE2
   Ecyu2ILWwa4qVJcao4r6muLIa8oJ04M5HMs/OsQUyrTO7Oo6TmtMxK6DU
   5KN/9qhfeJxoXSpj4yCtJBReFS5N46iUfaf5hEnKazNXYdwvBcNySPxi3
   QFajzv0Km5xE9MLD+bBd/AVVu9Vz9YUzAeyI/TAnoPg0yO3Nh58s1m56b
   rQqjTX1BIjdAladCh/BC/HqsjKKyGl8mxfg9k74IoHN1dLbqHAk+/ziIt
   hCFZrgOlyPG7AHsGL9A+CLpXky65nlzaYWg3EaL9VvJHLMI/5rPMHZ69O
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10369"; a="276679922"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="276679922"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 02:37:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="554385775"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 02:37:42 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 06 Jun 2022 12:37:39 +0300
Date:   Mon, 6 Jun 2022 12:37:39 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     George D Sworo <gdsworo@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        George D Sworo <george.d.sworo@intel.com>
Subject: Re: [PATCH] thunderbolt: Add support for Intel Raptor Lake
Message-ID: <Yp3K4xhNJ/PoY+HB@lahna>
References: <20220601224102.15266-1-george.d.sworo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601224102.15266-1-george.d.sworo@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi George,

On Wed, Jun 01, 2022 at 03:41:02PM -0700, George D Sworo wrote:
> From: George D Sworo <george.d.sworo@intel.com>
> 
>  Raptor Lake has the same integrated Thunderbolt/USB4 controller as
>  Intel Alder Lake. By default it is still using firmware based
>  connection manager so we can use most of the Alder Lake flows.
> 
> Signed-off-by: George D Sworo <george.d.sworo@intel.com>
> Change-Id: Ida8d0876913baa1ffb3c0bc888d6503f3175406e

This does not belong to the kernel changelogs so I dropped it. I also
moved the PCI IDs to follow the numeric ordering in nhi.h. With those
changes I applied to thunderbolt.git/next, thanks!

I assume you have actually tested this on RPL?
