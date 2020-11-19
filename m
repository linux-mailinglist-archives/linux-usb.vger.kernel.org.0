Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686792B9AE8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 19:52:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgKSSvQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 13:51:16 -0500
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net ([184.168.200.140]:59160
        "EHLO p3nlsmtpcp01-02.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728104AbgKSSvQ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 13:51:16 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id fp0YkPCDAjAPufp0YkJIsb; Thu, 19 Nov 2020 11:50:14 -0700
X-CMAE-Analysis: v=2.4 cv=XbBMcK15 c=1 sm=1 tr=0 ts=5fb6be66
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=gu6fZOg2AAAA:8 a=0JZRrnSsyPEHiRDwBhIA:9 a=QgUYmq2U2z1k_GMg:21
 a=Bbo2m5wlVJpyCPvg:21 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=NWVoK91CQyQA:10
 a=2RSlZUUhi9gRBrsHwhhZ:22
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:45946 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kfp0Y-00Ea1f-Ka; Thu, 19 Nov 2020 11:50:14 -0700
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
 <1e58c6f4-c651-b45a-b0fc-7bee40fe61cb@tripolho.com>
 <20201119172250.GC576844@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <0125b936-46b9-0fb8-3fe2-63d1563a1e17@tripolho.com>
Date:   Thu, 19 Nov 2020 13:50:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119172250.GC576844@rowland.harvard.edu>
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
X-CMAE-Envelope: MS4xfCaSgwiwWtYmeK29e45aUhE7Gvf+MSC2b9HruwLB+ckMaWj0lZb66n0DblAkYIwXXDTifPrfcHhlREl2qI/uUQVvtJ1mqd8BL7YeTFjk8avJ0aOCsfyZ
 yS8ALBj1RUFIfN0kd9lvLfnj8GB6y3R272kR00fPAK9BUNQOtFNpDSv3NTze8ReaLo70N29fbAymcb4zMUhynxqoKKdneMq4wXTZYeS5h1ETGIlqxRQoIgU1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Alan,

I have to get the proper blessing to do more tests, and I will work on them.

Meanwhile, my comments are below.

Thanks for your attention,


Alberto

On 11/19/20 12:22 PM, Alan Stern wrote:
> On Mon, Nov 16, 2020 at 01:42:46PM -0500, Alberto Sentieri wrote:
>> Alan,
>>
>> I am not sure if that would give you any clue, but I enabled usbfs_snoop in
>> the kernel and I got URB error -108 (endpoint shutdown) just before the
>> kernel lock.
>>
>> Just after starting the program, I got something like that:
>>
>> [  174.325977] usb 1-1.1.1: opened by process 2961: ate
>> [  174.326006] usb 1-1.1.1: usbdev_do_ioctl: GETDRIVER
>> [  174.326015] usb 1-1.1.1: usbdev_do_ioctl: IOCTL
>> [  174.326334] usb 1-1.1.1: usbdev_do_ioctl: CLAIMINTERFACE
>> [  174.326371] usb 1-1.1.1: usbdev_do_ioctl: SETINTERFACE
>> [  174.326582] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326592] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326617] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326623] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326629] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326635] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326640] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326645] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326652] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326657] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326663] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326668] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326674] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326679] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326685] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326691] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326696] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326702] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326708] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326713] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326718] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326723] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326729] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326734] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326740] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326745] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326751] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326756] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326762] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326767] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.326773] usb 1-1.1.1: usbdev_do_ioctl: SUBMITURB
>> [  174.326783] usb 1-1.1.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.327565] usb 1-1.3.1: opened by process 2961: ate
>> [  174.327584] usb 1-1.3.1: usbdev_do_ioctl: GETDRIVER
>> [  174.327593] usb 1-1.3.1: usbdev_do_ioctl: IOCTL
>> [  174.327855] usb 1-1.3.1: usbdev_do_ioctl: CLAIMINTERFACE
>> [  174.327881] usb 1-1.3.1: usbdev_do_ioctl: SETINTERFACE
>> [  174.328180] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
>> [  174.328188] usb 1-1.3.1: userurb 0000000000000000, ep1 int-in, length 64
>> [  174.328205] usb 1-1.3.1: usbdev_do_ioctl: SUBMITURB
> Can you post the output from "lsusb -t" for your test system?  The
> device numbers aren't what I expected to see.  Not wrong, just
> unexpected.
I will run lsusb -t when I get access to the system. But the numbers are 
correct. Each device has a 2-port USB hub which is connected to the USB 
bus, just before the micro-controller. That is the reason for all of 
them ending in .1. The micro-controller is connected to port 1 of the 
2-port hub.
>
> Apart from that, this looks like normal initialization.  Why does the
> program submit 16 URBs all for the same endpoint without waiting?
> Wouldn't two or three be enough?
I am using simple commands (to the device) and the responses fit in a 
64-byte HID packet. But there are more complex commands, which may 
return many packets. All submitted input URBs are there because, in some 
cases, the worker main loop can take many milliseconds to start reaping 
the URBs after they arrive.
>> During the program execution, I got many lines like that:
>>
>> [  178.537958] usb 1-1.4.1: urb complete
>> [  178.537975] usb 1-1.4.1: userurb         pK-error, ep1 int-out,
>> actual_length 64 status 0
>> [  178.538000] usb 1-1.2.1: urb complete
>> [  178.538006] usb 1-1.2.1: userurb         pK-error, ep1 int-out,
>> actual_length 64 status 0
>>
>> I am not sure if pK-error has a special meaning there.
> It's an error in the debugging output.  I have just submitted a patch
> to fix the error (see
> <https://marc.info/?l=linux-usb&m=160580539818074&w=2>).  In any case,
> it should be irrelevant for your problem.
Thanks.
>> However, just before the lock, I got this sequence:
>>
>> [  387.326795] usb 1-1.5.3.1: usbdev_do_ioctl: SUBMITURB
>> [  387.326801] usb 1-1.5.3.1: userurb 0000000000000000, ep1 int-in, length
>> 64
>> [  387.327531] usb 1-1.5.3.1: urb complete
>> [  387.327539] usb 1-1.5.3.1: userurb         pK-error, ep1 int-out,
>> actual_length 64 status 0
>> [  387.327582] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  387.327590] usb 1-1.5.3.1: reap 0000000000000000
>> [  387.327598] usb 1-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.109400] usb 3-1.5.7.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.110032] usb 3-1.6.7.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.110169] usb 3-1.5.5.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.110605] usb 3-1.6.5.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.111394] usb 3-1.1.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.403278] usb 3-1.6.4.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.404011] usb 3-1.5.1.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.404344] usb 3-1.6.3.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.404649] usb 3-1.4.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.404790] usb 3-1.3.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.405283] usb 3-1.5.3.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.407828] usb 3-1.6.1.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.408771] usb 3-1.5.4.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.409155] usb 3-1.5.2.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.409452] usb 3-1.5.6.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.409743] usb 3-1.6.6.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.409848] usb 3-1.2.1: usbdev_do_ioctl: REAPURBNDELAY
>> [  388.410840] usb 3-1.6.2.1: usbdev_do_ioctl: REAPURBNDELAY
> This rapid sequence of reap requests with no completions or actual
> reaps is odd.  Is this the sort of thing you expect your program to
> do?  Maybe you can add some debugging output to the program.
What apparently happened before that (but unfortunately I did not 
capture it this time) is that the particular device return errno -71 in 
some URBs, without de-enumerating. However, I am only seeing userurbs 
with status 0 in my the netconsole capture, before the ones with status 
-108 (just before the lock). So, if error -71 happened, all URBs are 
reaped and the devices are then closed. Usually I see error -71 in the 
program log happening for a few devices at the same time. After closing 
the interface, the program opens it again. The return from open should 
be a valid file descriptor, otherwise it would fail. After opening the 
device successfully it starts submitting urbs, and error -108 is coming 
back, telling me that the device just opened is not open.

It just came to my attention now: maybe something to be investigated is 
what the kernel does if a interface is closed due to a URB error and 
immediately opened again.

> Also, can you turn on dynamic debugging for usbcore before starting
> the test?
>
> 	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
>
>> [  389.612597] usb 3-1.5.7.1: opened by process 2961: ate
>> [  389.612622] usb 3-1.5.7.1: usbdev_do_ioctl: GETDRIVER
>> [  389.612631] usb 3-1.5.7.1: usbdev_do_ioctl: IOCTL
>> [  389.614965] usb 3-1.5.7.1: urb complete
>> [  389.614981] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in,
>> actual_length 0 status -108
>> [  389.614989] usb 3-1.5.7.1: urb complete
>> [  389.614994] usb 3-1.5.7.1: userurb         pK-error, ep1 int-in,
>> actual_length 0 status -108
> The -108 erroro codes are ESHUTDOWN.  They indicate that the device
> was disconnected or something like that, although I don't see any
> other indication of this in the log.
>
>> [  389.616926] usb 3-1.5.7.1: usbdev_do_ioctl: CLAIMINTERFACE
>> [  389.616964] usb 3-1.5.7.1: usbdev_do_ioctl: SETINTERFACE
> And if the device had been disconnected, these calls would have failed.
>
>> As you can see, it locked in 215 seconds, in this test. Do you see anything
>> special in this sequence?
> No, but several things are puzzling.  But there's nothing that
> indicates any reason for the system to freeze.
>
> Alan Stern
