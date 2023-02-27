Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 897296A4239
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 14:06:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjB0NGh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 08:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjB0NGg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 08:06:36 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98FB1EFE8
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 05:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677503171; x=1709039171;
  h=message-id:date:mime-version:to:cc:references:from:
   subject:in-reply-to:content-transfer-encoding;
  bh=b8oyPOP0yoUkd09yNuCCqtaUSqq7rHUXJvtC7ObQ2YA=;
  b=TJw3KUD/5A4JdEqNNB8PdX7C3KNEBSL3iZjrbLsRFPiBIqQRpwyYhXtB
   xvbqI6Nxvv/T0b0L9xtRVLcWTJKtm1euVxqFNyV2BTQWR0EPwYcNVHmwd
   GnOmJPXm0gNeHa43A7JAfctPbqqXnQhbKQR+uw3XL823+MtGYorimoxFD
   YRBdslCqqlwd8z4r3GkwtnAFd72a7wTd9le95itT2TTl6pyim68ufxqMh
   NPmbZljrAbH3PApTuJPHYVNrpThuC/TBNdNHDHyHBeNddLIniA1B/ZXJ6
   q2D0AB1A5ryF3ddP1Qug9R/NkO/UyIj8YNNGnHj8VnZqB3//Okii9w+PR
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="398625681"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="398625681"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 05:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="651219624"
X-IronPort-AV: E=Sophos;i="5.97,332,1669104000"; 
   d="scan'208";a="651219624"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 27 Feb 2023 05:06:09 -0800
Message-ID: <d86ca3b6-6d02-6312-6e45-4ef954ff36f6@linux.intel.com>
Date:   Mon, 27 Feb 2023 15:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Seth Bollinger <seth.boll@gmail.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        sethb@digi.com
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com>
 <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
 <Y/eKwvQAihZYKUos@rowland.harvard.edu>
 <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
 <39df1d39-f1f9-ce69-64b8-981b19731d30@linux.intel.com>
 <CA+JN8xPjqCaHLvh5v9y3pFC0DxNWjBj-3jF0DJ=B1YSddvYGNg@mail.gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: HC died
In-Reply-To: <CA+JN8xPjqCaHLvh5v9y3pFC0DxNWjBj-3jF0DJ=B1YSddvYGNg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.2.2023 15.16, Seth Bollinger wrote:
>> xhci driver does exactly this, but fails to stop the command ring while
>> trying to abort the command TRB.
>>
>> Does increasing the timeout for stopping command ring help?
>>
>> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
>> index f5b0e1ce22af..6cecbca34cca 100644
>> --- a/drivers/usb/host/xhci-ring.c
>> +++ b/drivers/usb/host/xhci-ring.c
>> @@ -397,7 +397,7 @@ static int xhci_abort_cmd_ring(struct xhci_hcd *xhci, unsigned long flags)
>>            * and try to recover a -ETIMEDOUT with a host controller reset.
>>            */
>>           ret = xhci_handshake(&xhci->op_regs->cmd_ring,
>> -                       CMD_RING_RUNNING, 0, 5 * 1000 * 1000);
>> +                       CMD_RING_RUNNING, 0, 10 * 1000 * 1000);
>>           if (ret < 0) {
>>                   xhci_err(xhci, "Abort failed to stop command ring: %d\n", ret);
>>                   xhci_halt(xhci);
> 
> Well, for us it doesn't really help as it still ends the life of the
> HC, but it doesn't solve the issue either (you can see the 10 second
> timeout here).

Ok, thanks, seems that aborting the ring does not work either.

When you earlier bumped the command ring timeout did you notice if
transfer TRBs for other devices were completing normally while waiting
for the address device command TRB to complete?

If so then it could make sense to just increase the XHCI_CMD_DEFAULT_TIMEOUT
for the address device commands to 10 seconds

This can probably be quickly tested by moving a USB mouse while triggering the
address device timeout.

Thanks
Mathias

