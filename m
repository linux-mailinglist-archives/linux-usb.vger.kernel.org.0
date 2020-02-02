Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19D9E14FBBD
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2020 06:31:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbgBBFVf convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 2 Feb 2020 00:21:35 -0500
Received: from funyu.konbu.org ([51.15.241.64]:35844 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgBBFVf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 2 Feb 2020 00:21:35 -0500
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Sun, 02 Feb 2020 00:21:34 EST
Received: from tungsten (8.125.148.210.rev.vmobile.jp [210.148.125.8])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id E5373288401;
        Sun,  2 Feb 2020 05:15:24 +0000 (UTC)
Date:   Sun, 2 Feb 2020 14:15:20 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200202051520.GA971@tungsten>
References: <20191105032922.GA3041@tungsten>
 <20200131220925.GA26896@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200131220925.GA26896@roeck-us.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Guenter,


>good find, and good analysis. We stated to see this problem as well in the
>latest ChromeOS kernel.
I'm glad you find my report helpful.


>be able to reproduce the problem. Maybe you can help me. How do you tether
>your phone through USB ?
You mention thethering, so I think you have read my follow-up:
https://www.spinics.net/lists/linux-usb/msg187497.html


My setup is as follows:
- 'kenzo' phone (https://wiki.lineageos.org/devices/kenzo) on AICP 12.1
  (android 7.1.2 linux 3.10.105);
- 'veyron speedy' chromebook (https://wiki.gentoo.org/wiki/Asus_Chromebook_C201)
  on Arch Linux ARM, vanilla linux 5.2.14;


Here are my repro steps, sorry if tedious, I'm not sure of the level of
details you want, so I will go verbose squared :) :

0. plug in phone to chromebook, with a USB2 micro b cable;

1. activate usb tethering in phone settings:
   settings> more> tethering & portable hotspot> USB tethering 
   click and confirm "tethered";

2. chromebook sees phone as:
[ 2128.080551] rndis_host 2-1:1.0 usb0: register 'rndis_host' at usb-ff580000.usb-1, RNDIS device, 4a:5e:0c:89:ec:09

3. chromebook$ sudo dhcpcd --noarp usb0
usb0: adding default route via 192.168.42.129

4. on phone, start termux (https://f-droid.org/en/packages/com.termux/) 

5. phone$ dd if=/dev/urandom of=blob count=50 bs=1M

6. phone$ sha512sum blob
b9e...14d blob

7. phone$ pkg install netcat

8. phone$ while true; do <blob netcat -l -p 9999; done

9. chromebook$ sudo pacman -Syu extra/gnu-netcat community/pigz

10. chromebook$ dd if=/dev/urandom of=job count=10 bs=1M

11. chromebook terminal 0$ while true; do <job pigz -11 -i -p 1024 >/dev/null; done

12. chromebook terminal 1$ cat /proc/loadavg
28.18 8.76 3.74 54/521 8826
 
13. chromebook terminal 1$ while true; do netcat 192.168.42.129 9999 | sha512sum; done
b9e...14d -

13. chromebook will panic soon (I see repros in tens of seconds);

I managed to track the issue to:
> The kernel will write to 0 at line 2494 below in file drivers/usb/dwc2/hcd.c
>2474 static void dwc2_free_dma_aligned_buffer(struct urb *urb)
>2494 		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);


I discussed the below patch with hminas@synopsys.com, who expressed doubts about its
correctness.

I tested it a while back and it seemed solid (no crash & correct hashes), but while
writing this mail I see that sometimes the output of sha512sum on the
chromebook is wrong... also, I'm thinking that the fix below may be a memory
leak.


In conclusion, do not commit, the fix needs more work :)

I hope to restart experimenting in a short while, when I get a bit more free
time.


I am waiting for any question you may have, thank you for your time.
Boris.

Guenter Roeck wrote:
>Hi Boris,
>
>On Tue, Nov 05, 2019 at 12:29:22PM +0900, Boris ARZUR wrote:
>> Channel halt can happen with BULK endpoints when the
>> cpu is under high load. Treating it as an error leads
>> to a null-pointer dereference in dwc2_free_dma_aligned_buffer().
>> 
>
>good find, and good analysis. We stated to see this problem as well in the
>latest ChromeOS kernel.
>
>I am still trying understand what exactly happens. To do that, I'll need to
>be able to reproduce the problem. Maybe you can help me. How do you tether
>your phone through USB ?
>
>Thanks,
>Guenter
>
>> Signed-off-by: Boris Arzur <boris@konbu.org>
>> ---
>>  drivers/usb/dwc2/hcd_intr.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>>                                  * A periodic transfer halted with no other
>> --
>> 2.23.0
>> 
>> diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
>> index a052d39b4375..697fed530aeb 100644
>> --- a/drivers/usb/dwc2/hcd_intr.c
>> +++ b/drivers/usb/dwc2/hcd_intr.c
>> @@ -1944,7 +1944,8 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg
>> *hsotg,
>>                          */
>>                         dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
>>                 } else {
>> -                       if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
>> +                       if (chan->ep_type == USB_ENDPOINT_XFER_BULK ||
>> +                           chan->ep_type == USB_ENDPOINT_XFER_INT ||
>>                             chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
>>                                 /*
