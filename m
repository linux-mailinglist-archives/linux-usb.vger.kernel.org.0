Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6313438D1B5
	for <lists+linux-usb@lfdr.de>; Sat, 22 May 2021 00:56:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbhEUW5j (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 18:57:39 -0400
Received: from mr07.mx01.tldhost.de ([62.108.44.247]:45090 "EHLO
        mr07.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhEUW5j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 18:57:39 -0400
X-Greylist: delayed 2040 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 May 2021 18:57:38 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id 0A39F1219C8
        for <linux-usb@vger.kernel.org>; Sat, 22 May 2021 00:17:09 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id F40DA1219D2; Sat, 22 May 2021 00:17:08 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 3179A12197C;
        Sat, 22 May 2021 00:17:07 +0200 (CEST)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTPS;
 Fri, 21 May 2021 22:17:07 +0000
Date:   Fri, 21 May 2021 22:17:06 +0000
Message-ID: <20210521221706.Horde.sFtE6C4lkS5sJzKfWl41tv7@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Guido Kiener <Guido.Kiener@rohde-schwarz.com>, dpenkler@gmail.com,
        USB list <linux-usb@vger.kernel.org>,
        Thinh.Nguyen@synopsys.com, mathias.nyman@intel.com
Subject: Re: [syzbot] INFO: rcu detected stall in tx
References: <35b615b7c7344767b6fd37f7d420787e@rohde-schwarz.com>
 <20210521012420.GC1224757@rowland.harvard.edu>
In-Reply-To: <20210521012420.GC1224757@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20210521221707.12291.72825@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Zitat von Alan Stern <stern@rowland.harvard.edu>:

> On Thu, May 20, 2021 at 09:25:53PM +0000, Guido Kiener wrote:
>> I've tested to pull the cable and I can easy produce the -EPROTO  
>> (-71) error in the usbtmc.c driver.
>> The error also happens when I have no traffic and just switch off  
>> the USBTMC device (which I can do from home office).
>> When there is traffic, the IN/OUT pipe will also show some -EPROTO  
>> errors from the flying urbs.
>>
>> On my test PC the amount of error messages vary from 1 to ca. 10  
>> error message issued by the INT pipe (see below).
>> Nevertheless I do not see the endless loop, since the USB  
>> disconnect stops the loop.
>> (Tested with USB 2.0, older kernel 4.15, but latest modified  
>> usbtmc.c driver using ehci-pci)
>> So I can test fixes (of course with latest kernel) and also setup a  
>> machine with USB 3.0.
>>
>> 1. Example
>> [1616527.017863] usbtmc 1-1.4:1.0: usbtmc_write_bulk_cb - nonzero  
>> write bulk status received: -71
>> [1616527.032489] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.053998] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.076145] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.098143] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.120244] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.142244] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.164440] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.186517] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.208175] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.230272] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1616527.241982] usb 1-1.4: USB disconnect, device number 3
>>
>> 2. Example
>> [1622454.299131] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.305815] usbtmc 1-1.4:1.0: usbtmc_write_bulk_cb - nonzero  
>> write bulk status received: -71
>> [1622454.309921] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -71
>> [1622454.319121] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.341199] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.363336] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.385466] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.407576] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1622454.422870] usb 1-1.4: USB disconnect, device number 7
>>
>> 3. Example
>> [1623429.713784] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -71
>> [1623429.714037] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.714279] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.714528] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.714778] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.715029] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.715278] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.715528] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.715777] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.716028] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.716277] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.718916] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.719168] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.722404] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.725666] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.725918] usbtmc 1-1.4:1.0: usbtmc_read_bulk_cb - nonzero  
>> read bulk status received: -2
>> [1623429.727837] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.749949] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.772094] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.794184] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.816297] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.838479] usbtmc 1-1.4:1.0: unknown status received: -71
>> [1623429.838795] usb 1-1.4: USB disconnect, device number 8
>
> Try running this test on a system with only one CPU (and no
> hyperthreading).  I think that's the environment syzbot emulates.
>

I looked at the original console output again:
https://syzkaller.appspot.com/x/log.txt?x=1065c5fcd00000
I'm not very familiar yet in reading rcu files, but I would say:
1. I assume there are 2 CPUs running (C0,C1).
2. There are 5 USBTMC devices running concurrenlty which seems to be  
disconnected together at once.
You will find all disconnect messages "usb x-1: USB disconnect, device  
number y" at the end within 5 seconds (418.4-423.7 sec).
3. Each USBTMC device issues every 20 msec the typical INT pipe  
message "X-1:0.0: unknown status received: -71" when the connection is  
disconnected.
All USBTMC device messages are alternating. Round robin works.

Does someone have an idea for the following questions:
1. Why does it take about 96 seconds from the beginning of the first  
INT pipe message (322.1) until the first disconnect message (418.4)?
2. What is blocking the "disconnect" event for such a long time?
3. Is it possible to provoke this behavior when I disconnect the cable  
in slow motion?
4. Is the self-detected stall just caused by another driver and the  
USBTMC driver is innocent, but only chatty?

Next Thursday I can check recommendations again.

-Guido




