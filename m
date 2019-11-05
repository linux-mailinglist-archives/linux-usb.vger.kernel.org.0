Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76240F04E1
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 19:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390700AbfKESSW convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 5 Nov 2019 13:18:22 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:55141 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390520AbfKESSV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Nov 2019 13:18:21 -0500
Received: from mail-pf1-f200.google.com ([209.85.210.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iS3PH-0000IR-GS
        for linux-usb@vger.kernel.org; Tue, 05 Nov 2019 18:18:19 +0000
Received: by mail-pf1-f200.google.com with SMTP id z21so7713795pfr.4
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2019 10:18:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=5Wmxaj+BarZSVjtedyoX+TxJZ3eiXoyUdzCwL1PF1ho=;
        b=kC6rHQtTMVsGT7kYAaPYFNVhYs76Fx6BhoB0hITnFY92yy5WpOK2hJM4rtU4yAnuYV
         C6QLWTzFnnx5RRuSuGbmw2hj8r8U1aFVgx6I/xUkLodRAubsWWK69ETk7MfeQqNjT7SH
         Pr/rZ/wgdofdfC2zBTCO0ceGFcA9kew3dRs4CYpIDYP/qeI8Ar7KxRMgb0H7E9ZBmutX
         3/faw/TBwgVjoerbYLwIW8GcU9xVr6MZxf1KFzINLPI69c6xhfSwndLagRRAQyohzkTg
         LwcaLguej34MVx/1Y2jXyQeHMRi+y1q+nxWPZSGBPM6KyyjljRR/kDOhPC53WpjYKya1
         NVxQ==
X-Gm-Message-State: APjAAAXPt2JHLGMUQt3tErEEfNwgw/hw7ehxUPN1mbgyTr4OhHbpjjPc
        CkwpUMyuESQf4As7sHUp0AZyNouYvqjg2bL7zWOITrDuyTn4IDtVuUQr8frUikdl7cLy1ddKPsZ
        5B8zJXVTY7jCWve4IS8zXMCNfmFnqEpZVJByLog==
X-Received: by 2002:a63:fe15:: with SMTP id p21mr37016351pgh.26.1572977898032;
        Tue, 05 Nov 2019 10:18:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqyF6bjih930a3F0/ufrbz/d2a09kvuzfZtw1eo08SNk1T5WctIcXJK6b5IpTtuITWLhmXlIrg==
X-Received: by 2002:a63:fe15:: with SMTP id p21mr37016317pgh.26.1572977897645;
        Tue, 05 Nov 2019 10:18:17 -0800 (PST)
Received: from 2001-b011-380f-3c42-8c92-3808-9862-c817.dynamic-ip6.hinet.net (2001-b011-380f-3c42-8c92-3808-9862-c817.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:8c92:3808:9862:c817])
        by smtp.gmail.com with ESMTPSA id z1sm93478pju.27.2019.11.05.10.18.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Nov 2019 10:18:17 -0800 (PST)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3601.0.10\))
Subject: Re: [PATCH] usb: Allow USB device to be warm reset in suspended state
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <Pine.LNX.4.44L0.1911051200570.1678-100000@iolanthe.rowland.org>
Date:   Wed, 6 Nov 2019 02:18:14 +0800
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8BIT
Message-Id: <325CE337-2467-4DBF-AF23-E4E5E11EAEFB@canonical.com>
References: <Pine.LNX.4.44L0.1911051200570.1678-100000@iolanthe.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3601.0.10)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Nov 6, 2019, at 02:07, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Wed, 6 Nov 2019, Kai-Heng Feng wrote:
> 
>> On Dell WD15 dock, sometimes USB ethernet cannot be detected after plugging
>> cable to the ethernet port, the hub and roothub get runtime resumed and
>> runtime suspended immediately:
>> ...
> 
>> ...
>> 
>> As Mathias pointed out, the hub enters Cold Attach Status state and
>> requires a warm reset. However usb_reset_device() bails out early when
>> the device is in suspended state, as its callers port_event() and
>> hub_event() don't always resume the device.
>> 
>> Since there's nothing wrong to reset a suspended device, allow
>> usb_reset_device() to do so to solve the issue.
> 
> I was sure I remembered reading somewhere that suspended devices were
> not allowed to be reset, but now I can't find that requirement anywhere
> in the USB spec.

I don't find it in the USB spec either.
That said, the following usb_autoresume_device() before reset may resume the device.
I've also tried using pm_runtime_get_noresume() and it works equally well for my case but I am not sure if we want to change the behavior here.

> 
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> drivers/usb/core/hub.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>> index 05a2d51bdbe0..f0194fdbc9b8 100644
>> --- a/drivers/usb/core/hub.c
>> +++ b/drivers/usb/core/hub.c
>> @@ -5877,8 +5877,7 @@ int usb_reset_device(struct usb_device *udev)
>> 	struct usb_host_config *config = udev->actconfig;
>> 	struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
>> 
>> -	if (udev->state == USB_STATE_NOTATTACHED ||
>> -			udev->state == USB_STATE_SUSPENDED) {
>> +	if (udev->state == USB_STATE_NOTATTACHED) {
>> 		dev_dbg(&udev->dev, "device reset not allowed in state %d\n",
>> 				udev->state);
>> 		return -EINVAL;
> 
> You forgot to update the kerneldoc for this function.

Ok, will do that in v2.

Kai-Heng

> 
> Alan Stern
> 

