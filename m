Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25BDC2AF91B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 20:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbgKKTc0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 14:32:26 -0500
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net ([184.168.200.140]:59082
        "EHLO p3nlsmtpcp01-02.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726513AbgKKTcZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 14:32:25 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id cvq0kRNbjsFA9cvq0kJ4al; Wed, 11 Nov 2020 12:31:24 -0700
X-CMAE-Analysis: v=2.4 cv=Xu4/hXJ9 c=1 sm=1 tr=0 ts=5fac3c0c
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=VwQbUJbxAAAA:8 a=XRmz5qeXFlNOdd5SrRAA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:46736 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kcvq0-00AFFh-DH; Wed, 11 Nov 2020 12:31:24 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <e505f7eb-1841-4c10-03af-6d7975bcd2dd@tripolho.com>
Date:   Wed, 11 Nov 2020 14:31:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201111155130.GB237113@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-CMAE-Envelope: MS4xfBVjhXJFWsf3RKEFYmrFDgGPiQ5qBgyFuenlgxNmPlm/fHLNell9oAF7cDsYlAMSovK+q9T8IUY+aQF576iN9JBh1GQ/mtxVMcSlrDCGEhpOxUtCqTXs
 WW1DbF0FIJQXbuCTl9RCDAjsz7QsTO/Uuz1bCJG0nOCoXStmM7WleAH40u37U1PHQ3FTy8Ohgo4HrVKf/u5mDCgX5QHUZHSg5i6809bR0iFTv9RKWxUUmRMw
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/11/20 10:51 AM, Alan Stern wrote:
> On Tue, Nov 10, 2020 at 06:42:17PM -0500, Alberto Sentieri wrote:
>> 1) The current Ubuntu Kernel is 5.4.0-53. Do you want me to upgrade it to
>> 5.9, from kernel.org? Or is there a Ubuntu 5.9 package that I can use? It
>> would be easy to do it If there is a Ubuntu package with 5.9, which I would
>> install and, after the tests, uninstall.
> If you want to know what Ubuntu packages are available, you should ask
> on an Ubuntu mailing list instead of the linux-usb mailing list.
I am sorry to be asking about Ubuntu. For some reason I imagined I was 
exchanging emails with Ubuntu guys, but now I understand that you are 
from the kernel.org.
>
>> 2) Why do you believe that 5.9 would solve the problem? I am asking that
>> because I cannot change the production machine for a test if I cannot go
>> back to the original state. There is always a risk involved.
> We do not believe that 5.9 will solve the problem -- we have no reason
> to believe this -- but we could be wrong.  In any case it is always
> best to test with the most up-to-date software available, and 5.9 is the
> version closest to what we are working on now.
I will try kernel 5.9 soon...
>
>> 3) It is one single thread dealing with all 36 devices. Each device has its
>> own co-routine (not preemptive), but all co-routines are executed by a
>> unique thread.
> If everything runs within a single thread, how can adding a semaphore
> or mutex make any difference?
The semaphore will block a co-routine, not a thread. It is not the type 
of semaphore C programmers are used to. So, before the introduction of 
the semaphore, a sequence like that would happen:

request packet device 1 URB submit
request packet device 2 URB submit
...
request packet device 36 URB submit
wait on epoll after submitting 36 URBs, one for each device.
reap URBs, receive response packets, send confirmation packets 
(basically run the state machine, each device has its own state)

After the semaphore, a sequence like that would happen:

lock the semaphore
send request packet device 1 (URB submit)
wait on epoll
reap URB with device 1 response packet
submit URB with device 1 confirmation
wait on epoll
reap URB submitted on last step
unlock the semaphore
Now go to the next device, which was waiting on the co-routine semaphore.

The main difference is that I would not submit 36 URBs to 36 different 
devices at the same time. The submission of 36 URBs would make the 
devices start responding as soon as they get ready and receive a pool.


>
>> 4) By network console, do you mean ssh? It dies as well when it locks. The
>> screen is the regular GNOME3 screen and nothing can be seen there. Every
>> time it locks they send a picture, and I cannot see anything meaningful
>> there. I am thinking about disabling GNOME3, but I need their blessing for
>> that.
> See https://www.kernel.org/doc/Documentation/networking/netconsole.txt
> for instructions on netconsole.  And when you use it for testing, be
> sure to set the console log level to a high value.
>
> Alan Stern


I will try kernel 5.9. However, it seems that the 5.3 kernel gets lost 
when too many submits / reaps start happening very close to each other.

Thanks,

Alberto Sentieri

