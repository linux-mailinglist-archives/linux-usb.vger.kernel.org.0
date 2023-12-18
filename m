Return-Path: <linux-usb+bounces-4321-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ADD7817C57
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 22:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABB281F24411
	for <lists+linux-usb@lfdr.de>; Mon, 18 Dec 2023 21:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991A373465;
	Mon, 18 Dec 2023 21:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f/25Kj5T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F8A2D
	for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 21:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5c66b093b86so3354545a12.0
        for <linux-usb@vger.kernel.org>; Mon, 18 Dec 2023 13:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702933218; x=1703538018; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lbfMb+NOjybpF6SMv1Hvlbp38OJz7RhVEEdIzBrWeMU=;
        b=f/25Kj5Tm3/dlElrl8Urwl+cZKv5eDX6Ev8QHUiHM/SPQzdswGGQuQlYSNedwc2vTC
         BYV+JJEh+s+rTFWJPQ4jk5JXRZm9hIfnDCBXAm20QNyHijrKuHjd3Sl3nQR4TPfUF/Lk
         d0JK7Fd1ddR7kUPNx09HWKMtB0rqGZodOJytKsHkwuYdsI/4ReuTG4u3tzCCF27vOAGY
         s4R22/wIiEV1xUsFR8mKK/uTNHuUOLoiADj+EHDUtYkO5OfJbubMfnFJjL0QQxAhRqXx
         HlrX0rK4Q/8nYTxjlMufoPicekv8D6kwq3LFObQhTGEHw5B3Nlrq1igUnLiA/ufYJSan
         RuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702933218; x=1703538018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbfMb+NOjybpF6SMv1Hvlbp38OJz7RhVEEdIzBrWeMU=;
        b=ef+dWPGBChkhOcCrAqTnEs2Pwgi0jy+dQkg9sNxSCNfAfnfMaE4ryxLnYesS2m2oPq
         rf05QCgdVe0XfcYjO4Dfzq8MtBrTXXM3IhziScaSeHle81J6HLnwpeTbwcsV8XRQBODp
         mNB0uDtkCJsq3kc3/evNoCi9Ww4v3XSo/OkhQHD2Ff0ftTczMETvFtKjm1V/spXq+I+D
         1hUu7xCLQCmL4M4YOnHogjwJAeAFIYUVCBStnQPLj2dbSKJWVYinueLKafnq9/34VpNy
         BvodEldFax5Zoy7phfHHrFKvYDYZD8a0HaBp9sfYhGp6s6ImUsyaJZVsdeP1d/yB4qtH
         zq8g==
X-Gm-Message-State: AOJu0YwRrlkmNRetxI6MwSRQc+w6jG/vSWELzV0fTQCFTpqbm/mgAY61
	biAWjG+rWazZ4j3DlZFWjuY=
X-Google-Smtp-Source: AGHT+IF4zJAUT6TR3j1rGq3gAoBk6Eccul/rHUV7PwaU888YvSCnEfIcQ1mFOHvnki76RIZ76oenIw==
X-Received: by 2002:a17:90a:9ce:b0:28b:4750:c85a with SMTP id 72-20020a17090a09ce00b0028b4750c85amr5732974pjo.43.1702933217561;
        Mon, 18 Dec 2023 13:00:17 -0800 (PST)
Received: from hdebian ([2804:1b3:6602:3e38:6c73:baea:d67f:beac])
        by smtp.gmail.com with ESMTPSA id jv14-20020a17090b31ce00b0028aecd6b29fsm10424525pjb.3.2023.12.18.13.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 13:00:17 -0800 (PST)
Date: Mon, 18 Dec 2023 17:59:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Oliver Neukum <oneukum@suse.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
	edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
	linux-usb@vger.kernel.org, pabeni@redhat.com
Subject: Re: Question regarding CDC NCM and VNC performance issue
Message-ID: <20231218205953.g77zdjsojrgjak6a@hdebian>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
 <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com>

Hi,

On Fri, Dec 15, 2023 at 01:44:29PM -0800, Maciej Żenczykowski wrote:
> Here's my recommendation.
> On the gadget side.
> Print something when the timer is armed.
> Print something when the timer fires.
> Include the timestamp.
> 
> Then try to send something (a single packet) that won't trigger a reply.
> 
> For example run a script in a screen session that sends 1 unsolicited
> arp reply packet every 10 seconds.
> This is rare enough, it should obviously get the timer to fire.
> Again, wait 5 minutes, so you've had 30+ packets sent.
> See if it does even fire...
> You can run tcpdump on the receiver to see what you receive (and the
> timestamps on that)

Thanks for the recommendation, I did what you suggested for 5 minutes
adding printk's for all 'hrtimer_*' function calls inside f_ncm.c.
Basically we only get 'hrtimer_start' and 'hrtimer_try_to_cancel' calls,
which makes sense. Here is the result, doing ARP pings from the device
to the host PC:

[   20.427879] hfranco: hrtimer_try_to_cancel
[   21.270355] hfranco: hrtimer_start
[   21.270732] hfranco: hrtimer_try_to_cancel
[   31.695892] hfranco: hrtimer_start
[   31.696215] hfranco: hrtimer_try_to_cancel
[   36.324646] hfranco: hrtimer_start
[   36.324989] hfranco: hrtimer_try_to_cancel
[   37.168880] hfranco: hrtimer_start
[   37.169216] hfranco: hrtimer_try_to_cancel
[   60.359510] hfranco: hrtimer_start
[   60.359836] hfranco: hrtimer_try_to_cancel
[   68.188814] hfranco: hrtimer_start
[   68.189141] hfranco: hrtimer_try_to_cancel
[   69.035732] hfranco: hrtimer_start
[   69.036062] hfranco: hrtimer_try_to_cancel
[   90.413786] hfranco: hrtimer_start
[   90.414116] hfranco: hrtimer_try_to_cancel
[  100.380712] hfranco: hrtimer_start
[  100.381048] hfranco: hrtimer_try_to_cancel
[  110.349906] hfranco: hrtimer_start
[  110.350247] hfranco: hrtimer_try_to_cancel
[  120.321527] hfranco: hrtimer_start
[  120.321872] hfranco: hrtimer_try_to_cancel
[  120.325531] hfranco: hrtimer_start
[  120.325869] hfranco: hrtimer_try_to_cancel
[  130.295101] hfranco: hrtimer_start
[  130.295428] hfranco: hrtimer_try_to_cancel
[  131.992642] hfranco: hrtimer_start
[  131.992984] hfranco: hrtimer_try_to_cancel
[  132.839585] hfranco: hrtimer_start
[  132.839927] hfranco: hrtimer_try_to_cancel
[  140.270782] hfranco: hrtimer_start
[  140.271112] hfranco: hrtimer_try_to_cancel
[  150.248507] hfranco: hrtimer_start
[  150.248848] hfranco: hrtimer_try_to_cancel
[  160.228126] hfranco: hrtimer_start
[  160.228453] hfranco: hrtimer_try_to_cancel
[  170.209459] hfranco: hrtimer_start
[  170.209822] hfranco: hrtimer_try_to_cancel
[  180.192015] hfranco: hrtimer_start
[  180.192351] hfranco: hrtimer_try_to_cancel
[  190.176082] hfranco: hrtimer_start
[  190.176423] hfranco: hrtimer_try_to_cancel
[  200.161272] hfranco: hrtimer_start
[  200.161600] hfranco: hrtimer_try_to_cancel
[  210.147622] hfranco: hrtimer_start
[  210.147949] hfranco: hrtimer_try_to_cancel
[  220.135257] hfranco: hrtimer_start
[  220.135582] hfranco: hrtimer_try_to_cancel
[  230.123934] hfranco: hrtimer_start
[  230.124274] hfranco: hrtimer_try_to_cancel
[  237.879789] hfranco: hrtimer_start
[  237.880133] hfranco: hrtimer_try_to_cancel
[  240.113459] hfranco: hrtimer_start
[  240.113794] hfranco: hrtimer_try_to_cancel
[  250.103968] hfranco: hrtimer_start
[  250.104309] hfranco: hrtimer_try_to_cancel
[  259.800618] hfranco: hrtimer_start
[  259.800946] hfranco: hrtimer_try_to_cancel
[  260.095486] hfranco: hrtimer_start
[  260.095828] hfranco: hrtimer_try_to_cancel
[  260.646435] hfranco: hrtimer_start
[  260.646776] hfranco: hrtimer_try_to_cancel
[  270.087384] hfranco: hrtimer_start
[  270.087711] hfranco: hrtimer_try_to_cancel
[  280.080143] hfranco: hrtimer_start
[  280.080468] hfranco: hrtimer_try_to_cancel
[  290.073603] hfranco: hrtimer_start
[  290.073945] hfranco: hrtimer_try_to_cancel
[  300.067513] hfranco: hrtimer_start
[  300.067852] hfranco: hrtimer_try_to_cancel
[  310.061945] hfranco: hrtimer_start
[  310.062297] hfranco: hrtimer_try_to_cancel
[  320.056667] hfranco: hrtimer_start
[  320.057008] hfranco: hrtimer_try_to_cancel
[  330.051900] hfranco: hrtimer_start
[  330.052255] hfranco: hrtimer_try_to_cancel
[  340.047353] hfranco: hrtimer_start
[  340.047678] hfranco: hrtimer_try_to_cancel
[  350.044862] hfranco: hrtimer_start
[  350.045221] hfranco: hrtimer_try_to_cancel
[  360.043011] hfranco: hrtimer_start
[  360.043352] hfranco: hrtimer_try_to_cancel
[  370.041268] hfranco: hrtimer_start
[  370.041611] hfranco: hrtimer_try_to_cancel
[  380.039556] hfranco: hrtimer_start
[  380.039891] hfranco: hrtimer_try_to_cancel
[  390.037826] hfranco: hrtimer_start
[  390.038150] hfranco: hrtimer_try_to_cancel
[  400.036353] hfranco: hrtimer_start

/ # arping -U -I usb0 -i 10 -s 192.168.11.1 192.168.11.2
ARPING 192.168.11.2 from 192.168.11.1 usb0
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.504ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.459ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.612ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.676ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.509ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.696ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  3.008ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.446ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.776ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.529ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.669ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.523ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.574ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.872ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.654ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.639ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.576ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.584ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.560ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.393ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.627ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.799ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.980ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.661ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.707ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.523ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.711ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.704ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.566ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.678ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.592ms
Unicast reply from 192.168.11.2 [62:05:42:DF:6F:C2]  2.654ms
^CSent 32 probes (1 broadcast(s))
Received 32 response(s)

$ sudo tcpdump -i enx620542df6fc2
tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
listening on enx620542df6fc2, link-type EN10MB (Ethernet), snapshot length 262144 bytes
17:02:32.599638 IP6 hdebian > ip6-allrouters: ICMP6, router solicitation, length 8
17:02:35.425325 IP6 apalis-imx6-10692086.local > ip6-allrouters: ICMP6, router solicitation, length 16
17:02:42.810738 IP6 hdebian.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:02:42.865794 IP6 hdebian.mdns > ff02::fb.mdns: 0 [b2&3=0x200] [2a] PTR (QM)? b.f.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.2.0.f.f.ip6.arpa. (181)
17:02:42.865832 IP6 hdebian.mdns > ff02::fb.mdns: 0 [0q] (12)
17:02:43.253971 IP apalis-imx6-10692086.local.mdns > mdns.mcast.net.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:02:43.895157 IP6 hdebian.mdns > ff02::fb.mdns: 0 [b2&3=0x200] [2a] PTR (QM)? b.f.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.2.0.f.f.ip6.arpa. (181)
17:02:43.895196 IP6 hdebian.mdns > ff02::fb.mdns: 0 [0q] (12)
17:02:44.100862 IP6 apalis-imx6-10692086.local.mdns > ff02::fb.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:02:44.961717 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:02:46.145083 IP6 hdebian.mdns > ff02::fb.mdns: 0 [b2&3=0x200] [2a] PTR (QM)? b.f.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.2.0.f.f.ip6.arpa. (181)
17:02:46.145128 IP6 hdebian.mdns > ff02::fb.mdns: 0 [0q] (12)
17:03:05.477178 ARP, Request who-has hdebian (Broadcast) tell apalis-imx6-10692086.local, length 28
17:03:05.477217 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:03:15.443291 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:03:15.443309 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:03:24.580306 IP6 hdebian > ip6-allrouters: ICMP6, router solicitation, length 8
17:03:25.411804 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:03:25.411821 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:03:35.382697 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:03:35.382717 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:03:35.386582 IP6 apalis-imx6-10692086.local > ip6-allrouters: ICMP6, router solicitation, length 16
17:03:45.355482 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:03:45.355504 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:03:46.811643 IP6 hdebian.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:03:47.052930 IP apalis-imx6-10692086.local.mdns > mdns.mcast.net.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:03:47.899743 IP6 apalis-imx6-10692086.local.mdns > ff02::fb.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:03:48.962107 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:03:55.330407 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:03:55.330423 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:05.307308 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:05.307324 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:15.286180 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:15.286209 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:25.266785 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:25.266816 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:35.248474 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:35.248489 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:45.231873 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:45.231902 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:04:55.216288 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:04:55.216315 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:05.201924 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:05.201951 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:09.438461 IP6 hdebian > ip6-allrouters: ICMP6, router solicitation, length 8
17:05:15.188755 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:15.188799 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:25.176620 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:25.176648 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:32.931912 IP6 apalis-imx6-10692086.local > ip6-allrouters: ICMP6, router solicitation, length 16
17:05:35.165375 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:35.165399 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:45.155068 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:45.155082 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:54.813550 IP6 hdebian.mdns > ff02::fb.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:05:54.851012 IP apalis-imx6-10692086.local.mdns > mdns.mcast.net.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:05:55.145920 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:05:55.145943 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:05:55.696822 IP6 apalis-imx6-10692086.local.mdns > ff02::fb.mdns: 0 [1a] PTR (QM)? _tezi._tcp.local. (71)
17:05:56.963151 IP hdebian.mdns > mdns.mcast.net.mdns: 0 [2q] PTR (QM)? _ipps._tcp.local. PTR (QM)? _ipp._tcp.local. (45)
17:06:05.136948 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:05.137104 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:06:15.128897 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:15.128918 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:06:25.121662 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:25.121682 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:06:35.114912 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:35.114943 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:06:45.108576 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:45.108599 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:06:55.102468 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:06:55.102501 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:05.096969 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:05.096994 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:15.091619 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:15.091647 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:25.088359 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:25.088385 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:35.085718 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:35.085753 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:45.083263 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:45.083291 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:07:55.080759 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:07:55.080782 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:08:05.078303 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:08:05.078344 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
17:08:15.075990 ARP, Request who-has hdebian (62:05:42:df:6f:c2 (oui Unknown)) tell apalis-imx6-10692086.local, length 28
17:08:15.076012 ARP, Reply hdebian is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
^C
88 packets captured
88 packets received by filter
0 packets dropped by kernel

Everything basically worked, without any freezing/slowness (please note
that during the test I wasn't using the VNC client, only the arping). I
also did it using screen with ssh/serial console disconnected.

Although I passed -U flag to arping, I still get replies. Is this
expected?

> note that you're getting bidirectional transfer due to the icmp errors.
> 
> if you want to test unidirectionally, you need to send something that
> won't get a reply.
> for example an unsolicited arp reply (with arping)... or a udp packet
> to a port drop'ed by a firewall.
> 
> and of course make sure you don't run it in such a way that you get
> ssh traffic causing bidirectional traffic.
> (ie. run it (and tcpdump) under screen)
> [this is assuming you can't run it directly on the device without
> getting in via ssh,
> maybe you can via serial port or whatever - though do note that serial
> wakeups could potentially also 'trigger' / 'fix' your hrtimer,
> so probably best to run things silently under screen with no direct
> output via ssh/serial/console.

I also tested by sending UDP packets with netcat, every 1 second:

```
while true
do
        echo 'hi' | nc -u 192.168.11.2 5201
        sleep 1
done
```

I also manually added the ARP entry to the table using the 'arp'
command, expecting I would get rid off ARP calls/replies, but it didn't.
Even though the ARP table is correct, I still see ARP calls. Also, I
can't get rid of ICMP packets, so at the end I couldn't truly test the
one-way direction communication. For example, this is a snippet from
tcpdump:

20:22:00.559786 IP 192.168.11.2.50323 > 192.168.11.1.5201: UDP, length 3
20:22:00.559857 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
20:22:01.563804 IP 192.168.11.2.44521 > 192.168.11.1.5201: UDP, length 3
20:22:01.563903 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
20:22:02.554294 ARP, Request who-has 192.168.11.2 tell 192.168.11.1, length 28
20:22:02.556414 ARP, Reply 192.168.11.2 is-at 62:05:42:df:6f:c2 (oui Unknown), length 28
20:22:02.569192 IP 192.168.11.2.56428 > 192.168.11.1.5201: UDP, length 3
20:22:02.569281 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
20:22:03.575838 IP 192.168.11.2.50178 > 192.168.11.1.5201: UDP, length 3
20:22:03.575903 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
20:22:03.717633 ARP, Request who-has 192.168.11.1 tell 192.168.11.2, length 28
20:22:03.717680 ARP, Reply 192.168.11.1 is-at be:8e:0a:23:00:70 (oui Unknown), length 28
20:22:04.582394 IP 192.168.11.2.41700 > 192.168.11.1.5201: UDP, length 3
20:22:04.582473 IP 192.168.11.1 > 192.168.11.2: ICMP 192.168.11.1 udp port 5201 unreachable, length 39
20:22:05.587417 IP 192.168.11.2.57901 > 192.168.11.1.5201: UDP, length 3

The same happens on both directions, host -> device and device -> host.
I couldn't see any slowness or freezing.

On Mon, Dec 18, 2023 at 03:34:36PM +0100, Oliver Neukum wrote:
> 
> 
> On 15.12.23 22:44, Maciej Żenczykowski wrote:
> > On Fri, Dec 15, 2023 at 1:20 PM Hiago De Franco <hiagofranco@gmail.com> wrote:
> 
> Hi,
> 
> > Here's my recommendation.
> > On the gadget side.
> > Print something when the timer is armed.
> > Print something when the timer fires.
> > Include the timestamp.
> > 
> > Then try to send something (a single packet) that won't trigger a reply.
> 
> You are implicitly raising a question.
> Does this bug strike if a single package is queued? The failure
> case seems to be 10 or 11 packages.

I think I will keep the same test but try to increase the number of
packages per second I'm sending, maybe one packet / 100 ms or something
like that.

> 
> 	Regards
> 		Oliver
>

Best Regards,
Hiago.

