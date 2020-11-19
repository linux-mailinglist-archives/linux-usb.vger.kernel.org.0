Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E05572B9D7B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Nov 2020 23:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgKSWPm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Nov 2020 17:15:42 -0500
Received: from p3nlsmtpcp01-04.prod.phx3.secureserver.net ([184.168.200.145]:36422
        "EHLO p3nlsmtpcp01-04.prod.phx3.secureserver.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726474AbgKSWPm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 19 Nov 2020 17:15:42 -0500
Received: from p3plcpnl0564.prod.phx3.secureserver.net ([50.62.176.91])
        by : HOSTING RELAY : with ESMTP
        id fsCPkDfeWFpAefsCPkHvuK; Thu, 19 Nov 2020 15:14:41 -0700
X-CMAE-Analysis: v=2.4 cv=aJs1FZxm c=1 sm=1 tr=0 ts=5fb6ee51
 a=enoWsqFKhXaBs5BDtsbzsA==:117 a=dhrM4QDckVN49Kxx3K61fg==:17
 a=9+rZDBEiDlHhcck0kWbJtElFXBc=:19 a=IkcTkHD0fZMA:10 a=nNwsprhYR40A:10
 a=_NlQC1uBnsVzd435jXIA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: a1@tripolho.com
Received: from pool-96-242-17-244.nwrknj.fios.verizon.net ([96.242.17.244]:46516 helo=[192.168.62.65])
        by p3plcpnl0564.prod.phx3.secureserver.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <22t@tripolho.com>)
        id 1kfsCP-0018jm-LE; Thu, 19 Nov 2020 15:14:41 -0700
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
 <427818cf-aa35-54d3-83cf-02529a0ab5aa@tripolho.com>
 <20201119194300.GA582614@rowland.harvard.edu>
From:   Alberto Sentieri <22t@tripolho.com>
Message-ID: <3c7ee33a-643b-0264-6317-d6c4fa70e9f6@tripolho.com>
Date:   Thu, 19 Nov 2020 17:14:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119194300.GA582614@rowland.harvard.edu>
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
X-CMAE-Envelope: MS4xfLjjRSG1j7eZ1HBx142l/sXGrBulSW+SleIkq01z3KnC9B1GfN/8UuHX88JuDeGYS7ZIXLkz2+o05s3K2POHpllp5wR8fDUynTuro7ImOJ25GYys0uIc
 spKGAhFf3hKqI2vTy6Tmu+YvSAn1y8Kz+qG+aTfYTq3/t79FUf17xpayj19vr3fElO0QefX1u7NqTfp+03AcV0hGNyXAn0cRhlj80U+KKCZelGRJugWpGGq7
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/19/20 2:43 PM, Alan Stern wrote:
> On Thu, Nov 19, 2020 at 02:21:47PM -0500, Alberto Sentieri wrote:
>> lsusb -t in a similar configuration I use for development (it has just 6
>> device, and not 36):
>>
>> $ lsusb -t
>> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
>>      |__ Port 3: Dev 5, If 0, Class=Hub, Driver=hub/7p, 480M
>>          |__ Port 1: Dev 6, If 0, Class=Hub, Driver=hub/2p, 480M
>>              |__ Port 1: Dev 8, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
>>          |__ Port 2: Dev 7, If 0, Class=Hub, Driver=hub/2p, 480M
>>              |__ Port 1: Dev 10, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
>>          |__ Port 4: Dev 9, If 0, Class=Hub, Driver=hub/2p, 480M
>>              |__ Port 1: Dev 12, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
>>          |__ Port 5: Dev 11, If 0, Class=Hub, Driver=hub/7p, 480M
>>          |__ Port 6: Dev 13, If 0, Class=Hub, Driver=hub/7p, 480M
>>              |__ Port 6: Dev 15, If 0, Class=Hub, Driver=hub/2p, 480M
>>                  |__ Port 1: Dev 17, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
>>              |__ Port 7: Dev 16, If 0, Class=Hub, Driver=hub/2p, 480M
>>                  |__ Port 1: Dev 18, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
>>          |__ Port 7: Dev 14, If 0, Class=Human Interface Device,
>> Driver=usbhid, 12M
> Previously you said that each HID microcontroller is connected to port 1
> of a two-port hub.  But that clearly isn't true for device 14 in the
> listing above.  What happened there?
The program never talks to that device. It does not try to open it. The 
program has a list of valid interfaces, and if one is not in the list it 
will not be part of the game. Really I sent you a list of 5 devices, 
because one was disconnect when I ran lsusb.

This would be the list with the 6 devices:

/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/4p, 480M
     |__ Port 3: Dev 53, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 1: Dev 54, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 56, If 0, Class=Human Interface Device, 
Driver=, 12M
         |__ Port 2: Dev 55, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 58, If 0, Class=Human Interface Device, 
Driver=, 12M
         |__ Port 3: Dev 57, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 60, If 0, Class=Human Interface Device, 
Driver=, 12M
         |__ Port 4: Dev 59, If 0, Class=Hub, Driver=hub/2p, 480M
             |__ Port 1: Dev 62, If 0, Class=Human Interface Device, 
Driver=, 12M
         |__ Port 5: Dev 61, If 0, Class=Hub, Driver=hub/7p, 480M
         |__ Port 6: Dev 63, If 0, Class=Hub, Driver=hub/7p, 480M
             |__ Port 6: Dev 69, If 0, Class=Hub, Driver=hub/2p, 480M
                 |__ Port 1: Dev 70, If 0, Class=Human Interface Device, 
Driver=, 12M
             |__ Port 7: Dev 66, If 0, Class=Hub, Driver=hub/2p, 480M
                 |__ Port 1: Dev 68, If 0, Class=Human Interface Device, 
Driver=, 12M
         |__ Port 7: Dev 64, If 0, Class=Human Interface Device, 
Driver=usbhid, 12M

Again, device 64 (previous device 14) is not part of the game.

I compiled kernel 5.9.8, which is running, and have other kernels as 
well. I will try to reproduce the problem in my lab. I will let you know 
as soon as I have more information. If I were able to reproduce the 
problem, I will try to use a Beagle USB analyzer at the same time the 
problem occurs.

Thanks,

Alberto
> Alan Stern
>
