Return-Path: <linux-usb+bounces-3994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 576D180DB9B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 21:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A60ACB21513
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 20:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EB1853E1C;
	Mon, 11 Dec 2023 20:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+4mle0W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 076B7FD
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 12:29:05 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d098b87eeeso43216105ad.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 12:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702326544; x=1702931344; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dfKBDoe9UUf/htIEAOWu0ldwk6OORtDll86+S4+r1d4=;
        b=M+4mle0WMzm+gwtGggD0dS2cMoXQagQGTtsHqjubdrU5vnnYg+vNDA6g9fyQvOhjNw
         Xa+/eJwC2j9WDGCFbjphgAXlp4iBsLQIEarUsZFHd+Ub9mGLoAj3Mw5fSxcY5kU7eYpJ
         wkX9U6FJfgj5djLS47GlsA/RjYhMNpwNDs79fxAtfG/CwJCiwfWFyB1WHMO/WZriMjfB
         N30NCXeyXot/ViHyNqURXbnLyK96FifGLqMLLApp34v032Oynmxj477QAa7miecXo2Tb
         ZW6QE7uwVvG1Uy4krquwTA45NfF3ssXobgLZXpMMCd+qc/hHyBGf2oGv0Uzr5J8svzyg
         eHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702326544; x=1702931344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dfKBDoe9UUf/htIEAOWu0ldwk6OORtDll86+S4+r1d4=;
        b=BmcaAkWeNWVoOOVLi4tFGeQYHuAPZx3qHp0Gfhgr4U44YdVySMUAbz0+NEP/d3ZpUj
         4rRuMkH9zyyub2I0d9LqOsbb2LIHeUELE8/CtFNjI2rKXZtbcLApCMXW9ZjbVKI03ho5
         PB23+CUdskoepWJkymFx2pM8M+xivq6Ealna9OQFSb/H5BSOr+lp0EW9ougcFJ0ZuWlp
         zxFT9gMNUOW5APIJJz6mUjhaEdQltIqPNpLPQWVJeJbHlX1B4NTB/As5gj0ftJscrpVi
         Pf8RJyMNI/y8vj3w0TIQ2CR2IPhRGNQnqbqKK39NH4N0S7lgOOilmcTwZ1bDIN8SN6ZQ
         j3eA==
X-Gm-Message-State: AOJu0YxMFPL53kS1GgYWQt/S14JmRPYZ0SEqK0+ZTKC4Avxi1TvZRZJM
	aUu38H8FwidxFEnTRHu1EFNA+kqst/QlEqwn
X-Google-Smtp-Source: AGHT+IFQ8OqgIc3t/Svsl+dBPCmVKg0eVO0TX8q3zzVYwNZ1UPz08NDWvRjvuPJLNY/dn2+0Ac5dHQ==
X-Received: by 2002:a17:902:b708:b0:1d0:cae6:eea1 with SMTP id d8-20020a170902b70800b001d0cae6eea1mr4710097pls.83.1702326543970;
        Mon, 11 Dec 2023 12:29:03 -0800 (PST)
Received: from hdebian ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id j4-20020a170902da8400b001d072591d77sm7075964plx.247.2023.12.11.12.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 12:29:03 -0800 (PST)
Date: Mon, 11 Dec 2023 17:28:47 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
	linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <20231211202847.5egx3vihuaf63s67@hdebian>
References: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
 <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>
 <20231207185712.p6cablxfdh4znbue@hdebian>
 <CANP3RGevXM03ixg3=c-Bpdbnoz+WTuVtL2KoUzJV-s0MdNk-tw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGevXM03ixg3=c-Bpdbnoz+WTuVtL2KoUzJV-s0MdNk-tw@mail.gmail.com>

On Thu, Dec 07, 2023 at 08:37:09PM +0100, Maciej Żenczykowski wrote:
> On Thu, Dec 7, 2023 at 7:57 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > Hello Oliver and Maciej,
> >
> > On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> > > Can you tell us which side in your test case produces many small packets?
> > >
> > > Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NSECS in
> > > f_ncm.c by an order of magnitude.
> >
> > The device side, Apalis iMX6, is the one producing the small packages
> > and sending to my host PC. The VNC server is running on iMX6 device and,
> > the client, on my host PC.
> >
> > I've decreased TX_TIMEOUT_NSECS from 300000 to 30000, but nothing
> > changed, the behaviour is the same.
> >
> > On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> > > That suggests, but does not prove that the issue is on the host side.
> > > Could you post the result of "ethtool -S" after a test run? We should
> > > get statistics on the reasons for transmissions that way.
> >
> > Sure, for some reason I couldn't run ethtool on the iMX6 device:
> >
> > / # ethtool -S usb0
> > no stats available
> >
> > So I ran everything on my Debian host PC. First, without any changes on
> > the device's kernel, this is the result (where the VNC is really
> > slow/frozen):
> >
> > $ sudo ethtool -S enx3e5dcdead75e
> > NIC statistics:
> >      tx_reason_ntb_full: 0
> >      tx_reason_ndp_full: 0
> >      tx_reason_timeout: 222
> >      tx_reason_max_datagram: 0
> >      tx_overhead: 42387
> >      tx_ntbs: 222
> >      rx_overhead: 38375
> >      rx_ntbs: 529
> >
> > Next, I decreased NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE from 16384 to
> > 8192. The performance improved a bit, and this is the result:
> >
> > $ sudo ethtool -S enx42ff68c1000a
> > NIC statistics:
> >      tx_reason_ntb_full: 0
> >      tx_reason_ndp_full: 0
> >      tx_reason_timeout: 321
> >      tx_reason_max_datagram: 0
> >      tx_overhead: 61617
> >      tx_ntbs: 321
> >      rx_overhead: 59341
> >      rx_ntbs: 759
> >
> > Finally, I changed from 8192 to 4096, and the perfomance was
> > better:
> >
> > $ sudo ethtool -S enx3a601e306de1
> > NIC statistics:
> >      tx_reason_ntb_full: 0
> >      tx_reason_ndp_full: 0
> >      tx_reason_timeout: 56067
> >      tx_reason_max_datagram: 0
> >      tx_overhead: 83630876
> >      tx_ntbs: 56064
> >      rx_overhead: 25437595
> >      rx_ntbs: 847920
> >
> > At 4096 I can use the VNC with my app, click on buttons and see the mouse
> > moving smoothly. Please note the device name changes because we're using
> > random MAC addresses. 'ethtool' was running on my Debian host PC. I tested
> > for 1min30s and then got the statics with ethtool for all 3 tests.
> >
> > On Thu, Dec 07, 2023 at 12:38:18PM +0100, Maciej Żenczykowski wrote:
> > >
> > > An every 1s (the default) ping is too rare to be of help I'd assume...
> > > Try ping with various intervals (-i).  All the way down to a flood ping (-f).
> > > Most likely -i 0.01 would be enough to make things work better...
> >
> > This one is interesting, backing to the default value of 16384, I
> > launched the VNC client which now is back to be slow/frozen. In
> > parallel, I started the ping command. The first one with 1 second
> > results the following (I'm pingging my host PC, using my device's
> > terminal):
> >
> > / # ping 192.168.11.2 -i 1
> > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > 64 bytes from 192.168.11.2: icmp_seq=1 ttl=64 time=5070 ms
> > 64 bytes from 192.168.11.2: icmp_seq=2 ttl=64 time=4003 ms
> > 64 bytes from 192.168.11.2: icmp_seq=3 ttl=64 time=2963 ms
> > 64 bytes from 192.168.11.2: icmp_seq=4 ttl=64 time=1923 ms
> > 64 bytes from 192.168.11.2: icmp_seq=5 ttl=64 time=883 ms
> > ^C
> > --- 192.168.11.2 ping statistics ---
> > 26 packets transmitted, 5 received, 80.7692% packet loss, time 25950ms
> > rtt min/avg/max/mdev = 882.886/2968.250/5069.878/1478.425 ms, pipe 5
> >
> > Ping is really slow and lost almost all packets.
> 
> It is *slow*.  But I don't think you're actually losing packets.
> They simply haven't arrived *yet*.
> Notice that the packets are sent every second, but they arrive after
> ~5/~4/~3/~2/~1 s.
> This suggests they all got delivered in one burst.
> 
> You are missing 21 packets, but it's all the *final* 21 packets.
> You'd need to run for a long long time (maybe 5 minutes or even more)
> and see what happens then...
> to see if the packets are indeed lost, or just not yet delivered...
>

Great, thanks for the explanation. Indeed, I ran the tests again, but
now I waited 6 minutes for each test, and these are the results:

-i 1
--- 192.168.11.2 ping statistics ---
349 packets transmitted, 349 received, 0% packet loss, time 361724ms
rtt min/avg/max/mdev = 1.597/10751.276/27960.848/12974.107 ms, pipe 27

-i 0.1
--- 192.168.11.2 ping statistics ---
3301 packets transmitted, 3294 received, 0.212057% packet loss, time 361342ms
rtt min/avg/max/mdev = 0.959/1131.714/3081.504/1385.261 ms, pipe 29

-i 0.01
--- 192.168.11.2 ping statistics ---
20718 packets transmitted, 20718 received, 0% packet loss, time 366465ms
rtt min/avg/max/mdev = 0.568/178.764/587.956/234.702 ms, pipe 29

-flood
--- 192.168.11.2 ping statistics ---
29173 packets transmitted, 29149 received, 0.0822679% packet loss, time 362065ms
rtt min/avg/max/mdev = 0.518/127.472/583.971/204.277 ms, pipe 29, ipg/ewma 12.411/21.570 ms

So yes, we can assume 0% of packet loss. Furthermore, I can see the
bursts happening on my terminal, the ping command doesn't do anything
and suddenly all the pings arrive at the same time, over and over again
in a loop.

> > Next test, I decreased
> > to 0.1s:
> >
> > / # ping 192.168.11.2 -i 0.1
> > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > ...
> > --- 192.168.11.2 ping statistics ---
> > 129 packets transmitted, 122 received, 5.42636% packet loss, time 13971ms
> > rtt min/avg/max/mdev = 1.752/999.274/2751.767/799.248 ms, pipe 26
> >
> > While ping is running in parallel, VNC has a better performance, I can
> > see my mouse running and click on some buttons. As soon as ping stops,
> > VNC is slow/frozen again. Also we have less packet loss.
> 
> Again - this packet loss may be just at the tail.
> You'd need to run it for much much longer to see if packet loss is high or not.
> It may just be that you always lose the last ~7 packets or so...
> 
> >
> > Next test, decreased to 0.01:
> >
> > / # ping 192.168.11.2 -i 0.01
> > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > ...
> > --- 192.168.11.2 ping statistics ---
> > 584 packets transmitted, 572 received, 2.05479% packet loss, time 10106ms
> > rtt min/avg/max/mdev = 1.565/171.031/559.872/165.475 ms, pipe 28
> >
> > And finally, the flood:
> >
> > / # ping 192.168.11.2 -f
> > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > ...
> > --- 192.168.11.2 ping statistics ---
> > 1314 packets transmitted, 1311 received, 0.22831% packet loss, time 16299ms
> > rtt min/avg/max/mdev = 0.729/131.710/548.971/163.098 ms, pipe 28, ipg/ewma
> > 12.413/7.802 ms
> >
> > While the flood is happening in parallel, the VNC runs very smoothly,
> > and, again, as soon as it stops, it's back to slow/frozen.
> >
> > I believe here the ping command is helping to fullfil the buffer, that's
> > why running it on parallel makes the VNC work...
> >
> > > Also which specific versions of the kernel are involved on both sides
> > > of the connection.
> >
> > Device iMX6 is running Linux kernel v6.1.65, while my host PC is running
> > Linux kernel v6.5.0.
> >
> > > There was a pretty recent fix related to packet aggregation recently
> > > that could be either the fix or the cause.
> > >   "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call"
> > > Though I doubt it - I believe that was specific to how windows packs things.
> > >
> > > Also Krishna Kurapati has a (afaik still not merged) patch "usb:
> > > gadget: ncm: Add support to configure wMaxSegmentSize"
> > > that could be of use - though again, doubt it.
> >
> > I could also try to apply these patches and check how it goes. Thanks
> > for the information.
> >
> > > Another thing that comes to mind, is that perhaps the device in
> > > question does not have sufficiently high res timers?
> > > There might be something in the kernel boot log / dmesg about hrtimer
> > > resolution...
> > > Maybe this just needs to be configurable...  Or pick a smaller value
> > > with broken hrtimer (if that's the issue),
> > > or just disable aggregation if lowres hrtimers... etc...
> > >
> > > #define TX_TIMEOUT_NSECS 300000
> > > 300 us is too small to be noticeable by VNC imho, so I think something
> > > *must* be misbehaving.
> > > Perhaps timer resolution is bad and this 300us ends up being much larger...???
> >
> > This is what I got from dmesg inside the iMX6 device:
> >
> > / # dmesg | grep timer
> > [    0.000000] Switching to timer-based delay loop, resolution 333ns
> > [    0.000019] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
> > 0xffffffff, max_idle_ns: 637086815595 ns
> > [    0.001545] Calibrating delay loop (skipped), value calculated using
> > timer frequency.. 6.00 BogoMIPS (lpj=30000)
> > [    0.203469] clocksource: Switched to clocksource mxc_timer1
> >
> > > I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
> > > instead of CLOCK_MONOTONIC.
> > > There could potentially be an issue with suspend, though I really doubt it.
> >
> > Also tested this, but it didn't change anything, VNC is still
> > slow/frozen.
> >
> > > Another idea would be to add a gadget setting to disable tx
> > > aggregation entirely...
> > > (note that reducing from 8000 to 2000 doesn't actually turn off aggregation...)
> > >
> > > Have you tried reducing from 8000 to 4000 or 3500 or 3000?
> > > Maybe there's some funkiness with page sizes??
> >
> > Sorry, do you mean reducing the both NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE?
> 
> I'm not sure ;-)
> 
> > If so, I tried to reduce from 16384 to 8192, 4096 and 2048. Everytime I
> > reduced the value, it got better and better, VNC running smoothly.
> >
> > I will keep testing to see if I get something.
> >
> > Thanks and regards,
> > Hiago.
> 
> I think we need to figure out whether the problem is host->device or
> device->host.
> Or perhaps you do already know this??
> Maybe this was mentioned already earlier in the thread and I missed it.
> 

Actually I still don't know yet.

> Try reducing only in or only out... and changing only one side of the
> connection.

I did this test and it was very interesting, thanks for the
reccomendation. 
It looks like only NTB_DEFAULT_IN_SIZE is relevant for
this issue. I changed NTB_DEFAULT_IN_SIZE from 16384 to 2048 on the
_device_ side (Apalis iMX6) and left the NTB_OUT_SIZE with the default
value of 16384, and now I can use my VNC client on the host side (move the
mouse, click some buttons...). Very fast and responsive I would say.

Does it mean the issue is on the HOST side?

> Maybe change TX_MAX_NUM_DPE to 1 (or other values)
> 
> Maybe change
> 
> if (ncm->skb_tx_data
> && (ncm->ndp_dgram_count >= TX_MAX_NUM_DPE
> || (ncm->skb_tx_data->len +
> div + rem + skb->len +
> ncm->skb_tx_ndp->len + ndp_align + (2 * dgram_idx_len))
> > max_size)) {
> 
> to just if (ncm->skb_tx_data)

Changing the 'if' statement to only 'if (ncm->skb_tx_data)' also made it
work! VNC running smoothly on my VNC client. Again, I applied this patch
to the device's kernel, Apalis iMX6.

I will put some print debugging here to see if I can figure out
something else.

Thanks a lot,
Hiago.

