Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDB5F6923E7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 18:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232860AbjBJRDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 12:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232868AbjBJRDP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 12:03:15 -0500
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAEDE6FE95
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 09:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676048594; x=1707584594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zz0TvUsyj/RiJUZUlH0BbljAC2lwFGMjgGtTXV0IlMw=;
  b=Q1msZ0M0kTvIqy0xrXiaqfH/OAp2dASU9tVcPGN4VHWpgcWcIvbs7Zvg
   gq05iiHK2O+IAFcNEf1kUbO62ZCzFX5lvvvEVYUYdpgdnwqt74wGR1EJ9
   ZuzqR4huR7F94L+b4wWEJthcrVGGzYKNp1eltSOzrBOzHSTB9s15I8UB0
   bphhMcszsylSBmqXrbJhl4Ryxs48M0+XkCe3YKMpFs6DHOOSsljIWixGe
   IqcYivbIJrHdb5qPKtJd/WM/SZsTL6MxeTEBAle3QNh6m0QiDJeTgpnEm
   Zrl/FUUiOWDKAStf8cR8vEtXuiEpxpQ4Jh2CNouCtYGjvm108qu79jjBu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392870048"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="392870048"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 09:01:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="913586326"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="913586326"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2023 09:01:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pQWmQ-0058Mv-0X;
        Fri, 10 Feb 2023 19:01:46 +0200
Date:   Fri, 10 Feb 2023 19:01:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Dan Scally <dan.scally@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: gadget: configfs: Fix set but not used variable
 warning
Message-ID: <Y+Z4eeZTCDqzfu8C@smile.fi.intel.com>
References: <20230209094359.1549629-1-dan.scally@ideasonboard.com>
 <Y+ZotAmeiaypxSxw@smile.fi.intel.com>
 <28381c7f-ec2b-621e-c441-20795689174f@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28381c7f-ec2b-621e-c441-20795689174f@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 10, 2023 at 04:03:52PM +0000, Dan Scally wrote:
> On 10/02/2023 15:54, Andy Shevchenko wrote:
> > On Thu, Feb 09, 2023 at 09:43:59AM +0000, Daniel Scally wrote:
> > > Fix a -Wunused-but-set-variable warning in gadget_string_s_store()
> > A side comment below.

...

> > >   	if (len > USB_MAX_STRING_LEN)
> > >   		return -EINVAL;
> > > -	ret = strscpy(string->string, page, size);
> > > -	return len;
> > > +	return strscpy(string->string, page, size);
> > Do you need above check with strscpy()? You may supply the maximum length
> > and negative error code from the strscpy() will indicate the cut.
> > 
> It would still copy the truncated string in that case though, correct? Seems
> cleaner to me to just fail and leave the string as-is, but I don't
> particularly mind either way.

Good point. Yes, depending on the nature of the data we copy it (my proposal)
may or may not be a good idea.

-- 
With Best Regards,
Andy Shevchenko


