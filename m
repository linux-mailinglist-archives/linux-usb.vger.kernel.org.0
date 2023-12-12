Return-Path: <linux-usb+bounces-4087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525080F7F6
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 21:32:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B8C9B20F40
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 20:32:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B111726AE9;
	Tue, 12 Dec 2023 20:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5YHbU7d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29AA1B0
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 12:32:42 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6ce9c8c45a7so3967735b3a.0
        for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 12:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702413161; x=1703017961; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KkA8XT8G6c22FUsyjrbSA3YXPqJWDfWOygO7l8p3rTo=;
        b=S5YHbU7dpvJDUZdsqo62y0Wqw4oqTUV+lYNBQ+2iu/c583qsPzYPVqnhq6x7jMZVvt
         u/MxZ7SDC8syFHJf6wlZLGURysyO64od0FOjlqNRL7Q1OtkAdiah92UBdeNCr0Bs68V/
         YuNxDYIBZ3LFzIkwKu7UAxBn4Uc8fDDJM7CrOc0u+J6ChF4wg5uSRzvXLvDqW1E6zzBc
         2dx51r8bwYFLzcNcQZz04WQVGQICZx+LRmby9dOOKh9j+Uo2va4pZ9pbVOvOGbHypZvz
         UdyeQAsqhxDC6yC0QUM8n1+mmSsjVwdyGBg9tPr7AYFEqlTIAdhdL8rw0t8363VElzTS
         XcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702413161; x=1703017961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkA8XT8G6c22FUsyjrbSA3YXPqJWDfWOygO7l8p3rTo=;
        b=m27vGV7YQ9uHKSrQ1fcG9gRsKPaKrWfb918yLDafVk2u71umzjSVftaqqcPyf9+WRl
         ld4bXui0B7Bkh34Rqa5hO3ITkz8ZhhnNa2GwGBaRpysvVdTGifrkjp29fOEhvRHwd83z
         RUgBumLQnQN2FqSaBX5kNCUx/0NBxqPCLVpkzwKgxUDUAjCqFEk2MIfkc4FdW8lePbXP
         EcV9UDq5q8lxQPPsehT08VL7tZukzBPCfBeMGe9eWBxSw51TVgfVFSIK3yNlYgC3Wu6d
         QtDqFyjj0uFZd9qJ+UNw6SBRHE4iG4jEtNK8q5NBMRpqRLogqh/l97MSMopaq3j3GiSn
         6GFA==
X-Gm-Message-State: AOJu0YyWqDX6y3rq4/32Opbd6VyZbQ1Ks3/khF96aFshSIa5m4vJnf+d
	h1Fqadpy7QzE3rS431AIFmM=
X-Google-Smtp-Source: AGHT+IFg+gQ325DlIx5CYrwYL0kzcHhx/cjJQILQ+vl33u8RdNr3JjxyzKl1h9GcZ0voCwLn9NCKWA==
X-Received: by 2002:a05:6a00:8cc3:b0:6ce:2731:5f7a with SMTP id ij3-20020a056a008cc300b006ce27315f7amr2939577pfb.57.1702413161183;
        Tue, 12 Dec 2023 12:32:41 -0800 (PST)
Received: from hdebian ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b006bdd7cbcf98sm8568360pfo.182.2023.12.12.12.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 12:32:40 -0800 (PST)
Date: Tue, 12 Dec 2023 17:32:22 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Oliver Neukum <oneukum@suse.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
	linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <20231212203222.lxihy34lh22g6d3w@hdebian>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGd-uMNYPNP2FYxPNL3x3RewNVR3VxZhwaii5mhQcQ7wXg@mail.gmail.com>
 <4d046193-afa7-4341-b308-8b475c4e820a@suse.com>

Hi Maciej and Oliver,

On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej Żenczykowski wrote:
> On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > On Thu, Dec 07, 2023 at 08:37:09PM +0100, Maciej Żenczykowski wrote:
> > > On Thu, Dec 7, 2023 at 7:57 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > >
> > > > Hello Oliver and Maciej,
> > > >
> > > > On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> > > > > Can you tell us which side in your test case produces many small packets?
> > > > >
> > > > > Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NSECS in
> > > > > f_ncm.c by an order of magnitude.
> > > >
> > > > The device side, Apalis iMX6, is the one producing the small packages
> > > > and sending to my host PC. The VNC server is running on iMX6 device and,
> > > > the client, on my host PC.
> > > >
> > > > I've decreased TX_TIMEOUT_NSECS from 300000 to 30000, but nothing
> > > > changed, the behaviour is the same.
> > > >
> > > > On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> > > > > That suggests, but does not prove that the issue is on the host side.
> > > > > Could you post the result of "ethtool -S" after a test run? We should
> > > > > get statistics on the reasons for transmissions that way.
> > > >
> > > > Sure, for some reason I couldn't run ethtool on the iMX6 device:
> > > >
> > > > / # ethtool -S usb0
> > > > no stats available
> > > >
> > > > So I ran everything on my Debian host PC. First, without any changes on
> > > > the device's kernel, this is the result (where the VNC is really
> > > > slow/frozen):
> > > >
> > > > $ sudo ethtool -S enx3e5dcdead75e
> > > > NIC statistics:
> > > >      tx_reason_ntb_full: 0
> > > >      tx_reason_ndp_full: 0
> > > >      tx_reason_timeout: 222
> > > >      tx_reason_max_datagram: 0
> > > >      tx_overhead: 42387
> > > >      tx_ntbs: 222
> > > >      rx_overhead: 38375
> > > >      rx_ntbs: 529
> > > >
> > > > Next, I decreased NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE from 16384 to
> > > > 8192. The performance improved a bit, and this is the result:
> > > >
> > > > $ sudo ethtool -S enx42ff68c1000a
> > > > NIC statistics:
> > > >      tx_reason_ntb_full: 0
> > > >      tx_reason_ndp_full: 0
> > > >      tx_reason_timeout: 321
> > > >      tx_reason_max_datagram: 0
> > > >      tx_overhead: 61617
> > > >      tx_ntbs: 321
> > > >      rx_overhead: 59341
> > > >      rx_ntbs: 759
> > > >
> > > > Finally, I changed from 8192 to 4096, and the perfomance was
> > > > better:
> > > >
> > > > $ sudo ethtool -S enx3a601e306de1
> > > > NIC statistics:
> > > >      tx_reason_ntb_full: 0
> > > >      tx_reason_ndp_full: 0
> > > >      tx_reason_timeout: 56067
> > > >      tx_reason_max_datagram: 0
> > > >      tx_overhead: 83630876
> > > >      tx_ntbs: 56064
> > > >      rx_overhead: 25437595
> > > >      rx_ntbs: 847920
> > > >
> > > > At 4096 I can use the VNC with my app, click on buttons and see the mouse
> > > > moving smoothly. Please note the device name changes because we're using
> > > > random MAC addresses. 'ethtool' was running on my Debian host PC. I tested
> > > > for 1min30s and then got the statics with ethtool for all 3 tests.
> > > >
> > > > On Thu, Dec 07, 2023 at 12:38:18PM +0100, Maciej Żenczykowski wrote:
> > > > >
> > > > > An every 1s (the default) ping is too rare to be of help I'd assume...
> > > > > Try ping with various intervals (-i).  All the way down to a flood ping (-f).
> > > > > Most likely -i 0.01 would be enough to make things work better...
> > > >
> > > > This one is interesting, backing to the default value of 16384, I
> > > > launched the VNC client which now is back to be slow/frozen. In
> > > > parallel, I started the ping command. The first one with 1 second
> > > > results the following (I'm pingging my host PC, using my device's
> > > > terminal):
> > > >
> > > > / # ping 192.168.11.2 -i 1
> > > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > > 64 bytes from 192.168.11.2: icmp_seq=1 ttl=64 time=5070 ms
> > > > 64 bytes from 192.168.11.2: icmp_seq=2 ttl=64 time=4003 ms
> > > > 64 bytes from 192.168.11.2: icmp_seq=3 ttl=64 time=2963 ms
> > > > 64 bytes from 192.168.11.2: icmp_seq=4 ttl=64 time=1923 ms
> > > > 64 bytes from 192.168.11.2: icmp_seq=5 ttl=64 time=883 ms
> > > > ^C
> > > > --- 192.168.11.2 ping statistics ---
> > > > 26 packets transmitted, 5 received, 80.7692% packet loss, time 25950ms
> > > > rtt min/avg/max/mdev = 882.886/2968.250/5069.878/1478.425 ms, pipe 5
> > > >
> > > > Ping is really slow and lost almost all packets.
> > >
> > > It is *slow*.  But I don't think you're actually losing packets.
> > > They simply haven't arrived *yet*.
> > > Notice that the packets are sent every second, but they arrive after
> > > ~5/~4/~3/~2/~1 s.
> > > This suggests they all got delivered in one burst.
> > >
> > > You are missing 21 packets, but it's all the *final* 21 packets.
> > > You'd need to run for a long long time (maybe 5 minutes or even more)
> > > and see what happens then...
> > > to see if the packets are indeed lost, or just not yet delivered...
> > >
> >
> > Great, thanks for the explanation. Indeed, I ran the tests again, but
> > now I waited 6 minutes for each test, and these are the results:
> >
> > -i 1
> > --- 192.168.11.2 ping statistics ---
> > 349 packets transmitted, 349 received, 0% packet loss, time 361724ms
> > rtt min/avg/max/mdev = 1.597/10751.276/27960.848/12974.107 ms, pipe 27
> >
> > -i 0.1
> > --- 192.168.11.2 ping statistics ---
> > 3301 packets transmitted, 3294 received, 0.212057% packet loss, time 361342ms
> > rtt min/avg/max/mdev = 0.959/1131.714/3081.504/1385.261 ms, pipe 29
> >
> > -i 0.01
> > --- 192.168.11.2 ping statistics ---
> > 20718 packets transmitted, 20718 received, 0% packet loss, time 366465ms
> > rtt min/avg/max/mdev = 0.568/178.764/587.956/234.702 ms, pipe 29
> >
> > -flood
> > --- 192.168.11.2 ping statistics ---
> > 29173 packets transmitted, 29149 received, 0.0822679% packet loss, time 362065ms
> > rtt min/avg/max/mdev = 0.518/127.472/583.971/204.277 ms, pipe 29, ipg/ewma 12.411/21.570 ms
> >
> > So yes, we can assume 0% of packet loss. Furthermore, I can see the
> > bursts happening on my terminal, the ping command doesn't do anything
> > and suddenly all the pings arrive at the same time, over and over again
> > in a loop.
> 
> Ok, this is great to know.  No loss, just very very high delay.
> 
> > > > Next test, I decreased
> > > > to 0.1s:
> > > >
> > > > / # ping 192.168.11.2 -i 0.1
> > > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > > ...
> > > > --- 192.168.11.2 ping statistics ---
> > > > 129 packets transmitted, 122 received, 5.42636% packet loss, time 13971ms
> > > > rtt min/avg/max/mdev = 1.752/999.274/2751.767/799.248 ms, pipe 26
> > > >
> > > > While ping is running in parallel, VNC has a better performance, I can
> > > > see my mouse running and click on some buttons. As soon as ping stops,
> > > > VNC is slow/frozen again. Also we have less packet loss.
> > >
> > > Again - this packet loss may be just at the tail.
> > > You'd need to run it for much much longer to see if packet loss is high or not.
> > > It may just be that you always lose the last ~7 packets or so...
> > >
> > > >
> > > > Next test, decreased to 0.01:
> > > >
> > > > / # ping 192.168.11.2 -i 0.01
> > > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > > ...
> > > > --- 192.168.11.2 ping statistics ---
> > > > 584 packets transmitted, 572 received, 2.05479% packet loss, time 10106ms
> > > > rtt min/avg/max/mdev = 1.565/171.031/559.872/165.475 ms, pipe 28
> > > >
> > > > And finally, the flood:
> > > >
> > > > / # ping 192.168.11.2 -f
> > > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > > ...
> > > > --- 192.168.11.2 ping statistics ---
> > > > 1314 packets transmitted, 1311 received, 0.22831% packet loss, time 16299ms
> > > > rtt min/avg/max/mdev = 0.729/131.710/548.971/163.098 ms, pipe 28, ipg/ewma
> > > > 12.413/7.802 ms
> > > >
> > > > While the flood is happening in parallel, the VNC runs very smoothly,
> > > > and, again, as soon as it stops, it's back to slow/frozen.
> > > >
> > > > I believe here the ping command is helping to fullfil the buffer, that's
> > > > why running it on parallel makes the VNC work...
> > > >
> > > > > Also which specific versions of the kernel are involved on both sides
> > > > > of the connection.
> > > >
> > > > Device iMX6 is running Linux kernel v6.1.65, while my host PC is running
> > > > Linux kernel v6.5.0.
> > > >
> > > > > There was a pretty recent fix related to packet aggregation recently
> > > > > that could be either the fix or the cause.
> > > > >   "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call"
> > > > > Though I doubt it - I believe that was specific to how windows packs things.
> > > > >
> > > > > Also Krishna Kurapati has a (afaik still not merged) patch "usb:
> > > > > gadget: ncm: Add support to configure wMaxSegmentSize"
> > > > > that could be of use - though again, doubt it.
> > > >
> > > > I could also try to apply these patches and check how it goes. Thanks
> > > > for the information.
> > > >
> > > > > Another thing that comes to mind, is that perhaps the device in
> > > > > question does not have sufficiently high res timers?
> > > > > There might be something in the kernel boot log / dmesg about hrtimer
> > > > > resolution...
> > > > > Maybe this just needs to be configurable...  Or pick a smaller value
> > > > > with broken hrtimer (if that's the issue),
> > > > > or just disable aggregation if lowres hrtimers... etc...
> > > > >
> > > > > #define TX_TIMEOUT_NSECS 300000
> > > > > 300 us is too small to be noticeable by VNC imho, so I think something
> > > > > *must* be misbehaving.
> > > > > Perhaps timer resolution is bad and this 300us ends up being much larger...???
> > > >
> > > > This is what I got from dmesg inside the iMX6 device:
> > > >
> > > > / # dmesg | grep timer
> > > > [    0.000000] Switching to timer-based delay loop, resolution 333ns
> > > > [    0.000019] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
> > > > 0xffffffff, max_idle_ns: 637086815595 ns
> > > > [    0.001545] Calibrating delay loop (skipped), value calculated using
> > > > timer frequency.. 6.00 BogoMIPS (lpj=30000)
> > > > [    0.203469] clocksource: Switched to clocksource mxc_timer1
> > > >
> > > > > I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
> > > > > instead of CLOCK_MONOTONIC.
> > > > > There could potentially be an issue with suspend, though I really doubt it.
> > > >
> > > > Also tested this, but it didn't change anything, VNC is still
> > > > slow/frozen.
> > > >
> > > > > Another idea would be to add a gadget setting to disable tx
> > > > > aggregation entirely...
> > > > > (note that reducing from 8000 to 2000 doesn't actually turn off aggregation...)
> > > > >
> > > > > Have you tried reducing from 8000 to 4000 or 3500 or 3000?
> > > > > Maybe there's some funkiness with page sizes??
> > > >
> > > > Sorry, do you mean reducing the both NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE?
> > >
> > > I'm not sure ;-)
> > >
> > > > If so, I tried to reduce from 16384 to 8192, 4096 and 2048. Everytime I
> > > > reduced the value, it got better and better, VNC running smoothly.
> > > >
> > > > I will keep testing to see if I get something.
> > > >
> > > > Thanks and regards,
> > > > Hiago.
> > >
> > > I think we need to figure out whether the problem is host->device or
> > > device->host.
> > > Or perhaps you do already know this??
> > > Maybe this was mentioned already earlier in the thread and I missed it.
> > >
> >
> > Actually I still don't know yet.
> 
> Heh.
> 
> >
> > > Try reducing only in or only out... and changing only one side of the
> > > connection.
> >
> > I did this test and it was very interesting, thanks for the
> > reccomendation.
> > It looks like only NTB_DEFAULT_IN_SIZE is relevant for
> > this issue. I changed NTB_DEFAULT_IN_SIZE from 16384 to 2048 on the
> > _device_ side (Apalis iMX6) and left the NTB_OUT_SIZE with the default
> > value of 16384, and now I can use my VNC client on the host side (move the
> > mouse, click some buttons...). Very fast and responsive I would say.
> >
> > Does it mean the issue is on the HOST side?
> 
> Well... that's what I would assume based on that, but...
> 
> I think what we've really found is a bug:
>   unsigned max_size = ncm->port.fixed_in_len;
> is I think using fixed_in_len instead of using out_len.
> 
> *OR*
> 
> This is the gadget/device side and IN/OUT are always from the point of
> view of the host.
> ie. IN to the host, so transmitted by the gadget/device.
> 
> It's bound to be one or the other.  And while initially I thought the former,
> I think it's likely the latter.
> I vaguelly recall having run into something with in/out being
> host-relative somewhere before.
> 
> > > Maybe change TX_MAX_NUM_DPE to 1 (or other values)
> > >
> > > Maybe change
> > >
> > > if (ncm->skb_tx_data
> > > && (ncm->ndp_dgram_count >= TX_MAX_NUM_DPE
> > > || (ncm->skb_tx_data->len +
> > > div + rem + skb->len +
> > > ncm->skb_tx_ndp->len + ndp_align + (2 * dgram_idx_len))
> > > > max_size)) {
> > >
> > > to just if (ncm->skb_tx_data)
> >
> > Changing the 'if' statement to only 'if (ncm->skb_tx_data)' also made it
> > work! VNC running smoothly on my VNC client. Again, I applied this patch
> > to the device's kernel, Apalis iMX6.
> 
> Here you modified only the device's tx - basically turning off
> buffering/aggregation.
> (and likely poorly at that since - I think - this approach still ends
> up buffering one packet,
> because it seems to send the previous packet when it gets the next one)
> 
> ...and in general it seems more likely something is busted on the
> device, then on the host...
> 
> > I will put some print debugging here to see if I can figure out
> > something else.
> 
> Everything is pointing towards the timer not firing...
> Perhaps try instrumenting the timer callback to see if it ever runs.
>   ncm_tx_timeout <-- add a printk in here
> See if the timer registration functions aren't returning non-caught errors.
>   hrtimer_try_to_cancel - returns an int - it's not checked. - maybe
> this always claims there's no timer to cancel?
> but afaict:
>   hrtimer_start - does not return anything
>   hrtimer_init - also does not appear to return anything...

I was thinking about the same, the timer is not firing at all. I put the
printk's as suggested, and the ncm_tx_is being triggered. Basically,
when I first turn on my device, the try_to_cancel function is always
returning -1, which means "when the timer is currently executing the
callback function and cannot be stopped".

When I launch my VNC client, a see the following pattern:
[   94.926136] hfranco: hrtimer_start called.
[   94.926259] hfranco: try_to_cancel 1
[   94.926268] hfranco: hrtimer_start called.
[   94.926391] hfranco: try_to_cancel 1

The hrtimer is called and then try_to_cancel returns 1, which means it
was canceled "when the timer was active" (following the function
comment).
So I guess the hrtimer is somehow working as expected (at least being
called).
I also calculated the time between the consecutive messages of timer
started and trying to cancel the timer, and this is what I got:

94.926259 - 94.926136 = 0.000123 seconds
94.926391 - 94.926268 = 0.000123 seconds
94.927548 - 94.926401 = 0.001147 seconds
94.927818 - 94.927585 = 0.000233 seconds
94.928338 - 94.927836 = 0.000502 seconds
94.928590 - 94.928360 = 0.000230 seconds
94.929330 - 94.928608 = 0.000722 seconds
94.929609 - 94.929363 = 0.000246 seconds

I'm not sure how accurate this is, but we can clearly sometimes see it
gets more than 300us.

On Tue, Dec 12, 2023 at 10:48:01AM +0100, Oliver Neukum wrote:
> On 11.12.23 21:44, Maciej Żenczykowski wrote:
> > On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> > > 
> > > On Thu, Dec 07, 2023 at 08:37:09PM +0100, Maciej Żenczykowski wrote:
> > > > On Thu, Dec 7, 2023 at 7:57 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> 
> Hi,
> 
> > > > > On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> > > > > > That suggests, but does not prove that the issue is on the host side.
> > > > > > Could you post the result of "ethtool -S" after a test run? We should
> > > > > > get statistics on the reasons for transmissions that way.
> 
> > > > > Finally, I changed from 8192 to 4096, and the perfomance was
> > > > > better:
> > > > > 
> > > > > $ sudo ethtool -S enx3a601e306de1
> > > > > NIC statistics:
> > > > >       tx_reason_ntb_full: 0
> > > > >       tx_reason_ndp_full: 0
> > > > >       tx_reason_timeout: 56067
> 
> This has grown two orders of magnitude.
> 
> > > > >       tx_reason_max_datagram: 0
> > > > >       tx_overhead: 83630876
> > > > >       tx_ntbs: 56064
> > > > >       rx_overhead: 25437595
> > > > >       rx_ntbs: 847920
> > > > > 
> > > > > At 4096 I can use the VNC with my app, click on buttons and see the mouse
> > > > > moving smoothly. Please note the device name changes because we're using
> > > > > random MAC addresses. 'ethtool' was running on my Debian host PC. I tested
> > > > > for 1min30s and then got the statics with ethtool for all 3 tests.
> 
> As you are testing for a constant time, the increase in transmissions
> due to timeouts also decreases latency by two orders of magnitude.
> Though this does not ultimately tell us which side is responsible.
> > > > > While the flood is happening in parallel, the VNC runs very smoothly,
> > > > > and, again, as soon as it stops, it's back to slow/frozen.
> > > > > 
> > > > > I believe here the ping command is helping to fullfil the buffer, that's
> > > > > why running it on parallel makes the VNC work...
> 
> Indeed. You can confirm this by running "ethool -S" before and after the ping.
> During the ping tx_reason_timeout should stagnate and probably tx_reason_ndp_full
> will go up.
> 
> > > > > > #define TX_TIMEOUT_NSECS 300000
> > > > > > 300 us is too small to be noticeable by VNC imho, so I think something
> > > > > > *must* be misbehaving.
> > > > > > Perhaps timer resolution is bad and this 300us ends up being much larger...???
> 
> Now that you mention it and have taken a closer look I suspect this piece of code:
> 
>         } else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
>                 /* wait for more frames */
>                 /* push variables */
>                 ctx->tx_curr_skb = skb_out;
>                 /* set the pending count */
>                 if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
>                         ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
>                 goto exit_no_skb;
> 
> Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be all the way to 1?
> It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> This applies to the host side.

On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?

Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT and
finally both at the same time, but it didn't help.

I've also put some printks as following:

	ctx->tx_curr_frame_num = n;
	printk("hfranco: tx_curr_frame_num = %d", n);

	if (n == 0) {
		printk("hfranco: n == 0");
		/* wait for more frames */
		/* push variables */
		ctx->tx_curr_skb = skb_out;
		goto exit_no_skb;

	} else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
		printk("hfranco: tx_max_datagrams = %d", ctx->tx_max_datagrams);
		printk("hfranco: timer_interval = %d", ctx->timer_interval);
		printk("hfranco: n inside else if = %d", n);
		/* wait for more frames */
		/* push variables */
		ctx->tx_curr_skb = skb_out;
		/* set the pending count */
		if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
			ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
		goto exit_no_skb;

	} else {
		printk("hfranco: n inside else = %d", n);
		if (n == ctx->tx_max_datagrams)
			ctx->tx_reason_max_datagram++;	/* count reason for transmitting */

I ran it on my host PC, compiled it as module for my Debian dekstop, and
this is the dmesg:

[ 9663.478807] hfranco: tx_curr_frame_num = 1
[ 9663.478816] hfranco: tx_max_datagrams = 40
[ 9663.478818] hfranco: timer_interval = 400000
[ 9663.478820] hfranco: n inside else if = 1
[ 9663.478822] hfranco: timer started
[ 9663.479645] hfranco: tx_curr_frame_num = 1
[ 9663.479652] hfranco: n inside else = 1

And then it basically repeats. Looks like 'n' never passes the 1 value.
By tweaking the flags mentioned before, 'n' got a value of 4, but that
was the maximum value. I was wondering, why do you think this code looks
suspicious? I basically just inserted some printks on the tx side, I
will see if I can get something from the rx as well.

> 
> 	Regards
> 		Oliver

Thanks a lot and regards,
Hiago.

