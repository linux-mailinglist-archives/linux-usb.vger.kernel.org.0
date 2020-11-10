Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636452AE447
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 00:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731746AbgKJXn0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Nov 2020 18:43:26 -0500
Received: from p3nlsmtpcp01-02.prod.phx3.secureserver.net ([184.168.200.140]:36740
        "EHLO p3nlsmtpcp01-02.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731558AbgKJXn0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 10 Nov 2020 18:43:26 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id cdHLkJvvqsFA9cdHLkD5gn; Tue, 10 Nov 2020 16:42:23 -0700
X-CMAE-Analysis: v=2.4 cv=Xu4/hXJ9 c=1 sm=1 tr=0 ts=5fab255f
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=VwQbUJbxAAAA:8 a=_mUPLmyXwGQoOHowg7QA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:40926 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kcdHL-004XCT-8M; Tue, 10 Nov 2020 16:42:23 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
Date:   Tue, 10 Nov 2020 18:42:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110205114.GB204624@rowland.harvard.edu>
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
X-CMAE-Envelope: MS4xfI8Fl918J6UWusk35n+qaMc4qEgJLjUHITLNX/Tfv+L5ZSRC9hakzRLJuE8/y5BkN6c9FljCzbhFpqFjrBTGeaUbg6LeOuFFM9ZGcRDBmlGO0yZMe7w+
 pviiFFGn9JaVPZ9HCYUB1QiDNt5puiBhuFWNbqYPaKUuklh+F5qZrXzPPJOyB1C5fItGA00kfMdo26FyaRIn4hpVslepY8iZ4xCR/8hcnpZPGlvtkMkSYk4x
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

1) The current Ubuntu Kernel is 5.4.0-53. Do you want me to upgrade it 
to 5.9, from kernel.org? Or is there a Ubuntu 5.9 package that I can 
use? It would be easy to do it If there is a Ubuntu package with 5.9, 
which I would install and, after the tests, uninstall.

2) Why do you believe that 5.9 would solve the problem? I am asking that 
because I cannot change the production machine for a test if I cannot go 
back to the original state. There is always a risk involved.

3) It is one single thread dealing with all 36 devices. Each device has 
its own co-routine (not preemptive), but all co-routines are executed by 
a unique thread.

4) By network console, do you mean ssh? It dies as well when it locks. 
The screen is the regular GNOME3 screen and nothing can be seen there. 
Every time it locks they send a picture, and I cannot see anything 
meaningful there. I am thinking about disabling GNOME3, but I need their 
blessing for that.

Thanks,

Alberto

On 11/10/20 3:51 PM, Alan Stern wrote:
> On Tue, Nov 10, 2020 at 02:20:50PM -0500, Alberto Sentieri wrote:
>> I’ve seen many kernel locks caused by a particular user-level application.
>> After the kernel locks, there is no report left in the machine, neither in
>> the logs. These locks have to do with USB input and output.
>>
>> The objective of this email is to get guidance about how to collect more
>> data related to the locks.
>>
>> Follows a description of the problem.
>>
>> I manage a few remote machines installed at a manufacturing facility, which
>> run Ubuntu 18.04. For months I had seen unexpected kernel locks, which I
>> could not explain. By locks I mean that the machine completely dies. The
>> graphical screen and keyboard freezes. I cannot ping or connect through ssh
>> during the locks. The only way of making the machine come back is through a
>> “pull the plug”. After rebooting I cannot find anything meaningful about the
>> lock in the logs. The machine is a good quality one with a 6-core Xeon, 32
>> GB ECC memory (and the application is using about 1GB). Exact the same
>> problem happens in two identical machines, one running kernel 5.0.0-37
>> generic and the other running kernel 5.3.0-62-generic.
> Can you update either machine to a 5.9 kernel?
>
>> A few days ago I was able to create a sequence of events that produce the
>> locks in a couple of minutes. These events have to do with USB 2.0 interrupt
>> I/O on USB devices connected at 12 Mbits/s and the frequency URBs are
>> submitted and reaped . It is necessary to have at least 36 devices connected
>> to reproduce the problem easily, which I cannot do from where I am. The
>> machines are in a country other than the one I live, and my physical access
>> to them is not possible due to COVID-19 restrictions.
>>
>> There is no special USB drivers installed. However, there is a NVIDIA
>> manufacturer driver installed, which I installed using the Ubuntu regular
>> tools for non-free software. All USB I/O is done by a regular user opening
>> /dev/bus/usb/xxx/xxx (the device group is set to the user group by udev).
>>
>> Each set of 18 USB devices is connected to a 10-Amp.-power-supply powered
>> HUB. Each hub has its own USB 2.0 root, I mean, I installed multiple USB 2.0
>> PCI express expansion cards, and only one port of each expansion card is
>> used for each HUB.
>>
>> The protocol to talk to any of the 36 devices is pretty simple. It uses USB
>> interrupt frames. A 64-byte frame is sent to the device (request packet). I
>> use ioctl (USBDEVFS_SUBMITURB). The file descriptor is monitored by epoll
>> and when an answer comes back, the response packet (another 64-byte
>> interrupt packet) is recovered by ioctl (USBDEVFS_REAPURBNDELAY). Then a
>> 64-byte packet (confirmation packet) is sent through USBDEVFS_SUBMITURB.
>> This sequence happens once every few seconds and the delay between the three
>> packets is just a couple of milliseconds. All process of dealing with the 36
>> devices is in a unique thread, under the same epoll loop.
> This sentence is ambiguous.  Do you mean there is a single unique thread
> which talks to all 36 devices?  Or do you mean there is a separate
> unique thread for each device (so 36 threads)?
>
>> So if I synchronize all 36 devices, I mean, I try to talk to all them
>> basically at the same time, the kernel will lock in about 2 minutes or less.
>> By “at the same time” I mean to submit the URBs for the request packet
>> around the same time for all of them, and then sit there, waiting for the
>> proper epoll wake-up to deal with the state machine (response and
>> confirmation packets).
>>
>> However, if I lock a semaphore before sending the request packet for one
>> device, and only unlock after reaping the URB I used to send the
>> confirmation packet, it ran for ate least 72 hours without problems. So, one
>> device at a time (using basically the same software plus the semaphore) does
>> not cause the kernel lock.
>>
>> My point is that simple ioctl calls to USB devices should not break the
>> kernel. I need help to address the kernel issue. The problem is difficult to
>> reproduce at my office because it needs many devices connected to it, which
>> are available only in a place I do not have physical access to, due to
>> COVID-19 travel restrictions.
>>
>> My guess is that, for a regular user, this bug rarely manifests itself and
>> it may be there for a long time.
>>
>> I would like to figure out exactly where the problem is and I am looking for
>> your guidance to get more information about it.
> You could try using a network console.  Or have someone who is on-site
> take a picture of the computer screen when a crash occurs.
>
> Alan Stern
