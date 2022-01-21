Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1091495F75
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 14:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349367AbiAUNKG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 08:10:06 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:33190 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245103AbiAUNKG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jan 2022 08:10:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1642770606; x=1674306606;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iPXLUl7wMKPoi92WQwqfl++prRc8bg3VlIZme/P2HXY=;
  b=vazh0LAKhr4GgiI2RlOvpzYraH62leAiajXmnkSpSxUjRx6h/Z5ukH4g
   QbmGOhcOd4/O8wf0aPTAn8vXhunYZlmff94n4ZyfIm4pk5mVlA/JtABM9
   jEqzjfPTWEZZzbEeLCQkk+PMQZ9UXhmWTbEeF/WcDmM9oKme8odrUU4M9
   o=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 21 Jan 2022 05:10:06 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2022 05:10:05 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Fri, 21 Jan 2022 05:10:05 -0800
Received: from [10.50.6.39] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 21 Jan
 2022 05:10:02 -0800
Message-ID: <6fbf149a-52d7-c348-3d52-61c6f9820481@quicinc.com>
Date:   Fri, 21 Jan 2022 18:39:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1] usb: hub: Power cycle root hub if CSC is set during
 hub_port_reset
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <linux-usb@vger.kernel.org>, <quic_pkondeti@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_mrana@quicinc.com>
References: <1642607498-8458-1-git-send-email-quic_ppratap@quicinc.com>
 <YehKeTcpa1mxDHbG@rowland.harvard.edu>
From:   Pratham Pratap <quic_ppratap@quicinc.com>
In-Reply-To: <YehKeTcpa1mxDHbG@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

Thanks for reviewing.

On 1/19/2022 10:59 PM, Alan Stern wrote:
> On Wed, Jan 19, 2022 at 09:21:38PM +0530, Pratham Pratap wrote:
>> When a FS device is following a suspend-reset-enumeration-data
>> transfer sequence,
> Such a sequence never happens.  The kernel always does a resume before a
> reset, if the port is suspended.
>
> I seem to recall reading something in the USB-2 spec saying that this was
> required (i.e., a suspended port should never be reset without being
> resumed first), but now I can't find it.
What if resume failed and the driver ends up in reset resume path?
Also, there can be a possibility of some class driver preforming
reset-resume(based on quirks).
>
>> sometimes it goes back in suspend just after reset
>> without the link entering L0. This is seen in only when the following
>> scenarios are met:
>> - SOF and EOR happens at the same clock cycle
>> - UTMI line state should transition from SE0 to K at the same clock
>> cycle(if the UTMI line state transition from SE0 to J at the same
>> clock cycle then problem is not seen)
> This is not true in general.  You're talking about a specific host
> controller with a specific PHY, aren't you?  If you are, you should say
> so.
Yes, this is seen with dwc controller and SNPS eUSB2 PHY
>> Attemting a power cycle of the root hub recovers the problem described.
>> To identify the issue, PLS goes to disabled state followed by CSC bit
>> being set(because of CCS status change).
>>
>> Signed-off-by: Pratham Pratap <quic_ppratap@quicinc.com>
>> ---
>> v1:
>> Problem is seen on core emulation setup with eUSB2 PHY test chip.
>> This failure is seen only in full speed host mode usecase with all
>> available eUSB2 repeater randomly in 1 out of 5000 to 6000 iterations.
> This information should be part of the patch description.  And it should
> be mentioned in a comment in the code.

Will make it as part of next patch version.

>> As of now, we don't have any SOC with eUSB2 PHY on which this fix can
>> be tested.
> If you can't test the patch, why are you submitting it?
This patch is tested in emulation environment not in SW world since
we don't have any SOC yet to test it.
>>   drivers/usb/core/hub.c        | 34 ++++++++++++++++++++++++++--------
>>   drivers/usb/host/xhci-plat.c  |  3 +++
>>   include/linux/usb/hcd.h       |  1 +
>>   include/uapi/linux/usb/ch11.h |  1 +
>>   4 files changed, 31 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 47a1c8b..6a65092 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -2834,10 +2834,20 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
>>   		|| link_state == USB_SS_PORT_LS_COMP_MOD;
>>   }
>>   
>> +static void usb_hub_port_power_cycle(struct usb_device *hdev, struct usb_hub *hub, int port1)
>> +{
>> +	dev_info(&hub->ports[port1 - 1]->dev, "attempt power cycle\n");
>> +	usb_hub_set_port_power(hdev, hub, port1, false);
>> +	msleep(2 * hub_power_on_good_delay(hub));
>> +	usb_hub_set_port_power(hdev, hub, port1, true);
>> +	msleep(hub_power_on_good_delay(hub));
>> +}
>> +
>>   static int hub_port_wait_reset(struct usb_hub *hub, int port1,
>>   			struct usb_device *udev, unsigned int delay, bool warm)
>>   {
>>   	int delay_time, ret;
>> +	struct usb_hcd *hcd = bus_to_hcd(udev->bus);
> udev may be a NULL pointer.  You can use hub->hdev instead.
sure, will take care of it in v2

>>   	u16 portstatus;
>>   	u16 portchange;
>>   	u32 ext_portstatus = 0;
>> @@ -2887,8 +2897,21 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
>>   		return -ENOTCONN;
>>   
>>   	/* Device went away? */
>> -	if (!(portstatus & USB_PORT_STAT_CONNECTION))
>> +	if (!(portstatus & USB_PORT_STAT_CONNECTION)) {
>> +		/*
>> +		 * When a FS device is following a suspend-reset-enumeration-data_transfer
>> +		 * sequence, sometimes it goes back in suspend just after reset without the
>> +		 * link entering L0. To fix this when CSC bit is set(because of CCS status
>> +		 * change) power cycle the root hub.
>> +		 */
>> +		if (udev->reset_resume && (!udev->parent && hcd->fs_suspend_reset) &&
> Unnecessary extra parentheses.  Also, at this point udev can be a NULL
> pointer; you must test it before dereferencing it.
>
> Furthermore, udev->parent must always be set; you probably meant to write
> !hub->hdev->parent.
>
>> +				(portstatus & USB_PORT_STAT_CSC)) {
> You probably mean portchange here, not portstatus.  There is no CSC bit
> in portstatus.
yes
>> +			usb_hub_port_power_cycle(hdev, hub, port1);
>> +			return -EAGAIN;
>> +		}
>> +
>>   		return -ENOTCONN;
>> +	}
>>   
>>   	/* Retry if connect change is set but status is still connected.
>>   	 * A USB 3.0 connection may bounce if multiple warm resets were issued,
>> @@ -5393,13 +5416,8 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
>>   			break;
>>   
>>   		/* When halfway through our retry count, power-cycle the port */
>> -		if (i == (PORT_INIT_TRIES - 1) / 2) {
>> -			dev_info(&port_dev->dev, "attempt power cycle\n");
>> -			usb_hub_set_port_power(hdev, hub, port1, false);
>> -			msleep(2 * hub_power_on_good_delay(hub));
>> -			usb_hub_set_port_power(hdev, hub, port1, true);
>> -			msleep(hub_power_on_good_delay(hub));
>> -		}
>> +		if (i == (PORT_INIT_TRIES - 1) / 2)
>> +			usb_hub_port_power_cycle(hdev, hub, port1);
>>   	}
>>   	if (hub->hdev->parent ||
>>   			!hcd->driver->port_handed_over ||
>> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
>> index c1edcc9..607c4f0 100644
>> --- a/drivers/usb/host/xhci-plat.c
>> +++ b/drivers/usb/host/xhci-plat.c
>> @@ -342,6 +342,9 @@ static int xhci_plat_probe(struct platform_device *pdev)
>>   	hcd->tpl_support = of_usb_host_tpl_support(sysdev->of_node);
>>   	xhci->shared_hcd->tpl_support = hcd->tpl_support;
>>   
>> +	hcd->fs_suspend_reset = of_property_read_bool(sysdev->of_node, "fs-suspend-reset");
>> +	xhci->shared_hcd->fs_suspend_reset = hcd->fs_suspend_reset;
>> +
>>   	if (priv) {
>>   		ret = xhci_priv_plat_setup(hcd);
>>   		if (ret)
>> diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
>> index 548a028..05ccbc8 100644
>> --- a/include/linux/usb/hcd.h
>> +++ b/include/linux/usb/hcd.h
>> @@ -172,6 +172,7 @@ struct usb_hcd {
>>   	unsigned		tpl_support:1; /* OTG & EH TPL support */
>>   	unsigned		cant_recv_wakeups:1;
>>   			/* wakeup requests from downstream aren't received */
>> +	unsigned		fs_suspend_reset:1; /* fs suspend reset bug */
>>   
>>   	unsigned int		irq;		/* irq allocated */
>>   	void __iomem		*regs;		/* device memory/io */
>> diff --git a/include/uapi/linux/usb/ch11.h b/include/uapi/linux/usb/ch11.h
>> index fb0cd24..576bbf9 100644
>> --- a/include/uapi/linux/usb/ch11.h
>> +++ b/include/uapi/linux/usb/ch11.h
>> @@ -135,6 +135,7 @@ struct usb_port_status {
>>   #define USB_PORT_STAT_TEST              0x0800
>>   #define USB_PORT_STAT_INDICATOR         0x1000
>>   /* bits 13 to 15 are reserved */
>> +#define USB_PORT_STAT_CSC		0x20000
> This doesn't make any sense; you are defining a name for bit 17 in
> wPortStatus, which is a 16-bit field.  Are you sure you don't want to use
> USB_PORT_STAT_C_CONNECTION, which is already defined a little bit lower
> down in this file?
Ah! my bad. I must have overlooked it. Definitely we can use 
USB_PORT_STAT_C_CONNECTION.
Will take care of it in v2.
>>   
>>   /*
>>    * Additions to wPortStatus bit field from USB 3.0
>> -- 
>> 2.7.4
> Alan Stern

Thanks,

Pratham

