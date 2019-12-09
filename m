Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A46311166F9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Dec 2019 07:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbfLIGft (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Dec 2019 01:35:49 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43482 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726014AbfLIGft (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Dec 2019 01:35:49 -0500
Received: by mail-pf1-f195.google.com with SMTP id h14so6671187pfe.10
        for <linux-usb@vger.kernel.org>; Sun, 08 Dec 2019 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5tkzE1ChYC7YxGGc+NTxbiv9iM0VwKR/CR/NiqJxBhI=;
        b=faGtHs4ctuXAuzM6LpYLFICbCyIKECDy2HLpamKgvQt6W6c6qVL6MIMjK3bY9byhYD
         DHBzko0VDWANGK7cg8I9tWPlJn2MvAD02Zv9YtbLMqWnTP2aoxmuimI2Yur/0kcLsRAs
         zWtXUMpgeqhUr8SuN6XVnqeAXbhvojKdaz/O8hY6qSE1ZrCRi5bMlzYVYOfp+va8yY41
         oA8sXlLjOOoQDifddrlbf26BcOieMHLzq+L4cNpcgRUzweuPhwTYMp+ffzGfpljnhsYM
         y+/mvQw5iMiD7c2pKwuysMq7jZXW8AyfFCTz6j7PYJIp9LqYp0HQYk6T2Hnyab9vY9pY
         gASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5tkzE1ChYC7YxGGc+NTxbiv9iM0VwKR/CR/NiqJxBhI=;
        b=O5sIBJ6KOOHfExtEKelKPTlO/TJ4kLbNP0i/FfEE2PLG+AJW9n25KQPH7Aw6o+s/30
         iDGeONCJ0EkMJd9IoVmcaWSqR59c2okOkpnwSNw5g/T7jWnAf3KUSs6G3ec/vdNPjjpC
         qJYOsaUaj+Oke6FjZ43ekm5vkE3R+ny3qCHNKkZaLKv0nulp2Z/mcW4MaLh2nznoGu7R
         /scJKBM1ZU1/50mtnwJ+VdOlI9TXRXng8qUt8XTAzEXSfYxJ2Qat4dW3ntNAxnkOSB56
         Q4bnGkAo/jrFvzb7wmSgILr3KsCq281oWLyWy5bJMoYDYNYV4jqP74Gfg0KWA8TFYAZU
         Wpyw==
X-Gm-Message-State: APjAAAVHDTO4uZOtUSxwDZzs73IVTA4L2mVlVpDSYW9myXWxv7cnKPxR
        Lp0fNMTC8MWgSje481X+01o=
X-Google-Smtp-Source: APXvYqx7W8LMVRkXAJ7uvr4XwkpGd8vYI/K/3EcAKuYDl+d3YVuFiLDxsh37591e9xLHMeZE783INw==
X-Received: by 2002:aa7:8d03:: with SMTP id j3mr28925348pfe.162.1575873348124;
        Sun, 08 Dec 2019 22:35:48 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id k9sm11174412pje.26.2019.12.08.22.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2019 22:35:47 -0800 (PST)
Date:   Mon, 9 Dec 2019 15:35:43 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191209063543.GA2473@localhost.localdomain>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209033740.GA27394@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 09, 2019 at 04:37:40AM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> > On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Fri, Dec 06, 2019 at 03:50:58PM +0900, Suwan Kim wrote:
> > > > On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > Hello,
> > > > > 
> > > > > I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> > > > > connect Yubikey 4 and use its CCID interface (for example `ykman oath
> > > > > list` command), the client side hangs (100% reliably). After 60s I get a
> > > > > message that a CPU hangs waiting for a spinlock (see below).
> > > > > 
> > > > > I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
> > > > > to vhci-hcd and stub driver") commit. Which indeed is also backported to
> > > > > 4.19.
> > > > > 
> > > > > Any idea what is going on here? I can easily provide more information,
> > > > > if you tell me how to get it.
> > > > > 
> > > > 
> > > > Hi,
> > > > 
> > > > Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
> > > > in kernel config and send dmesg log? It will be helpful to figure
> > > > out lock dependency in vhci_hcd.
> > > 
> > > Hmm, I've tried, but I don't see much more information there (see
> > > below). I've just enabled PROVE_LOCKING and USBIP_DEBUG. Do I need to do
> > > anything more, like some boot option?
> > > 
> > > Also, this one (as the previous one) is from 4.19.84. Interestingly, on
> > > 4.19.87 I don't get the message at all.
> > > 
> > > Hmm, I've done also another test: got 4.19.84 with "usbip: Implement SG
> > > support to vhci-hcd and stub driver" reverted and it still hangs...
> > 
> > If so, deadlock is caused by other causes, and why is it different
> > from the results of bisect?
> 
> No idea, but as you've seen in the other email, another bisect returned
> exactly the same commit.
> 
> 
> > > I'm going for another bisect round (4.19.81 works, 4.19.84 doesn't).
> > > 
> > > [  212.890519] usb 1-1: recv xbuf, 42
> > 
> > This message is printed by receive error and before that, driver
> > canceled URB transmission. we need to know the exact situation
> > before this message.
> 
> I've added some more messages and found recv_size is 0.

That is the bug point. "size" is urb->actual_length that means
amount of data actually received from device. And "copy" is
amount of data received from usbip server. So, in this situation,
vhci-hcd received all the data from usbip server even if there
are more sg entries left. So, "copy == 0" means vhci-hcd receives
all data from the server and we should check "if (copy == 0)" in
for_each_sg() loop of usbip_recv_xbuff() to exit the loop and not
to add error event.

> 
> > Could you send me a longer log messages showing the situation
> > before "[  212.890519] usb 1-1: recv xbuf, 42"?
> 
> Sure, with added extra messages (debug patch below).
> 
> [  131.397522] usb 1-1: num_sgs 0
> [  131.406588] usb 1-1: num_sgs 0
> [  131.410621] usb 1-1: num_sgs 0
> [  131.411950] usb 1-1: num_sgs 0
> [  131.413186] usb 1-1: num_sgs 0
> [  131.414590] usb 1-1: num_sgs 0
> [  131.417086] usb 1-1: num_sgs 0
> [  131.418188] usb 1-1: num_sgs 0
> [  131.419228] usb 1-1: num_sgs 0
> [  131.420248] usb 1-1: num_sgs 0
> [  131.457315] usb 1-1: num_sgs 5
> [  131.457345] usb 1-1: size 42, copy 42 recv 42, recv_size 42, sg->length 16384

Device sent 42 bytes data (size 42) and vhci-hcd received 42 bytes
data from the server. vhci-hcd received all the data and It should
exit the loop.

> [  131.457359] usb 1-1: size 42, copy 0 recv -22, recv_size 0, sg->length 16384
> [  131.457372] usb 1-1: recv xbuf, 42 size 42
> [  131.458263] vhci_hcd: vhci_shutdown_connection:1024: stop threads
> [  131.458318] vhci_hcd: vhci_shutdown_connection:1032: release socket
> [  131.458431] vhci_hcd: vhci_shutdown_connection:1058: disconnect device
> [  131.460171] usb 1-1: USB disconnect, device number 2
> 
> (...)
> 
> If I add "if (!recv_size) continue;" there, it works!

I think we should check "copy" not the "recv_size" because "copy"
shows the amount of data received from the server.

int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
...
...
	if (urb->num_sgs) {
		copy = size;
		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
			int recv_size;

			if (copy < sg->length)
				recv_size = copy;
			else
				recv_size = sg->length;

			recv = usbip_recv(ud->tcp_socket, sg_virt(sg),
						recv_size);

			if (recv != recv_size)
				goto error;

			copy -= recv;
			ret += recv;
			
			/* Add here */
			if (!copy)
				break;
			^^^^^^^^^^^^^^
		}

Regards,
Suwan Kim

> > And please also send the result of "lsusb -v".
> 
> Bus 003 Device 006: ID 1050:0407 Yubico.com Yubikey 4 OTP+U2F+CCID
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               2.00
>   bDeviceClass            0 
>   bDeviceSubClass         0 
>   bDeviceProtocol         0 
>   bMaxPacketSize0        64
>   idVendor           0x1050 Yubico.com
>   idProduct          0x0407 Yubikey 4 OTP+U2F+CCID
>   bcdDevice            4.34
>   iManufacturer           1 Yubico
>   iProduct                2 Yubikey 4 OTP+U2F+CCID
>   iSerial                 0 
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x0096
>     bNumInterfaces          3
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0x80
>       (Bus Powered)
>     MaxPower               30mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           1
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      1 Boot Interface Subclass
>       bInterfaceProtocol      1 Keyboard
>       iInterface              0 
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               1.10
>           bCountryCode            0 Not supported
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength      71
>           Report Descriptor: (length is 71)
>             Item(Global): Usage Page, data= [ 0x01 ] 1
>                             Generic Desktop Controls
>             Item(Local ): Usage, data= [ 0x06 ] 6
>                             Keyboard
>             Item(Main  ): Collection, data= [ 0x01 ] 1
>                             Application
>             Item(Global): Usage Page, data= [ 0x07 ] 7
>                             Keyboard
>             Item(Local ): Usage Minimum, data= [ 0xe0 ] 224
>                             Control Left
>             Item(Local ): Usage Maximum, data= [ 0xe7 ] 231
>                             GUI Right
>             Item(Global): Logical Minimum, data= [ 0x00 ] 0
>             Item(Global): Logical Maximum, data= [ 0x01 ] 1
>             Item(Global): Report Size, data= [ 0x01 ] 1
>             Item(Global): Report Count, data= [ 0x08 ] 8
>             Item(Main  ): Input, data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): Report Count, data= [ 0x01 ] 1
>             Item(Global): Report Size, data= [ 0x08 ] 8
>             Item(Main  ): Input, data= [ 0x01 ] 1
>                             Constant Array Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): Report Count, data= [ 0x05 ] 5
>             Item(Global): Report Size, data= [ 0x01 ] 1
>             Item(Global): Usage Page, data= [ 0x08 ] 8
>                             LEDs
>             Item(Local ): Usage Minimum, data= [ 0x01 ] 1
>                             NumLock
>             Item(Local ): Usage Maximum, data= [ 0x05 ] 5
>                             Kana
>             Item(Main  ): Output, data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): Report Count, data= [ 0x01 ] 1
>             Item(Global): Report Size, data= [ 0x03 ] 3
>             Item(Main  ): Output, data= [ 0x01 ] 1
>                             Constant Array Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Global): Report Count, data= [ 0x06 ] 6
>             Item(Global): Report Size, data= [ 0x08 ] 8
>             Item(Global): Logical Minimum, data= [ 0x00 ] 0
>             Item(Global): Logical Maximum, data= [ 0x65 ] 101
>             Item(Global): Usage Page, data= [ 0x07 ] 7
>                             Keyboard
>             Item(Local ): Usage Minimum, data= [ 0x00 ] 0
>                             No Event
>             Item(Local ): Usage Maximum, data= [ 0x65 ] 101
>                             Keyboard Application (Windows Key for Win95 or Compose)
>             Item(Main  ): Input, data= [ 0x00 ] 0
>                             Data Array Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Local ): Usage, data= [ 0x03 ] 3
>                             Keyboard Error Undefined
>             Item(Global): Report Size, data= [ 0x08 ] 8
>             Item(Global): Report Count, data= [ 0x08 ] 8
>             Item(Main  ): Feature, data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Main  ): End Collection, data=none
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval              10
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        1
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         3 Human Interface Device
>       bInterfaceSubClass      0 
>       bInterfaceProtocol      0 
>       iInterface              0 
>         HID Device Descriptor:
>           bLength                 9
>           bDescriptorType        33
>           bcdHID               1.10
>           bCountryCode            0 Not supported
>           bNumDescriptors         1
>           bDescriptorType        34 Report
>           wDescriptorLength      34
>           Report Descriptor: (length is 34)
>             Item(Global): Usage Page, data= [ 0xd0 0xf1 ] 61904
>                             (null)
>             Item(Local ): Usage, data= [ 0x01 ] 1
>                             (null)
>             Item(Main  ): Collection, data= [ 0x01 ] 1
>                             Application
>             Item(Local ): Usage, data= [ 0x20 ] 32
>                             (null)
>             Item(Global): Logical Minimum, data= [ 0x00 ] 0
>             Item(Global): Logical Maximum, data= [ 0xff 0x00 ] 255
>             Item(Global): Report Size, data= [ 0x08 ] 8
>             Item(Global): Report Count, data= [ 0x40 ] 64
>             Item(Main  ): Input, data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Local ): Usage, data= [ 0x21 ] 33
>                             (null)
>             Item(Global): Logical Minimum, data= [ 0x00 ] 0
>             Item(Global): Logical Maximum, data= [ 0xff 0x00 ] 255
>             Item(Global): Report Size, data= [ 0x08 ] 8
>             Item(Global): Report Count, data= [ 0x40 ] 64
>             Item(Main  ): Output, data= [ 0x02 ] 2
>                             Data Variable Absolute No_Wrap Linear
>                             Preferred_State No_Null_Position Non_Volatile Bitfield
>             Item(Main  ): End Collection, data=none
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x04  EP 4 OUT
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               2
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x84  EP 4 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               2
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        2
>       bAlternateSetting       0
>       bNumEndpoints           3
>       bInterfaceClass        11 Chip/SmartCard
>       bInterfaceSubClass      0 
>       bInterfaceProtocol      0 
>       iInterface              0 
>       ChipCard Interface Descriptor:
>         bLength                54
>         bDescriptorType        33
>         bcdCCID              1.00
>         nMaxSlotIndex           0
>         bVoltageSupport         7  5.0V 3.0V 1.8V 
>         dwProtocols             2  T=1
>         dwDefaultClock       4000
>         dwMaxiumumClock      4000
>         bNumClockSupported      0
>         dwDataRate         307200 bps
>         dwMaxDataRate      307200 bps
>         bNumDataRatesSupp.      0
>         dwMaxIFSD            2038
>         dwSyncProtocols  00000000 
>         dwMechanical     00000000 
>         dwFeatures       000400FE
>           Auto configuration based on ATR
>           Auto activation on insert
>           Auto voltage selection
>           Auto clock change
>           Auto baud rate change
>           Auto parameter negotiation made by CCID
>           Short and extended APDU level exchange
>         dwMaxCCIDMsgLen      3072
>         bClassGetResponse    echo
>         bClassEnvelope       echo
>         wlcdLayout           none
>         bPINSupport             0 
>         bMaxCCIDBusySlots       1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0040  1x 64 bytes
>         bInterval               0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x83  EP 3 IN
>         bmAttributes            3
>           Transfer Type            Interrupt
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0008  1x 8 bytes
>         bInterval              32
> Device Status:     0x0000
>   (Bus Powered)
> 
> 
> 
> And the debug patch:
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index d88a5b15f..89b87d5ed 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -709,6 +709,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
>  		/* should not happen, probably malicious packet */
>  		goto error;
>  
> +	dev_err(&urb->dev->dev, "num_sgs %d\n", urb->num_sgs);
>  	if (urb->num_sgs) {
>  		copy = size;
>  		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
> @@ -721,6 +722,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
>  
>  			recv = usbip_recv(ud->tcp_socket, sg_virt(sg),
>  						recv_size);
> +			dev_err(&urb->dev->dev, "size %d, copy %d recv %d, recv_size %d, sg->length %d\n", size, copy, recv, recv_size, sg->length);
>  
>  			if (recv != recv_size)
>  				goto error;
> @@ -740,7 +742,7 @@ int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
>  	return ret;
>  
>  error:
> -	dev_err(&urb->dev->dev, "recv xbuf, %d\n", ret);
> +	dev_err(&urb->dev->dev, "recv xbuf, %d size %d\n", ret, size);
>  	if (ud->side == USBIP_STUB || ud->side == USBIP_VUDC)
>  		usbip_event_add(ud, SDEV_EVENT_ERROR_TCP);
>  	else
> 
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


