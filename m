Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53BFE5FEC62
	for <lists+linux-usb@lfdr.de>; Fri, 14 Oct 2022 12:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiJNKNn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Oct 2022 06:13:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbiJNKNe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Oct 2022 06:13:34 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC73A4D83C
        for <linux-usb@vger.kernel.org>; Fri, 14 Oct 2022 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665742413; x=1697278413;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8eR8Cx8KW9yje7XGT2hridZCOyTmpG9sXGTMaRiqs4=;
  b=n6NGDP9R3ehEoRUj2w4UFi0ZYSgEgu/WJHbF+Ioq+Jdb8tfJYxR5/8i4
   TxfawaYNUeyDuIWHNLoBIPWSdLqmTi0aPAyxyFcC/86L4CeLLwuKODAHM
   ZmCyfLcvThR+zHSQsAetJufvVuddDQPYgKgLw3loH5aOu0Kv2ltrAvpSB
   1DgOJ3bUdxeJjraqSpuLUqfmyo6GTtzJ9KJwlca3GSRTpzs+EQPsgZpbw
   a/K81wXK8wxWE8xr4rWX3aevTMJ+XWptToYR07m963ZzTKrysfWCctSW0
   Bt8Ar4JUiONge5PGfQA0gYaim371ZQ3J5GpgzsfSA0IhG6hlBX5ZvClIV
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="288630556"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="288630556"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2022 03:13:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="716699520"
X-IronPort-AV: E=Sophos;i="5.95,184,1661842800"; 
   d="scan'208";a="716699520"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Oct 2022 03:13:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ojHh5-006sZo-0E;
        Fri, 14 Oct 2022 13:13:31 +0300
Date:   Fri, 14 Oct 2022 13:13:30 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [bug report] usb: dwc3: drd: Defer probe if extcon device is not
 found
Message-ID: <Y0k2SoIqXziSyy46@smile.fi.intel.com>
References: <Y0ktkKfTgISmLogV@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0ktkKfTgISmLogV@kili>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
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

The culprit is wrong, but the rest seems correct.
Thank you.

-- 
With Best Regards,
Andy Shevchenko


