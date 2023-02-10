Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 446086922B1
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 16:54:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbjBJPyf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 10:54:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjBJPye (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 10:54:34 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B9FB75F61
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 07:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676044471; x=1707580471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tbksnTsMmdt2KODLrCVdiPTIlNReZdpK+e1KDJRErzM=;
  b=nYk7cmIhBIKccP9SlI9FN8RCtRp5g1ODh0L4LdLMWokWEo0sSfvOnRvK
   EVyzL2M/d4r2LSv8QcJWlZX8lL8Kz2X26tqfs/uuTTFVY3BWoPZDZLVQT
   ZUhaqYA3vl51uj23OzBHv+ebcHgMdz/dOardLl2NQY8GuGuT45xIc8phZ
   1rbFWoZyLW4t+tRq1SZ2a8e7hgOduVdfRvxp1ULWPGL4PL3OzPQl2WDth
   5DEhfQApJF1i/jq127b2LVxy7nXBU6lamPEQYjMllP3ZaPTHrawksQucK
   hLongDPquxPcTtmJ33S7Vl+I4cMEJbh5FPe7EBNyWV7TKcsH+JTzGj3LH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310811532"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310811532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 07:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="776967732"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="776967732"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2023 07:54:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pQVjI-00571L-1j;
        Fri, 10 Feb 2023 17:54:28 +0200
Date:   Fri, 10 Feb 2023 17:54:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] usb: gadget: configfs: Fix set but not used variable
 warning
Message-ID: <Y+ZotAmeiaypxSxw@smile.fi.intel.com>
References: <20230209094359.1549629-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230209094359.1549629-1-dan.scally@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 09, 2023 at 09:43:59AM +0000, Daniel Scally wrote:
> Fix a -Wunused-but-set-variable warning in gadget_string_s_store()

A side comment below.

...

>  	if (len > USB_MAX_STRING_LEN)
>  		return -EINVAL;
>  
> -	ret = strscpy(string->string, page, size);
> -	return len;
> +	return strscpy(string->string, page, size);

Do you need above check with strscpy()? You may supply the maximum length
and negative error code from the strscpy() will indicate the cut.

-- 
With Best Regards,
Andy Shevchenko


