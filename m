Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60E94602C83
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 15:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbiJRNKH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 09:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJRNKF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 09:10:05 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC1A212096
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666098602; x=1697634602;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dak6Tx8/jFx+XhAEuEve2zYtShPS/xfuM2mdX3vTxs4=;
  b=Gs/1SN4YGkQoPJJJb3g8/CQB/3RNaD54MvTk61NseUAfh0OZv5uaMp1d
   UGK+RA2H9m+kE9uB8oZFMeXRwjFdfEluVHiFoLG0BPpKfhqFKuPvB16mN
   f2ImsBLaiZgY8sEC1IL6kNrltMSJq+LfqYFU2ZwgA6M1FavUcnGYzMnlB
   oXnlXWxDp83DrWkktEVgtgbeFj3jA0OvbwcjtVGQl1VLtxgaXBwLW5luv
   ZO5GXu0T5JVtfijIMI+Eyp/U+AhRp4Ya/SISz1iMMeg3/swm4oSi+7Auy
   rwk64IujrwSBzG5+Gbt01hfC4FPVUDTbslU9+gNr7ntcpt/3CkE883IBq
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="332642873"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="332642873"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 06:10:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="717923205"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="717923205"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2022 06:10:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1okmM3-009NEn-35;
        Tue, 18 Oct 2022 16:09:59 +0300
Date:   Tue, 18 Oct 2022 16:09:59 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: dwc3: drd: Defer probe if extcon device is not
 found
Message-ID: <Y06lp4ekECXbRAIg@smile.fi.intel.com>
References: <Y0ktkKfTgISmLogV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0ktkKfTgISmLogV@kili>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 14, 2022 at 12:36:16PM +0300, Dan Carpenter wrote:
> Hello Andy Shevchenko,
> 
> The patch 98bba546e82d: "usb: dwc3: drd: Defer probe if extcon device
> is not found" from Feb 18, 2019, leads to the following Smatch static
> checker warning:
> 
> 	drivers/usb/dwc3/drd.c:460 dwc3_get_extcon()
> 	warn: 'edev' is an error pointer or valid

Should be fixed (as a side effect) by https://lore.kernel.org/r/20221017233510.53336-1-andriy.shevchenko@linux.intel.com

-- 
With Best Regards,
Andy Shevchenko


