Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C091B545C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2020 07:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgDWFrT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Apr 2020 01:47:19 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53500 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgDWFrP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Apr 2020 01:47:15 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <matthew.ruffell@canonical.com>)
        id 1jRUhd-0005QS-1x
        for linux-usb@vger.kernel.org; Thu, 23 Apr 2020 05:47:13 +0000
Received: by mail-pl1-f200.google.com with SMTP id w7so3878277ply.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2020 22:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ot2HtEfliGd8kj0tyPfLQEV3MTVqS9GO1dUH0PUjJ5g=;
        b=ucV1IB7Pd2fE9QsvAc+Bl8Dvjms9srXwgVrbPsycP6BagW8GfshqRL19VoCQlxkf4l
         45PVIXVnXiGMAMlCDBhpy/TZj8e4TtwK4YMM+wNWGmU2b20wG/lW2yziZw+nt9uC/zvM
         Lqs1n2J5gnVLSadZIYK/3X1YTG/DsXvKSbumPynwNiXGvtmuzgshq3QCUU1M6b2PGf0P
         8hdOwM5ojNu9VYQjGdqLX5QSB3XPRQJ7Q43RX1MCYGdvzg/sPNgyWl54Td8i8tkEeU80
         Z7x/Gv/o5NLwt1Mu94vWcf1HTRG9fBi2ZHv6575NbTHM0MkN8zlMYrAtWqpyV8JsnPYF
         3S2A==
X-Gm-Message-State: AGi0PuYeIEogt0IocXG0z8KSta4XBzV1F7TqEPYGWWWo12slKk2uypfy
        5o9kYAsfeHlEGutDW65NZMw2S9ybpq9j/Fcefbs350cA/a3Qeg7PKt164Ieo3IvohUE8ImEsXkS
        167R8h0Ih866Uvo/G+a8tZEIrCRcSAnX+QMd+NA==
X-Received: by 2002:a17:902:599b:: with SMTP id p27mr443676pli.193.1587620831468;
        Wed, 22 Apr 2020 22:47:11 -0700 (PDT)
X-Google-Smtp-Source: APiQypJP4iSYeZVwRsocgHHaHJtofpSDzqOU2qN0KieudHOle/oDEoXIkG+nm1uBje1EVs+mbm7qlQ==
X-Received: by 2002:a17:902:599b:: with SMTP id p27mr443646pli.193.1587620830990;
        Wed, 22 Apr 2020 22:47:10 -0700 (PDT)
Received: from [192.168.1.107] (222-154-99-146-fibre.sparkbb.co.nz. [222.154.99.146])
        by smtp.gmail.com with ESMTPSA id i25sm1333137pfo.196.2020.04.22.22.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 22:47:10 -0700 (PDT)
Subject: Re: [PROBLEM]: Infinite warm reset loops resulting in "Cannot enable.
 Maybe the USB cable is bad?" messages
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     dann.frazier@canonical.com, heitor.de.siqueira@canonical.com
References: <cd36bf27-fc7b-9a22-7065-2fabb8e89674@canonical.com>
 <7620fe19-cd6c-528d-2bc2-dd5a3be3973a@linux.intel.com>
From:   Matthew Ruffell <matthew.ruffell@canonical.com>
Message-ID: <80a1c2ae-4377-dfef-dd0b-97662a0e736a@canonical.com>
Date:   Thu, 23 Apr 2020 17:47:05 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7620fe19-cd6c-528d-2bc2-dd5a3be3973a@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mathias,

Thanks for responding.

On 21/04/20 7:37 pm, Mathias Nyman wrote:

> There are no USB3 devices enumerated.
> 
> Do any of the devices connected to the hub support USB 3 speeds (5Gbps or faster)?
> If not, could you add one the hub hub?
> Unlike other devices USB 3 hubs will enumerate as both USB 2.0 and USB 3 devices. 
> 
> Looks like the USB 3 part of the hub is not working correctly.

Interesting. Looking at the general overview of this system:

There is only one hub, an Intel PCH LBG-1, which has
-- 2x USB 3.0 ports connected to 2x USB 3.0 ports in the front of the chassis
-- 2x USB 3.0 ports connected to 2x USB 3.0 ports in the back of the chassis
-- 2x USB 3.0 ports connected to 2x USB 3.0 ports on the motherboard itself
-- 1x USB 2.0 port connected to the BMC (AST2500) 

A USB 3 hub is connected to a USB 3 port on the back of the chassis with a USB 3 cable, 
and this hub contains many devices.

There was a previous incident with the same hardware where a "bad" USB 3 cable
caused a similar warm reset loop. The symptoms were the same, with the infinite
warm resets on usb2-port2, and logs filled with "Cannot enable. Maybe the USB cable is bad?"
messages. One of my colleagues looked into a usbmon dump, and came up with the
following analysis:

The driver starts by inquiring the current port status with a GET_STATUS request:
ID TIME SOURCE DEST PROT LEN INFO
35 0.624266 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
36 0.624280 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2]

Frame 36 responds with [Port Status: 0x0340, PORT_POWER, PORT_LOW_SPEED]. When
taking bits 5-8 from 0x340, we get '0xA'. According to "Table 10-13. Port Status
Field, wPortStatus" from the USB specification, this corresponds to Compliance
Mode.

The driver then issues a Warm Reset. According to "7.5.5.2 Exit from
Compliance Mode", a Warm Reset shall transition the port to Rx.Detect.
ID TIME SOURCE DEST PROT LEN INFO
37 0.624299 host 2.1.0 USBHUB 64 SET_FEATURE Request [Port 2: BH_PORT_RESET]
38 0.624321 2.1.0 host USBHUB 64 SET_FEATURE Response [Port 2: BH_PORT_RESET]

What follows is the driver querying the port status for the C_PORT_RESET
flag. This flag is responsible for indicating the port is done with the Warm
Reset, and operation can proceed from the Rx.Detect state:
ID TIME SOURCE DEST PROT LEN INFO
39 0.683989 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
40 0.684015 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x350 | Port Change: 0x0)
41 0.743988 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
42 0.744012 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x2f0 | Port Change: 0x0)
43 0.951986 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
44 0.952011 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x2f0 | Port Change: 0x0)
45 1.159985 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
46 1.160010 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x2f0 | Port Change: 0x0)
49 1.367981 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
50 1.368010 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x340 | Port Change: 0x30)

In frame 40, the Port Status changes to 0x350 by setting PORT_RESET,
acknowledging the Warm Reset request. It then changes to 0x2f0 in frame 42,
which corresponds to the Polling state. The C_PORT_RESET flag is still not set,
so we shouldn't be transitioning to this state yet! (we need to end in Rx.Detect)
At last in frame 50, the Port Change flag is set to 0x30, corresponding to the
C_PORT_RESET bit. The Port Status is now back to 0x340, indicating the port is
back to Compliance Mode.

The driver then clears the Port Change flags, and starts issuing the Warm Reset
again. This repeats until PORT_RESET_TRIES, which is 5 for the Bionic
kernel. This process is also the cause of all the log spam, since even without
debug information this section of the driver has a lot of messages.
ID TIME SOURCE DEST PROT LEN INFO
51 1.368020 host 2.1.0 USBHUB 64 CLEAR_FEATURE Request [Port 2: C_PORT_RESET]
52 1.368031 2.1.0 host USBHUB 64 CLEAR_FEATURE Response [Port 2: C_PORT_RESET]
53 1.368035 host 2.1.0 USBHUB 64 CLEAR_FEATURE Request [Port 2: C_BH_PORT_RESET]
54 1.368045 2.1.0 host USBHUB 64 CLEAR_FEATURE Response [Port 2: C_BH_PORT_RESET]
55 1.368049 host 2.1.0 USBHUB 64 CLEAR_FEATURE Request [Port 2: C_PORT_LINK_STATE]
56 1.368058 2.1.0 host USBHUB 64 CLEAR_FEATURE Response [Port 2: C_PORT_LINK_STATE]
57 1.368062 host 2.1.0 USBHUB 64 CLEAR_FEATURE Request [Port 2: C_PORT_CONNECTION]
58 1.368071 2.1.0 host USBHUB 64 CLEAR_FEATURE Response [Port 2: C_PORT_CONNECTION]
59 1.368074 host 2.1.0 USBHUB 64 GET_STATUS Request [Port 2]
60 1.368085 2.1.0 host USBHUB 68 GET_STATUS Response [Port 2] (Port Status: 0x340 | Port Change: 0x0)
61 1.368093 host 2.1.0 USBHUB 64 SET_FEATURE Request [Port 2: BH_PORT_RESET]
62 1.368100 2.1.0 host USBHUB 64 SET_FEATURE Response [Port 2: BH_PORT_RESET]

The thing is, the technicians swapped out the USB 3 cable which connected one of the
rear USB 3 ports to the USB 3 hub with many devices for a different cable from a
different manufacturer. The problem vanished, and it was assumed to be a bad batch
of cables.

The problem returned again when the before mentioned patch was backported to the Ubuntu
kernel, and caused this "regression". 

> 
> My guess is that without the patch the USB 3 part of the hub is not working either. 
> Patch probably helps hub driver discover there is a USB 3 device in a SS_INVALID link
> state in the first place, and starts recovering it by warm resetting it.
> 

You may very well be right, considering our previous experience with the "bad" USB 3 cable.
How can we determine which device might be in this SS_INVALID link state? Should we do
another usbmon binary dump with a recent mainline kernel and go from there?

If the current warm reset regression is the same as what we previously saw when there was
a "bad" USB cable, does the non-compliant behaviour indicate that this is a hardware problem
and not a kernel problem?

> If it's an external hub can you try connecting some other USB 3 device first to a 
> USB 3 roothub port, and then the hub to another USB 3 roothub port?
> 
> This way the USB 3 roothub (bus) should not be suspended when the USB 3 hub is connected.
> Does that help, or change anything

Unfortunately no one has physical access to the server at the moment due to the lockdown,
and we only have remote ssh access. We will try this out once the technicians have access
to their offices again.

Again, thank you for your help.

Matthew
