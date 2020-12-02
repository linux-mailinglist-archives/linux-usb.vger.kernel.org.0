Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11F2D2CB7E2
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 09:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729013AbgLBI6s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Dec 2020 03:58:48 -0500
Received: from mga06.intel.com ([134.134.136.31]:60111 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728480AbgLBI6r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Dec 2020 03:58:47 -0500
IronPort-SDR: 0TZnOfxn6T5fpdnipNG1vfcKS+zIxvWfAvbhjO67LZcGRurHUxC3wxRQgrHX9SKgH01DtlHJSh
 TBaoyk/6eQMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="234588687"
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="234588687"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2020 00:57:05 -0800
IronPort-SDR: AFF0GSwbUqo1qU+TpI7/aKK6PQ9T/WaJdKUw4zH2xFjETa19MMgx7XeroXvilGMeFbHKteJwKy
 wabg0w12+9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,386,1599548400"; 
   d="scan'208";a="345796824"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2020 00:57:04 -0800
Subject: Re: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
References: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
 <VE1PR04MB6528A9C9B77B4F2A9CFF9C0D89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
 <9b8d9be1-a6e4-e861-1d91-a62a97ac3add@linux.intel.com>
 <VE1PR04MB65282E8B0E8D2C0100FCE18D89F30@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <0ff0ea34-bf51-9b23-84a3-a67d63214751@linux.intel.com>
Date:   Wed, 2 Dec 2020 10:58:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB65282E8B0E8D2C0100FCE18D89F30@VE1PR04MB6528.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2.12.2020 8.58, Jun Li wrote:
> 
> 
>> -----Original Message-----
>> From: Mathias Nyman <mathias.nyman@linux.intel.com>
>> Sent: Wednesday, December 2, 2020 7:55 AM
>> To: Jun Li <jun.li@nxp.com>; mathias.nyman@intel.com
>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Peter Chen
>> <peter.chen@nxp.com>
>> Subject: Re: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
>> suspend
>>
>> Hi
>>
>> On 1.12.2020 8.12, Jun Li wrote:
>>> Hi,
>>>
>>>> -----Original Message-----
>>>> From: Jun Li <jun.li@nxp.com>
>>>> Sent: Tuesday, November 3, 2020 7:23 PM
>>>> To: mathias.nyman@intel.com
>>>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Peter Chen
>>>> <peter.chen@nxp.com>
>>>> Subject: [PATCH] usb: host: xhci: wait USB2 port enter suspend for
>>>> bus suspend
>>>>
>>>> If the connected USB2 device wakeup is not enabled/supported, the
>>>> link state may still be U0 when do xhci bus suspend, after we suspend
>>>> ports in U0, we need give time to device to enter suspend before do
>>>> further suspend operations (e.g. system suspend), otherwise we may
>>>> enter system suspend with link state at U0.
>>
>>
>> What side-effects have you observed if bus suspend returns while a port is
>> still transitioning to U3?
> 
> I found a real problem on remote wakeup by USB2 device disconnect
> on root port, that device(e.g. Udisk) itself does not support remote
> wakeup, the remote wakeup has problem if I enable USB2 DPDM wakeup
> when USB2 bus at U0.
> 
>>
>> I can't recall why we end up with ports in U0 in bus suspend anymore.
>> I think that in system suspend the link should be put to U3 already when
>> the usb device is suspended, before the bus suspends, even if it doesn't
>> support remote wakeup.
> 
> I also thought so but actually not, see below in usb_port_suspend():
> 
>   12         if (hub_is_superspeed(hub->hdev))
>   13                 status = hub_set_port_link_state(hub, port1, USB_SS_PORT_LS_U3); 
>   14 
>   15         /*
>   16          * For system suspend, we do not need to enable the suspend feature
>   17          * on individual USB-2 ports.  The devices will automatically go
>   18          * into suspend a few ms after the root hub stops sending packets.
>   19          * The USB 2.0 spec calls this "global suspend".
>   20          *
>   21          * However, many USB hubs have a bug: They don't relay wakeup requests
>   22          * from a downstream port if the port's suspend feature isn't on.
>   23          * Therefore we will turn on the suspend feature if udev or any of its
>   24          * descendants is enabled for remote wakeup.
>   25          */
>   26         else if (PMSG_IS_AUTO(msg) || usb_wakeup_enabled_descendants(udev) > 0)
>   27                 status = set_port_feature(hub->hdev, port1,
>   28                                 USB_PORT_FEAT_SUSPEND);
>   29         else {
>   30                 really_suspend = false;
>   31                 status = 0;
>   32         }
> 
> usb_wakeup_enabled_descendants(udev) > 0 is not true, if the device itself
> does not support remote wakeup.
> 

You're right, link isn't set to U3 in this case. 

...
>>
>> if (bus_state->bus_suspended)
>> 	usleep_range(5000, 10000)
> 
> I will send your proposal if no more comments.

Yes, thanks, no more comments.

-Mathias

