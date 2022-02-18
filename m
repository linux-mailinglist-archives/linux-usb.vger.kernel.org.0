Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC874BB65E
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 11:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233856AbiBRKIW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 05:08:22 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbiBRKIV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 05:08:21 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9E51B7BF
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 02:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645178885; x=1676714885;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=Yy74488rpznooX2YOwQU2JAdHWPCY57pbM2l3BV/GKI=;
  b=Pqx7gpXBBRMaU6ZK6tVZyZ735Cd9dgWmEdXxExprHXD1x2FnLFqI5n3D
   DIHRXLlIltv1+Y9X9u4Y/IPdUHB8hzZKteFLf8XsqVqxciVlkYge6KrLS
   1brnyK2070dFnq9p68nejE4fjU2lbb/pe+kJDd5YMrfLtJIoF0+A+TCrQ
   130U8LkbTDCBnVi+j3vApbBANPpvj/tGlP343Cl8fH6ONbyq2XX3tU1uu
   eO1lDMzOSEQCCqDUhDvax+OK7xTemxUrkYI1PHKKlQElwhRRRGAYvAmPt
   iQQ9KSusFNngfcl5L+CbF2qaQiij9s/MlGu5TCbqzOZWqLo7j5ejhnQV1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="314362319"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="314362319"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2022 02:08:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; 
   d="scan'208";a="572252882"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2022 02:08:03 -0800
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20220216095153.1303105-1-mathias.nyman@linux.intel.com>
 <20220216095153.1303105-6-mathias.nyman@linux.intel.com>
 <Yg5msgveDOAaYh5u@kroah.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v2 5/9] xhci: dbgtty: use IDR to support several dbc
 instances.
Message-ID: <d3da9214-d0d0-e864-cf06-4f69b64e3127@linux.intel.com>
Date:   Fri, 18 Feb 2022 12:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <Yg5msgveDOAaYh5u@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 17.2.2022 17.16, Greg KH wrote:
> On Wed, Feb 16, 2022 at 11:51:49AM +0200, Mathias Nyman wrote:
>> To support systems with several xhci controllers with active
>> dbc on each xhci we need to use IDR to identify and give
>> an index to each port.
>>
>> Avoid using global struct tty_driver.driver_state for storing
>> dbc port pointer as it won't work with several dbc ports
>>
>> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
>> ---
>>  drivers/usb/host/xhci-dbgcap.h |  1 +
>>  drivers/usb/host/xhci-dbgtty.c | 46 ++++++++++++++++++++++++++++------
>>  2 files changed, 40 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/usb/host/xhci-dbgcap.h b/drivers/usb/host/xhci-dbgcap.h
>> index 5f3304a06591..ca04192fdab1 100644
>> --- a/drivers/usb/host/xhci-dbgcap.h
>> +++ b/drivers/usb/host/xhci-dbgcap.h
>> @@ -100,6 +100,7 @@ struct dbc_ep {
>>  struct dbc_port {
>>  	struct tty_port			port;
>>  	spinlock_t			port_lock;	/* port access */
>> +	int				minor;
>>  
>>  	struct list_head		read_pool;
>>  	struct list_head		read_queue;
>> diff --git a/drivers/usb/host/xhci-dbgtty.c b/drivers/usb/host/xhci-dbgtty.c
>> index 059b58f48e3a..d3acc0829ee5 100644
>> --- a/drivers/usb/host/xhci-dbgtty.c
>> +++ b/drivers/usb/host/xhci-dbgtty.c
>> @@ -10,11 +10,14 @@
>>  #include <linux/slab.h>
>>  #include <linux/tty.h>
>>  #include <linux/tty_flip.h>
>> +#include <linux/idr.h>
>>  
>>  #include "xhci.h"
>>  #include "xhci-dbgcap.h"
>>  
>>  static struct tty_driver *dbc_tty_driver;
>> +static struct idr dbc_tty_minors;
>> +static DEFINE_MUTEX(dbc_tty_minors_lock);
> 
> Why not just use an ida instead?  That way you do not need another lock
> and it becomes a tiny bit simpler overall.

idr seemed like a good way to tie together the minor number (in tty_struct index)
to the right dbc_port structure, which contains a pointer to that specific
xhci device 

This way I could find the right dbc_port and store it in tty_struct driver_data
in the  tty_operations install callback, allowing later tty read and and write calls
to find the correct xhci controller from tty_struct driver_data.

Looking at it now it might be possible to use just ida instead, and set the
tty_struct driver_data right after calling tty_port_register_device().

We should know everything we need there, id (minor), dbc_port, and can probably
get the tty_struct from the newly created tty port device somehow.

Should dig into tty a bit more for this.

> 
> I'll take this now, but in the future it might be worth to change this.

Thanks

-Mathias
