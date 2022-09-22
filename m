Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5405E62A4
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 14:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbiIVMly (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 08:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiIVMlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 08:41:45 -0400
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3C8E7239
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 05:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663850502; x=1695386502;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=pUbWxfFKWEL1F3XqurDuXjSNhWMCa2vT9zzPBm7RBhs=;
  b=UQrjRP0MPftad31+CYKM89YYXnTXzBQRe3STC1Ja4t3pozOSVZ8KxHnD
   OLHQjilkgb3bTxAHm7Xi2mIqP4452MWlhfESqxuGpRk64aof3MuJx1elM
   hpGZ93IijNsai7355q3mKdYeqmZifi7jysJnbQbEgEPMcgE6Gkf3HzCQA
   cZyOqdZqKrF0C7KzeYgYVYvo/O+qP1Eb8JV5stEBvH2iKqdUSA4cYTTOL
   dFQ7VoonuiLSLmzJNJMbgJNVMWMhxV1+vrSgXzbsPy4RhXcfejvLdtwLU
   TWsiHaOjXRty9Xmo5xkkQpmdkUjr7QoES2Bdkh+tt+YuJns5xz6ek9rzh
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="301693880"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="301693880"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 05:41:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="795068118"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 22 Sep 2022 05:41:41 -0700
Message-ID: <2b0dde2d-d00d-4dff-094f-e5207ce39a38@linux.intel.com>
Date:   Thu, 22 Sep 2022 15:43:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
 <YyxQMtJCLdgWuCsu@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 0/6] xhci features and fixes for usb-next
In-Reply-To: <YyxQMtJCLdgWuCsu@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.9.2022 15.08, Greg KH wrote:
> On Wed, Sep 21, 2022 at 03:34:44PM +0300, Mathias Nyman wrote:
>> Hi Greg
>>
>> Some xhci features and fixes for usb-next.
>> Both fixing some possible memory leaks that are too late for usb-linus,
>> and simple code cleanups for usb-next
> 
> Did you miss this one:
> 	https://lore.kernel.org/r/20220915011134.58400-1-liulongfang@huawei.com
> 
> or was there some issue with it?

Got distracted while looking at it.

Can be added but probably not that useful.

In a host controller error (HCE) case all host activity stops, so it would
make more sense to check HCE bit in timeout cases than in interrupt handler.

-Mathias


