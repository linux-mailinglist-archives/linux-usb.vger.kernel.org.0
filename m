Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 163A72CB124
	for <lists+linux-usb@lfdr.de>; Wed,  2 Dec 2020 00:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727355AbgLAXzR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Dec 2020 18:55:17 -0500
Received: from mga09.intel.com ([134.134.136.24]:54936 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726997AbgLAXzQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Dec 2020 18:55:16 -0500
IronPort-SDR: 3yRJl/yukdz47jeFYovgDRwIHQYdC1iRuFrPwUsbBK9OaSAgaKL4JjbsFFi3WV1Cb24ThN8E9T
 Ox5yh8khGgnA==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="173086264"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="173086264"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 15:53:34 -0800
IronPort-SDR: xDYy4XtWbE/FC0Kf9OSOJB/nMeVUrPD5hYMqL1j4sBv5Yvzc1iBQF8vPHR7A5Gvp005Pad2ldf
 hZo34P75SwRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="345662441"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by orsmga002.jf.intel.com with ESMTP; 01 Dec 2020 15:53:33 -0800
Subject: Re: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus
 suspend
To:     Jun Li <jun.li@nxp.com>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Peter Chen <peter.chen@nxp.com>
References: <1604402250-16434-1-git-send-email-jun.li@nxp.com>
 <VE1PR04MB6528A9C9B77B4F2A9CFF9C0D89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <9b8d9be1-a6e4-e861-1d91-a62a97ac3add@linux.intel.com>
Date:   Wed, 2 Dec 2020 01:55:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <VE1PR04MB6528A9C9B77B4F2A9CFF9C0D89F40@VE1PR04MB6528.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

On 1.12.2020 8.12, Jun Li wrote:
> Hi,
> 
>> -----Original Message-----
>> From: Jun Li <jun.li@nxp.com>
>> Sent: Tuesday, November 3, 2020 7:23 PM
>> To: mathias.nyman@intel.com
>> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; Peter Chen
>> <peter.chen@nxp.com>
>> Subject: [PATCH] usb: host: xhci: wait USB2 port enter suspend for bus suspend
>>
>> If the connected USB2 device wakeup is not enabled/supported, the link state
>> may still be U0 when do xhci bus suspend, after we suspend ports in U0, we
>> need give time to device to enter suspend before do further suspend operations
>> (e.g. system suspend), otherwise we may enter system suspend with link state
>> at U0.


What side-effects have you observed if bus suspend returns while a port is still
transitioning to U3?

I can't recall why we end up with ports in U0 in bus suspend anymore.
I think that in system suspend the link should be put to U3 already when the usb device is
suspended, before the bus suspends, even if it doesn't support remote wakeup.

Do you know the reason why the device is in U0 in bus suspend in your case?
Could that be the real problem that needs to be fixed? 

>>
>> Signed-off-by: Li Jun <jun.li@nxp.com>
>> ---
>>  drivers/usb/host/xhci-hub.c | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
>> index c799ca5..1e054d0 100644
>> --- a/drivers/usb/host/xhci-hub.c
>> +++ b/drivers/usb/host/xhci-hub.c
>> @@ -1598,6 +1598,7 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>>  	struct xhci_hub *rhub;
>>  	struct xhci_port **ports;
>>  	u32 portsc_buf[USB_MAXCHILDREN];
>> +	bool wait_port_enter_u3 = false;
>>  	bool wake_enabled;
>>
>>  	rhub = xhci_get_rhub(hcd);
>> @@ -1706,12 +1707,17 @@ int xhci_bus_suspend(struct usb_hcd *hcd)
>>  				xhci_stop_device(xhci, slot_id, 1);
>>  				spin_lock_irqsave(&xhci->lock, flags);
>>  			}
>> +			wait_port_enter_u3 = true;

I don't think "wait_port_enter_u3" is needed. If xhci_bus_suspend() needs 
to set a port link to U3 it will also set a bit in bus_state->bus_suspended

>>  		}
>>  		writel(portsc_buf[port_index], ports[port_index]->addr);
>>  	}
>>  	hcd->state = HC_STATE_SUSPENDED;
>>  	bus_state->next_statechange = jiffies + msecs_to_jiffies(10);
>>  	spin_unlock_irqrestore(&xhci->lock, flags);
>> +
>> +	if (wait_port_enter_u3)
>> +		usleep_range(5000, 10000);

First thought we should poll the register(s) and wait for ports to enter U3,
but the more common case where a device is suspended and link put to U3 with a 
USB2 SetPortFeature(PORT_SUSPEND) also just sleeps for 10ms, so doing it
for this special case should be ok as well. 

if (bus_state->bus_suspended)
	usleep_range(5000, 10000)

-Mathias

