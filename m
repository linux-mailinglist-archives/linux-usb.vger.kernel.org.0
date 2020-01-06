Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC5D130D7B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2020 07:19:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbgAFGTR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 6 Jan 2020 01:19:17 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36162 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgAFGTR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 01:19:17 -0500
Received: from mail-pl1-f199.google.com ([209.85.214.199])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1ioLjP-00069J-CN
        for linux-usb@vger.kernel.org; Mon, 06 Jan 2020 06:19:15 +0000
Received: by mail-pl1-f199.google.com with SMTP id t3so10876967plz.3
        for <linux-usb@vger.kernel.org>; Sun, 05 Jan 2020 22:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=vqkeBbtQ/S3eGJG7ALwvxRss7P5JkNLpwge+MbQGY3E=;
        b=r0bukf4jpyWmo0QeMri4dd5iK6d9nfOh5vknyd37h8iY6RYP352DR+0pC1uZgmoXw8
         1muCccBOvcHRNtZzQYjCkvlGxKo8f9/msMHJi7VNTwHCV3QBxcOUOctSRo2tEfTjqJ4t
         5qrhTqcrLKSf+GLz6A/ibvjzD8/YMMu4yr25rTzL0m0w+DF/8BDqN4AHg+f6qU7U2Z1x
         fZMiulcN/2JFPOuw6P+7eV6GcNb0ySnl2O7ySRSLue+vUYqVS+ue556YMQqu9j7jYwdX
         3nf6ib4rImJiCB/8WSPDnhEqah815QdH7erLNhJk63+DNnCk1CdLn1cIN8DvNbYbgLpU
         X2CQ==
X-Gm-Message-State: APjAAAWc+0SbtamrunuW2OcSptkY46yG5sgyLPH1h/J/RUlWI8PxS0pR
        ngEV6ntf284eya7a1rcxGJpXOP76Tsvxy2w9rWWK146Lpb8eRds2ighY/w8AvCybMYs/TtfyNQb
        bX9opWCj3WxMve6RXPmfq7KoOtwWaidSMwhWMmA==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr108394748pfc.195.1578291553831;
        Sun, 05 Jan 2020 22:19:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqwwneR4KEMxSx+1Y1t/2K3PN/9q9+hJWQvCmqIhS/uOCbyKHuq5HQvg5itd1UaQq8J8UXre5Q==
X-Received: by 2002:a62:1c88:: with SMTP id c130mr108394738pfc.195.1578291553557;
        Sun, 05 Jan 2020 22:19:13 -0800 (PST)
Received: from 2001-b011-380f-35a3-2839-ccbd-36ed-2f4a.dynamic-ip6.hinet.net (2001-b011-380f-35a3-2839-ccbd-36ed-2f4a.dynamic-ip6.hinet.net. [2001:b011:380f:35a3:2839:ccbd:36ed:2f4a])
        by smtp.gmail.com with ESMTPSA id j5sm60724985pfn.180.2020.01.05.22.19.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 Jan 2020 22:19:13 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.40.2.2.4\))
Subject: Re: [PATCH 3/3] USB: Disable LPM on WD19's Realtek Hub during setting
 its ports to U0
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <Pine.LNX.4.44L0.2001041117130.7125-100000@netrider.rowland.org>
Date:   Mon, 6 Jan 2020 14:19:07 +0800
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        gregkh@linuxfoundation.org, acelan.kao@canonical.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <90B37743-30D1-41BB-8272-D5FBDC89C88F@canonical.com>
References: <Pine.LNX.4.44L0.2001041117130.7125-100000@netrider.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3608.40.2.2.4)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Jan 5, 2020, at 00:20, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Sat, 4 Jan 2020, Kai-Heng Feng wrote:
> 
>>>>>> @@ -3533,9 +3533,17 @@ int usb_port_resume(struct usb_device *udev, pm_message_t msg)
>>>>>> 	}
>>>>>> 
>>>>>> 	/* see 7.1.7.7; affects power usage, but not budgeting */
>>>>>> -	if (hub_is_superspeed(hub->hdev))
>>>>>> +	if (hub_is_superspeed(hub->hdev)) {
>>>>>> +		if (hub->hdev->quirks & USB_QUIRK_DISABLE_LPM_ON_U0) {
>>>>>> +			usb_lock_device(hub->hdev);
>>>>>> +			usb_unlocked_disable_lpm(hub->hdev);
>>>>>> +		}
>>>>>> 		status = hub_set_port_link_state(hub, port1, USB_SS_PORT_LS_U0);
>>>>>> -	else
>>>>>> +		if (hub->hdev->quirks & USB_QUIRK_DISABLE_LPM_ON_U0) {
>>>>>> +			usb_unlocked_enable_lpm(hub->hdev);
>>>>>> +			usb_unlock_device(hub->hdev);
>>>>> 
>>>>> The locking here seems questionable.  Doesn't this code sometimes get
>>>>> called with the hub already locked?  Or with the child device locked
>>>>> (in which case locking the hub would violate the normal locking order:  
>>>>> parent first, child second)?
>>> 
>>> I did a little checking.  In many cases the child device _will_ be 
>>> locked at this point.
>>> 
>>>> Maybe introduce a new lock? The lock however will only be used by this specific hub.
>>>> But I still want the LPM can be enabled for this hub.
>>> 
>>> Do you really need to lock the hub at all?  What would the lock protect 
>>> against?
>> 
>> There can be multiple usb_port_resume() run at the same time for different ports, so this is to prevent LPM enable/disable race.
> 
> But there can't really be an LPM enable/disable race, can there?  The 
> individual function calls are protected by the bandwidth mutex taken by 
> the usb_unlocked_{en|dis}able_lpm routines, and the overall LPM setting 
> is controlled by the hub device's lpm_disable_counter.

For enable/disable LPM itself, there's no race.
But the lock here is to protect hub_set_port_link_state().
If we don't lock the hub, other instances of usb_port_resume() routine can enable LPM and we want the LPM stays disabled until hub_set_port_link_state() is done.

Kai-Heng

> 
> So I think you don't need to lock the hub here.
> 
> Alan Stern
> 

