Return-Path: <linux-usb+bounces-4223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F151E8151E3
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 22:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6530B1F242D5
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 21:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AB447F6C;
	Fri, 15 Dec 2023 21:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVYD99Ng"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F232A47F5E
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 21:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-35f3e4ce411so6674435ab.0
        for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 13:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702675243; x=1703280043; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y4+48fA4HGzJbW0ZF0UtMrpwsvKNjrk4+R4Zh/tsSc4=;
        b=OVYD99Ngks1hnenhZJi00hQly7sosxxHZ8aWNKNAgRQy2QsHwyWR9LdRDqh7j8DYyi
         poTHQNtgtE/s58jLhp+HM51uWxeTe7JSXS5LWKsHyVzuFnIqIkioaFUDcnHDiNJABIn+
         K8vQ1P2KzTBH/5Id6wDGOYjHyi9Xr0Ck/4P0hRP+1mL88596ifB1Zg2E3Jni9G91KUME
         5bcm528rXHKuh9GiFRh0n7gY5WaqUOXeewrJdlhPOP09l1ooqAKYQOdHz2Jl9mjnOwi1
         VmEEomytM1WOcAlSFH0ytlsuyhexyvSqxnmSY7dg4vq4BByQikqwRr1JwywsRrM7sOWc
         3Q6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702675243; x=1703280043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y4+48fA4HGzJbW0ZF0UtMrpwsvKNjrk4+R4Zh/tsSc4=;
        b=VdrgiU1lZMcigWBywo5pDIDWQAh9nFWE3Tfll9JIGLge16x4YCrYbMLZ4OZwZiPGE9
         NTeQzmRs3uDEeeDnHt50Hgc4OJz6JZ0qt0DdEgTjDymkgGToKiNRNIg6qzvPrJ30J/7/
         /AFZlq6LtES0UrE5z8T104RxdtS8933NTFwGzoNo9trGlxootnmY0KjzVPDQiW/Uktvq
         rJFwb/yjG2qJFenGpW5cFxK9hWh4aYxBcTcY+vSvdPW6bQFENTtT3M/6eM/NL2oXNroJ
         SIpWkbB9DRy5uPho17oEFjxk4f7HcoZtnlbw1BFYoaGoM2wgH/OPFPf9fN9kfqoq5v35
         2JCg==
X-Gm-Message-State: AOJu0YyUhQ2FFkPi+eM5LlmooITc11kD9fbdyorDWKyoJMx5qMfbyit5
	F4UoTUWfP4+YKZhculRT3VFza4VYb7hTKzJM
X-Google-Smtp-Source: AGHT+IHjnU2xaTXdkwHw2VGRC8AKhEIzJ7xsRgyG+nK7XL1eOlX1Op4mp++saXu4EDevB0iYOxvh0A==
X-Received: by 2002:a05:6e02:15c7:b0:35d:763a:926c with SMTP id q7-20020a056e0215c700b0035d763a926cmr20962327ilu.114.1702675242790;
        Fri, 15 Dec 2023 13:20:42 -0800 (PST)
Received: from hdebian ([2804:1b3:6602:3e38:5673:7daf:d5c0:c378])
        by smtp.gmail.com with ESMTPSA id fs7-20020a17090af28700b00286ed94466dsm963987pjb.32.2023.12.15.13.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 13:20:42 -0800 (PST)
Date: Fri, 15 Dec 2023 18:20:23 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Oliver Neukum <oneukum@suse.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
	linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <20231215212023.pas6tem7ekd2zcf6@hdebian>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ccb72864-6623-4652-8ccf-700c2c68916e@suse.com>
 <CANP3RGdOT9rrBai+uuTZCo7JPyeEbh_u+vu6VD7t_Z80nfAn1Q@mail.gmail.com>

Hi Oliver and Maciej,

Sorry for the delay on my message. I took some time to set up some
debugging tools, hoping to find something more interesting. I couldn't
find too much I guess, but I will describe the results here.

First, I set up ftrace to track 'package_for_tx' function. My idea would
be that I would see the delays between two consecutives calls of this
function being more than 300us, this would say the code wasn't
respecting the hrtimer. The trace log looks something like that:

# tracer: function
#
# entries-in-buffer/entries-written: 468/468   #P:2
#
#                                _-----=> irqs-off/BH-disabled
#                               / _----=> need-resched
#                              | / _---=> hardirq/softirq
#                              || / _--=> preempt-depth
#                              ||| / _-=> migrate-disable
#                              |||| /     delay
#           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
#              | |         |   |||||     |         |
            tezi-237     [001] dns..   101.030667: package_for_tx <-ncm_wrap_ntb
          <idle>-0       [000] d.s..   101.032771: package_for_tx <-ncm_wrap_ntb
          weston-228     [001] d.s..   101.039430: package_for_tx <-ncm_wrap_ntb
            tezi-237     [000] d.s..   101.041634: package_for_tx <-ncm_wrap_ntb
          <idle>-0       [001] d.s..   101.042326: package_for_tx <-ncm_wrap_ntb
          <idle>-0       [001] d.s..   101.055665: package_for_tx <-ncm_wrap_ntb
          weston-231     [001] d.s..   101.057779: package_for_tx <-ncm_wrap_ntb
          <idle>-0       [001] d.s..   101.068630: package_for_tx <-ncm_wrap_ntb
          weston-231     [001] d.s..   101.085738: package_for_tx <-ncm_wrap_ntb
            tezi-237     [000] D.s..   101.088611: package_for_tx <-ncm_wrap_ntb

So I created a simple script to calculate the delta time between two
consecutive calls and give me at the end how many of them are above
300us. This is the result:

Total timestamps above 300 microseconds: 440 of 742
Percentage of timestamps above 300 microseconds: 59.30%

Then I decided to lower down the TX_MAX_NUM_DPE from 32 to 0.
0 and 4 made the VNC runs smooth. I've also tested 8 and 16, but these
two didn't help. Again, by setting the number to 0, this is the result:

Total timestamps above 300 microseconds: 3149 of 65420
Percentage of timestamps above 300 microseconds: 4.81%

Of course we also have more packages, as the VNC is working and it's not
frozen. It's interesting how fast this is now, but as discussed with a
coleague, we don't know if this tells much. There are more latencies
envolved, for example from the scheduler, so probably the result is not
showing me anything valuable.

My second test was trying to figure out how TX_MAX_NUM_DPE was
impacting my issue, so I added two printks to check the number it was
getting and when it was being zeroed.

/* Delay for the transmit to wait before sending an unfilled NTB frame. */
 #define TX_TIMEOUT_NSECS       300000
@@ -964,6 +964,7 @@ static struct sk_buff *package_for_tx(struct f_ncm *ncm)
        /* Set the final NDP wLength */
        new_len = opts->ndp_size +
                        (ncm->ndp_dgram_count * dgram_idx_len);
+       printk("hfranco: package_for_tx called, setting ndp_dram_count to 0");
        ncm->ndp_dgram_count = 0;
        /* Increment from start to wLength */
        ntb_iter = (void *) ncm->skb_tx_ndp->data;
@@ -1027,6 +1028,8 @@ static struct sk_buff *ncm_wrap_ntb(struct gether *port,
                 * ready for new data.
                 * NOTE: Assume maximum align for speed of calculation.
                 */
+
+               printk("hfranco: ncm->ndp_dgram_count = %d", ncm->ndp_dgram_count);
                if (ncm->skb_tx_data
                    && (ncm->ndp_dgram_count >= TX_MAX_NUM_DPE
                    || (ncm->skb_tx_data->len +

This is the result:

[ 6613.034304] hfranco: package_for_tx called, setting ndp_dram_count to 0
[ 6613.034783] hfranco: ncm->ndp_dgram_count = 0
[ 6613.034812] hfranco: ncm->ndp_dgram_count = 2
[ 6613.034823] hfranco: ncm->ndp_dgram_count = 3
[ 6613.034835] hfranco: ncm->ndp_dgram_count = 4
[ 6613.034844] hfranco: ncm->ndp_dgram_count = 5
[ 6613.034855] hfranco: ncm->ndp_dgram_count = 6
[ 6613.034865] hfranco: ncm->ndp_dgram_count = 7
[ 6613.034874] hfranco: ncm->ndp_dgram_count = 8
[ 6613.034884] hfranco: ncm->ndp_dgram_count = 9
[ 6613.034895] hfranco: ncm->ndp_dgram_count = 10
[ 6613.034905] hfranco: ncm->ndp_dgram_count = 11
[ 6613.034914] hfranco: package_for_tx called, setting ndp_dram_count to 0
[ 6613.035266] hfranco: ncm->ndp_dgram_count = 2
[ 6613.035281] hfranco: ncm->ndp_dgram_count = 3
[ 6613.035292] hfranco: ncm->ndp_dgram_count = 4
[ 6613.035301] hfranco: ncm->ndp_dgram_count = 5
[ 6613.035310] hfranco: ncm->ndp_dgram_count = 6
[ 6613.035320] hfranco: ncm->ndp_dgram_count = 7
[ 6613.035329] hfranco: ncm->ndp_dgram_count = 8
[ 6613.035339] hfranco: ncm->ndp_dgram_count = 9
[ 6613.035350] hfranco: ncm->ndp_dgram_count = 10
[ 6613.035360] hfranco: ncm->ndp_dgram_count = 11
[ 6613.035366] hfranco: package_for_tx called, setting ndp_dram_count to 0

So, in general the value never passes 10 or 11, from all the test I done
with the VNC. As said earlier, by putting 4 made the VNC work:

[   17.333014] hfranco: package_for_tx called, setting ndp_dram_count to 0
[   17.333065] hfranco: ncm->ndp_dgram_count = 2
[   17.333079] hfranco: ncm->ndp_dgram_count = 3
[   17.333105] hfranco: ncm->ndp_dgram_count = 4
[   17.333114] hfranco: package_for_tx called, setting ndp_dram_count to 0
[   17.333161] hfranco: ncm->ndp_dgram_count = 2
[   17.333173] hfranco: ncm->ndp_dgram_count = 3
[   17.333184] hfranco: ncm->ndp_dgram_count = 4
[   17.333191] hfranco: package_for_tx called, setting ndp_dram_count to 0
[   17.333235] hfranco: ncm->ndp_dgram_count = 2
[   17.333259] hfranco: ncm->ndp_dgram_count = 3
[   17.333271] hfranco: ncm->ndp_dgram_count = 4

On Tue, Dec 12, 2023 at 10:21:13PM +0100, Oliver Neukum wrote:
> On 12.12.23 21:32, Hiago De Franco wrote:
> 
> Hi,
> 
> > On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej Żenczykowski wrote:
> > > On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> 
> > > Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be all the way to 1?
> > > It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> > > This applies to the host side.
> > 
> > On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
> > mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?
> 
> Yes, I meant that. Sorry.
> 
> > Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
> > CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> > CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT and
> > finally both at the same time, but it didn't help.
> > 
> > I've also put some printks as following:
> > 
> > 	ctx->tx_curr_frame_num = n;
> > 	printk("hfranco: tx_curr_frame_num = %d", n);
> > 
> > 	if (n == 0) {
> > 		printk("hfranco: n == 0");
> > 		/* wait for more frames */
> > 		/* push variables */
> > 		ctx->tx_curr_skb = skb_out;
> > 		goto exit_no_skb;
> > 
> > 	} else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
> > 		printk("hfranco: tx_max_datagrams = %d", ctx->tx_max_datagrams);
> > 		printk("hfranco: timer_interval = %d", ctx->timer_interval);
> > 		printk("hfranco: n inside else if = %d", n);
> > 		/* wait for more frames */
> > 		/* push variables */
> > 		ctx->tx_curr_skb = skb_out;
> > 		/* set the pending count */
> > 		if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> > 			ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
> > 		goto exit_no_skb;
> > 
> > 	} else {
> > 		printk("hfranco: n inside else = %d", n);
> > 		if (n == ctx->tx_max_datagrams)
> > 			ctx->tx_reason_max_datagram++;	/* count reason for transmitting */
> > 
> > I ran it on my host PC, compiled it as module for my Debian dekstop, and
> > this is the dmesg:
> > 
> > [ 9663.478807] hfranco: tx_curr_frame_num = 1
> > [ 9663.478816] hfranco: tx_max_datagrams = 40
> > [ 9663.478818] hfranco: timer_interval = 400000
> > [ 9663.478820] hfranco: n inside else if = 1
> > [ 9663.478822] hfranco: timer started
> > [ 9663.479645] hfranco: tx_curr_frame_num = 1
> > [ 9663.479652] hfranco: n inside else = 1
> > 
> > And then it basically repeats. Looks like 'n' never passes the 1 value.
> > By tweaking the flags mentioned before, 'n' got a value of 4, but that
> > was the maximum value. I was wondering, why do you think this code looks
> > suspicious? I basically just inserted some printks on the tx side, I
> > will see if I can get something from the rx as well.
> 
> If we look at the statistics you initially gathered, we can see that all transmissions
> on the host side happen because the timeout elapses. That, however, does
> _not_ tell us that the host is to blame. We could look at two possible scenarios
> 
> A - the gadget is bundling up the packets with too much delay and the host
> just answers to the megatransmissions with one packet and the delay on the host
> is inconsequential
> 
> B - the timer on the host runs for too long or sometimes not at all. If that were
> the case that code I pointed out would be most likely to blame
> 
> Could I suggest we try to localize the issue? Can you ping the host from the device?

Lastly, about Oliver's question, I tried to send an UDP package using
netcat from host to device and then from device to host. I was sending
one single packet in loop with 1 second interval first, then tried with
0.5 second and 0.1 second. My hope was, with this test, detect who was
failing, host or device.

For 1 second, it pretty much works on both directions. As example, this
is the output of my host PC (sendind packages with the device -> "echo
'hi' | nc -u 192.168.11.2 5201"):

$ sudo tcpdump -i enx9627798c3fa3
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on enx9627798c3fa3, link-type EN10MB (Ethernet), snapshot length 262144 bytes
17:47:51.865967 IP apalis-imx6-10692086.local.54882 > hdebian.5201: UDP, length 3
17:47:51.866051 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:52.145987 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [b2&3=0x200] [2a] PTR (QM)? 1.11.168.192.in-addr.arpa. (134)
17:47:52.146020 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [0q] (12)
17:47:52.198689 IP apalis-imx6-10692086.local.mdns > mdns.mcast.net.mdns: 0*- [0q] 1/0/0 (Cache flush) PTR apalis-imx6-10692086.local. (77)
17:47:52.882532 IP apalis-imx6-10692086.local.37745 > hdebian.5201: UDP, length 3
17:47:52.882634 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:53.903508 IP apalis-imx6-10692086.local.38147 > hdebian.5201: UDP, length 3
17:47:53.903585 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:54.920174 IP apalis-imx6-10692086.local.60718 > hdebian.5201: UDP, length 3
17:47:54.920265 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:55.940687 IP apalis-imx6-10692086.local.38729 > hdebian.5201: UDP, length 3
17:47:55.940743 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:56.913135 ARP, Request who-has apalis-imx6-10692086.local tell hdebian, length 28
17:47:56.915052 ARP, Reply apalis-imx6-10692086.local is-at ba:6d:d0:0a:95:6b (oui Unknown), length 28
17:47:56.956927 IP apalis-imx6-10692086.local.54649 > hdebian.5201: UDP, length 3
17:47:56.956966 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39
17:47:57.980879 IP apalis-imx6-10692086.local.53366 > hdebian.5201: UDP, length 3
17:47:57.980984 IP hdebian > apalis-imx6-10692086.local: ICMP hdebian udp port 5201 unreachable, length 39

When I lower down the time between two packages from 1 second to 0.5 and
0.1, it suddenly freezes. It happens on both directions, host to device
and device to host. As example, this is the host send UDP packets to the
device with 0.1s interval:

/ # tcpdump -i usb0
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on usb0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
18:39:53.662594 IP 192.168.11.2.54802 > 192.168.11.1.5201: UDP, length 3
18:39:53.662716 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:53.768678 IP 192.168.11.2.49080 > 192.168.11.1.5201: UDP, length 3
18:39:53.768767 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:53.875305 IP 192.168.11.2.56938 > 192.168.11.1.5201: UDP, length 3
18:39:53.875376 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:53.982238 IP 192.168.11.2.40177 > 192.168.11.1.5201: UDP, length 3
18:39:53.982354 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:54.089279 IP 192.168.11.2.43284 > 192.168.11.1.5201: UDP, length 3
18:39:54.089378 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:54.196027 IP 192.168.11.2.41990 > 192.168.11.1.5201: UDP, length 3
18:39:54.196105 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
18:39:54.303793 IP 192.168.11.2.42362 > 192.168.11.1.5201: UDP, length 3
18:39:58.664608 ARP, Request who-has 192.168.11.2 tell 192.168.11.1, length 28
18:39:58.666781 ARP, Reply 192.168.11.2 is-at ea:2a:bc:40:41:30 (oui Unknown), length 28
18:39:58.669531 ARP, Request who-has 192.168.11.1 tell 192.168.11.2, length 28
18:39:58.669582 ARP, Reply 192.168.11.1 is-at 1e:be:d4:00:51:0e (oui Unknown), length 28

It stops after this ARP request. Sometimes it send packages again, but
after a few seconds it freezes. So, at the end, I couldn't figure out
where the issue is...

> 
> 	Regards
> 		Oliver

On Tue, Dec 12, 2023 at 05:11:49PM -0800, Maciej Żenczykowski wrote:
> On Tue, Dec 12, 2023 at 1:21 PM Oliver Neukum <oneukum@suse.com> wrote:
> >
> > On 12.12.23 21:32, Hiago De Franco wrote:
> >
> > Hi,
> >
> > > On Mon, Dec 11, 2023 at 12:44:42PM -0800, Maciej Żenczykowski wrote:
> > >> On Mon, Dec 11, 2023 at 12:29 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> >
> > >> Hiago, could you try lowering CDC_NCM_TIMER_PENDING_CNT, if need be all the way to 1?
> > >> It is defined in include/linux/usb/cdc_ncm.h as 3 currently
> > >> This applies to the host side.
> > >
> > > On my side CDC_NCM_TIMER_PENDING_CNT is set to 2 by default, did you
> > > mean CDC_NCM_RESTART_TIMER_DATAGRAM_CNT?
> >
> > Yes, I meant that. Sorry.
> >
> > > Despite of that, I tried to lower both CDC_NCM_TIMER_PENDING_CNT and
> > > CDC_NCM_RESTART_TIMER_DATAGRAM_CNT all the way down to 1, first the
> > > CDC_NCM_TIMER_PENDING_CNT, then CDC_NCM_RESTART_TIMER_DATAGRAM_CNT and
> > > finally both at the same time, but it didn't help.
> > >
> > > I've also put some printks as following:
> > >
> > >       ctx->tx_curr_frame_num = n;
> > >       printk("hfranco: tx_curr_frame_num = %d", n);
> > >
> > >       if (n == 0) {
> > >               printk("hfranco: n == 0");
> > >               /* wait for more frames */
> > >               /* push variables */
> > >               ctx->tx_curr_skb = skb_out;
> > >               goto exit_no_skb;
> > >
> > >       } else if ((n < ctx->tx_max_datagrams) && (ready2send == 0) && (ctx->timer_interval > 0)) {
> > >               printk("hfranco: tx_max_datagrams = %d", ctx->tx_max_datagrams);
> > >               printk("hfranco: timer_interval = %d", ctx->timer_interval);
> > >               printk("hfranco: n inside else if = %d", n);
> > >               /* wait for more frames */
> > >               /* push variables */
> > >               ctx->tx_curr_skb = skb_out;
> > >               /* set the pending count */
> > >               if (n < CDC_NCM_RESTART_TIMER_DATAGRAM_CNT)
> > >                       ctx->tx_timer_pending = CDC_NCM_TIMER_PENDING_CNT;
> > >               goto exit_no_skb;
> > >
> > >       } else {
> > >               printk("hfranco: n inside else = %d", n);
> > >               if (n == ctx->tx_max_datagrams)
> > >                       ctx->tx_reason_max_datagram++;  /* count reason for transmitting */
> > >
> > > I ran it on my host PC, compiled it as module for my Debian dekstop, and
> 
> Shouldn't you be doing this on the gadget side?
> I thought we were thinking it was the gadget transmit timer having issues.

Because I still don't know where the issue is, I was testing both sides.

> 
> > > this is the dmesg:
> > >
> > > [ 9663.478807] hfranco: tx_curr_frame_num = 1
> > > [ 9663.478816] hfranco: tx_max_datagrams = 40
> > > [ 9663.478818] hfranco: timer_interval = 400000
> > > [ 9663.478820] hfranco: n inside else if = 1
> > > [ 9663.478822] hfranco: timer started
> > > [ 9663.479645] hfranco: tx_curr_frame_num = 1
> > > [ 9663.479652] hfranco: n inside else = 1
> > >
> > > And then it basically repeats. Looks like 'n' never passes the 1 value.
> > > By tweaking the flags mentioned before, 'n' got a value of 4, but that
> > > was the maximum value. I was wondering, why do you think this code looks
> > > suspicious? I basically just inserted some printks on the tx side, I
> > > will see if I can get something from the rx as well.
> >
> > If we look at the statistics you initially gathered, we can see that all transmissions
> > on the host side happen because the timeout elapses. That, however, does
> > _not_ tell us that the host is to blame. We could look at two possible scenarios
> >
> > A - the gadget is bundling up the packets with too much delay and the host
> > just answers to the megatransmissions with one packet and the delay on the host
> > is inconsequential
> >
> > B - the timer on the host runs for too long or sometimes not at all. If that were
> > the case that code I pointed out would be most likely to blame
> >
> > Could I suggest we try to localize the issue? Can you ping the host from the device?
> >
> >         Regards
> >                 Oliver
> 
> --
> Maciej Żenczykowski, Kernel Networking Developer @ Google

Sorry if I couldn't provide enough information, I'm kind of learning
trought the process. The TX_MAX_NUM_DPE is something I'm not fully
convinced, but again I will keep debugging.

Best regards,
Hiago.

