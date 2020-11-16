Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55BDF2B4BC4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:56:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732191AbgKPQyq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:54:46 -0500
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net ([184.168.200.145]:33534
        "EHLO p3nlsmtpcp01-04.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731271AbgKPQyq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 11:54:46 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id ehlAkstXGt9bCehlAkGu0x; Mon, 16 Nov 2020 09:53:44 -0700
X-CMAE-Analysis: v=2.4 cv=RJ12o6u+ c=1 sm=1 tr=0 ts=5fb2ae98
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=VwQbUJbxAAAA:8 a=5isuLWmZutClaEJmLAcA:9 a=QEXdDO2ut3YA:10
 a=AjGcO6oz07-iQ99wixmX:22
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:41130 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kehlA-001MKZ-4a; Mon, 16 Nov 2020 09:53:44 -0700
Subject: Re: kernel locks due to USB I/O
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <9428ae70-887e-b48b-f31c-f95d58f67c61@tripolho.com>
 <20201110205114.GB204624@rowland.harvard.edu>
 <8152190e-c962-e376-64fd-cc2ebf3e6104@tripolho.com>
 <20201111155130.GB237113@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <9687fac9-94de-50a3-f88e-b7e05d660aba@tripolho.com>
Date:   Mon, 16 Nov 2020 11:53:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
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
X-CMAE-Envelope: MS4xfC9zXGncmi6XIaZXZZtnmbvUdL14bijhv8TkeWk4NUd/eSFzHyz+uX46yanpfdnBlN0eksPKX/Hg+sW1ViQ6hXNItx7WMT8dU5X8Ru+oYYC/nWotnlsx
 XaHNoFWAT695yV0kyZBOMtKBFdGV3no8IvZ7ICpLggcQXaVdWx3lVPu9WRT2kKuvTnte3H7pjDpX7uBQh49cLpvn9ibpXOfe6z8TiFzeEB8GL1Rg+r/VoFJ1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The objective of this email is to report the current status of my findings.

I loaded netconsole on both machines I was having problems with. I tried 
3 times on the machine with kernel 5.0.0-37 and twice with on the 
machine with kernel 5.3.0-62. Each attempt consisted of running the 
program which lock the kernel until it locked (about 3 minutes after 
stating the program). The referred program had the "semphore code" 
commented out. Nothing was sent to netconsole on all the 5 attempts I 
made when the kernel locked.

Just to be clear about my use of netconsole, before loading the 
netconsole kernel module, I ran "dmesg -n 8". When netconsole module was 
loaded I could clearly see about 9 message lines on the computer 
receiving the netconsole messages telling me that netconsole was loaded 
(and how it was configured), so no doubts about the correct netconsole 
setup. The "netconsole server" was a machine on the same local network.

My next attempt will be to compile kernel 5.9, as you suggest, and try it.

Thanks,

Alberto Sentieri

On 11/11/20 10:51 AM, Alan Stern wrote:
> On Tue, Nov 10, 2020 at 06:42:17PM -0500, Alberto Sentieri wrote:
>> 1) The current Ubuntu Kernel is 5.4.0-53. Do you want me to upgrade it to
>> 5.9, from kernel.org? Or is there a Ubuntu 5.9 package that I can use? It
>> would be easy to do it If there is a Ubuntu package with 5.9, which I would
>> install and, after the tests, uninstall.
> If you want to know what Ubuntu packages are available, you should ask
> on an Ubuntu mailing list instead of the linux-usb mailing list.
>
>> 2) Why do you believe that 5.9 would solve the problem? I am asking that
>> because I cannot change the production machine for a test if I cannot go
>> back to the original state. There is always a risk involved.
> We do not believe that 5.9 will solve the problem -- we have no reason
> to believe this -- but we could be wrong.  In any case it is always
> best to test with the most up-to-date software available, and 5.9 is the
> version closest to what we are working on now.
>
>> 3) It is one single thread dealing with all 36 devices. Each device has its
>> own co-routine (not preemptive), but all co-routines are executed by a
>> unique thread.
> If everything runs within a single thread, how can adding a semaphore
> or mutex make any difference?
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
