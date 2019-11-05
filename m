Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F36CEF4B6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 06:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726988AbfKEFOY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 5 Nov 2019 00:14:24 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:37263 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfKEFOY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 00:14:24 -0500
Received: from mail-pf1-f197.google.com ([209.85.210.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iRrAb-00048b-VR
        for linux-usb@vger.kernel.org; Tue, 05 Nov 2019 05:14:22 +0000
Received: by mail-pf1-f197.google.com with SMTP id l20so15299844pff.6
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 21:14:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=JprAQtkugXMNo/gg2BE2hUTsxxRNgFiIwg+1mQgKeVY=;
        b=DslXYeYPctfXwO3wi+UhjJ01pLuXF+0QcMVkfwcW0HSbEMCgXPp2EXMPmSvJOmKeOT
         FaDql5Tj39KluxYVnaSC1EAuQ6HK5cYx0BT6LitH0SmL392oj+WiLcAF2ipfV1CuS3sV
         x6K8t6fbOF80DZf9LmP605rRnu7kiY6sgIdg8RL6rHFpRAQMKs5uSuel7R4wC+DMmJIK
         3jRqcB/0iL5Aa1pu3ecsi1XQRJbcPVT4OD3oWym74RiuDXQztl4TmvoaFq2Z3pOFMi6X
         3ucCzT1N2hdi8YLnRt/mfu+UQXcjhXaK/7qB7end3Dn1luNAMyXc4KBH70hgUsi/AiKd
         QB1Q==
X-Gm-Message-State: APjAAAV0qvdADPublq6wZkxVNLdV0701czwy+SGVm6KhABMD8yb0Nvyx
        IO3Z6V2FP6UTpJ6/y3p7k62AsoQ//JGwndR9t/PpvTXoJGlABUPt7A+dE/AOVnZyOnfpbDK36Ad
        XEY3rtSG2bLcKwdSL9RKJR4R3gvI+ziCh6KpkJg==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr35413447pfb.167.1572930860594;
        Mon, 04 Nov 2019 21:14:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqxLeAQ3fElRGQNEY/4syv8RZhQVelT90aGVjAH0F7fIO1ra0NmQdetGZnHO/2G4Z3YOLxkD8Q==
X-Received: by 2002:a62:1b4a:: with SMTP id b71mr35413421pfb.167.1572930860214;
        Mon, 04 Nov 2019 21:14:20 -0800 (PST)
Received: from [10.101.46.71] (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id t8sm8783700pji.11.2019.11.04.21.14.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Nov 2019 21:14:19 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCH 2/2] usb: core: Attempt power cycle when port is in
 eSS.Disabled state
From:   Kai Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20191104143838.GA2183570@kroah.com>
Date:   Tue, 5 Nov 2019 13:14:16 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <CFDCF282-FBBC-43BC-9E6B-093B752E5C33@canonical.com>
References: <20191007182840.4867-1-kai.heng.feng@canonical.com>
 <20191007182840.4867-2-kai.heng.feng@canonical.com>
 <20191104143838.GA2183570@kroah.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 4, 2019, at 10:38 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Tue, Oct 08, 2019 at 02:28:40AM +0800, Kai-Heng Feng wrote:
>> On Dell TB16, Realtek USB ethernet (r8152) connects to an SMSC hub which
>> then connects to ASMedia xHCI's root hub:
>> 
>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
>>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>>            |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
>> 
>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp. USB5537B
>> Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter
>> 
>> The SMSC hub may disconnect after system resume from suspend. When this
>> happens, the reset resume attempt fails, and the last resort to disable
>> the port and see something comes up later, also fails.
>> 
>> When the issue occurs, the link state stays in eSS.Disabled state
>> despite the warm reset attempts. The USB spec mentioned this can be
>> caused by invalid VBus, and after some expiremets, it does show that the
>> SMSC hub can be brought back after a power cycle.
>> 
>> So let's power cycle the port at the end of reset resume attempt, if
>> it's in eSS.Disabled state.
>> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/usb/core/hub.c | 21 +++++++++++++++++++--
>> 1 file changed, 19 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 6655a6a1651b..5f50aca7cf67 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -2739,20 +2739,33 @@ static bool hub_port_warm_reset_required(struct usb_hub *hub, int port1,
>> 		|| link_state == USB_SS_PORT_LS_COMP_MOD;
>> }
>> 
>> +static bool hub_port_power_cycle_required(struct usb_hub *hub, int port1,
>> +		u16 portstatus)
>> +{
>> +	u16 link_state;
>> +
>> +	if (!hub_is_superspeed(hub->hdev))
>> +		return false;
>> +
>> +	link_state = portstatus & USB_PORT_STAT_LINK_STATE;
>> +	return link_state == USB_SS_PORT_LS_SS_DISABLED;
>> +}
>> +
>> static void hub_port_power_cycle(struct usb_hub *hub, int port1)
>> {
>> +	struct usb_port *port_dev = hub->ports[port1  - 1];
>> 	int ret;
>> 
>> 	ret = usb_hub_set_port_power(hub, port1, false);
>> 	if (ret) {
>> -		dev_info(&udev->dev, "failed to disable port power\n");
>> +		dev_info(&port_dev->dev, "failed to disable port power\n");
>> 		return;
>> 	}
>> 
>> 	msleep(2 * hub_power_on_good_delay(hub));
>> 	ret = usb_hub_set_port_power(hub, port1, true);
>> 	if (ret) {
>> -		dev_info(&udev->dev, "failed to enable port power\n");
>> +		dev_info(&port_dev->dev, "failed to enable port power\n");
>> 		return;
>> 	}
>> 
>> @@ -3600,6 +3613,10 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
>> 	if (status < 0) {
>> 		dev_dbg(&udev->dev, "can't resume, status %d\n", status);
>> 		hub_port_logical_disconnect(hub, port1);
>> +		if (hub_port_power_cycle_required(hub, port1, portstatus)) {
>> +			dev_info(&udev->dev, "device in disabled state, attempt power cycle\n");
> 
> Why dev_info()?  Shouldn't we only care if this fails?

I’ll lower the level to dev_dbg().

> 
>> +			hub_port_power_cycle(hub, port1);
> 
> Weren't we only going to do this for the broken types of devices?  And
> not for everything?

From what I can understand from the spec, if the device is in eSS.Disabled state, there’s no way out.
So "power cycling as a last resort” is indeed targets everything.

Kai-Heng

> thanks,
> 
> greg k-h

