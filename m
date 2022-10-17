Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94DC3601338
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 18:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbiJQQNm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 12:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiJQQNd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 12:13:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095986D568
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666023213; x=1697559213;
  h=message-id:date:mime-version:to:cc:from:references:
   subject:in-reply-to:content-transfer-encoding;
  bh=SLSxHWX/H3XYuCgqmcmwpNKC4MgfnOBKYpz7CE/2n1c=;
  b=aLaE/YVPUSMBOIJmJN0V8+fmIE33/SLcSrhUbegUlAjSv4n42f8wAeqY
   pVynZjQzo0iQFIRGbMubLB2EosAv07dx9GLYicQvubzJruGuet8xgZ5Wv
   wzoq/navBuMTT0Hs7rE9pVZLd3AHKwtq6ZT18UVVojg2pxWtLsKM3oW5S
   MV79mOJ/c9SfTekLRq6KWoRdnBVMPmcIxwdzIMjaBSs6U0/GWWyPsu7e/
   83XacQdgEGxoetnQ3+KxXKLNVsU47EuOz0flCaj/0TmuyopVoW7+w9Cie
   mg0VLg9/tFgHwAAZ5p7QoZI9XZm4XOVsKNk0AlvU5WGcskb7Oei+Ilk8g
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="285567152"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="285567152"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 09:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="733215534"
X-IronPort-AV: E=Sophos;i="5.95,192,1661842800"; 
   d="scan'208";a="733215534"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga002.fm.intel.com with ESMTP; 17 Oct 2022 09:11:07 -0700
Message-ID: <e56eb603-56b0-373b-b52b-c0098d669b73@linux.intel.com>
Date:   Mon, 17 Oct 2022 19:12:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Content-Language: en-US
To:     =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
References: <Yw6r7FxMCCYSzfTk@mail-itl> <Y0i5h9Tx/1mxvh9A@mail-itl>
 <7eaf9861-5571-584f-b124-fa7076920090@linux.intel.com>
 <Y0nGsKipsnl3gtrp@mail-itl>
Subject: Re: list_del corruption (NULL pointer dereference) on xhci-pci unbind
In-Reply-To: <Y0nGsKipsnl3gtrp@mail-itl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 14.10.2022 23.29, Marek Marczykowski-Górecki wrote:
> On Fri, Oct 14, 2022 at 07:02:13PM +0300, Mathias Nyman wrote:
>> This whole software bandwidth issue should only be visible in Intel
>> Panther Point PCH xHC (Ivy bridge)
> 
> It is indeed Ivy Bridge platform.
> 
>> Endpoints should be deleted from bw_table list, and xhci_virt_devices
>> should be freed already before xhci_mem_cleanup() is called if all goes well.
>>
>> Normally endpoints are deleted from bw_table list during usb_disconnect()
>>
>> usb_disconnect()
>>    ...
>>    usb_hcd_alloc_bandwidth(dev, NULL, NULL, NULL);
>>      hcd->driver->drop_endpoint()  // flags endpoint to be dropped
>>      hcd->driver->check_bandwidth()
>>      ->xhci_check_bandwidth()
>>        xhci_configure_endpoint()
>>          xhci_reserve_bandwidth()  // only for Panther Point
>>            xhci_drop_ep_from_interval_table()
>>
>> But to avoid queuing new commands to a host in XHCI_STATE_DYING or
>> XHCI_STATE_REMOVING state we return early, not calling xhci_reserve_bandwidth().
> 
> Indeed when I remove that early return in xhci_check_bandwidth(), the
> crash is gone. What's the proper solution?
> 

We could probably just delete the endpoint from the bw list when freeing the device and
endpoints. Currently we just print that "endpoint x not removed from BW list!" message

does the below help?

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 9e56aa28efcd..2adc0c2b470c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -894,10 +894,12 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, int slot_id)
                  * We can't drop them anyway, because the udev might have gone
                  * away by this point, and we can't tell what speed it was.
                  */
-               if (!list_empty(&dev->eps[i].bw_endpoint_list))
+               if (!list_empty(&dev->eps[i].bw_endpoint_list)) {
+                       list_del_init(&dev->eps[i].bw_endpoint_list);
                         xhci_warn(xhci, "Slot %u endpoint %u "
                                         "not removed from BW list!\n",
                                         slot_id, i);
+               }
         }
         /* If this is a hub, free the TT(s) from the TT list */
         xhci_free_tt_info(xhci, dev, slot_id);

Thanks
-Mathias
