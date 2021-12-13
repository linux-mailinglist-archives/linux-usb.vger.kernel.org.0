Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11C51472F0B
	for <lists+linux-usb@lfdr.de>; Mon, 13 Dec 2021 15:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234716AbhLMOXl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Dec 2021 09:23:41 -0500
Received: from mga01.intel.com ([192.55.52.88]:36134 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234786AbhLMOXl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Dec 2021 09:23:41 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="262868007"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="262868007"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 06:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="660871478"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2021 06:23:34 -0800
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        Mark Pearson <markpearson@lenovo.com>
References: <20211210111653.1378381-1-mathias.nyman@linux.intel.com>
 <YbOmtWZueFNO3s0w@rowland.harvard.edu>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH] usb: hub: avoid warm port reset during USB3 disconnect
Message-ID: <06b58ac3-875f-518b-a9b2-599c61eec628@linux.intel.com>
Date:   Mon, 13 Dec 2021 16:25:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YbOmtWZueFNO3s0w@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10.12.2021 21.12, Alan Stern wrote:
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
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 00070a8a6507..e907dfa0ca6d 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -2777,6 +2777,8 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
>>  #define PORT_INIT_TRIES		4
>>  #endif	/* CONFIG_USB_FEW_INIT_RETRIES */
>>  
>> +#define DETECT_DISCONNECT_TRIES 5
>> +
>>  #define HUB_ROOT_RESET_TIME	60	/* times are in msec */
>>  #define HUB_SHORT_RESET_TIME	10
>>  #define HUB_BH_RESET_TIME	50
>> @@ -5543,6 +5545,7 @@ static void port_event(struct usb_hub *hub, int port1)
>>  	struct usb_device *udev = port_dev->child;
>>  	struct usb_device *hdev = hub->hdev;
>>  	u16 portstatus, portchange;
>> +	int i = 0;
>>  
>>  	connect_change = test_bit(port1, hub->change_bits);
>>  	clear_bit(port1, hub->event_bits);
>> @@ -5619,17 +5622,27 @@ static void port_event(struct usb_hub *hub, int port1)
>>  		connect_change = 1;
>>  
>>  	/*
>> -	 * Warm reset a USB3 protocol port if it's in
>> -	 * SS.Inactive state.
>> +	 * Avoid trying to recover a USB3 SS.Inactive port with a warm reset if
>> +	 * the device was disconnected. A 12ms disconnect detect timer in
>> +	 * SS.Inactive state transitions the port to RxDetect automatically.
>> +	 * SS.Inactive link error state is common during device disconnect.
>>  	 */
>> -	if (hub_port_warm_reset_required(hub, port1, portstatus)) {
>> -		dev_dbg(&port_dev->dev, "do warm reset\n");
>> -		if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
>> +	while (hub_port_warm_reset_required(hub, port1, portstatus)) {
>> +		if ((i++ < DETECT_DISCONNECT_TRIES) && udev) {
>> +			u16 unused;
>> +
>> +			msleep(20);
>> +			hub_port_status(hub, port1, &portstatus, &unused);
>> +			dev_dbg(&port_dev->dev, "Wait for inactive link disconnect detect\n");
>> +			continue;
> 
> This may be bikeshedding, and you should feel free to ignore the 
> following suggestion if you dislike it.
> 
> Don't you think it would be a lot clearer if the new "while" loop 
> covered only the code above, and the two sections below (port-only or 
> full-device warm reset) came after the end of the loop?  I had to reread 
> the patch a few times to figure out what it was really doing.
> 
> Alan Stern
>

I did first write this as:

while (hub_port_warm_reset_required(portstatus) && dev && still_retry--) {
	msleep();
	hub_port_status(&portstatus);
}

if (hub_port_warm_reset_required(portstatus)) {
	if (!dev || ...)
		hub_port_reset()
	else
		usb_reset_device()
}

But then decided it might be clearer to check if warm reset is required
in just one place.
Maybe it got a bit unnecessary complex to read inside that while loop,
even if this patch doesn't add any more code than the other way.

That said, this patch was tested by other external teams than just
Mark Pearson, all giving their thumbs up.
Not sure I can get the same amount of testing on a new version, and for
that reason, if there are no stronger objections, I'd like to keep this
as is. 

Thanks
-Mathias
