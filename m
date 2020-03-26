Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D00D193854
	for <lists+linux-usb@lfdr.de>; Thu, 26 Mar 2020 07:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbgCZGH7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 02:07:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50278 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725819AbgCZGH7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 02:07:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=rWWtLdoh4PaGLY22WOEpTFe94usfGs3+6Ob5y2vF0KM=; b=V6KW4LlHovH3xrPWiEMNPbpxMU
        hXRLgvouAKmtWHpwBQZvzCofKtFdPdKP7FcbOwjL3qw6Mbc+k3yz7gbJnNKfbD3/n1uelkaKHB2YM
        J0IkdogV11SScimSEIi3bUJKTDFRG8jzLT8/cgVXGCwz86oEy0I7exibpvsyPnjmn8x8YE/ye5QFb
        zAgamHiZ/Xk8FzAg7rkUf5167NSOhJymU6sp/gbeOxWHvde24OmI9Nl8hQ+wsY3zSXB/lqPC14uQz
        n8SGvoHYW1Kk21Gp3zqBnT6uA5xfoQfNDv1sIQvVsvpV+lesnFQU9KmSHjvYkP6svjjXgHo/W4WOy
        0LG9COjg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHLgM-0001eX-DO; Thu, 26 Mar 2020 06:07:58 +0000
Subject: Re: Beginner query regarding usbhid
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>
Cc:     Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
 <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
 <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
 <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fdc818d7-842c-cfef-3654-0478e74bfa73@infradead.org>
Date:   Wed, 25 Mar 2020 23:07:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e7c3e48.1c69fb81.7da14.34ab@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/25/20 10:31 PM, Rohit Sarkar wrote:
> On Wed, Mar 25, 2020 at 02:40:27PM -0700, Randy Dunlap wrote:
>> On 3/25/20 10:13 AM, Rohit Sarkar wrote:
>>> On Wed, Mar 25, 2020 at 04:41:38PM +0100, Hubert CHAUMETTE wrote:
>>>> Le 25/03/2020 15:47, Rohit Sarkar a écrit :
>>>>> I was trying to mess around with the driver that drives my mouse. I
>>>>> found out that it is usbhid. I then added a printk statement to the init
>>>>> and exit function of usbhid.
>>>>> I then compiled and installed the usbhid drivers. Post that I ran
>>>>> `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
>>>>> any logs in dmesg.
>>>>>
>>>>> I am certain I am missing something fundamental. Could someone help me
>>>>> with this.
>>>>
>>>> Hi,
>>>>
>>>> Did you check whether your module was effectively loaded with lsmod?
>>>> What log level did you use in your printk statement? Depending on your
>>>> system default loglevel your logs might not be printed. A quick fix
>>>> would be to use one of the lowest levels (pr_emerg, but pr_err might
>>>> suffice).
>>>> Regards,
>>>
>>> Hey,
>>> I did check that module was loaded. And one of the signs was that my
>>> mouse started working after insmod :).
> Hi,
>> Hi,
>> I'm not convinced that your modified usbhid module was loaded.
> Hmm, here's my dmesg logs if that helps:
> "
> [  382.132319] usbcore: deregistering interface driver usbhid
> [  391.077410] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input26
> [  391.136724] input: MOSART Semi. 2.4G Wireless Mouse as /devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.0/0003:3938:1031.0002/input/input27
> [  391.137285] hid-generic 0003:3938:1031.0002: input,hiddev0,hidraw0: USB HID v1.10 Mouse [MOSART Semi. 2.4G Wireless Mouse] on usb-0000:00:14.0-2/input0
> [  391.137480] usbcore: registered new interface driver usbhid
> [  391.137483] usbhid: USB HID core driver
> "

I can't tell that helps any.

>> Could an older (original) usbhid module be reloaded so that the mouse
>> started working again?  That would also explain the lack of (new) messages.
> I think so too. But how do I verify if this is the case?
> 
>> What kernel version are you using?  Is it a distro kernel?
> I am currently running a bleeding edge kernel that I built. ie 5.6-rc7. 
>> Are you trying to replace the usbhid module in a distro kernel or are
>> you building the entire kernel?
> I am building the entire kernel
>>> I used printk(KERN_ALERT "some message") for logging. I also tried with
>>> KERN_ERR but no luck. 
>>>
>>> The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
>>> and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
>>> both were executed from the usbhid directory.
>>
>> why those commands?  seems unusual.
> My Linux kernel source is in the directory mentioned in the commands. So
> it is same as running "make M=drivers/hid/usbhid/" from the linux kernel
> source root.

So /home/rohit/kernels/staging is the top-level kernel source directory?

"M=dir" is for external modules to be built.  AFAICT you are not building any
external modules.

Just run
$ cd <top of kernel source tree>
$ make all
$ sudo make install



-- 
~Randy

