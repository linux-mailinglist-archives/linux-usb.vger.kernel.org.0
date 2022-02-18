Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7DF4BB41B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 09:25:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232516AbiBRIZc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 03:25:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232507AbiBRIZa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 03:25:30 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94DA22F759
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 00:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645172714; x=1676708714;
  h=subject:to:references:cc:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=lS1cssRX93CoQ7VaH1rcN5jfchIDMXz8nO1qij6Qa1Y=;
  b=iFAhmXevcdpbBArlJDnooj5j/TxcFNklYLcWd2/xcv/baiHSToWbrGMo
   YOY9dUOX6hhkEXV71wBqQdbJc+dZ/QicZgrZ6SFo/FgAuvkUO2+GmLbBQ
   magWjdcj+Pzf9kVHl3dc3ZvJAH3ZDYnjU/qAfkDM9v7gT1tzO4EqQIHfU
   wuuz3AfeLVZOivN93U7Y/zYCZuzH2IBW7gnRA9/Jpps4Opftce+lOZyM8
   HnxFRoABC4aE44y/wiDhZyIjGy4gtkkhWy7egCXVmkOEjAzxMIgqA/sPe
   bl1UsY34Zl4oj3j9pyllY3qk9mMA9UJBr+EJcZiLNHMSCzwCL2+IqaFY5
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251278942"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="251278942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 00:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="572217347"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2022 00:25:07 -0800
Subject: Re: [PATCH] xhci: omit mem read just after allocation of trb
To:     Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
References: <20220217133549.27961-1-oneukum@suse.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Message-ID: <4632126f-97da-65c9-a240-b86f4490afe0@linux.intel.com>
Date:   Fri, 18 Feb 2022 10:26:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220217133549.27961-1-oneukum@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.2.2022 15.35, Oliver Neukum wrote:
> This has been allocated just a few lines earlier with a
> zalloc(). The value is known and "|=" is a waste of memory
> cycles.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>

Thanks

In case Greg wants to pick this up now directly:
Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Otherwise I'll submit it later with other small changes

-Mathias


