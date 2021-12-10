Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD643470267
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 15:05:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235682AbhLJOJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Dec 2021 09:09:02 -0500
Received: from mga02.intel.com ([134.134.136.20]:37339 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230463AbhLJOJB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Dec 2021 09:09:01 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="225622539"
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="225622539"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2021 06:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,195,1635231600"; 
   d="scan'208";a="659585007"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 10 Dec 2021 06:05:25 -0800
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
References: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
 <YbNC764D4ESw9cDN@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: hub: avoid warm port reset during USB3 disconnect
Message-ID: <844510f2-3b43-3b82-edc7-68706d8d8bba@linux.intel.com>
Date:   Fri, 10 Dec 2021 16:07:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbNC764D4ESw9cDN@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.12.2021 14.07, Greg KH wrote:
> On Fri, Dec 10, 2021 at 01:16:53PM +0200, Mathias Nyman wrote:
>> During disconnect USB-3 ports often go via SS.Inactive link error state
>> before the missing terminations are noticed, and link finally goes to
>> RxDetect state
>>
>> Avoid immediately warm-resetting ports in SS.Inactive state.
>> Let ports settle for a while and re-read the link status a few times 20ms
>> apart to see if the ports transitions out of SS.Inactive.
>>
>> According to USB 3.x spec 7.5.2, a port in SS.Inactive should
>> automatically check for missing far-end receiver termination every
>> 12 ms (SSInactiveQuietTimeout)
>>
>> The futile multiple warm reset retries of a disconnected device takes
>> a lot of time, also the resetting of a removed devices has caused cases
>> where the reset bit got stuck for a long time on xHCI roothub.
>> This lead to issues in detecting new devices connected to the same port
>> shortly after.
>>
>> Tested-by: Mark Pearson <markpearson@lenovo.com>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>  drivers/usb/core/hub.c | 24 +++++++++++++++++++-----
>>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> Does this fix a specific commit, or has it always been this way?  And is

Has been this way for 10 years. A guess would be since kernel v3.0:
5e467f6ebab1 usbcore: warm reset USB3 port in SS.Inactive state
But that code has been altered a few times since then.

> this for 5.16-final or 5.17-rc1 and/or stable trees?

maybe 5.17-rc1. 
Skipping stable until shown to resolve more critical issues, and has been
sitting in upstream for a while.

Thanks
-Mathias
