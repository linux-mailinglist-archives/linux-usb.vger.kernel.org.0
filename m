Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 181931932EC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Mar 2020 22:40:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgCYVka (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Mar 2020 17:40:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50234 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbgCYVka (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Mar 2020 17:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=j/yRPl9s2pIRBrhx3CUKW3YHLl0U9yuVx0yKwMSyxbE=; b=SUG5GbqxAPeSX/4R1jLyDrE/Cn
        pBOtFFTcf4NbpBIdYg/mRdke7tBi06eikwxpO/3hx8BMqZxRqUJCx2YtoOSw4luYknSknVNg3p0l6
        pi+FVy0G61/VEzceVbIZjsuDlmwyEq1NQq1y6nj2Hek3Se026DzhPArXvAPnZ4N5XfOZN+jTeqARJ
        3cWXBFNrS6qTI83QA7zKO3IxS6kNByPEUa746Fy8HQ+nJRkBpglAgxAdirScTZg56GmtrKmqo7A+q
        xHjYVMLSlInJLxBiZVVNKxn+BEc3YX2jIx4QlujeAwwhXBu7IbsDbIgONImJKoC3/zLMg1lsNKYTx
        jURKBK0g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jHDlF-0001Lz-GK; Wed, 25 Mar 2020 21:40:29 +0000
Subject: Re: Beginner query regarding usbhid
To:     Rohit Sarkar <rohitsarkar5398@gmail.com>,
        Hubert CHAUMETTE <hubert.chaumette@kolabnow.com>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
        linux-newbie@vger.kernel.org
References: <5e7b5fbc.1c69fb81.cace7.7aa1@mx.google.com>
 <1585147543.3831.8.camel@suse.com>
 <5e7b6f15.1c69fb81.d92d3.facb@mx.google.com>
 <b799aa1720fecb94d832264b4561eb8a@kolabnow.com>
 <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cfda560c-ad5f-5e71-ab22-d8639688722b@infradead.org>
Date:   Wed, 25 Mar 2020 14:40:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e7b9127.1c69fb81.f2f8b.582c@mx.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 3/25/20 10:13 AM, Rohit Sarkar wrote:
> On Wed, Mar 25, 2020 at 04:41:38PM +0100, Hubert CHAUMETTE wrote:
>> Le 25/03/2020 15:47, Rohit Sarkar a écrit :
>>> I was trying to mess around with the driver that drives my mouse. I
>>> found out that it is usbhid. I then added a printk statement to the init
>>> and exit function of usbhid.
>>> I then compiled and installed the usbhid drivers. Post that I ran
>>> `sudo modprobe -r usbhid` and `sudo modprobe usbhid` but couldnt observe
>>> any logs in dmesg.
>>>
>>> I am certain I am missing something fundamental. Could someone help me
>>> with this.
>>
>> Hi,
>>
>> Did you check whether your module was effectively loaded with lsmod?
>> What log level did you use in your printk statement? Depending on your
>> system default loglevel your logs might not be printed. A quick fix
>> would be to use one of the lowest levels (pr_emerg, but pr_err might
>> suffice).
>> Regards,
> 
> Hey,
> I did check that module was loaded. And one of the signs was that my
> mouse started working after insmod :).

Hi,
I'm not convinced that your modified usbhid module was loaded.

Could an older (original) usbhid module be reloaded so that the mouse
started working again?  That would also explain the lack of (new) messages.

What kernel version are you using?  Is it a distro kernel?
Are you trying to replace the usbhid module in a distro kernel or are
you building the entire kernel?

> I used printk(KERN_ALERT "some message") for logging. I also tried with
> KERN_ERR but no luck. 
> 
> The command I used for building was "make -C /home/rohit/LINUX/kernels/staging  M=$(pwd)"
> and for installing the modules: "sudo make -C /home/rohit/LINUX/kernels/staging  M=$(pwd) modules_install"
> both were executed from the usbhid directory.

why those commands?  seems unusual.

-- 
~Randy

