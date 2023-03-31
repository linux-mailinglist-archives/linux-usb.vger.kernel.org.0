Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1676E6D1891
	for <lists+linux-usb@lfdr.de>; Fri, 31 Mar 2023 09:28:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjCaH2j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Mar 2023 03:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230341AbjCaH2h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Mar 2023 03:28:37 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C07B477
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 00:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680247715; x=1711783715;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bPgNKlhyb9OzyYvORgvr/d3MfdvndiYONGsHq0bVvmA=;
  b=lOhuqnCFSS1nh+I3GeAz+Oh8djYb0ehuPVjdFANm8mC083nDmXvAzkpD
   za/ArtLt1zs1Hf8vw/3w7mZj90/W/sQK4dZeVZXJmSI9SqCFv2m2pyGvQ
   1b5hXYOPvyZRhq/EmVFCNQEWJxsza4kl5jLGlfXMkOWg2JQVlozU6wMYm
   WfhfSazmKH1BAaHd1e0opMqlNI1+DT0zZQGE+4zpkG9o/wH+PtKqo30Tr
   Poeb9k/Bc5j1hvWPiEev572OMzqYXPIL+qkLEuatprQ8H60/khewP3eZU
   dD85iQ4EpSdTksYSgFwYdkoCjR+KIF0+mSN7EE4fA3352CAETyKxDUPOk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="404098607"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="404098607"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 00:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="774264247"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="774264247"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2023 00:28:33 -0700
Message-ID: <91ed91fb-def3-80f9-827b-8ed633b836d9@linux.intel.com>
Date:   Fri, 31 Mar 2023 10:29:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] Revert "usb: xhci-pci: Set PROBE_PREFER_ASYNCHRONOUS"
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
 <20230330143056.1390020-3-mathias.nyman@linux.intel.com>
 <ZCWfa9Hqs_mF8GKh@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <ZCWfa9Hqs_mF8GKh@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30.3.2023 17.40, Greg KH wrote:
> On Thu, Mar 30, 2023 at 05:30:55PM +0300, Mathias Nyman wrote:
>> This reverts commit 4c2604a9a6899bab195edbee35fc8d64ce1444aa.
>>
>> Asynch probe caused regression in a setup with both Renesas and Intel xHC
>> controllers. Devices connected to the Renesas disconnected shortly after
>> boot. With Asynch probe the busnumbers got interleaved.
>>
>> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 1
>> xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 2
>> xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus number 3
>> xhci_hcd 0000:04:00.0: new USB bus registered, assigned bus number 4
>>
>> Reason why this commit causes regression is still unknown, but revert it
>> while debugging the issue.
>>
>> Link: https://lore.kernel.org/linux-usb/20230307132120.5897c5af@deangelis.fenrir.org.uk
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> 
> I'll add a Fixes: and cc: stable on this, ok?

Yes, please.

Thanks
Mathias

