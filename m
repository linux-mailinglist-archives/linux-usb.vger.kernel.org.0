Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F9354821AF
	for <lists+linux-usb@lfdr.de>; Fri, 31 Dec 2021 04:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240916AbhLaDKP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Dec 2021 22:10:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237453AbhLaDKO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Dec 2021 22:10:14 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFFADC061574
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 19:10:14 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so34477823otj.7
        for <linux-usb@vger.kernel.org>; Thu, 30 Dec 2021 19:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=4bb9JnkaomlMZcldHjZtQ086NfVxXGJ/XyEqwe1SdfY=;
        b=fE5qlT3IZXzhIfHQ0lfe/yVg0qvCazNq6Nlw6Sh9bw0/ezLXZEU7mGtwfXPrS0fCqa
         LdY1Bodf6sLpX7LIxUtH3GlAkL7k5iFsTAlHvyLpMinkfAyBvlvCLxatJNTP6iV9Eiw+
         zo3HpSEqnR0VfeiLT5NXGtXFou3Jc1dJ0+vGoNWyFpxDUIAlUeqlfja/im87Hx3talTj
         XLtte4kk/vJ+q1AD8Xn/AC+NA6XrjHUkqMIigDMBqbEVYoHmMfBy7I2xmXdH9yAwVhMS
         NHp44sOkSau5qVxEL0fBPhMzUyZ2z2h5L73ZyoSrL3JtMgAWrCs6VEK7E0mwWPgZKlpe
         sq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=4bb9JnkaomlMZcldHjZtQ086NfVxXGJ/XyEqwe1SdfY=;
        b=I5npw+0FiqmhiZx92xH5qYCapRxR0peusrVqltHvhaUw5iI2avNGwLRW66exytY8sk
         aaqEwrcY6QnvEwGYiz5XAjp/KvF35u0s1l4fNhv0+YFj3pVnWavIY3ayjMY2JCZgAyCj
         LxTfQZCh5OSVDkKDnzgrDvkIIwmaBc0Klbq0RSfXGfu1CazWO8+xFiRzIHsP5HLH3ROA
         h/+jfvWyxyDXnDyFUcfE8K0UXVZvrPf1fX0JfHjy4+TLgIdAm8kh0kT8YpRlP1ADrAe4
         IRaSL65f65fAIRQ1Ft8GSAQIeRZhuQ0nX8BAR2W36VJTfjkY830zIjenglp82bKgapkb
         nxpg==
X-Gm-Message-State: AOAM533tQk3rElV/te6E+UJkRxhUy5R8UIbd5H+u9L/ugtUfdwJ2P58X
        r4Ms17YBr7L2Mw1ZjVNgskMqqeDJ/4IpNV74/XM=
X-Google-Smtp-Source: ABdhPJxjcq9USf/Y8MRnxgFGwozq7VRbR+HEJAbvzGM3HzJv1ounYqL0trX8Id4qimG4O8Cb73lTt3H/GLrypMxORKk=
X-Received: by 2002:a9d:f04:: with SMTP id 4mr24863944ott.326.1640920213366;
 Thu, 30 Dec 2021 19:10:13 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4007:0:0:0:0:0 with HTTP; Thu, 30 Dec 2021 19:10:12
 -0800 (PST)
In-Reply-To: <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
References: <f5bca159-e8de-3c76-c2b4-6f4efa001fd9@linux.intel.com>
 <20211230131014.21886-1-youling257@gmail.com> <Yc20WPbIad44/3rd@kroah.com>
 <CAOzgRdbeQ69pWbagFwTvV4ZcYGBE5GkwdqcuxxGFLXBJSy-GMA@mail.gmail.com> <6908aa69-469b-8f92-8e19-60685f524f9c@synopsys.com>
From:   youling 257 <youling257@gmail.com>
Date:   Fri, 31 Dec 2021 11:10:12 +0800
Message-ID: <CAOzgRdb+Ru8AL=wUquysbqd8uGkNSDzSNfOSW3Fs2Pd6BGxo1w@mail.gmail.com>
Subject: Re: USB 3.2 Gen 2x2 "Superspeed+20GBps" support for ASM3242
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "william.allentx@gmail.com" <william.allentx@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

test this patch, cat /sys/bus/usb/devices/4-1/speed, 10000
[   74.694284] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number
2 using xhci_hcd
[   74.750329] usb-storage 4-1:1.0: USB Mass Storage device detected

but speed, pcie to usb3.2 gen2x2, WRITE: bw=642MiB/s (673MB/s),
642MiB/s-642MiB/s (673MB/s-673MB/s), io=1000MiB (1049MB),
run=1557-1557msec
READ: bw=467MiB/s (490MB/s), 467MiB/s-467MiB/s (490MB/s-490MB/s),
io=1000MiB (1049MB), run=2140-2140msec

the mainboard usb3.2 gen2x1, WRITE: bw=838MiB/s (878MB/s),
838MiB/s-838MiB/s (878MB/s-878MB/s), io=1000MiB (1049MB),
run=1194-1194msec
READ: bw=753MiB/s (790MB/s), 753MiB/s-753MiB/s (790MB/s-790MB/s),
io=1000MiB (1049MB), run=1328-1328msec

2021-12-31 9:39 GMT+08:00, Thinh Nguyen <Thinh.Nguyen@synopsys.com>:
> Hi,
>
> youling 257 wrote:
>> 2021-12-30 21:30 GMT+08:00, Greg KH <gregkh@linuxfoundation.org>:
>>> On Thu, Dec 30, 2021 at 09:10:14PM +0800, youling257 wrote:
>>>> where i can find the series patch?
>>>> https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-usb/list/?series=427561__;!!A4F2R9G_pg!M_zXKjO1JtIkz57qZ7BEEL7zjx2QXQTfau26hBNLX7bKEL_vOP-m8Xn1eZ14VRpY-0Ga$
>>>>
>>>
>>> There is nothing at that link.
>>>
>>> What is the lore.kernel.org link for the patch you are curious about?
>>>
>>>> when i used maiwo k1690(10gbps) connect to ASM3242 Controller, only
>>>> 500MB/s.
>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb3/speed, 480
>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/speed, 20000
>>>> maiwo k1690 is on
>>>> /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1.
>>>> cat /sys/devices/pci0000:00/0000:00:01.3/0000:09:00.0/usb4/4-1/speed,
>>>> 5000
>>>>
>>>>
>>>> 01:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>>>> Controller (prog-if 30 [XHCI])
>>>>         Subsystem: ASMedia Technology Inc. ASM3242 USB 3.2 Host
>>>> Controller
>>>>
>>>> [    0.359281] xhci_hcd 0000:01:00.0: xHCI Host Controller
>>>> [    0.359283] xhci_hcd 0000:01:00.0: new USB bus registered, assigned
>>>> bus
>>>> number 2
>>>> [    0.359285] xhci_hcd 0000:01:00.0: Host supports USB 3.2 Enhanced
>>>> SuperSpeed
>>>>
>>>> [ 1191.734123] usb 4-1: new SuperSpeed USB device number 2 using
>>>> xhci_hcd
>>>> [ 1191.794767] usb-storage 4-1:1.0: USB Mass Storage device detected
>>>> [ 1191.795049] scsi host9: usb-storage 4-1:1.0
>>>> [ 1051.051274] scsi 9:0:0:0: Direct-Access     Realtek  USB 3.2 Device
>>>> 1.00 PQ: 0 ANSI: 6
>>>> [ 1051.051442] sd 9:0:0:0: Attached scsi generic sg0 type 0
>>>> [ 1051.054461] sd 9:0:0:0: [sda] 500118192 512-byte logical blocks:
>>>> (256
>>>> GB/238 GiB)
>>>> [ 1051.055068] sd 9:0:0:0: [sda] Write Protect is off
>>>> [ 1051.055073] sd 9:0:0:0: [sda] Mode Sense: 37 00 00 08
>>>> [ 1051.055716] sd 9:0:0:0: [sda] Write cache: disabled, read cache:
>>>> enabled, doesn't support DPO or FUA
>>>> [ 1051.072131]  sda: sda1 sda2
>>>>
>>>> i don't have NVMe to USB 2x2 Enclosure (ASM2364 chipset), i have NVMe
>>>> to
>>>> USB 2x1 Enclosure (RTL9120B chipset), maiwo k1690, using it on
>>>> PciExpress
>>>> X4 add in card (ASM3242 chipset), it only 5Gbps speed, should be
>>>> 10Gbps.
>>>>
>>>
>>> Are you sure that your hardware can really support this?  Do you have
>>> the right cable and the device will support this speed?
>> 02:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] 400 Series
>> Chipset USB 3.1 XHCI Controller (rev 01) (prog-if 30 [XHCI])
>>         Subsystem: ASMedia Technology Inc. 400 Series Chipset USB 3.1
>> XHCI Controller
>>
>> maiwo k1690 connect to mainboard usb3.2 gen2x1 port can 10gbps.
>> [ 1049.965556] usb 2-2: new SuperSpeed Plus Gen 2x1 USB device number
>> 2 using xhci_hcd
>> [ 1050.028280] usb-storage 2-2:1.0: USB Mass Storage device detected
>> [ 1050.028560] scsi host9: usb-storage 2-2:1.0
>>
>> pcie to usb3.2 gen2x2 asm3242 should be compatible usb3.2 gen2x1.
>> I don't have windows os to test them, may be 5gbps on windows yet.
>> Is there a way to hack them to 10Gbps on linux?
>>
>>> And most important, what kernel version are you using?
>> kernel 5.16 rc7.
>>> thanks,
>>>
>>> greg k-h
>>>
>
> The ASmedia host controller incorrectly reports the speed ID in the
> port-status mismatching with its PSI capability for SSP devices. As
> a result, the host/hub driver will report the wrong speed.
>
> To resolve/workaround this, the xHCI driver can capture the device speed
> from sublink speed notification of a SSP device. All SSP devices must
> send sublink speed device notification, so this method should resolve
> your issue.
>
> You can apply the change below. This should resolve your issue.
>
> BR,
> Thinh
>
>
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index 9ddcc0ab4db7..6de15f004684 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2602,7 +2602,7 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
>  	 */
>  	temp = readl(&xhci->op_regs->dev_notification);
>  	temp &= ~DEV_NOTE_MASK;
> -	temp |= DEV_NOTE_FWAKE;
> +	temp |= DEV_NOTE_FWAKE | DEV_NOTE_SUBLINK_SPEED;
>  	writel(temp, &xhci->op_regs->dev_notification);
>
>  	return 0;
> diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
> index 99d9d9c88988..80081b3fd52a 100644
> --- a/drivers/usb/host/xhci-ring.c
> +++ b/drivers/usb/host/xhci-ring.c
> @@ -1860,6 +1860,8 @@ static void handle_device_notification(struct xhci_hcd
> *xhci,
>  {
>  	u32 slot_id;
>  	struct usb_device *udev;
> +	u32 type;
> +	u32 dn;
>
>  	slot_id = TRB_TO_SLOT_ID(le32_to_cpu(event->generic.field[3]));
>  	if (!xhci->devs[slot_id]) {
> @@ -1868,11 +1870,45 @@ static void handle_device_notification(struct
> xhci_hcd *xhci,
>  		return;
>  	}
>
> -	xhci_dbg(xhci, "Device Wake Notification event for slot ID %u\n",
> -			slot_id);
>  	udev = xhci->devs[slot_id]->udev;
> -	if (udev && udev->parent)
> -		usb_wakeup_notification(udev->parent, udev->portnum);
> +	type = TRB_DN_TYPE(le32_to_cpu(event->generic.field[0]));
> +
> +	switch (type) {
> +	case TRB_DN_TYPE_FUNC_WAKE:
> +		xhci_info(xhci, "Device Wake Notification event for slot ID %u\n",
> +			  slot_id);
> +		if (udev && udev->parent)
> +			usb_wakeup_notification(udev->parent, udev->portnum);
> +		break;
> +	case TRB_DN_TYPE_SUBLINK_SPEED:
> +		if (!udev)
> +			break;
> +
> +		dn = le32_to_cpu(event->generic.field[1]);
> +		udev->ssp_rate = USB_SSP_GEN_UNKNOWN;
> +
> +		if (TRB_DN_SUBLINK_SPEED_LP(dn) ==
> +		    TRB_DN_SUBLINK_SPEED_LP_SSP) {
> +			udev->speed = USB_SPEED_SUPER_PLUS;
> +
> +			if (TRB_DN_SUBLINK_SPEED_LSE(dn) !=
> +			    TRB_DN_SUBLINK_SPEED_LSE_GBPS)
> +				break;
> +
> +			if (TRB_DN_SUBLINK_SPEED_LSM(dn) == 10) {
> +				if (TRB_DN_SUBLINK_SPEED_LANES(dn))
> +					udev->ssp_rate = USB_SSP_GEN_2x2;
> +				else
> +					udev->ssp_rate = USB_SSP_GEN_2x1;
> +			} else if (TRB_DN_SUBLINK_SPEED_LSM(dn) == 5) {
> +				if (TRB_DN_SUBLINK_SPEED_LANES(dn))
> +					udev->ssp_rate = USB_SSP_GEN_1x2;
> +			}
> +		} else {
> +			udev->speed = USB_SPEED_SUPER;
> +		}
> +		break;
> +	}
>  }
>
>  /*
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 9192465fd5f3..ce2ca67c115f 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -267,6 +267,7 @@ struct xhci_op_regs {
>   * SW does need to pay attention to function wake notifications.
>   */
>  #define	DEV_NOTE_FWAKE		ENABLE_DEV_NOTE(1)
> +#define	DEV_NOTE_SUBLINK_SPEED	ENABLE_DEV_NOTE(5)
>
>  /* CRCR - Command Ring Control Register - cmd_ring bitmasks */
>  /* bit 0 is the command ring cycle state */
> @@ -1434,6 +1435,30 @@ union xhci_trb {
>  /* Get NEC firmware revision. */
>  #define	TRB_NEC_GET_FW		49
>
> +/* Get Device Notification type */
> +#define TRB_DN_TYPE(p)			(((p) >> 4) & 0xf)
> +
> +#define TRB_DN_TYPE_FUNC_WAKE		1
> +#define TRB_DN_TYPE_SUBLINK_SPEED	5
> +
> +/* Get sublink speed attributes */
> +#define TRB_DN_SUBLINK_SPEED_LSE(p)	(((p) >> 4) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LSE_BPS	0
> +#define TRB_DN_SUBLINK_SPEED_LSE_KBPS	1
> +#define TRB_DN_SUBLINK_SPEED_LSE_MBPS	2
> +#define TRB_DN_SUBLINK_SPEED_LSE_GBPS	3
> +#define TRB_DN_SUBLINK_SPEED_ST(p)	(((p) >> 6) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LANES(p)	(((p) >> 10) & 0xf)
> +#define TRB_DN_SUBLINK_SPEED_LP(p)	(((p) >> 14) & 0x3)
> +#define TRB_DN_SUBLINK_SPEED_LP_SS	0
> +#define TRB_DN_SUBLINK_SPEED_LP_SSP	1
> +#define TRB_DN_SUBLINK_SPEED_LSM(p)	(((p) >> 16) & 0xffff)
> +
> +#define TRB_DN_SUBLINK_SPEED_IS_SYMMETRIC(p) \
> +	(!(TRB_DN_SUBLINK_SPEED_ST(p) & BIT(0)))
> +#define TRB_DN_SUBLINK_SPEED_IS_TX(p) \
> +	(!!(TRB_DN_SUBLINK_SPEED_ST(p) & BIT(1)))
> +
>  static inline const char *xhci_trb_type_string(u8 type)
>  {
>  	switch (type) {
>
>
>
>
>
