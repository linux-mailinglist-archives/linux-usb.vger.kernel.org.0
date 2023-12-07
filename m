Return-Path: <linux-usb+bounces-3875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE988090D9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 19:57:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B871F28113A
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 18:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E42A4B143;
	Thu,  7 Dec 2023 18:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmQBXUFu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E15210F9
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 10:57:24 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-5c65ca2e1eeso900777a12.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 10:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701975444; x=1702580244; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ss4a7viUlFhbfKaGQ56SzhSKCxKcuewqMzcoBNE6TOo=;
        b=kmQBXUFuHDbip94reYa6YU2gbciUD6UBhIjnLGMQS/sgorFFT1cyaL3+k7AiPz8lyX
         u8hRsVhe0EN/3ngQS/v0BEUFRM2YSVk6iPwX41h0cXKDYO6KMupBF5rdjcB+R3qSnwSS
         2SU5TU3IKhOWicBZiqaZAVNl7i8RBcDFpEibMCM6ptRM2CuC/UUgo/j0xJPBEoWqwoQ3
         3royRVEtrgBFwfH/hR+6ycsMgQrayO6+ZF6TzbZGBz5elxQyVwckXBVZvmFm/9kYGSrs
         1OFERt+gVAnJeimmonwK1mASr65Pj0FKKc6LC59SzxDO2Hpga/ZLQzMwXIvnMnB2szFl
         naog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701975444; x=1702580244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ss4a7viUlFhbfKaGQ56SzhSKCxKcuewqMzcoBNE6TOo=;
        b=lUXw/VIEZNE6nb1yS7PcH33Q1Cvn4KA2wZOE6M3JIHTaILhEYVSJbZk+0GK+p2pFrB
         Mz9tX0ph/P9TXjpM3D0ZPzME9AYpZ126EJrmkm0CWpeBAgH9a+XzDVDX8Ol3aMSGb68Z
         7cTK4ZnGlJcXjCBeMi0Fbr17XdJGWzk/VcpC9zS1TDWduPOQP3fe1atm6U5uM9BP60LO
         4nF3A0WCxwXNZC2nF69EJFSUMe7HrtNP50FPoXSFKjEKAqww3sag/0H2ODR1XvhJhmTK
         FunNa2e/hP+PblZxDl/DVPM1q2fKpWeqMDUBbtnZh0hsvLKgIUCdIIW8MItnu1L+1rxs
         8RaQ==
X-Gm-Message-State: AOJu0YxRZedJAKek226ck6UHDo9IlybWz2Bgao0znMgW1bvzUfJKzcyv
	bWmhDd5G1o1tV6JL1vmdHhM=
X-Google-Smtp-Source: AGHT+IFfaktWbTkNVmnMiXAjy9s6sSQjGxYuUUTopWlT/d2C9cyb31L05MKJVqY3PY2lENF2AGqcDw==
X-Received: by 2002:a17:90b:38cc:b0:286:c5ae:5264 with SMTP id nn12-20020a17090b38cc00b00286c5ae5264mr2514746pjb.31.1701975443877;
        Thu, 07 Dec 2023 10:57:23 -0800 (PST)
Received: from hdebian ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id pa8-20020a17090b264800b0027df6ff00eesm254716pjb.19.2023.12.07.10.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:57:23 -0800 (PST)
Date: Thu, 7 Dec 2023 15:57:12 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Hiago De Franco <hiagofranco@gmail.com>, davem@davemloft.net,
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
	linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <20231207185712.p6cablxfdh4znbue@hdebian>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
 <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>

Hello Oliver and Maciej,

On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> Can you tell us which side in your test case produces many small packets?
> 
> Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NSECS in
> f_ncm.c by an order of magnitude.

The device side, Apalis iMX6, is the one producing the small packages
and sending to my host PC. The VNC server is running on iMX6 device and,
the client, on my host PC.

I've decreased TX_TIMEOUT_NSECS from 300000 to 30000, but nothing
changed, the behaviour is the same.

On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> That suggests, but does not prove that the issue is on the host side.
> Could you post the result of "ethtool -S" after a test run? We should
> get statistics on the reasons for transmissions that way.

Sure, for some reason I couldn't run ethtool on the iMX6 device:

/ # ethtool -S usb0
no stats available

So I ran everything on my Debian host PC. First, without any changes on
the device's kernel, this is the result (where the VNC is really
slow/frozen):

$ sudo ethtool -S enx3e5dcdead75e
NIC statistics:
     tx_reason_ntb_full: 0
     tx_reason_ndp_full: 0
     tx_reason_timeout: 222
     tx_reason_max_datagram: 0
     tx_overhead: 42387
     tx_ntbs: 222
     rx_overhead: 38375
     rx_ntbs: 529

Next, I decreased NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE from 16384 to
8192. The performance improved a bit, and this is the result:

$ sudo ethtool -S enx42ff68c1000a
NIC statistics:
     tx_reason_ntb_full: 0
     tx_reason_ndp_full: 0
     tx_reason_timeout: 321
     tx_reason_max_datagram: 0
     tx_overhead: 61617
     tx_ntbs: 321
     rx_overhead: 59341
     rx_ntbs: 759

Finally, I changed from 8192 to 4096, and the perfomance was 
better:

$ sudo ethtool -S enx3a601e306de1
NIC statistics:
     tx_reason_ntb_full: 0
     tx_reason_ndp_full: 0
     tx_reason_timeout: 56067
     tx_reason_max_datagram: 0
     tx_overhead: 83630876
     tx_ntbs: 56064
     rx_overhead: 25437595
     rx_ntbs: 847920

At 4096 I can use the VNC with my app, click on buttons and see the mouse
moving smoothly. Please note the device name changes because we're using
random MAC addresses. 'ethtool' was running on my Debian host PC. I tested
for 1min30s and then got the statics with ethtool for all 3 tests.

On Thu, Dec 07, 2023 at 12:38:18PM +0100, Maciej Żenczykowski wrote:
> 
> An every 1s (the default) ping is too rare to be of help I'd assume...
> Try ping with various intervals (-i).  All the way down to a flood ping (-f).
> Most likely -i 0.01 would be enough to make things work better...

This one is interesting, backing to the default value of 16384, I
launched the VNC client which now is back to be slow/frozen. In
parallel, I started the ping command. The first one with 1 second
results the following (I'm pingging my host PC, using my device's
terminal):

/ # ping 192.168.11.2 -i 1
PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
64 bytes from 192.168.11.2: icmp_seq=1 ttl=64 time=5070 ms
64 bytes from 192.168.11.2: icmp_seq=2 ttl=64 time=4003 ms
64 bytes from 192.168.11.2: icmp_seq=3 ttl=64 time=2963 ms
64 bytes from 192.168.11.2: icmp_seq=4 ttl=64 time=1923 ms
64 bytes from 192.168.11.2: icmp_seq=5 ttl=64 time=883 ms
^C
--- 192.168.11.2 ping statistics ---
26 packets transmitted, 5 received, 80.7692% packet loss, time 25950ms
rtt min/avg/max/mdev = 882.886/2968.250/5069.878/1478.425 ms, pipe 5

Ping is really slow and lost almost all packets. Next test, I decreased
to 0.1s:

/ # ping 192.168.11.2 -i 0.1
PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
...
--- 192.168.11.2 ping statistics ---
129 packets transmitted, 122 received, 5.42636% packet loss, time 13971ms
rtt min/avg/max/mdev = 1.752/999.274/2751.767/799.248 ms, pipe 26

While ping is running in parallel, VNC has a better performance, I can
see my mouse running and click on some buttons. As soon as ping stops,
VNC is slow/frozen again. Also we have less packet loss.

Next test, decreased to 0.01:

/ # ping 192.168.11.2 -i 0.01
PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
...
--- 192.168.11.2 ping statistics ---
584 packets transmitted, 572 received, 2.05479% packet loss, time 10106ms
rtt min/avg/max/mdev = 1.565/171.031/559.872/165.475 ms, pipe 28

And finally, the flood:

/ # ping 192.168.11.2 -f
PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
...
--- 192.168.11.2 ping statistics ---
1314 packets transmitted, 1311 received, 0.22831% packet loss, time 16299ms
rtt min/avg/max/mdev = 0.729/131.710/548.971/163.098 ms, pipe 28, ipg/ewma
12.413/7.802 ms

While the flood is happening in parallel, the VNC runs very smoothly,
and, again, as soon as it stops, it's back to slow/frozen.

I believe here the ping command is helping to fullfil the buffer, that's
why running it on parallel makes the VNC work...

> Also which specific versions of the kernel are involved on both sides
> of the connection.

Device iMX6 is running Linux kernel v6.1.65, while my host PC is running
Linux kernel v6.5.0.

> There was a pretty recent fix related to packet aggregation recently
> that could be either the fix or the cause.
>   "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call"
> Though I doubt it - I believe that was specific to how windows packs things.
> 
> Also Krishna Kurapati has a (afaik still not merged) patch "usb:
> gadget: ncm: Add support to configure wMaxSegmentSize"
> that could be of use - though again, doubt it.

I could also try to apply these patches and check how it goes. Thanks
for the information.

> Another thing that comes to mind, is that perhaps the device in
> question does not have sufficiently high res timers?
> There might be something in the kernel boot log / dmesg about hrtimer
> resolution...
> Maybe this just needs to be configurable...  Or pick a smaller value
> with broken hrtimer (if that's the issue),
> or just disable aggregation if lowres hrtimers... etc...
> 
> #define TX_TIMEOUT_NSECS 300000
> 300 us is too small to be noticeable by VNC imho, so I think something
> *must* be misbehaving.
> Perhaps timer resolution is bad and this 300us ends up being much larger...???

This is what I got from dmesg inside the iMX6 device:

/ # dmesg | grep timer
[    0.000000] Switching to timer-based delay loop, resolution 333ns
[    0.000019] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 637086815595 ns
[    0.001545] Calibrating delay loop (skipped), value calculated using
timer frequency.. 6.00 BogoMIPS (lpj=30000)
[    0.203469] clocksource: Switched to clocksource mxc_timer1

> I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
> instead of CLOCK_MONOTONIC.
> There could potentially be an issue with suspend, though I really doubt it.

Also tested this, but it didn't change anything, VNC is still
slow/frozen.

> Another idea would be to add a gadget setting to disable tx
> aggregation entirely...
> (note that reducing from 8000 to 2000 doesn't actually turn off aggregation...)
> 
> Have you tried reducing from 8000 to 4000 or 3500 or 3000?
> Maybe there's some funkiness with page sizes??

Sorry, do you mean reducing the both NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE?

If so, I tried to reduce from 16384 to 8192, 4096 and 2048. Everytime I
reduced the value, it got better and better, VNC running smoothly.

I will keep testing to see if I get something.

Thanks and regards,
Hiago.

