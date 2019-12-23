Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 261FE129B69
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2019 23:15:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbfLWWPo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Dec 2019 17:15:44 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]:45419 "EHLO
        mail-wr1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbfLWWPn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Dec 2019 17:15:43 -0500
Received: by mail-wr1-f46.google.com with SMTP id j42so18104069wrj.12
        for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2019 14:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ABszHV/pyWQELmtP75obrwWlndE917OuXavdaAgSe8M=;
        b=aYPY1zmBzx6x85WkCPAjWYP6etOpjOr33vs0L7nxvtw8W/N+uLxgtzDqlrWyNCNKtd
         HVQgWNSHv8d58x/HiYhafrnZ0Qx7GG/hVUpmQT9IIOwkW0IAcBFlOXlcBCTbwoVGhoI3
         wrzz86I/++yqBnyTrvgJJ8XqrqvLF/y6C/xEbkK9ED871QALWGImJMYYRg+qbvWQEUy4
         H1K+TT2fP5/CM/mljA3zHAfkYYqAgTz5Jg5wLdqUW0wiAf8VI8C29fdVGtP6nVZp6qAn
         KaMP7L9O4liwrPxx8dx0Nr3le8YXgGMtiywzYKxo+Mo944dTKhC0Z82T+ceRPI9gQyCf
         GxDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ABszHV/pyWQELmtP75obrwWlndE917OuXavdaAgSe8M=;
        b=hg4sqPQuMRKCaNxTBU+pEq21PaIbBYHYpZug0y5pEKsjBPy2ML1Duwi8Y6kdyZs9Ka
         FjLrpY6/vX+oUslsH47IuWzHByaeU4NuAZF0KwP0r5VrHcvr0/Y7bql0Yg+E6ncuElpf
         Md7yCuuApK/1wa+jxm3BFz5GhMEBVNowRX+r1/36iyyzRI4WdnNAkjcMhpkMZGybDNN2
         O8+uEfq7Ywzd0xeJYjzj+kDdjss9gL6pmPTB/TwBszz/ErEn41A9Q5RXoZilI+g7fFNK
         UJSMBf3psIrylMOlP8j8233eAgpEgshoBHkPU+09MYqunmYctgUtrUxvrHnOvk4MmC1C
         BsmQ==
X-Gm-Message-State: APjAAAVCpLB2BWj39Dyv1e0x7BLEYgO4zii+7Ojw9UbXoq46LZptjGhX
        IZn8mmbFGlrVExWc6+UHi1pBCgCg
X-Google-Smtp-Source: APXvYqxmAdQmG9B8OVl3bwL6Ah8NrGDIpI+0VZ1POc8m/yQiPrgvWp9M6SANtNC7v4AHFdBL1B7cpw==
X-Received: by 2002:adf:f501:: with SMTP id q1mr70066wro.263.1577139339578;
        Mon, 23 Dec 2019 14:15:39 -0800 (PST)
Received: from ?IPv6:2a02:908:4b12:d272:3fa5:df5b:b0f6:e46? ([2a02:908:4b12:d272:3fa5:df5b:b0f6:e46])
        by smtp.gmail.com with ESMTPSA id a1sm688062wmj.40.2019.12.23.14.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 14:15:38 -0800 (PST)
Subject: Re: ERROR: unexpected command completion code 0x11 for DJ-Tech CTRL
 (resending as plain text ;)
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
References: <348c50de-f922-8295-ef87-cf5cdea5c7f4@gmail.com>
 <0a9215c0-99b3-cf8f-381b-e4997e3f5cfe@linux.intel.com>
 <d65f140c-0854-62a5-f21e-5d92f0575635@gmail.com>
 <98997f07-80ef-b86a-6702-448e68ff4ffa@linux.intel.com>
From:   "Rene D. Obermueller" <cmdrrdo@gmail.com>
Message-ID: <35205ad4-9a10-c576-017a-db8d6520ae6b@gmail.com>
Date:   Mon, 23 Dec 2019 23:15:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <98997f07-80ef-b86a-6702-448e68ff4ffa@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Mathias,


On 23.12.19 13:14, Mathias Nyman wrote:

> The Maximum Packet Size of the full-speed bulk endpoint looks a bit 
> suspicious (maxp 4)
> 
> 12478.521580: xhci_add_endpoint: State disabled mult 1 max P. Streams 0 
> interval 125 us max ESIT payload 0 CErr 3 Type Bulk OUT burst 0 maxp 4 
> deq 00000000fff71001
> 
> For full speed bulk endpoints only support 8, 16, 32 and 64 bytes Max 
> Packet sizes.
> Host are not required to support other values. See USB2 spec section 
> 5.8.3 for details

thanks for the explanation!


> Maybe forcing it to one of the allowed values could work.
> Does the below hack help? (untested)?
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 3b1388fa2f36..29102776baed 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -1476,8 +1476,12 @@ int xhci_endpoint_init(struct xhci_hcd *xhci,
>          if (!usb_endpoint_xfer_isoc(&ep->desc))
>                  err_count = 3;
>          /* Some devices get this wrong */
> -       if (usb_endpoint_xfer_bulk(&ep->desc) && udev->speed == 
> USB_SPEED_HIGH)
> -               max_packet = 512;
> +       if (usb_endpoint_xfer_bulk(&ep->desc) {

I changed this line for missing closing bracket...


> +                       if (udev->speed == USB_SPEED_HIGH)
> +                               max_packet = 512;
> +                       if (udev->speed == USB_SPEED_FULL)
> +                               max_packet = 1 << 
> (fls(clamp_val(max_packet, 8, 64)) - 1);
> +               }
>          /* xHCI 1.0 and 1.1 indicates that ctrl ep avg TRB Length 
> should be 8 */
>          if (usb_endpoint_xfer_control(&ep->desc) && xhci->hci_version 
>  >= 0x100)
>                  avg_trb_len = 8;

...and with the new kernel, connecting the device works [1], and lsusb 
reports the device as well. [2]

Only thing that looks different on my workstation is this

-  iManufacturer           1 (error)
-  iProduct                2 (error)
-  iSerial                 3 (error)
+  iManufacturer           1
+  iProduct                2
+  iSerial                 3


Now, I had connected the device after reboot with the new kernel and 
went afk for 4h. When I returned, aseqdump did not show anything.

But after reconnecting the device, I can read data from it with aseqdump 
and also use the device in mixxx.

I can't put my finger on why it stopped working, and I will probably 
have to have a closer look at this during the next days, but at first 
glance it may not be related to USB at all.

So for now I'll say the hack gets the device to work. Thank you very 
much for your help!


-René



[1]
[15189.483381] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.486515] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.489512] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.492514] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.493396] usb 3-2.3: New USB device found, idVendor=2485, 
idProduct=504f, bcdDevice= 2.54
[15189.493400] usb 3-2.3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[15189.493402] usb 3-2.3: Product: CTRL
[15189.493404] usb 3-2.3: Manufacturer: CTRL
[15189.493406] usb 3-2.3: SerialNumber: CTRL
[15189.493683] xhci_hcd:xhci_add_endpoint:1917: xhci_hcd 0000:05:00.4: 
add ep 0x1, slot id 9, new drop flags = 0x0, new add flags = 0x5
[15189.493703] xhci_hcd:xhci_add_endpoint:1917: xhci_hcd 0000:05:00.4: 
add ep 0x81, slot id 9, new drop flags = 0x0, new add flags = 0xd
[15189.493709] xhci_hcd:xhci_check_bandwidth:2878: xhci_hcd 
0000:05:00.4: xhci_check_bandwidth called for udev 00000000972d7af8
[15189.493716] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // 
Ding dong!
[15189.493773] xhci_hcd:xhci_dbg_trace:31: xhci_hcd 0000:05:00.4: 
Successful Endpoint Configure command
[15189.493781] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // 
Ding dong!
[15189.493818] xhci_hcd:handle_tx_event:2395: xhci_hcd 0000:05:00.4: 
Stopped on No-op or Link TRB for slot 9 ep 1
[15189.493828] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // 
Ding dong!
[15189.493869] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // 
Ding dong!
[15189.493918] xhci_hcd:handle_tx_event:2395: xhci_hcd 0000:05:00.4: 
Stopped on No-op or Link TRB for slot 9 ep 2
[15189.493926] xhci_hcd:xhci_ring_cmd_db:282: xhci_hcd 0000:05:00.4: // 
Ding dong!
[15189.497485] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.500488] xhci_hcd:process_ctrl_td:2094: xhci_hcd 0000:05:00.4: 
Waiting for status stage event
[15189.564944] xhci_hcd:process_bulk_intr_td:2257: xhci_hcd 
0000:05:00.4: ep 0x87 - asked for 16384 bytes, 16068 bytes untransferred
[15191.568180] xhci_hcd:process_bulk_intr_td:2257: xhci_hcd 
0000:05:00.4: ep 0x87 - asked for 16384 bytes, 16068 bytes untransferred
[15193.571621] xhci_hcd:process_bulk_intr_td:2257: xhci_hcd 
0000:05:00.4: ep 0x87 - asked for 16384 bytes, 16068 bytes untransferred




[2]
Bus 003 Device 011: ID 2485:504f
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               1.10
   bDeviceClass            0
   bDeviceSubClass         0
   bDeviceProtocol         0
   bMaxPacketSize0         8
   idVendor           0x2485
   idProduct          0x504f
   bcdDevice            2.54
   iManufacturer           1 (error)
   iProduct                2 (error)
   iSerial                 3 (error)
   bNumConfigurations      1
   Configuration Descriptor:
     bLength                 9
     bDescriptorType         2
     wTotalLength       0x0053
     bNumInterfaces          1
     bConfigurationValue     1
     iConfiguration          0
     bmAttributes         0x40
       (Missing must-be-set bit!)
       Self Powered
     MaxPower              500mA
     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           2
       bInterfaceClass         1 Audio
       bInterfaceSubClass      3 MIDI Streaming
       bInterfaceProtocol      0
       iInterface              0
       MIDIStreaming Interface Descriptor:
         bLength                 7
         bDescriptorType        36
         bDescriptorSubtype      1 (HEADER)
         bcdADC               1.00
         wTotalLength       0x0041
       MIDIStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (MIDI_IN_JACK)
         bJackType               1 Embedded
         bJackID                 1
         iJack                   0
       MIDIStreaming Interface Descriptor:
         bLength                 6
         bDescriptorType        36
         bDescriptorSubtype      2 (MIDI_IN_JACK)
         bJackType               2 External
         bJackID                 2
         iJack                   0
       MIDIStreaming Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (MIDI_OUT_JACK)
         bJackType               1 Embedded
         bJackID                 3
         bNrInputPins            1
         baSourceID( 0)          2
         BaSourcePin( 0)         1
         iJack                   0
       MIDIStreaming Interface Descriptor:
         bLength                 9
         bDescriptorType        36
         bDescriptorSubtype      3 (MIDI_OUT_JACK)
         bJackType               2 External
         bJackID                 4
         bNrInputPins            1
         baSourceID( 0)          1
         BaSourcePin( 0)         1
         iJack                   0
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x01  EP 1 OUT
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               0
         bRefresh                0
         bSynchAddress           0
         MIDIStreaming Endpoint Descriptor:
           bLength                 5
           bDescriptorType        37
           bDescriptorSubtype      1 (GENERAL)
           bNumEmbMIDIJack         1
           baAssocJackID( 0)       1
       Endpoint Descriptor:
         bLength                 9
         bDescriptorType         5
         bEndpointAddress     0x81  EP 1 IN
         bmAttributes            2
           Transfer Type            Bulk
           Synch Type               None
           Usage Type               Data
         wMaxPacketSize     0x0004  1x 4 bytes
         bInterval               0
         bRefresh                0
         bSynchAddress           0
         MIDIStreaming Endpoint Descriptor:
           bLength                 5
           bDescriptorType        37
           bDescriptorSubtype      1 (GENERAL)
           bNumEmbMIDIJack         1
           baAssocJackID( 0)       3
