Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E425E44ED6
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jun 2019 23:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbfFMV7s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Jun 2019 17:59:48 -0400
Received: from mailfilter2.ihug.co.nz ([203.109.136.2]:16759 "EHLO
        mailfilter2.ihug.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbfFMV7r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Jun 2019 17:59:47 -0400
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Jun 2019 17:59:46 EDT
X-Cloudmark-SP-Filtered: true
X-Cloudmark-SP-Result: =?us-ascii?q?v=3D2=2E1_cv=3DZfq9TphA_c=3D1_sm=3D2_tr?=
 =?us-ascii?q?=3D0_a=3D+wZQ9V8TwFDb+bPO7zJ1jg=3D=3D=3A17?=
 =?us-ascii?q?_a=3DjpOVt7BSZ2e4Z31A5e1TngXxSK0=3D=3A19_a=3Dkj9zAlcOel0A=3A10?=
 =?us-ascii?q?_a=3Ddq6fvYVFJ5YA=3A10?=
 =?us-ascii?q?_a=3DycGLOZvRAAAA=3A8_a=3DGcBjqfl=5FAAAA=3A8_a=3DVwQbUJbxAAAA?=
 =?us-ascii?q?=3A8_a=3D1=5FuRqOBQAAAA=3A8?=
 =?us-ascii?q?_a=3DaAkNVphkAAAA=3A8_a=3DnbzhBc3WAAAA=3A8_a=3DzK78OCVoGShWb4I?=
 =?us-ascii?q?tPY4A=3A9?=
 =?us-ascii?q?_a=3DwSwJ0vXf4Y-WlBlP=3A21_a=3DnkOcSyfWNPwLmwkS=3A21_a=3DCjuIK?=
 =?us-ascii?q?1q=5F8ugA=3A10?=
 =?us-ascii?q?_a=3D=5FFdmRy1lNMmlPwh0EFDV=3A22_a=3DCWQMFa1q=5FpvqjtddOh7T=3A?=
 =?us-ascii?q?22?=
 =?us-ascii?q?_a=3DAjGcO6oz07-iQ99wixmX=3A22_a=3DBqJUVCxI9yffi80WDKHC=3A22?=
 =?us-ascii?q?_a=3DuzxBtuH7W9VDlUk5-f10=3A22_a=3DEkLwxwq1R-hcMYNqXCWi=3A22?=
X-IronPort-AV: E=Sophos;i="5.63,370,1557144000"; 
   d="scan'208";a="505008041"
Received: from unassigned.core.vf.net.nz (HELO smtp.vodafone.co.nz) ([203.118.158.227])
  by cust.filter2.content.vf.net.nz with ESMTP; 14 Jun 2019 09:49:19 +1200
Received: from PC201407091922 (28.215.252.27.dyn.cust.vf.net.nz [27.252.215.28])
        by smtp.vodafone.co.nz (Postfix) with ESMTP id F08B74FB00A;
        Sat,  8 Jun 2019 05:50:16 +0000 (UTC)
From:   "Jonathan Olds" <jontio@i4free.co.nz>
To:     "'Johan Hovold'" <johan@kernel.org>
Cc:     <frank@kingswood-consulting.co.uk>, <werner@cornelius-consult.de>,
        <boris@hajduk.org>, <linux-usb@vger.kernel.org>
References: <000901d50e93$7cb31470$76193d50$@co.nz> <20190603072337.GB3668@localhost>
In-Reply-To: <20190603072337.GB3668@localhost>
Subject: RE: linux/drivers/usb/serial/ch341.c calculates some baud rates wrong
Date:   Sat, 8 Jun 2019 17:49:51 +1200
Message-ID: <000001d51dbe$1245e560$36d1b020$@co.nz>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdUZ3UfHN2bTxA3STX64Y2wikQAqMwDqkJjw
Content-Language: en-nz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

Thanks for the info. I followed
https://nickdesaulniers.github.io/blog/2017/05/16/submitting-your-first-patc
h-to-the-linux-kernel-and-responding-to-feedback/ and made a proposal patch
("[PATCH] USB: serial: ch341: fix wrong baud rate setting calculation"). The
Get_maintainers.pl file didn't work for me I got...

../../../scripts/get_maintainer.pl
0001-USB-serial-ch341-fix-wrong-baud-rate-setting-calcula.patch 
../../../scripts/get_maintainer.pl: The current directory does not appear to
be a linux kernel source tree.

I've measured the actual baud rates for a lot of given baud rates and I
think I have deduced the formulas for calculating the "a" value. "a" is a
uint16 and split up in two, a LSB and a MSB. The current driver only uses
LSB from the set {0,1,2,3}. There is another valid LSB of 7 that the current
driver doesn't use. The formula for LSB from the set {0,1,2,3} is...

Actual baud rate == 2^(3*LSB-10)*12000000/(256-MSB), if LSB is in {0,1,2,3}
and 0<MSB<255

When LSB == 7 then things are a bit different. LSB==7 seems to switch off
the clock divider that the LSB usually does but only if MSB<248; when
MSB>=248 the clock divider is turned back on and LSB is effectively 3 again.
So we can also use the following formula...

Actual baud rate == 12000000/(256-MSB), if LSB == 7 and 0<MSB<248

So the trick is to use these formulas to find a MSB and a LSB that produce
and actual baud rate that are as close as possible to the desired baud rate.
With errors greater than say 2 to 3% hardware will start to fail to
communicate.

Looking at some common baud rates only the higher rates are affected by not
using a LSB of 7. Of the typical rates only 256000 and 921600 are really
affected. However other unusual frequencies are affected too such as 1333333
and I think you could calculate a lot more unusual affected frequencies.
That being the case I think calculating the MSB when LSB == 7 for a given
wanted baud rate could be a better solution than special cases for each
affected baud rate. Something like this seems to work and what I used for
testing...

    // chip frequency is 12Mhz. not quite the same as
(CH341_BAUDBASE_FACTOR>>7)
    #define CH341_OSC_FREQUENCY 12000000
    //
    //this block of code is for deciding when LSB==7 of "a" is beter than
LSB=={0,1,2,3} of "a".
    //frequencies such as 921600, 256000, 1333333 etc have a large baud rate
error when using LSB=={0,1,2,3}
    //such as the above code uses. 921600 when using LSB=={0,1,2,3} I
measured 7.4% error but when
    //using LSB==7 I measured 0.4% error.
    //
    //The chip I tested this on was a CH340G and came back with "Chip
version: 0x31".
    //I assume this will work for CH341 and other chip versions but I don't
think I
    //have any of those chips lying around.
    //
    //calc baud error using the 0,1,2,3 LSB and also the error without the
divisor (LSB==7)
    uint32_t msB=(a>>8)&0xFF;
    uint32_t lsB=a&0xFF;
    int32_t baud_wanted=(priv->baud_rate);
    uint32_t denom=((1<<(10-3*lsB))*(256-msB));
 
if(denom&&((baud_wanted+100)>=(((uint32_t)CH341_OSC_FREQUENCY)/256)))//as
baud_wanted==(CH341_OSC_FREQUENCY/256) implies MSB==0 for no divisor, the
100 is for rounding.
    {
        //calc error for divisor
        int32_t baud_expected=((uint32_t)CH341_OSC_FREQUENCY)/denom;
        uint32_t baud_error_difference=abs(baud_expected-baud_wanted);
    
        //calc a for no divisor
        uint32_t
a_no_divisor=(((256<<8)-(((uint32_t)CH341_OSC_FREQUENCY)<<8)/baud_wanted+128
)&0xFF00)|0x07;
        
        //a_no_divisor is only valid for MSB<248.
        if((a_no_divisor>>8)<248)
        {

            //calc error for no divisor
            int32_t
baud_expected_no_divisor=((uint32_t)CH341_OSC_FREQUENCY)/(256-(a_no_divisor>
>8));
            uint32_t
baud_error_difference_no_divisor=abs(baud_expected_no_divisor-baud_wanted);

            //if error using no divisor is less than using a divisor then
use it instead for the "a" word.
            if(baud_error_difference_no_divisor<baud_error_difference)
            {
                a=a_no_divisor;
            }
            
            printk("ch341_set_baudrate_lcr: using LSB==%u.
org_expected_baud=%u org_error=%u org_a=0x%4X no_divisor_expected_baud=%u
no_divisor_error=%u
no_divisor_a=0x%4X\n",a&0xFF,baud_expected,baud_error_difference,(msB<<8|lsB
),baud_expected_no_divisor,baud_error_difference_no_divisor,a_no_divisor);

        }
    }
  

I've tested that with my hardware and it seems to work fine with every
setting I could throw at it. I am aware that I've only tried it on my
hardware with a CH340G chip. So trying with different chips and computers
would be a good idea (I've tested it on the CH340G chip with two computers).

My measurements/workings as a libre/open office calc file can be downloaded
from https://jontio.github.io/linux_kernel_work/ch43x_tests.ods .

I measured the following with the current driver...

Baud wanted	Baud measured	Error as % of wanted
50	50	0.0%
75	75.2	0.3%
110	109.5	0.5%
135	134.6	0.3%
150	150.4	0.3%
300	300.8	0.3%
600	601.3	0.2%
1200	1201.9	0.2%
1800	1801.8	0.1%
2400	2403.8	0.2%
4800	4807.7	0.2%
7200	7215	0.2%
9600	9615.4	0.2%
14400	14430	0.2%
19200	19231	0.2%
38400	38462	0.2%
56000	56054	0.1%
57600	57837	0.4%
115200	115207	0.0%
128000	127551	0.4%
230400	230415	0.0%
256000	250000	2.3%
460800	460617	0.0%
921600	853242	7.4%
1000000	999001	0.1%
1333333	1204819	9.6%
1843200	1496334	18.8%
2000000	1984127	0.8%
5000000	2985075	40.3%

The patch will fix 256000, 1333333 and 921600 but not 1843200 and 5000000.

The driver even with my patch doesn't give an error to the user when the
error is beyond a certain threshold. With the formulas I deduced it would be
possible to estimate the percentage error and if it was beyond a certain
threshold send something to dmesg. For example the ch34x can't produce
1843200 baud with an acceptable accuracy but the driver will happily
calculate the best possible "a". The user could read dmesg and adjust their
hardware to better match the ch34x baud rate.

Cheers,
Jonti

-----Original Message-----
From: Johan Hovold [mailto:johan@kernel.org] 
Sent: Monday, 3 June 2019 7:24 p.m.
To: Jonathan Olds
Cc: johan@kernel.org; frank@kingswood-consulting.co.uk;
werner@cornelius-consult.de; boris@hajduk.org
Subject: Re: linux/drivers/usb/serial/ch341.c calculates some baud rates
wrong

Hi Jonathan,

and sorry about the late reply.

On Mon, May 20, 2019 at 10:37:48AM +1200, Jonathan Olds wrote:
> Hi,
> 
> Sorry for sending this email to so many but I've never contributed to 
> the Linux kernel before and I'm not sure how this is done or who to talk
to.

You can use scripts/get_maintainer.pl to figure out which maintainers and
lists to CC.

For USB serial that would be me and we always keep the linux-usb list on CC.

It never hurts to CC the original authors as well, just like you did here.

Note that you need to send mails to list as plain text, not html.

> With a CH340 chip the ch341 driver is loaded. My chip id is 0x31 
> according to the driver debug info.
> 
> In "static int ch341_set_baudrate_lcr(struct usb_device *dev, struct 
> ch341_private *priv, u8 lcr)"
> 
> 
> Currently we have...

...

>                a = (factor & 0xff00) | divisor;

> This "a" thing is called index when used in this function...
> 
> "ch341_control_out(dev, CH341_REQ_WRITE_REG, 0x1312, a);"
> 
> This "a" is wrong for some baud rates. (I've only tried 921600 so far)
> 
> For example at 921600 baud "a" is calculated as "0xF303". This creates 
> a baud rate of about 857000 baud. This can be seen in the following
figures...

> I saw this is another driver...

...

> So this person used cases for various baud rates that have incorrect 
> rates using the method that the current Linux kernel driver implements.
> 
> I then use the 0xF307 that this calculates for 921600 baud and put an 
> if statement into the current Linux driver like so...

...

> This produced the correct baud rate as can be seen in the following 
> figure...

> I found this bug out of necessity. I made a board ( 
> http://jontio.zapto.org/jpic ) and programmed initially in Windows 
> without any baud rate issues. Then moving to Linux the board wasn't 
> able to connect as the baud rate where incorrect. So it is a real bug 
> and one that needs addressing. Fortunately the solution looks like 
> using the code with the cases in it. I have no idea where the 
> programming documentation is for this chip so this index number for 
> setting the baud rate is just a magic number to me at the moment.
> 
> What is the process to get this fix incorporated into new updates to 
> Linux kernel? If you want I can create a list of what standard baud 
> rates are incorrect and by how much with an oscilloscope; I think it 
> will only be for the very high baud rates and may only affect 921600 and
above.

Such a list would be very useful to have.

And I agree that if you can't infer the algorithm used from your
experimental data we may need to start special casing.

Please do gather the data, and send it to the list and propose a patch for
fixing the broken rates.

Thanks,
Johan

