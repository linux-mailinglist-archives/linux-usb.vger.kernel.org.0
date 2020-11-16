Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 684252B5015
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 19:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgKPSnz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 13:43:55 -0500
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net ([184.168.200.145]:34424
        "EHLO p3nlsmtpcp01-04.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727391AbgKPSnz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 13:43:55 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id ejSnktadQt9bCejSnkHSSV; Mon, 16 Nov 2020 11:42:53 -0700
X-CMAE-Analysis: v=2.4 cv=RJ12o6u+ c=1 sm=1 tr=0 ts=5fb2c82d
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=3vGk7YgEQgiX6p95JxQA:9 a=OtOXIhoYnLR8EhRJ:21 a=Nz1XyxlhXoG7-vUs:21
 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:41874 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kejSm-0036IO-TQ; Mon, 16 Nov 2020 11:42:53 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
 <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
 <20201116170625.GC436089@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
Date:   Mon, 16 Nov 2020 13:42:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201116170625.GC436089@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - p3plcpnl0564.prod.phx3.secureserver.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tripolho.com
X-Get-Message-Sender-Via: p3plcpnl0564.prod.phx3.secureserver.net: authenticated_id: a1@tripolho.com
X-Authenticated-Sender: p3plcpnl0564.prod.phx3.secureserver.net: a1@tripolho.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CMAE-Envelope: MS4xfGJ+WJIzGnZIi14HmAN3t/LzrpYBoztOd7wcut+Zfug87PvN7ubUfPbjWTEu3yzmzTGSCYW1NBN3SMpkfQyy390msHGK5gfoGWXGwScFvK90tCVCfqe7
 giyBXA+aTCmkM+ECaybA3JV2VCwN3TqAdM8/9kPh5ePG2KhpFM3VXKnhU3Yc6I8C4n8W4Q8oEts9fhH3vR5i5O8G7ENz1hExWdZeI5TS17GWXsSBwzo7rOry
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan,

I am not sure if that would give you any clue, but I enabled usbfs_snoop 
in the kernel and I got URB error -108 (endpoint shutdown) just before 
the kernel lock.

Just after starting the program, I got something like that:

[  174.325977] usb 1-1.1.1: opened by process 2961: ate
[  174.326006] usb 1-1.1.1: usbdev_do_ioctl: GETDRIVER
[  174.326015] usb 1-1.1.1: usbdev_do_ioctl: IOCTL
[  174.326334] usb 1-1.1.1: usbdev_do_ioctl: CLAIMINTERFACE
[  174.326371] usb 1-1.1.1: usbdev_do_ioctl: SETINTERFACE
[  174.326582] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326592] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326617] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326623] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326629] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326635] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326640] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326645] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326652] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326657] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326663] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326668] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326674] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326679] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326685] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326691] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326696] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326702] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326708] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326713] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326718] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326723] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326729] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326734] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326740] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326745] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326751] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326756] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326762] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326767] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.326773] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
[  174.326783] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.327565] usb 1-1.3.1: opened by process 2961: ate
[  174.327584] usb 1-1.3.1: usbdev_do_ioctl: GETDRIVER
[  174.327593] usb 1-1.3.1: usbdev_do_ioctl: IOCTL
[  174.327855] usb 1-1.3.1: usbdev_do_ioctl: CLAIMINTERFACE
[  174.327881] usb 1-1.3.1: usbdev_do_ioctl: SETINTERFACE
[  174.328180] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
[  174.328188] usb 1-1.3.1: userurb 0000000000000000, ep1 int-in, length 64
[  174.328205] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB


During the program execution, I got many lines like that:

[  178.537958] usb 1-1.4.1: urb complete
[  178.537975] usb 1-1.4.1: userurb         pK-error, ep1 int-out, 
actual_length 64 status 0
[  178.538000] usb 1-1.2.1: urb complete
[  178.538006] usb 1-1.2.1: userurb         pK-error, ep1 int-out, 
actual_length 64 status 0

I am not sure if pK-error has a special meaning there.

However, just before the lock, I got this sequence:

[  387.326795] usb 1-1.5.3.1: usbdev_do_ioctl: SUBMITURB
[  387.326801] usb 1-1.5.3.1: userurb 0000000000000000, ep1 int-in, 
length 64
[  387.327531] usb 1-1.5.3.1: urb complete
[  387.327539] usb 1-1.5.3.1: userurb         pK-error, ep1 int-out, 
actual_length 64 status 0
[  387.327582] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
[  387.327590] usb 1-1.5.3.1: reap 0000000000000000
[  387.327598] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.109400] usb 3-1.5.7.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.110032] usb 3-1.6.7.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.110169] usb 3-1.5.5.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.110605] usb 3-1.6.5.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.111394] usb 3-1.1.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.403278] usb 3-1.6.4.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.404011] usb 3-1.5.1.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.404344] usb 3-1.6.3.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.404649] usb 3-1.4.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.404790] usb 3-1.3.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.405283] usb 3-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.407828] usb 3-1.6.1.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.408771] usb 3-1.5.4.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.409155] usb 3-1.5.2.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.409452] usb 3-1.5.6.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.409743] usb 3-1.6.6.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.409848] usb 3-1.2.1: usbdev_do_ioctl: REAPURBNDELAY
[  388.410840] usb 3-1.6.2.1: usbdev_do_ioctl: REAPURBNDELAY
[  389.612597] usb 3-1.5.7.1: opened by process 2961: ate
[  389.612622] usb 3-1.5.7.1: usbdev_do_ioctl: GETDRIVER
[  389.612631] usb 3-1.5.7.1: usbdev_do_ioctl: IOCTL
[  389.614965] usb 3-1.5.7.1: urb complete
[  389.614981] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.614989] usb 3-1.5.7.1: urb complete
[  389.614994] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.614999] usb 3-1.5.7.1: urb complete
[  389.615003] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615008] usb 3-1.5.7.1: urb complete
[  389.615013] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615018] usb 3-1.5.7.1: urb complete
[  389.615022] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615027] usb 3-1.5.7.1: urb complete
[  389.615032] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615037] usb 3-1.5.7.1: urb complete
[  389.615042] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615047] usb 3-1.5.7.1: urb complete
[  389.615051] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615056] usb 3-1.5.7.1: urb complete
[  389.615060] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615065] usb 3-1.5.7.1: urb complete
[  389.615070] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615074] usb 3-1.5.7.1: urb complete
[  389.615079] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615084] usb 3-1.5.7.1: urb complete
[  389.615089] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615094] usb 3-1.5.7.1: urb complete
[  389.615098] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615103] usb 3-1.5.7.1: urb complete
[  389.615108] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615112] usb 3-1.5.7.1: urb complete
[  389.615117] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.615121] usb 3-1.5.7.1: urb complete
[  389.615126] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in, 
actual_length 0 status -108
[  389.616823] usb 3-1.5.7.1: urb complete
[  389.616839] usb 3-1.5.7.1: userurb         pK-error, ep1 int-out, 
actual_length 0 status -108
[  389.616926] usb 3-1.5.7.1: usbdev_do_ioctl: CLAIMINTERFACE
[  389.616964] usb 3-1.5.7.1: usbdev_do_ioctl: SETINTERFACE

As you can see, it locked in 215 seconds, in this test. Do you see 
anything special in this sequence?


Thanks,


Alberto Sentieri


On 11/16/20 12:06 PM, Alan Stern wrote:
> On Mon, Nov 16, 2020 at 11:53:38AM -0500, Alberto Sentieri wrote:
>> The objective of this email is to report the current status of my findings.
>>
>> I loaded netconsole on both machines I was having problems with. I tried 3
>> times on the machine with kernel 5.0.0-37 and twice with on the machine with
>> kernel 5.3.0-62. Each attempt consisted of running the program which lock
>> the kernel until it locked (about 3 minutes after stating the program). The
>> referred program had the "semphore code" commented out. Nothing was sent to
>> netconsole on all the 5 attempts I made when the kernel locked.
>>
>> Just to be clear about my use of netconsole, before loading the netconsole
>> kernel module, I ran "dmesg -n 8". When netconsole module was loaded I could
>> clearly see about 9 message lines on the computer receiving the netconsole
>> messages telling me that netconsole was loaded (and how it was configured),
>> so no doubts about the correct netconsole setup. The "netconsole server" was
>> a machine on the same local network.
>>
>> My next attempt will be to compile kernel 5.9, as you suggest, and try it.
> While this may not generate any useful information, one way to create a
> bunch of log output while running your test is to set the usbfs_snoop
> module parameter for usbcore to true.
>
> You can also enable dynamic debugging for usbcore, although in a stable
> environment like yours it probably won't produce much output.
>
> Alan Stern
