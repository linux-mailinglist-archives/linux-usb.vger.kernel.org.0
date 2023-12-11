Return-Path: <linux-usb+bounces-3995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4F380DBE8
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 21:45:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97751B2153E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 20:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A6454669;
	Mon, 11 Dec 2023 20:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X5DNuNL9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6766AB5
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 12:45:00 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-54f4a933ddcso3252a12.0
        for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 12:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702327499; x=1702932299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vgzYSrYuKmWKsE184RWXZXs3RfXAtjiMGJJO2qs9VXg=;
        b=X5DNuNL9MwU6I9anJ0YZer3qtOLOVP3RBRC1xOveeUQHaNBDZO2yk7g0eXfnJuFRy9
         NI+32UNzt+p/G706rZc72vV5yKkxKiNZkoobX81hBhTaojlWx0LGpGTTUbAs0qwl1VUt
         DIfYwQqF+/tz+vrz8gGr1PUa9cH2K+EpSuIgSgI0enEPc6EGTQ+iBhyghkXEMAuI2tJq
         yz9kCeATSMUy/WyBF4Xrh/Q+ri2ro96MsDWdHUgW6mJL9SBgsrBZTXmL1bnwOFG2yZpS
         hCXi3eTnCFGDNQZyfNTUeUHOWJnYcLrwYir24VQyjiZcz31dpH0M3HVH4mC9iGqaMejo
         HGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702327499; x=1702932299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vgzYSrYuKmWKsE184RWXZXs3RfXAtjiMGJJO2qs9VXg=;
        b=S8JoFC/retTduoLMSNRZMMU410TuVnYiDEuBaByKyIdL6tLPZJ+O8Yhl+vuIMrcyY1
         MqDAWVBhMQ5gcUXweqwe3CPd559qn514MRQ2c1ts0pQ/4kY9Y+bDu3mkB4/pZhM/w4TK
         Ciwmsi6tCKokvid5K/qv7Qv1jJ55ZYzlR0zWAS73oQ52+PUcM5NCQ41DXZi8K/gwDl/x
         iIemnfH4piuAC19FUsA+kkLOIBJO+ah2YLYZ4RfvInKEa3DufhVbItKylxRohQMqByJQ
         QMLmGwmDcWKPWik1bs6tqQi+R9vuP6V/48Xs4rN50RegKuCVdc91TLzAJ/lc4jmRWkUl
         ea+Q==
X-Gm-Message-State: AOJu0Yzl/YkccgSlJtmi+olTtFs2HahcFXtTtoiUeY1Sj23811u/PVv4
	3iYNdIPNqfiFesJ6esGEwa5Mjnennz+Y/DtClq9gdQ==
X-Google-Smtp-Source: AGHT+IE0U7eZMVbWqT80XG9ZTrT+Bm34wkMHKRX2aONiCh3ONEXGFj33JBIXnbAuNEVjnUScfYc7DaYw2AV6/vFJcMI=
X-Received: by 2002:a50:d7c3:0:b0:54a:ee8b:7a99 with SMTP id
 m3-20020a50d7c3000000b0054aee8b7a99mr256839edj.0.1702327498400; Mon, 11 Dec
 2023 12:44:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com> <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>
 <20231207185712.p6cablxfdh4znbue@hdebian> <CANP3RGevXM03ixg3=c-Bpdbnoz+WTuVtL2KoUzJV-s0MdNk-tw@mail.gmail.com>
 <20231211202847.5egx3vihuaf63s67@hdebian>
In-Reply-To: <20231211202847.5egx3vihuaf63s67@hdebian>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Mon, 11 Dec 2023 12:44:42 -0800
Message-ID: <CANP3RGd-uMNYPNP2FYxPNL3x3RewNVR3VxZhwaii5mhQcQ7wXg@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 12:29=E2=80=AFPM Hiago De Franco <hiagofranco@gmail=
.com> wrote:
>
> On Thu, Dec 07, 2023 at 08:37:09PM +0100, Maciej =C5=BBenczykowski wrote:
> > On Thu, Dec 7, 2023 at 7:57=E2=80=AFPM Hiago De Franco <hiagofranco@gma=
il.com> wrote:
> > >
> > > Hello Oliver and Maciej,
> > >
> > > On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> > > > Can you tell us which side in your test case produces many small pa=
ckets?
> > > >
> > > > Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NS=
ECS in
> > > > f_ncm.c by an order of magnitude.
> > >
> > > The device side, Apalis iMX6, is the one producing the small packages
> > > and sending to my host PC. The VNC server is running on iMX6 device a=
nd,
> > > the client, on my host PC.
> > >
> > > I've decreased TX_TIMEOUT_NSECS from 300000 to 30000, but nothing
> > > changed, the behaviour is the same.
> > >
> > > On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> > > > That suggests, but does not prove that the issue is on the host sid=
e.
> > > > Could you post the result of "ethtool -S" after a test run? We shou=
ld
> > > > get statistics on the reasons for transmissions that way.
> > >
> > > Sure, for some reason I couldn't run ethtool on the iMX6 device:
> > >
> > > / # ethtool -S usb0
> > > no stats available
> > >
> > > So I ran everything on my Debian host PC. First, without any changes =
on
> > > the device's kernel, this is the result (where the VNC is really
> > > slow/frozen):
> > >
> > > $ sudo ethtool -S enx3e5dcdead75e
> > > NIC statistics:
> > >      tx_reason_ntb_full: 0
> > >      tx_reason_ndp_full: 0
> > >      tx_reason_timeout: 222
> > >      tx_reason_max_datagram: 0
> > >      tx_overhead: 42387
> > >      tx_ntbs: 222
> > >      rx_overhead: 38375
> > >      rx_ntbs: 529
> > >
> > > Next, I decreased NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE from 16384 to
> > > 8192. The performance improved a bit, and this is the result:
> > >
> > > $ sudo ethtool -S enx42ff68c1000a
> > > NIC statistics:
> > >      tx_reason_ntb_full: 0
> > >      tx_reason_ndp_full: 0
> > >      tx_reason_timeout: 321
> > >      tx_reason_max_datagram: 0
> > >      tx_overhead: 61617
> > >      tx_ntbs: 321
> > >      rx_overhead: 59341
> > >      rx_ntbs: 759
> > >
> > > Finally, I changed from 8192 to 4096, and the perfomance was
> > > better:
> > >
> > > $ sudo ethtool -S enx3a601e306de1
> > > NIC statistics:
> > >      tx_reason_ntb_full: 0
> > >      tx_reason_ndp_full: 0
> > >      tx_reason_timeout: 56067
> > >      tx_reason_max_datagram: 0
> > >      tx_overhead: 83630876
> > >      tx_ntbs: 56064
> > >      rx_overhead: 25437595
> > >      rx_ntbs: 847920
> > >
> > > At 4096 I can use the VNC with my app, click on buttons and see the m=
ouse
> > > moving smoothly. Please note the device name changes because we're us=
ing
> > > random MAC addresses. 'ethtool' was running on my Debian host PC. I t=
ested
> > > for 1min30s and then got the statics with ethtool for all 3 tests.
> > >
> > > On Thu, Dec 07, 2023 at 12:38:18PM +0100, Maciej =C5=BBenczykowski wr=
ote:
> > > >
> > > > An every 1s (the default) ping is too rare to be of help I'd assume=
...
> > > > Try ping with various intervals (-i).  All the way down to a flood =
ping (-f).
> > > > Most likely -i 0.01 would be enough to make things work better...
> > >
> > > This one is interesting, backing to the default value of 16384, I
> > > launched the VNC client which now is back to be slow/frozen. In
> > > parallel, I started the ping command. The first one with 1 second
> > > results the following (I'm pingging my host PC, using my device's
> > > terminal):
> > >
> > > / # ping 192.168.11.2 -i 1
> > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > 64 bytes from 192.168.11.2: icmp_seq=3D1 ttl=3D64 time=3D5070 ms
> > > 64 bytes from 192.168.11.2: icmp_seq=3D2 ttl=3D64 time=3D4003 ms
> > > 64 bytes from 192.168.11.2: icmp_seq=3D3 ttl=3D64 time=3D2963 ms
> > > 64 bytes from 192.168.11.2: icmp_seq=3D4 ttl=3D64 time=3D1923 ms
> > > 64 bytes from 192.168.11.2: icmp_seq=3D5 ttl=3D64 time=3D883 ms
> > > ^C
> > > --- 192.168.11.2 ping statistics ---
> > > 26 packets transmitted, 5 received, 80.7692% packet loss, time 25950m=
s
> > > rtt min/avg/max/mdev =3D 882.886/2968.250/5069.878/1478.425 ms, pipe =
5
> > >
> > > Ping is really slow and lost almost all packets.
> >
> > It is *slow*.  But I don't think you're actually losing packets.
> > They simply haven't arrived *yet*.
> > Notice that the packets are sent every second, but they arrive after
> > ~5/~4/~3/~2/~1 s.
> > This suggests they all got delivered in one burst.
> >
> > You are missing 21 packets, but it's all the *final* 21 packets.
> > You'd need to run for a long long time (maybe 5 minutes or even more)
> > and see what happens then...
> > to see if the packets are indeed lost, or just not yet delivered...
> >
>
> Great, thanks for the explanation. Indeed, I ran the tests again, but
> now I waited 6 minutes for each test, and these are the results:
>
> -i 1
> --- 192.168.11.2 ping statistics ---
> 349 packets transmitted, 349 received, 0% packet loss, time 361724ms
> rtt min/avg/max/mdev =3D 1.597/10751.276/27960.848/12974.107 ms, pipe 27
>
> -i 0.1
> --- 192.168.11.2 ping statistics ---
> 3301 packets transmitted, 3294 received, 0.212057% packet loss, time 3613=
42ms
> rtt min/avg/max/mdev =3D 0.959/1131.714/3081.504/1385.261 ms, pipe 29
>
> -i 0.01
> --- 192.168.11.2 ping statistics ---
> 20718 packets transmitted, 20718 received, 0% packet loss, time 366465ms
> rtt min/avg/max/mdev =3D 0.568/178.764/587.956/234.702 ms, pipe 29
>
> -flood
> --- 192.168.11.2 ping statistics ---
> 29173 packets transmitted, 29149 received, 0.0822679% packet loss, time 3=
62065ms
> rtt min/avg/max/mdev =3D 0.518/127.472/583.971/204.277 ms, pipe 29, ipg/e=
wma 12.411/21.570 ms
>
> So yes, we can assume 0% of packet loss. Furthermore, I can see the
> bursts happening on my terminal, the ping command doesn't do anything
> and suddenly all the pings arrive at the same time, over and over again
> in a loop.

Ok, this is great to know.  No loss, just very very high delay.

> > > Next test, I decreased
> > > to 0.1s:
> > >
> > > / # ping 192.168.11.2 -i 0.1
> > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > ...
> > > --- 192.168.11.2 ping statistics ---
> > > 129 packets transmitted, 122 received, 5.42636% packet loss, time 139=
71ms
> > > rtt min/avg/max/mdev =3D 1.752/999.274/2751.767/799.248 ms, pipe 26
> > >
> > > While ping is running in parallel, VNC has a better performance, I ca=
n
> > > see my mouse running and click on some buttons. As soon as ping stops=
,
> > > VNC is slow/frozen again. Also we have less packet loss.
> >
> > Again - this packet loss may be just at the tail.
> > You'd need to run it for much much longer to see if packet loss is high=
 or not.
> > It may just be that you always lose the last ~7 packets or so...
> >
> > >
> > > Next test, decreased to 0.01:
> > >
> > > / # ping 192.168.11.2 -i 0.01
> > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > ...
> > > --- 192.168.11.2 ping statistics ---
> > > 584 packets transmitted, 572 received, 2.05479% packet loss, time 101=
06ms
> > > rtt min/avg/max/mdev =3D 1.565/171.031/559.872/165.475 ms, pipe 28
> > >
> > > And finally, the flood:
> > >
> > > / # ping 192.168.11.2 -f
> > > PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> > > ...
> > > --- 192.168.11.2 ping statistics ---
> > > 1314 packets transmitted, 1311 received, 0.22831% packet loss, time 1=
6299ms
> > > rtt min/avg/max/mdev =3D 0.729/131.710/548.971/163.098 ms, pipe 28, i=
pg/ewma
> > > 12.413/7.802 ms
> > >
> > > While the flood is happening in parallel, the VNC runs very smoothly,
> > > and, again, as soon as it stops, it's back to slow/frozen.
> > >
> > > I believe here the ping command is helping to fullfil the buffer, tha=
t's
> > > why running it on parallel makes the VNC work...
> > >
> > > > Also which specific versions of the kernel are involved on both sid=
es
> > > > of the connection.
> > >
> > > Device iMX6 is running Linux kernel v6.1.65, while my host PC is runn=
ing
> > > Linux kernel v6.5.0.
> > >
> > > > There was a pretty recent fix related to packet aggregation recentl=
y
> > > > that could be either the fix or the cause.
> > > >   "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap ca=
ll"
> > > > Though I doubt it - I believe that was specific to how windows pack=
s things.
> > > >
> > > > Also Krishna Kurapati has a (afaik still not merged) patch "usb:
> > > > gadget: ncm: Add support to configure wMaxSegmentSize"
> > > > that could be of use - though again, doubt it.
> > >
> > > I could also try to apply these patches and check how it goes. Thanks
> > > for the information.
> > >
> > > > Another thing that comes to mind, is that perhaps the device in
> > > > question does not have sufficiently high res timers?
> > > > There might be something in the kernel boot log / dmesg about hrtim=
er
> > > > resolution...
> > > > Maybe this just needs to be configurable...  Or pick a smaller valu=
e
> > > > with broken hrtimer (if that's the issue),
> > > > or just disable aggregation if lowres hrtimers... etc...
> > > >
> > > > #define TX_TIMEOUT_NSECS 300000
> > > > 300 us is too small to be noticeable by VNC imho, so I think someth=
ing
> > > > *must* be misbehaving.
> > > > Perhaps timer resolution is bad and this 300us ends up being much l=
arger...???
> > >
> > > This is what I got from dmesg inside the iMX6 device:
> > >
> > > / # dmesg | grep timer
> > > [    0.000000] Switching to timer-based delay loop, resolution 333ns
> > > [    0.000019] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
> > > 0xffffffff, max_idle_ns: 637086815595 ns
> > > [    0.001545] Calibrating delay loop (skipped), value calculated usi=
ng
> > > timer frequency.. 6.00 BogoMIPS (lpj=3D30000)
> > > [    0.203469] clocksource: Switched to clocksource mxc_timer1
> > >
> > > > I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
> > > > instead of CLOCK_MONOTONIC.
> > > > There could potentially be an issue with suspend, though I really d=
oubt it.
> > >
> > > Also tested this, but it didn't change anything, VNC is still
> > > slow/frozen.
> > >
> > > > Another idea would be to add a gadget setting to disable tx
> > > > aggregation entirely...
> > > > (note that reducing from 8000 to 2000 doesn't actually turn off agg=
regation...)
> > > >
> > > > Have you tried reducing from 8000 to 4000 or 3500 or 3000?
> > > > Maybe there's some funkiness with page sizes??
> > >
> > > Sorry, do you mean reducing the both NTB_DEFAULT_IN_SIZE and NTB_OUT_=
SIZE?
> >
> > I'm not sure ;-)
> >
> > > If so, I tried to reduce from 16384 to 8192, 4096 and 2048. Everytime=
 I
> > > reduced the value, it got better and better, VNC running smoothly.
> > >
> > > I will keep testing to see if I get something.
> > >
> > > Thanks and regards,
> > > Hiago.
> >
> > I think we need to figure out whether the problem is host->device or
> > device->host.
> > Or perhaps you do already know this??
> > Maybe this was mentioned already earlier in the thread and I missed it.
> >
>
> Actually I still don't know yet.

Heh.

>
> > Try reducing only in or only out... and changing only one side of the
> > connection.
>
> I did this test and it was very interesting, thanks for the
> reccomendation.
> It looks like only NTB_DEFAULT_IN_SIZE is relevant for
> this issue. I changed NTB_DEFAULT_IN_SIZE from 16384 to 2048 on the
> _device_ side (Apalis iMX6) and left the NTB_OUT_SIZE with the default
> value of 16384, and now I can use my VNC client on the host side (move th=
e
> mouse, click some buttons...). Very fast and responsive I would say.
>
> Does it mean the issue is on the HOST side?

Well... that's what I would assume based on that, but...

I think what we've really found is a bug:
  unsigned max_size =3D ncm->port.fixed_in_len;
is I think using fixed_in_len instead of using out_len.

*OR*

This is the gadget/device side and IN/OUT are always from the point of
view of the host.
ie. IN to the host, so transmitted by the gadget/device.

It's bound to be one or the other.  And while initially I thought the forme=
r,
I think it's likely the latter.
I vaguelly recall having run into something with in/out being
host-relative somewhere before.

> > Maybe change TX_MAX_NUM_DPE to 1 (or other values)
> >
> > Maybe change
> >
> > if (ncm->skb_tx_data
> > && (ncm->ndp_dgram_count >=3D TX_MAX_NUM_DPE
> > || (ncm->skb_tx_data->len +
> > div + rem + skb->len +
> > ncm->skb_tx_ndp->len + ndp_align + (2 * dgram_idx_len))
> > > max_size)) {
> >
> > to just if (ncm->skb_tx_data)
>
> Changing the 'if' statement to only 'if (ncm->skb_tx_data)' also made it
> work! VNC running smoothly on my VNC client. Again, I applied this patch
> to the device's kernel, Apalis iMX6.

Here you modified only the device's tx - basically turning off
buffering/aggregation.
(and likely poorly at that since - I think - this approach still ends
up buffering one packet,
because it seems to send the previous packet when it gets the next one)

...and in general it seems more likely something is busted on the
device, then on the host...

> I will put some print debugging here to see if I can figure out
> something else.

Everything is pointing towards the timer not firing...
Perhaps try instrumenting the timer callback to see if it ever runs.
  ncm_tx_timeout <-- add a printk in here
See if the timer registration functions aren't returning non-caught errors.
  hrtimer_try_to_cancel - returns an int - it's not checked. - maybe
this always claims there's no timer to cancel?
but afaict:
  hrtimer_start - does not return anything
  hrtimer_init - also does not appear to return anything...

