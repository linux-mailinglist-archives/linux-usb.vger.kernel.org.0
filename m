Return-Path: <linux-usb+bounces-3876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD1F809191
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 20:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 708581C209D5
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 19:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E704F897;
	Thu,  7 Dec 2023 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BDYMxHCb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 187A8173D
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 11:37:28 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so1869a12.0
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 11:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701977846; x=1702582646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAnHyJZ5YM+87le3UEkvCLpZzmXTlPtRZpjRKLqwFzs=;
        b=BDYMxHCbRgFwY1lP56hjco76mXWinpF09wvjOha34bqHTLLuF+OPt//b7m4ysaumAU
         fXxLJ8I9P3kuAqBWizS8sFFE6ODhuqiEBU+MLdzPLH1BqAlU4VJszxLKduHyB9tZgCA2
         tFuvlOlzmTWDs6eVjjSxLkseCWdjEtRDYDARwm598W0gF57L5/40UXN0/ATJek76rjEj
         +K5Kx3sEu98jF7V/TW9TgU/yx0rK48B3SQAYtJTLRJQb3KuBqv0Y75hJZntpX3vwASyI
         YwEIfSDLybcHqfvMprRy3GL375R6OFXr8BK9DuvcLeMQ+mWkOVvV1xDQtUXzFnonveNe
         J3wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701977846; x=1702582646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAnHyJZ5YM+87le3UEkvCLpZzmXTlPtRZpjRKLqwFzs=;
        b=RA35FpIcEQa1MI1sljHLcbaj44a1gGKcwtX4vz09Gfed5Uk2GdpaS+sd4q+cedB8s8
         ejs0MJtNcbQvRdBgZr4RJuGpJ+63Iso19HuuRrBGfDRuIulBLcqN3K2u/wmlZV3ASAQp
         hElEO6W0cY+vfqq+yqIhQitbmIE9e6xw90HC7q9VDfYQkCbMhScTUVvMBtA7+8YASYB0
         9r7eMd9s3DmpkA2mkSEsr5tEJmJfDYB9Hwv5+Z5NyxuBgX4q4UgwtlO6qnt6LYbcy+4U
         4vHgig02hgdEBAd+gD07ae3jl8yQBxWw9Ml6X8+eVjq246HKhDzXPCPpXMGmIh523hup
         IODg==
X-Gm-Message-State: AOJu0YwcS6CVG5DTix5WUxiyOpi5stm4ZlL/kbQ0JoFs8eO9F3goE5o/
	6hz14NJrFF+cS5td7TPXwJg21B3sV6w52DFvkYHyPw==
X-Google-Smtp-Source: AGHT+IEd64KL05YYKaG0eW8e4vP7rn1slZ0Un8MvPUV3oMaGO9EqaHsRolZ7/f8QBMPRHiGRoOSWMfuYjboh5ZXLNZ8=
X-Received: by 2002:a50:9f6e:0:b0:54c:794b:875b with SMTP id
 b101-20020a509f6e000000b0054c794b875bmr6332edf.1.1701977846259; Thu, 07 Dec
 2023 11:37:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com> <CANP3RGdr+snVzp2exMEzcd2PPQy8rOEL5PzpfXAEztdpZ8NK0g@mail.gmail.com>
 <20231207185712.p6cablxfdh4znbue@hdebian>
In-Reply-To: <20231207185712.p6cablxfdh4znbue@hdebian>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Thu, 7 Dec 2023 20:37:09 +0100
Message-ID: <CANP3RGevXM03ixg3=c-Bpdbnoz+WTuVtL2KoUzJV-s0MdNk-tw@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 7:57=E2=80=AFPM Hiago De Franco <hiagofranco@gmail.c=
om> wrote:
>
> Hello Oliver and Maciej,
>
> On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:
> > Can you tell us which side in your test case produces many small packet=
s?
> >
> > Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NSECS =
in
> > f_ncm.c by an order of magnitude.
>
> The device side, Apalis iMX6, is the one producing the small packages
> and sending to my host PC. The VNC server is running on iMX6 device and,
> the client, on my host PC.
>
> I've decreased TX_TIMEOUT_NSECS from 300000 to 30000, but nothing
> changed, the behaviour is the same.
>
> On Thu, Dec 07, 2023 at 12:07:25PM +0100, Oliver Neukum wrote:
> > That suggests, but does not prove that the issue is on the host side.
> > Could you post the result of "ethtool -S" after a test run? We should
> > get statistics on the reasons for transmissions that way.
>
> Sure, for some reason I couldn't run ethtool on the iMX6 device:
>
> / # ethtool -S usb0
> no stats available
>
> So I ran everything on my Debian host PC. First, without any changes on
> the device's kernel, this is the result (where the VNC is really
> slow/frozen):
>
> $ sudo ethtool -S enx3e5dcdead75e
> NIC statistics:
>      tx_reason_ntb_full: 0
>      tx_reason_ndp_full: 0
>      tx_reason_timeout: 222
>      tx_reason_max_datagram: 0
>      tx_overhead: 42387
>      tx_ntbs: 222
>      rx_overhead: 38375
>      rx_ntbs: 529
>
> Next, I decreased NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE from 16384 to
> 8192. The performance improved a bit, and this is the result:
>
> $ sudo ethtool -S enx42ff68c1000a
> NIC statistics:
>      tx_reason_ntb_full: 0
>      tx_reason_ndp_full: 0
>      tx_reason_timeout: 321
>      tx_reason_max_datagram: 0
>      tx_overhead: 61617
>      tx_ntbs: 321
>      rx_overhead: 59341
>      rx_ntbs: 759
>
> Finally, I changed from 8192 to 4096, and the perfomance was
> better:
>
> $ sudo ethtool -S enx3a601e306de1
> NIC statistics:
>      tx_reason_ntb_full: 0
>      tx_reason_ndp_full: 0
>      tx_reason_timeout: 56067
>      tx_reason_max_datagram: 0
>      tx_overhead: 83630876
>      tx_ntbs: 56064
>      rx_overhead: 25437595
>      rx_ntbs: 847920
>
> At 4096 I can use the VNC with my app, click on buttons and see the mouse
> moving smoothly. Please note the device name changes because we're using
> random MAC addresses. 'ethtool' was running on my Debian host PC. I teste=
d
> for 1min30s and then got the statics with ethtool for all 3 tests.
>
> On Thu, Dec 07, 2023 at 12:38:18PM +0100, Maciej =C5=BBenczykowski wrote:
> >
> > An every 1s (the default) ping is too rare to be of help I'd assume...
> > Try ping with various intervals (-i).  All the way down to a flood ping=
 (-f).
> > Most likely -i 0.01 would be enough to make things work better...
>
> This one is interesting, backing to the default value of 16384, I
> launched the VNC client which now is back to be slow/frozen. In
> parallel, I started the ping command. The first one with 1 second
> results the following (I'm pingging my host PC, using my device's
> terminal):
>
> / # ping 192.168.11.2 -i 1
> PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> 64 bytes from 192.168.11.2: icmp_seq=3D1 ttl=3D64 time=3D5070 ms
> 64 bytes from 192.168.11.2: icmp_seq=3D2 ttl=3D64 time=3D4003 ms
> 64 bytes from 192.168.11.2: icmp_seq=3D3 ttl=3D64 time=3D2963 ms
> 64 bytes from 192.168.11.2: icmp_seq=3D4 ttl=3D64 time=3D1923 ms
> 64 bytes from 192.168.11.2: icmp_seq=3D5 ttl=3D64 time=3D883 ms
> ^C
> --- 192.168.11.2 ping statistics ---
> 26 packets transmitted, 5 received, 80.7692% packet loss, time 25950ms
> rtt min/avg/max/mdev =3D 882.886/2968.250/5069.878/1478.425 ms, pipe 5
>
> Ping is really slow and lost almost all packets.

It is *slow*.  But I don't think you're actually losing packets.
They simply haven't arrived *yet*.
Notice that the packets are sent every second, but they arrive after
~5/~4/~3/~2/~1 s.
This suggests they all got delivered in one burst.

You are missing 21 packets, but it's all the *final* 21 packets.
You'd need to run for a long long time (maybe 5 minutes or even more)
and see what happens then...
to see if the packets are indeed lost, or just not yet delivered...

> Next test, I decreased
> to 0.1s:
>
> / # ping 192.168.11.2 -i 0.1
> PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> ...
> --- 192.168.11.2 ping statistics ---
> 129 packets transmitted, 122 received, 5.42636% packet loss, time 13971ms
> rtt min/avg/max/mdev =3D 1.752/999.274/2751.767/799.248 ms, pipe 26
>
> While ping is running in parallel, VNC has a better performance, I can
> see my mouse running and click on some buttons. As soon as ping stops,
> VNC is slow/frozen again. Also we have less packet loss.

Again - this packet loss may be just at the tail.
You'd need to run it for much much longer to see if packet loss is high or =
not.
It may just be that you always lose the last ~7 packets or so...

>
> Next test, decreased to 0.01:
>
> / # ping 192.168.11.2 -i 0.01
> PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> ...
> --- 192.168.11.2 ping statistics ---
> 584 packets transmitted, 572 received, 2.05479% packet loss, time 10106ms
> rtt min/avg/max/mdev =3D 1.565/171.031/559.872/165.475 ms, pipe 28
>
> And finally, the flood:
>
> / # ping 192.168.11.2 -f
> PING 192.168.11.2 (192.168.11.2) 56(84) bytes of data.
> ...
> --- 192.168.11.2 ping statistics ---
> 1314 packets transmitted, 1311 received, 0.22831% packet loss, time 16299=
ms
> rtt min/avg/max/mdev =3D 0.729/131.710/548.971/163.098 ms, pipe 28, ipg/e=
wma
> 12.413/7.802 ms
>
> While the flood is happening in parallel, the VNC runs very smoothly,
> and, again, as soon as it stops, it's back to slow/frozen.
>
> I believe here the ping command is helping to fullfil the buffer, that's
> why running it on parallel makes the VNC work...
>
> > Also which specific versions of the kernel are involved on both sides
> > of the connection.
>
> Device iMX6 is running Linux kernel v6.1.65, while my host PC is running
> Linux kernel v6.5.0.
>
> > There was a pretty recent fix related to packet aggregation recently
> > that could be either the fix or the cause.
> >   "usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call"
> > Though I doubt it - I believe that was specific to how windows packs th=
ings.
> >
> > Also Krishna Kurapati has a (afaik still not merged) patch "usb:
> > gadget: ncm: Add support to configure wMaxSegmentSize"
> > that could be of use - though again, doubt it.
>
> I could also try to apply these patches and check how it goes. Thanks
> for the information.
>
> > Another thing that comes to mind, is that perhaps the device in
> > question does not have sufficiently high res timers?
> > There might be something in the kernel boot log / dmesg about hrtimer
> > resolution...
> > Maybe this just needs to be configurable...  Or pick a smaller value
> > with broken hrtimer (if that's the issue),
> > or just disable aggregation if lowres hrtimers... etc...
> >
> > #define TX_TIMEOUT_NSECS 300000
> > 300 us is too small to be noticeable by VNC imho, so I think something
> > *must* be misbehaving.
> > Perhaps timer resolution is bad and this 300us ends up being much large=
r...???
>
> This is what I got from dmesg inside the iMX6 device:
>
> / # dmesg | grep timer
> [    0.000000] Switching to timer-based delay loop, resolution 333ns
> [    0.000019] clocksource: mxc_timer1: mask: 0xffffffff max_cycles:
> 0xffffffff, max_idle_ns: 637086815595 ns
> [    0.001545] Calibrating delay loop (skipped), value calculated using
> timer frequency.. 6.00 BogoMIPS (lpj=3D30000)
> [    0.203469] clocksource: Switched to clocksource mxc_timer1
>
> > I wonder if the hrtimer_init() call should be with CLOCK_BOOTTIME
> > instead of CLOCK_MONOTONIC.
> > There could potentially be an issue with suspend, though I really doubt=
 it.
>
> Also tested this, but it didn't change anything, VNC is still
> slow/frozen.
>
> > Another idea would be to add a gadget setting to disable tx
> > aggregation entirely...
> > (note that reducing from 8000 to 2000 doesn't actually turn off aggrega=
tion...)
> >
> > Have you tried reducing from 8000 to 4000 or 3500 or 3000?
> > Maybe there's some funkiness with page sizes??
>
> Sorry, do you mean reducing the both NTB_DEFAULT_IN_SIZE and NTB_OUT_SIZE=
?

I'm not sure ;-)

> If so, I tried to reduce from 16384 to 8192, 4096 and 2048. Everytime I
> reduced the value, it got better and better, VNC running smoothly.
>
> I will keep testing to see if I get something.
>
> Thanks and regards,
> Hiago.

I think we need to figure out whether the problem is host->device or
device->host.
Or perhaps you do already know this??
Maybe this was mentioned already earlier in the thread and I missed it.

Try reducing only in or only out... and changing only one side of the
connection.
Maybe change TX_MAX_NUM_DPE to 1 (or other values)

Maybe change

if (ncm->skb_tx_data
&& (ncm->ndp_dgram_count >=3D TX_MAX_NUM_DPE
|| (ncm->skb_tx_data->len +
div + rem + skb->len +
ncm->skb_tx_ndp->len + ndp_align + (2 * dgram_idx_len))
> max_size)) {

to just if (ncm->skb_tx_data)

