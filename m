Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57447545E5E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 10:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347270AbiFJIQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 04:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347240AbiFJIQc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 04:16:32 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E22DC20BE38
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654848989; x=1686384989;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=xB+8lCXM5ehOpPzqxNz9AwgTMfQZq9K7WuVY39UAKsA=;
  b=gpPb6JR04KsnuH6l/24rM98d2Xe/UCLj3h4xkaJx4UCKI2jcyBEqHEWi
   2Uc39BKq2bcWkcSYzZwybk+/ezceeTst7Nb80mK5jHsOpjm3nhfL2G7Oi
   HIucqlgisYDKWTQpecNQ0x8bzNcHqY0j1PuNlSR1BCwiGeflOadRDvrv4
   e3xscyejyl6wVRfc9Ylh4q2Iyj4xQNpXz6OJK5WmFEehYLrbqMmAKhOa1
   gxv+x5AR9dlBvSyqk9NYBv5oLI6URcAjawTyo7fhrUOmtRQQoZePBwVER
   DHCWEPFiO08EggTF1WPLk7pHMvE/AqoFkpPvBYuy2sYKOyXWQnoe+S7Bg
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="278358957"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="278358957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 01:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="724856825"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2022 01:16:27 -0700
Message-ID: <dfd65190-fe38-3189-70fa-6b2c31ebecdf@linux.intel.com>
Date:   Fri, 10 Jun 2022 11:17:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.8.1
Content-Language: en-US
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     hkallweit1@gmail.com, gregkh@linuxfoundation.org,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        quic_jackp@quicinc.com, tunguyen@apm.com,
        linux-amlogic@lists.infradead.org
References: <c4e9f0d8-c736-1153-3f32-b85e7024b3fe@linux.intel.com>
 <20220609120336.831533-1-mathias.nyman@linux.intel.com>
 <YqIUsP437G8g75YS@google.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [RFT PATCH] xhci: Fix null pointer dereference in resume if xhci
 has only one roothub
In-Reply-To: <YqIUsP437G8g75YS@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*On 9.6.2022 18.41, Matthias Kaehlcke wrote:
> On Thu, Jun 09, 2022 at 03:03:36PM +0300, Mathias Nyman wrote:
>> In the re-init path xhci_resume() passes 'hcd->primary_hcd' to hci_init(),
>> however this field isn't initialized by __usb_create_hcd() for a HCD
>> without secondary controller.
>>
>> xhci_resume() is called once per xHC device, not per hcd, so the extra
>> checking for primary hcd can be removed.
>>
>> Fixes: e0fe986972f5 ("usb: host: xhci-plat: prepare operation w/o shared hcd")
>> Reported-by: Matthias Kaehlcke <mka@chromium.org>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>   drivers/usb/host/xhci.c | 15 +++++----------
>>   1 file changed, 5 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>> index f0ab63138016..9ac56e9ffc64 100644
>> --- a/drivers/usb/host/xhci.c
>> +++ b/drivers/usb/host/xhci.c
>> @@ -1107,7 +1107,6 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>>   {
>>   	u32			command, temp = 0;
>>   	struct usb_hcd		*hcd = xhci_to_hcd(xhci);
>> -	struct usb_hcd		*secondary_hcd;
>>   	int			retval = 0;
>>   	bool			comp_timer_running = false;
>>   	bool			pending_portevent = false;
>> @@ -1214,23 +1213,19 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernated)
>>   		 * first with the primary HCD, and then with the secondary HCD.
>>   		 * If we don't do the same, the host will never be started.
>>   		 */
>> -		if (!usb_hcd_is_primary_hcd(hcd))
>> -			secondary_hcd = hcd;
>> -		else
>> -			secondary_hcd = xhci->shared_hcd;
>> -
>>   		xhci_dbg(xhci, "Initialize the xhci_hcd\n");
>> -		retval = xhci_init(hcd->primary_hcd);
>> +		retval = xhci_init(hcd);
>>   		if (retval)
>>   			return retval;
>>   		comp_timer_running = true;
>>   
>>   		xhci_dbg(xhci, "Start the primary HCD\n");
> 
> Is the log still correct? IIUC this now isn't necessarily the primary HCD.

It's still correct as this is always the xhci->main_hcd, the one that is created first.
There could be a better word than "primary", but my brain is accustomed to seeing this
line while debugging.


> 
>> -		retval = xhci_run(hcd->primary_hcd);
>> -		if (!retval && secondary_hcd) {
>> +		retval = xhci_run(hcd);
>> +		if (!retval && xhci->shared_hcd) {
>>   			xhci_dbg(xhci, "Start the secondary HCD\n");
> 
> ditto

same, always xhci->shared_hcd, the one that is created second.

> 
>> -			retval = xhci_run(secondary_hcd);
>> +			retval = xhci_run(xhci->shared_hcd);
>>   		}
>> +
>>   		hcd->state = HC_STATE_SUSPENDED;
>>   		if (xhci->shared_hcd)
>>   			xhci->shared_hcd->state = HC_STATE_SUSPENDED;
> 
> Tested-by: Matthias Kaehlcke <mka@chromium.org>

Thanks for testing
-Mathias
