Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F6461C8BA1
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 15:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgEGNB3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 09:01:29 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:57603 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgEGNB0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 09:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588856485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r4VUZY+HHbQAX4VPNMOZtZCKmWqywO7euIcohioLi2I=;
        b=YTa+GkVngVeSGByXGn1gQVZdocjzxIbCANfi0+eoV+fFUHNa/6T+sI2KiB4fGJ5QkHre8g
        xAUd3/bMfN2mTrIj7ABHxffSuz0ME2nx+L8KLlB8hFX174zMBMJ8t837k/m58VeIB37Ht6
        0NWkYyi512Uz7GLigm539oJgXTzgFBA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-e39dKsPBOeqNrzQkOKMC6Q-1; Thu, 07 May 2020 09:01:05 -0400
X-MC-Unique: e39dKsPBOeqNrzQkOKMC6Q-1
Received: by mail-wm1-f70.google.com with SMTP id v23so2594750wmj.0
        for <linux-usb@vger.kernel.org>; Thu, 07 May 2020 06:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r4VUZY+HHbQAX4VPNMOZtZCKmWqywO7euIcohioLi2I=;
        b=BZIYyKlDSsIjN2Lkc1z3MBatgr4N4TUUIwOcEDs86VuCy6PW8fTFQExgRo3Zjpc+av
         UpUzEvBMzgz0f0MDrFARH3MZKqRwg9eyQJ1f4dSxMxZjO3awW8lP8YF7xedEWoUjIy0G
         /pOp7ZfUku6/5Shi+3y1vfG5h0AKR3v73+Qte9lkmXcwRZu0jAjjp7d3GaT8fikkVI1f
         36YudK8cJUKNvAKUxNO7jJ/YkNJY30ZDGdgF3V8WzH8tKrVKrdb7yOuWK1xRlrrfiLTa
         0cEcMCfRGh07W/zgamdy6+PZGfwCo/+wa+ZufEgbR+5Qe0iYu9NULwVnFGvhRTajPoiP
         zGvA==
X-Gm-Message-State: AGi0PuYWTApj2jQeSFC0C21IfiX9bkC13TPVdT+4+W601COIewRyYftW
        piwQE3AikUeUgb+Bo/Z64UamTxJNsljt+8+MHnn8VY9l2I8UcPVsf91CuIQRfC4kxar25fZm/kt
        hEKOxoMsx6UOXrYBfmR0K
X-Received: by 2002:a05:600c:22d6:: with SMTP id 22mr10127207wmg.121.1588856463585;
        Thu, 07 May 2020 06:01:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypIf4mZfMvRcapTLzZOVBFb8IcEr4Uhlpqd0yPvd8OJ58qChmxQmNaqtMLQVwYeO8WDv4+gAJA==
X-Received: by 2002:a05:600c:22d6:: with SMTP id 22mr10126977wmg.121.1588856461586;
        Thu, 07 May 2020 06:01:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id x18sm7489162wmi.29.2020.05.07.06.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 06:01:00 -0700 (PDT)
Subject: Re: unusual_uas.h additional entry
To:     =?UTF-8?Q?Julian_Gro=c3=9f?= <julian.g@posteo.de>
Cc:     linux-usb@vger.kernel.org
References: <20200428212754.0a18dd25@motofckr9k-mint-desktop>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5cc67210-efc3-76a7-7f36-aab8dcb66271@redhat.com>
Date:   Thu, 7 May 2020 15:01:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200428212754.0a18dd25@motofckr9k-mint-desktop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 4/28/20 9:27 PM, Julian Groß wrote:
> Hello,
> 
> I would like to ask for an addition to the "unusual_uas.h" file.
> According to
> https://en.opensuse.org/SDB:USB_3.0_Hard_Drive_troubleshooting I went
> through the usb_stor_adjust_quirks flags for my USB 3.0 storage device
> and found flag "f" to fix my issue of the device needing several
> minutes to connect (flag "u" of couse also fixing the issue).
> 
> As I don't understand the format of the entries, please add missing
> information from the "lsusb -v" output down below.
> 
> 
> 
> /* Reported-by: Julian Groß <julian.g@posteo.de> */
> UNUSUAL_DEV(0xXXXX,
> 		"",
> 		"",
> 		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> 		US_FL_NO_REPORT_OPCODES),


Thank you for your report about this, adding the quirk will
make things work out of the box for other users which is
always good.

I will prepare a patch for this and submit it upstream.

Regards,

Hans


> 
> 
> 
> 
> 
> Bus 002 Device 022: ID 059f:105f LaCie, Ltd
> Device Descriptor:
>    bLength                18
>    bDescriptorType         1
>    bcdUSB               3.00
>    bDeviceClass            0 (Defined at Interface level)
>    bDeviceSubClass         0
>    bDeviceProtocol         0
>    bMaxPacketSize0         9
>    idVendor           0x059f LaCie, Ltd
>    idProduct          0x105f
>    bcdDevice            0.01
>    iManufacturer           2 LaCie
>    iProduct                3 2Big Quadra USB3
>    iSerial                 1 000000002598fe2400ad
>    bNumConfigurations      1
>    Configuration Descriptor:
>      bLength                 9
>      bDescriptorType         2
>      wTotalLength          121
>      bNumInterfaces          1
>      bConfigurationValue     1
>      iConfiguration          0
>      bmAttributes         0xc0
>        Self Powered
>      MaxPower               36mA
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass         8 Mass Storage
>        bInterfaceSubClass      6 SCSI
>        bInterfaceProtocol     80 Bulk-Only
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst              15
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst              15
>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       1
>        bNumEndpoints           4
>        bInterfaceClass         8 Mass Storage
>        bInterfaceSubClass      6 SCSI
>        bInterfaceProtocol     98
>        iInterface              0
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x81  EP 1 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst              15
>          MaxStreams             32
>          Data-in pipe (0x03)
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x02  EP 2 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst              15
>          MaxStreams             32
>          Data-out pipe (0x04)
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x83  EP 3 IN
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst              15
>          MaxStreams             32
>          Status pipe (0x02)
>        Endpoint Descriptor:
>          bLength                 7
>          bDescriptorType         5
>          bEndpointAddress     0x04  EP 4 OUT
>          bmAttributes            2
>            Transfer Type            Bulk
>            Synch Type               None
>            Usage Type               Data
>          wMaxPacketSize     0x0400  1x 1024 bytes
>          bInterval               0
>          bMaxBurst               0
>          Command pipe (0x01)
> Binary Object Store Descriptor:
>    bLength                 5
>    bDescriptorType        15
>    wTotalLength           22
>    bNumDeviceCaps          2
>    USB 2.0 Extension Device Capability:
>      bLength                 7
>      bDescriptorType        16
>      bDevCapabilityType      2
>      bmAttributes   0x00000002
>        Link Power Management (LPM) Supported
>    SuperSpeed USB Device Capability:
>      bLength                10
>      bDescriptorType        16
>      bDevCapabilityType      3
>      bmAttributes         0x00
>      wSpeedsSupported   0x000e
>        Device can operate at Full Speed (12Mbps)
>        Device can operate at High Speed (480Mbps)
>        Device can operate at SuperSpeed (5Gbps)
>      bFunctionalitySupport   1
>        Lowest fully-functional device speed is Full Speed (12Mbps)
>      bU1DevExitLat          10 micro seconds
>      bU2DevExitLat        2047 micro seconds
> Device Status:     0x000d
>    Self Powered
>    U1 Enabled
>    U2 Enabled
> 

