Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8668828F1E9
	for <lists+linux-usb@lfdr.de>; Thu, 15 Oct 2020 14:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbgJOMRs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Oct 2020 08:17:48 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:55250 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgJOMRs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 15 Oct 2020 08:17:48 -0400
Received: by mail-wm1-f66.google.com with SMTP id p15so2939586wmi.4
        for <linux-usb@vger.kernel.org>; Thu, 15 Oct 2020 05:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=R413iDFRzcj273RFAq5kyCZojsu0C8mZJXkICoqv0+Y=;
        b=mSDBYfHfEfZzdNtsbSqvH3KYhS+R+pLCrqdQaY3eKK7CXLFTP3wKlWVBpIhTsi64XA
         eBf590fyJXXEY/8JfM9IpS0S/1NIFBTbvAtHCPPvRuj5t5oi0EJUl65ilj6HKXI7DiUn
         dN1fxNzuVLuaf2BhxASEycw2/nbawnpoKaGTE/4+lxLdorGfMc4EsS/lgfYEbbWqh/W3
         h/To2FE1gkXCejEffmkoKt+LxuDenMzQsPCDv2rShMLX7AmYHwlFwE458XuHGqB3BUpl
         HAqtCr+gZHnyJFBryEObpRKrl3aQzhjDtziONc93pCViZYoHxkTFknzv+LAarBkmuPoo
         2ocA==
X-Gm-Message-State: AOAM5313Kpr7EyndoksRGVGVUtPcMNat0DSESMrB9KjpcoZOhAWoZxO/
        Rvu51cAlqBgMBeSo5GmiCWFyQelhzhu2kclB
X-Google-Smtp-Source: ABdhPJzemYCWgJZkuV0HOPMTEGta3tX9EI/peJXkaxhZ3/bPI5+CXhTV3nWlzS3dQMBgGrM1w5kL/A==
X-Received: by 2002:a05:600c:608:: with SMTP id o8mr3720639wmm.86.1602764266925;
        Thu, 15 Oct 2020 05:17:46 -0700 (PDT)
Received: from [192.168.86.26] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id g5sm4277182wmi.4.2020.10.15.05.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2020 05:17:46 -0700 (PDT)
Reply-To: tanure@linux.com
To:     linux-usb@vger.kernel.org, kernelnewbies@kernelnewbies.org
From:   Lucas Tanure <tanure@linux.com>
Subject: USB Question about devices being reconnected to the host
Message-ID: <d4c94e87-a1bb-18d5-054f-2e6ed01fab5b@linux.com>
Date:   Thu, 15 Oct 2020 13:17:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm learning about USB drivers and I would like to know about 
disconnecting and reconnecting usb devices.

I can see my probe function being called and also the disconnect 
function. But if I reconnect the device there is no call from the kernel 
to notify my driver about the device being reconnected.

I can also see that the module for my driver was not unloaded, so I dont 
understand the life cycle of a USB device.

If the module is not unloaded at disconnection and re-loaded for a new 
device being connected, how can the driver know the device is there 
after a disconnection?

Thanks
Lucas

This is my dmesg for the driver at the end of this email:

[   34.706041] usb 1-1.1.2: new high-speed USB device number 5 using dwc_otg
[   34.837647] usb 1-1.1.2: New USB device found, idVendor=04b4, 
idProduct=00f1, bcdDevice= 0.00
[   34.837666] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[   34.837679] usb 1-1.1.2: Product: FX3
[   34.837693] usb 1-1.1.2: Manufacturer: Cypress
[   34.902480] usbdev_probe
[   34.902681] usbcore: registered new interface driver My USB Device
[   45.416310] usb 1-1.1.2: USB disconnect, device number 5
[   45.416655] usbdev_disconnect
[   61.326035] usb 1-1.1.2: new high-speed USB device number 6 using dwc_otg
[   61.457674] usb 1-1.1.2: New USB device found, idVendor=04b4, 
idProduct=00f1, bcdDevice= 0.00
[   61.457692] usb 1-1.1.2: New USB device strings: Mfr=1, Product=2, 
SerialNumber=0
[   61.457706] usb 1-1.1.2: Product: FX3
[   61.457720] usb 1-1.1.2: Manufacturer: Cypress

Driver:

#define DEBUG
#include <linux/of.h>
#include <linux/usb.h>
#include <linux/module.h>

static int usbdev_probe(struct usb_interface *intf, const struct 
usb_device_id *id)
{
	pr_info("%s", __func__);

	return 0;
}

static void usbdev_disconnect(struct usb_interface *intf)
{
	pr_info("%s", __func__);
}

static int usbdev_suspend(struct usb_interface *intf, pm_message_t message)
{
	pr_err("%s", __func__);
	return 0;
}

static int usbdev_resume(struct usb_interface *intf)
{
	pr_info("%s", __func__);
	return 0;
}

static int usbdev_reset_resume(struct usb_interface *intf)
{
	pr_info("%s", __func__);
	return 0;
}

static int usbdev_pre_reset(struct usb_interface *intf)
{
	pr_info("%s", __func__);
	return 0;
}

static int usbdev_post_reset(struct usb_interface *intf)
{
	pr_info("%s", __func__);
	return 0;
}

static const struct usb_device_id usbdev_id_table[] = {
	{ USB_DEVICE(0x04b4, 0x00f1) },
	{}
};
MODULE_DEVICE_TABLE(usb, usbdev_id_table);

static struct usb_driver usbdev_driver = {
	.name			= "My USB Device",
	.probe			= usbdev_probe,
	.disconnect		= usbdev_disconnect,
	.id_table		= usbdev_id_table,
	.suspend	 	= usbdev_suspend,
	.resume			= usbdev_resume,
	.reset_resume 	= usbdev_reset_resume,
	.pre_reset		= usbdev_pre_reset,
	.post_reset 	= usbdev_post_reset,
};

module_usb_driver(usbdev_driver);

MODULE_AUTHOR("Lucas Tanure <tanure@linux.com>");
MODULE_DESCRIPTION("Driver for My USB device");
MODULE_LICENSE("GPL v2");
