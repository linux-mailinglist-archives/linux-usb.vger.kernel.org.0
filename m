Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B475602D1C
	for <lists+linux-usb@lfdr.de>; Tue, 18 Oct 2022 15:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230090AbiJRNf3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Oct 2022 09:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbiJRNf2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Oct 2022 09:35:28 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA09C5E554
        for <linux-usb@vger.kernel.org>; Tue, 18 Oct 2022 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666100126; x=1697636126;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=F1/0o0UWrVC8yEsfi6N3uX8w9QXMmB/3ZyIrhDDaQ4Q=;
  b=fQM2Sd/p53cO/hGCjKKpuynKoFlIINbhWw42vLZc4F5illTPE2TfUNK3
   FOmqnxlSS9yz9I1/P9N+AZt19UNmcEhJ2+EHg554vUYrKap1GHUC5ZCmV
   efA6W+8hi3++66ShrlIf2VUvMa/eJvJ9yzt3R7rLnmbWABpbM4JDFwKm7
   rSyX0AVlu6qI7nKpu4zBKLNfkC8ZIRRUBbeT7SM1g388DOmwNp/r8gFm8
   8s21Ktwq4MpJl9A+nGM4rFfLoQCDoelkkyxGIOrUksSpRBGJs6O+XFUsc
   Z/pSKxBNGIIzZ7DwGcVLxqM2US/ZTsNFk+lfqZiCRIvrGFwYWcqZ0TkES
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="306087788"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="306087788"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2022 06:35:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606541420"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; 
   d="scan'208";a="606541420"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 06:35:25 -0700
Message-ID: <fc4ba1ad-3104-e538-ec63-713cda7c2984@linux.intel.com>
Date:   Tue, 18 Oct 2022 16:36:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org
References: <Yw6r7FxMCCYSzfTk@mail-itl> <Y0i5h9Tx/1mxvh9A@mail-itl>
 <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
 <Y0nGsKipsnl3gtrp@mail-itl>
 <e56eb603-56b0-373b-b52b-c0098d669b73@linux.intel.com>
 <Y02iOUbJd8mFNLYd@mail-itl>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
In-Reply-To: <Y02iOUbJd8mFNLYd@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.10.2022 21.43, Marek Marczykowski-Górecki wrote:
> On Mon, Oct 17, 2022 at 07:12:36PM +0300, Mathias Nyman wrote:
>> On 14.10.2022 23.29, Marek Marczykowski-Górecki wrote:
>>> On Fri, Oct 14, 2022 at 07:02:13PM +0300, Mathias Nyman wrote:
>>>> This whole software bandwidth issue should only be visible in Intel
>>>> Panther Point PCH xHC (Ivy bridge)
>>>
>>> It is indeed Ivy Bridge platform.
>>>
>>>> Endpoints should be deleted from bw_table list, and xhci_virt_devices
>>>> should be freed already before xhci_mem_cleanup() is called if all goes well.
>>>>
>>>> Normally endpoints are deleted from bw_table list during usb_disconnect()
>>>>
>>>> usb_disconnect()
>>>>     ...
>>>>     usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
>>>>       hcd->driver->drop_endpoint()  // flags endpoint to be dropped
>>>>       hcd->driver->check_bandwidth()
>>>>       ->xhci_check_bandwidth()
>>>>         xhci_configure_endpoint()
>>>>           xhci_reserve_bandwidth()  // only for Panther Point
>>>>             xhci_drop_ep_from_interval_table()
>>>>
>>>> But to avoid queuing new commands to a host in XHCI_STATE_DYING or
>>>> XHCI_STATE_REMOVING state we return early, not calling xhci_reserve_bandwidth().
>>>
>>> Indeed when I remove that early return in xhci_check_bandwidth(), the
>>> crash is gone. What's the proper solution?
>>>
>>
>> We could probably just delete the endpoint from the bw list when freeing the device and
>> endpoints. Currently we just print that "endpoint x not removed from BW list!" message
>>
>> does the below help?
> 
> Yes, this helps!

Great, thanks, I'll turn it into a proper patch.
Can I add your Reported-by and Tested-by tags to it?

> 
> xhci_drop_ep_from_interval_table() does few more things, but I assume
> this all doesn't matter at the xhci_free_virt_device() time, right?

Right, if bw_endpoint_list isn't empty when freeing the virt device
it means something prevented dropping the endpoint cleanly earlier.

Most likely host died or is being removed. We just want a clean exit

Thanks
-Mathias
