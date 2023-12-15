Return-Path: <linux-usb+bounces-4225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E81B815205
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 22:44:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CFE51F243E2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 21:44:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BA8482ED;
	Fri, 15 Dec 2023 21:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEKyc9pu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C113358B0
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 21:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-54744e66d27so3684a12.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702676681; x=1703281481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IvoaTCHQB6m2X17NpTDNaTvh2i4TVhNSwNiho0jhKxg=;
        b=MEKyc9puBxEwIltRJx2hfmbzub2J/UBw9biTtkMnss91iFNq9Ljo2mYRD07sBoCYVm
         Di4lT3uXH8vvEWvkBa010qmcFHwIewQ6Rz+N6dgYqb3az9L0HNsC97iCpk1lSLwTJxl5
         WR5dshXWZ0lmLfScT7AfFbu+vtk6JUoumDCF3Boqx4DDZZfhyDcR12l1qNpO5rlzPp7g
         QRqAUpcWQZK0Yxbcev4c7wJU1DL1np6bz0JZhO4NQGIPVlQQ28SWUOlkRv308K8879Su
         nTcBhEkO0NF9mSniJHi31q/SWduJlQML4oJZjIBUTORBGiIDmzQtDby8bw7w7MwdeFs1
         NPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702676681; x=1703281481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvoaTCHQB6m2X17NpTDNaTvh2i4TVhNSwNiho0jhKxg=;
        b=jInEvep65AtHfojBp2WRSPXvXSmJSBAicZsvtBikzXrqbS7wCzNCw5+6Mf6+zm16/W
         z120iFbn5rNaD09Wfy0+x4VUEmvRioZc5vGOqnvdV22uW+ex2BM39JW04MWSoF061Wvl
         aP75K2KsJLMSloM+Nerq/lUtzQn6B2KwyEoxGDyFBrLQDqdY5taVxG2pL7DCnS4Fd6sw
         18W4LZTtzT4RuwGOhb1eccQ4hYANAzJ8dnZ5wP7BOTPpcYqRZGJ1lqhXcq0bbMxBreER
         65nJaxGQDvxrUBkvKA1H4qEx2V2JAibDbfzKg1CiVQuLrTf/IRyLiMOW1Uz84GyilJy+
         jLmw==
X-Gm-Message-State: AOJu0YzEP5THWDZcWSx5V4+3aoXcNvQ+ak7+mbm/cRdKviylGMWf5rfr
	9jZqXGbSnSxOD7MShnOK80DGVAtCsmK/UVH526Tg+DX4dIvw
X-Google-Smtp-Source: AGHT+IFOPwKgHaaFecQceJHrkoPOUp73tHhJU433RVr3RTbfxd/xRG3nE7ACDzgy5ZO93qsuJ9vTs9HqkpyUkzZj4TI=
X-Received: by 2002:a50:cdc6:0:b0:551:9870:472 with SMTP id
 h6-20020a50cdc6000000b0055198700472mr22796edj.1.1702676680838; Fri, 15 Dec
 2023 13:44:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
 <CANP3RGdOT9rrBai+uuTZCo7JPyeEbh_u+vu6VD7t_Z80nfAn1Q@mail.gmail.com> <20231215212023.pas6tem7ekd2zcf6@hdebian>
In-Reply-To: <20231215212023.pas6tem7ekd2zcf6@hdebian>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Fri, 15 Dec 2023 13:44:29 -0800
Message-ID: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>, Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net, 
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org, 
	linux-usb@vger.kernel.org, pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 1:20=E2=80=AFPM Hiago De Franco <hiagofranco@gmail.=
com> wrote:
>
> Hi Oliver and Maciej,
>
> Sorry for the delay on my message. I took some time to set up some
> debugging tools, hoping to find something more interesting. I couldn't
> find too much I guess, but I will describe the results here.

No worries.

> First, I set up ftrace to track 'package_for_tx' function. My idea would
> be that I would see the delays between two consecutives calls of this
> function being more than 300us, this would say the code wasn't
> respecting the hrtimer. The trace log looks something like that:

Here's my recommendation.
On the gadget side.
Print something when the timer is armed.
Print something when the timer fires.
Include the timestamp.

Then try to send something (a single packet) that won't trigger a reply.

For example run a script in a screen session that sends 1 unsolicited
arp reply packet every 10 seconds.
This is rare enough, it should obviously get the timer to fire.
Again, wait 5 minutes, so you've had 30+ packets sent.
See if it does even fire...
You can run tcpdump on the receiver to see what you receive (and the
timestamps on that)


>
> # tracer: function
> #
> # entries-in-buffer/entries-written: 468/468   #P:2
> #
> #                                _-----=3D> irqs-off/BH-disabled
> #                               / _----=3D> need-resched
> #                              | / _---=3D> hardirq/softirq
> #                              || / _--=3D> preempt-depth
> #                              ||| / _-=3D> migrate-disable
> #                              |||| /     delay
> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
> #              | |         |   |||||     |         |
>             tezi-237     [001] dns..   101.030667: package_for_tx <-ncm_w=
rap_ntb
>           <idle>-0       [000] d.s..   101.032771: package_for_tx <-ncm_w=
rap_ntb
>           weston-228     [001] d.s..   101.039430: package_for_tx <-ncm_w=
rap_ntb
>             tezi-237     [000] d.s..   101.041634: package_for_tx <-ncm_w=
rap_ntb
>           <idle>-0       [001] d.s..   101.042326: package_for_tx <-ncm_w=
rap_ntb
>           <idle>-0       [001] d.s..   101.055665: package_for_tx <-ncm_w=
rap_ntb
>           weston-231     [001] d.s..   101.057779: package_for_tx <-ncm_w=
rap_ntb
>           <idle>-0       [001] d.s..   101.068630: package_for_tx <-ncm_w=
rap_ntb
>           weston-231     [001] d.s..   101.085738: package_for_tx <-ncm_w=
rap_ntb
>             tezi-237     [000] D.s..   101.088611: package_for_tx <-ncm_w=
rap_ntb
>
> So I created a simple script to calculate the delta time between two
> consecutive calls and give me at the end how many of them are above
> 300us. This is the result:
>
> Total timestamps above 300 microseconds: 440 of 742
> Percentage of timestamps above 300 microseconds: 59.30%
>
> Then I decided to lower down the TX_MAX_NUM_DPE from 32 to 0.
> 0 and 4 made the VNC runs smooth. I've also tested 8 and 16, but these
> two didn't help. Again, by setting the number to 0, this is the result:
>
> Total timestamps above 300 microseconds: 3149 of 65420
> Percentage of timestamps above 300 microseconds: 4.81%
>
> Of course we also have more packages, as the VNC is working and it's not
> frozen. It's interesting how fast this is now, but as discussed with a
> coleague, we don't know if this tells much. There are more latencies
> envolved, for example from the scheduler, so probably the result is not
> showing me anything valuable.
>
> My second test was trying to figure out how TX_MAX_NUM_DPE was
> impacting my issue, so I added two printks to check the number it was
> getting and when it was being zeroed.
>
> /* Delay for the transmit to wait before sending an unfilled NTB frame. *=
/
>  #define TX_TIMEOUT_NSECS       300000
> @@ -964,6 +964,7 @@ static struct sk_buff *package_for_tx(struct f_ncm *n=
cm)
>         /* Set the final NDP wLength */
>         new_len =3D opts->ndp_size +
>                         (ncm->ndp_dgram_count * dgram_idx_len);
> +       printk("hfranco: package_for_tx called, setting ndp_dram_count to=
 0");
>         ncm->ndp_dgram_count =3D 0;
>         /* Increment from start to wLength */
>         ntb_iter =3D (void *) ncm->skb_tx_ndp->data;
> @@ -1027,6 +1028,8 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *=
port,
>                  * ready for new data.
>                  * NOTE: Assume maximum align for speed of calculation.
>                  */
> +
> +               printk("hfranco: ncm->ndp_dgram_count =3D %d", ncm->ndp_d=
gram_count);
>                 if (ncm->skb_tx_data
>                     && (ncm->ndp_dgram_count >=3D TX_MAX_NUM_DPE
>                     || (ncm->skb_tx_data->len +
>
> This is the result:
>
> [ 6613.034304] hfranco: package_for_tx called, setting ndp_dram_count to =
0
> [ 6613.034783] hfranco: ncm->ndp_dgram_count =3D 0
> [ 6613.034812] hfranco: ncm->ndp_dgram_count =3D 2
> [ 6613.034823] hfranco: ncm->ndp_dgram_count =3D 3
> [ 6613.034835] hfranco: ncm->ndp_dgram_count =3D 4
> [ 6613.034844] hfranco: ncm->ndp_dgram_count =3D 5
> [ 6613.034855] hfranco: ncm->ndp_dgram_count =3D 6
> [ 6613.034865] hfranco: ncm->ndp_dgram_count =3D 7
> [ 6613.034874] hfranco: ncm->ndp_dgram_count =3D 8
> [ 6613.034884] hfranco: ncm->ndp_dgram_count =3D 9
> [ 6613.034895] hfranco: ncm->ndp_dgram_count =3D 10
> [ 6613.034905] hfranco: ncm->ndp_dgram_count =3D 11
> [ 6613.034914] hfranco: package_for_tx called, setting ndp_dram_count to =
0
> [ 6613.035266] hfranco: ncm->ndp_dgram_count =3D 2
> [ 6613.035281] hfranco: ncm->ndp_dgram_count =3D 3
> [ 6613.035292] hfranco: ncm->ndp_dgram_count =3D 4
> [ 6613.035301] hfranco: ncm->ndp_dgram_count =3D 5
> [ 6613.035310] hfranco: ncm->ndp_dgram_count =3D 6
> [ 6613.035320] hfranco: ncm->ndp_dgram_count =3D 7
> [ 6613.035329] hfranco: ncm->ndp_dgram_count =3D 8
> [ 6613.035339] hfranco: ncm->ndp_dgram_count =3D 9
> [ 6613.035350] hfranco: ncm->ndp_dgram_count =3D 10
> [ 6613.035360] hfranco: ncm->ndp_dgram_count =3D 11
> [ 6613.035366] hfranco: package_for_tx called, setting ndp_dram_count to =
0
>
> So, in general the value never passes 10 or 11, from all the test I done
> with the VNC. As said earlier, by putting 4 made the VNC work:
>
> [   17.333014] hfranco: package_for_tx called, setting ndp_dram_count to =
0
> [   17.333065] hfranco: ncm->ndp_dgram_count =3D 2
> [   17.333079] hfranco: ncm->ndp_dgram_count =3D 3
> [   17.333105] hfranco: ncm->ndp_dgram_count =3D 4
> [   17.333114] hfranco: package_for_tx called, setting ndp_dram_count to =
0
> [   17.333161] hfranco: ncm->ndp_dgram_count =3D 2
> [   17.333173] hfranco: ncm->ndp_dgram_count =3D 3
> [   17.333184] hfranco: ncm->ndp_dgram_count =3D 4
> [   17.333191] hfranco: package_for_tx called, setting ndp_dram_count to =
0
> [   17.333235] hfranco: ncm->ndp_dgram_count =3D 2
> [   17.333259] hfranco: ncm->ndp_dgram_count =3D 3
> [   17.333271] hfranco: ncm->ndp_dgram_count =3D 4
>
> On Tue, Dec 12, 2023 at 10:21:13PM +0100, Oliver Neukum wrote:
> > On 12.12.23 21:32, Hiago De Franco wrote:
> >
> > Hi,
> >
> > > On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej =C5=BBenczykowski wr=
ote:
> > > > On Mon, Dec 11, 2023 at 12:29=E2=80=AFPM Hiago De Franco <hiagofran=
co@gmail.com> wrote:
> >
> > > > Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be=
 all the way to 1?
> > > > It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> > > > This applies to the host side.
> > >
> > > On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
> > > mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?
> >
> > Yes, I meant that. Sorry.
> >
> > > Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
> > > CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> > > CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT an=
d
> > > finally both at the same time, but it didn't help.
> > >
> > > I've also put some printks as following:
> > >
> > >     ctx->tx_curr_frame_num =3D n;
> > >     printk("hfranco: tx_curr_frame_num =3D %d", n);
> > >
> > >     if (n =3D=3D 0) {
> > >             printk("hfranco: n =3D=3D 0");
> > >             /* wait for more frames */
> > >             /* push variables */
> > >             ctx->tx_curr_skb =3D skb_out;
> > >             goto exit_no_skb;
> > >
> > >     } else if ((n < ctx->tx_max_datagrams) && (ready2send =3D=3D 0) &=
& (ctx->timer_interval > 0)) {
> > >             printk("hfranco: tx_max_datagrams =3D %d", ctx->tx_max_da=
tagrams);
> > >             printk("hfranco: timer_interval =3D %d", ctx->timer_inter=
val);
> > >             printk("hfranco: n inside else if =3D %d", n);
> > >             /* wait for more frames */
> > >             /* push variables */
> > >             ctx->tx_curr_skb =3D skb_out;
> > >             /* set the pending count */
> > >             if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> > >                     ctx->tx_timer_pending =3D CDC_NCM_TIMER_PENDING_C=
NT;
> > >             goto exit_no_skb;
> > >
> > >     } else {
> > >             printk("hfranco: n inside else =3D %d", n);
> > >             if (n =3D=3D ctx->tx_max_datagrams)
> > >                     ctx->tx_reason_max_datagram++;  /* count reason f=
or transmitting */
> > >
> > > I ran it on my host PC, compiled it as module for my Debian dekstop, =
and
> > > this is the dmesg:
> > >
> > > [ 9663.478807] hfranco: tx_curr_frame_num =3D 1
> > > [ 9663.478816] hfranco: tx_max_datagrams =3D 40
> > > [ 9663.478818] hfranco: timer_interval =3D 400000
> > > [ 9663.478820] hfranco: n inside else if =3D 1
> > > [ 9663.478822] hfranco: timer started
> > > [ 9663.479645] hfranco: tx_curr_frame_num =3D 1
> > > [ 9663.479652] hfranco: n inside else =3D 1
> > >
> > > And then it basically repeats. Looks like 'n' never passes the 1 valu=
e.
> > > By tweaking the flags mentioned before, 'n' got a value of 4, but tha=
t
> > > was the maximum value. I was wondering, why do you think this code lo=
oks
> > > suspicious? I basically just inserted some printks on the tx side, I
> > > will see if I can get something from the rx as well.
> >
> > If we look at the statistics you initially gathered, we can see that al=
l transmissions
> > on the host side happen because the timeout elapses. That, however, doe=
s
> > _not_ tell us that the host is to blame. We could look at two possible =
scenarios
> >
> > A - the gadget is bundling up the packets with too much delay and the h=
ost
> > just answers to the megatransmissions with one packet and the delay on =
the host
> > is inconsequential
> >
> > B - the timer on the host runs for too long or sometimes not at all. If=
 that were
> > the case that code I pointed out would be most likely to blame
> >
> > Could I suggest we try to localize the issue? Can you ping the host fro=
m the device?
>
> Lastly, about Oliver's question, I tried to send an UDP package using
> netcat from host to device and then from device to host. I was sending
> one single packet in loop with 1 second interval first, then tried with
> 0.5 second and 0.1 second. My hope was, with this test, detect who was
> failing, host or device.
>
> For 1 second, it pretty much works on both directions. As example, this
> is the output of my host PC (sendind packages with the device -> "echo
> 'hi' | nc -u 192.168.11.2 5201"):
>
> $ sudo tcpdump -i enx9627798c3fa3
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on enx9627798c3fa3, link-type EN10MB (Ethernet), snapshot lengt=
h 262144 bytes
> 17:47:51.865967 IP apalis-imx6-10692086.local.54882 > hdebian.5201: UDP, =
length 3
> 17:47:51.866051 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:52.145987 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [b2&3=3D0x200] [=
2a] PTR (QM)? 1.11.168.192.in-addr.arpa. (134)
> 17:47:52.146020 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [0q] (12)
> 17:47:52.198689 IP apalis-imx6-10692086.local.mdns > mdns.mcast.net.mdns:=
 0*- [0q] 1/0/0 (Cache flush) PTR apalis-imx6-10692086.local. (77)
> 17:47:52.882532 IP apalis-imx6-10692086.local.37745 > hdebian.5201: UDP, =
length 3
> 17:47:52.882634 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:53.903508 IP apalis-imx6-10692086.local.38147 > hdebian.5201: UDP, =
length 3
> 17:47:53.903585 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:54.920174 IP apalis-imx6-10692086.local.60718 > hdebian.5201: UDP, =
length 3
> 17:47:54.920265 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:55.940687 IP apalis-imx6-10692086.local.38729 > hdebian.5201: UDP, =
length 3
> 17:47:55.940743 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:56.913135 ARP, Request who-has apalis-imx6-10692086.local tell hdeb=
ian, length 28
> 17:47:56.915052 ARP, Reply apalis-imx6-10692086.local is-at ba:6d:d0:0a:9=
5:6b (oui Unknown), length 28
> 17:47:56.956927 IP apalis-imx6-10692086.local.54649 > hdebian.5201: UDP, =
length 3
> 17:47:56.956966 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39
> 17:47:57.980879 IP apalis-imx6-10692086.local.53366 > hdebian.5201: UDP, =
length 3
> 17:47:57.980984 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp=
 port 5201 unreachable, length 39

note that you're getting bidirectional transfer due to the icmp errors.

if you want to test unidirectionally, you need to send something that
won't get a reply.
for example an unsolicited arp reply (with arping)... or a udp packet
to a port drop'ed by a firewall.

and of course make sure you don't run it in such a way that you get
ssh traffic causing bidirectional traffic.
(ie. run it (and tcpdump) under screen)
[this is assuming you can't run it directly on the device without
getting in via ssh,
maybe you can via serial port or whatever - though do note that serial
wakeups could potentially also 'trigger' / 'fix' your hrtimer,
so probably best to run things silently under screen with no direct
output via ssh/serial/console.

> When I lower down the time between two packages from 1 second to 0.5 and
> 0.1, it suddenly freezes. It happens on both directions, host to device
> and device to host. As example, this is the host send UDP packets to the
> device with 0.1s interval:
>
> / # tcpdump -i usb0
> tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
> listening on usb0, link-type EN10MB (Ethernet), snapshot length 262144 by=
tes
> 18:39:53.662594 IP 192.168.11.2.54802 > 192.168.11.1.5201: UDP, length 3
> 18:39:53.662716 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:53.768678 IP 192.168.11.2.49080 > 192.168.11.1.5201: UDP, length 3
> 18:39:53.768767 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:53.875305 IP 192.168.11.2.56938 > 192.168.11.1.5201: UDP, length 3
> 18:39:53.875376 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:53.982238 IP 192.168.11.2.40177 > 192.168.11.1.5201: UDP, length 3
> 18:39:53.982354 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:54.089279 IP 192.168.11.2.43284 > 192.168.11.1.5201: UDP, length 3
> 18:39:54.089378 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:54.196027 IP 192.168.11.2.41990 > 192.168.11.1.5201: UDP, length 3
> 18:39:54.196105 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp por=
t 5201 unreachable, length 39
> 18:39:54.303793 IP 192.168.11.2.42362 > 192.168.11.1.5201: UDP, length 3
> 18:39:58.664608 ARP, Request who-has 192.168.11.2 tell 192.168.11.1, leng=
th 28
> 18:39:58.666781 ARP, Reply 192.168.11.2 is-at ea:2a:bc:40:41:30 (oui Unkn=
own), length 28
> 18:39:58.669531 ARP, Request who-has 192.168.11.1 tell 192.168.11.2, leng=
th 28
> 18:39:58.669582 ARP, Reply 192.168.11.1 is-at 1e:be:d4:00:51:0e (oui Unkn=
own), length 28
>
> It stops after this ARP request. Sometimes it send packages again, but
> after a few seconds it freezes. So, at the end, I couldn't figure out
> where the issue is...
>
> >
> >       Regards
> >               Oliver
>
> On Tue, Dec 12, 2023 at 05:11:49PM -0800, Maciej =C5=BBenczykowski wrote:
> > On Tue, Dec 12, 2023 at 1:21=E2=80=AFPM Oliver Neukum <oneukum@suse.com=
> wrote:
> > >
> > > On 12.12.23 21:32, Hiago De Franco wrote:
> > >
> > > Hi,
> > >
> > > > On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej =C5=BBenczykowski =
wrote:
> > > >> On Mon, Dec 11, 2023 at 12:29=E2=80=AFPM Hiago De Franco <hiagofra=
nco@gmail.com> wrote:
> > >
> > > >> Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need b=
e all the way to 1?
> > > >> It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> > > >> This applies to the host side.
> > > >
> > > > On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did yo=
u
> > > > mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?
> > >
> > > Yes, I meant that. Sorry.
> > >
> > > > Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT an=
d
> > > > CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> > > > CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT =
and
> > > > finally both at the same time, but it didn't help.
> > > >
> > > > I've also put some printks as following:
> > > >
> > > >       ctx->tx_curr_frame_num =3D n;
> > > >       printk("hfranco: tx_curr_frame_num =3D %d", n);
> > > >
> > > >       if (n =3D=3D 0) {
> > > >               printk("hfranco: n =3D=3D 0");
> > > >               /* wait for more frames */
> > > >               /* push variables */
> > > >               ctx->tx_curr_skb =3D skb_out;
> > > >               goto exit_no_skb;
> > > >
> > > >       } else if ((n < ctx->tx_max_datagrams) && (ready2send =3D=3D =
0) && (ctx->timer_interval > 0)) {
> > > >               printk("hfranco: tx_max_datagrams =3D %d", ctx->tx_ma=
x_datagrams);
> > > >               printk("hfranco: timer_interval =3D %d", ctx->timer_i=
nterval);
> > > >               printk("hfranco: n inside else if =3D %d", n);
> > > >               /* wait for more frames */
> > > >               /* push variables */
> > > >               ctx->tx_curr_skb =3D skb_out;
> > > >               /* set the pending count */
> > > >               if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> > > >                       ctx->tx_timer_pending =3D CDC_NCM_TIMER_PENDI=
NG_CNT;
> > > >               goto exit_no_skb;
> > > >
> > > >       } else {
> > > >               printk("hfranco: n inside else =3D %d", n);
> > > >               if (n =3D=3D ctx->tx_max_datagrams)
> > > >                       ctx->tx_reason_max_datagram++;  /* count reas=
on for transmitting */
> > > >
> > > > I ran it on my host PC, compiled it as module for my Debian dekstop=
, and
> >
> > Shouldn't you be doing this on the gadget side?
> > I thought we were thinking it was the gadget transmit timer having issu=
es.
>
> Because I still don't know where the issue is, I was testing both sides.
>
> >
> > > > this is the dmesg:
> > > >
> > > > [ 9663.478807] hfranco: tx_curr_frame_num =3D 1
> > > > [ 9663.478816] hfranco: tx_max_datagrams =3D 40
> > > > [ 9663.478818] hfranco: timer_interval =3D 400000
> > > > [ 9663.478820] hfranco: n inside else if =3D 1
> > > > [ 9663.478822] hfranco: timer started
> > > > [ 9663.479645] hfranco: tx_curr_frame_num =3D 1
> > > > [ 9663.479652] hfranco: n inside else =3D 1
> > > >
> > > > And then it basically repeats. Looks like 'n' never passes the 1 va=
lue.
> > > > By tweaking the flags mentioned before, 'n' got a value of 4, but t=
hat
> > > > was the maximum value. I was wondering, why do you think this code =
looks
> > > > suspicious? I basically just inserted some printks on the tx side, =
I
> > > > will see if I can get something from the rx as well.
> > >
> > > If we look at the statistics you initially gathered, we can see that =
all transmissions
> > > on the host side happen because the timeout elapses. That, however, d=
oes
> > > _not_ tell us that the host is to blame. We could look at two possibl=
e scenarios
> > >
> > > A - the gadget is bundling up the packets with too much delay and the=
 host
> > > just answers to the megatransmissions with one packet and the delay o=
n the host
> > > is inconsequential
> > >
> > > B - the timer on the host runs for too long or sometimes not at all. =
If that were
> > > the case that code I pointed out would be most likely to blame
> > >
> > > Could I suggest we try to localize the issue? Can you ping the host f=
rom the device?
> > >
> > >         Regards
> > >                 Oliver
> >
> > --
> > Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google
>
> Sorry if I couldn't provide enough information, I'm kind of learning
> trought the process. The TX_MAX_NUM_DPE is something I'm not fully
> convinced, but again I will keep debugging.
>
> Best regards,
> Hiago.

--
Maciej =C5=BBenczykowski, Kernel Networking Developer @ Google

