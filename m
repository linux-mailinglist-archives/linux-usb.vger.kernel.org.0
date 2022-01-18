Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9269F491301
	for <lists+linux-usb@lfdr.de>; Tue, 18 Jan 2022 01:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238561AbiARAtJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jan 2022 19:49:09 -0500
Received: from mail.nrtc.syn-alias.com ([129.213.214.220]:45586 "EHLO
        mail.nrtc.syn-alias.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbiARAtI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jan 2022 19:49:08 -0500
X-Authed-Username: Y2thbWFzQGluZm9ybW5ldC5jb20=
Authentication-Results:  smtp01.nrtc.email-ash1.sync.lan smtp.user=<hidden>; auth=pass (LOGIN)
Received: from [99.92.213.82] ([99.92.213.82:36196] helo=[192.168.70.216])
        by mail.informnet.com (envelope-from <ckamas@dslextreme.com>)
        (ecelerity 4.3.1.69410 r(Core:4.3.1.0)) with ESMTPA
        id 36/EF-09894-38E06E16; Mon, 17 Jan 2022 19:49:08 -0500
Subject: Debugging crash in kernel module usbip-host
From:   Chuck Kamas <ckamas@dslextreme.com>
To:     linux-usb@vger.kernel.org
References: <04f3e890-3e6f-4ad2-bfa8-f4cb0e672487@dslextreme.com>
Message-ID: <5700736a-1ba4-9752-e73e-9d54829ce7bf@dslextreme.com>
Date:   Mon, 17 Jan 2022 16:49:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <04f3e890-3e6f-4ad2-bfa8-f4cb0e672487@dslextreme.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Vade-Verdict: clean
X-Vade-Analysis-1: gggruggvucftvghtrhhoucdtuddrgedvvddruddvgddvjecutefuodetggdotefrodftvfcurfhrohhf
X-Vade-Analysis-2: ihhlvgemucfujgfpteevqfftpdfptffvvedpgffpggdqpfftvfevpdfqfgfvnecuuegrihhlohhuthem
X-Vade-Analysis-3: uceftddunecunecujfgurhepuffhvfhfkffffgggjggtgfesthekredttdefjeenucfhrhhomhepvehh
X-Vade-Analysis-4: uhgtkhcumfgrmhgrshcuoegtkhgrmhgrshesughslhgvgihtrhgvmhgvrdgtohhmqeenucggtffrrght
X-Vade-Analysis-5: thgvrhhnpeeguedvleeghfetteefgeffkeefledvveffffevkefhieehtdegffevleffleeivdenucfk
X-Vade-Analysis-6: phepleelrdelvddrvddufedrkedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgv
X-Vade-Analysis-7: thepleelrdelvddrvddufedrkedvpdhhvghloheplgduledvrdduieekrdejtddrvdduiegnpdhmrghi
X-Vade-Analysis-8: lhhfrhhomheptghkrghmrghssegushhlvgigthhrvghmvgdrtghomhdprhgtphhtthhopehlihhnuhig
X-Vade-Analysis-9: qdhushgssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhmthgrhhhoshhtpehsmhhtphdrnhhrthgtrdgv
X-Vade-Analysis-10: mhgrihhlqdgrshhhuddrshihnhgtrdhlrghnpdhnsggprhgtphhtthhopedupdgruhhthhgpuhhsvghr
X-Vade-Analysis-11: pegtkhgrmhgrshesughslhgvgihtrhgvmhgvrdgtohhm
X-Vade-Client: NRTC
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

My USBIP host is crashing while sharing my FTDI quad RS485 to usb 
converter on a raspberry pi CM3. I managed to crash into KDG. I have 
instrumented the kernel and enabled ftrace on the USBIP host kernel 
module. I see that it is crashing when the module tries to access a NULL 
pointer inside stub_free_priv_and_urb in stub_rxloop.


My assumption for the NULL pointer dereference is from the stack back 
trace having DataAbort in it.


I setup ftrace to filter on the usbip kernel module. What I don't 
understand, and would love your help with is what are all these "stub" 
functions? I can not find them in the source code. Where do they come from?


Chuck



  last lines of ftrace:

   stub_tx-403       1d... 1611874480us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611874485us!: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611874623us+: stub_complete 
<-__usb_hcd_giveback_urb
   stub_tx-403       1.... 1611874660us+: stub_send_ret_submit 
<-stub_tx_loop
   stub_tx-403       1d... 1611874738us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611874743us!: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611874942us+: stub_complete 
<-__usb_hcd_giveback_urb
   stub_tx-403       1.... 1611874977us+: stub_send_ret_submit 
<-stub_tx_loop
   stub_tx-403       1d... 1611875053us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611875058us!: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611875481us+: stub_complete 
<-__usb_hcd_giveback_urb
   stub_tx-403       1.... 1611875516us+: stub_send_ret_submit 
<-stub_tx_loop
   stub_tx-403       1d... 1611875617us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611875621us!: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611875777us+: stub_complete 
<-__usb_hcd_giveback_urb
   stub_tx-403       1.... 1611875811us!: stub_send_ret_submit 
<-stub_tx_loop
   stub_tx-403       1d... 1611875914us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611875921us+: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611875945us+: stub_complete 
<-__usb_hcd_giveback_urb
   stub_tx-403       1.... 1611876012us+: stub_send_ret_submit 
<-stub_tx_loop
   stub_tx-403       1d... 1611876091us : stub_free_priv_and_urb 
<-stub_send_ret_submit
   stub_tx-403       1.... 1611876101us!: stub_send_ret_unlink 
<-stub_tx_loop
    <idle-0         0..s. 1611876945us+: stub_complete 
<-__usb_hcd_giveback_urb
    <idle-0         0..s. 1611876958us : stub_complete 
<-__usb_hcd_giveback_urb
    <idle-0         0d.s. 1611876961us : stub_enqueue_ret_unlink 
<-stub_complete
    <idle-0         0d.s. 1611876965us : stub_free_priv_and_urb 
<-stub_complete
  ---------------------------------




  Relevant stack back trace:

  [<801166e0] (__do_kernel_fault.part.0) from [<80951db4] 
(do_translation_fault+0x0/0xc0)
   r7:b6778000 r4:af88fe30

  [<80951a28] (do_page_fault) from [<80951e70] 
(do_translation_fault+0xbc/0xc0)
   r10:7f300550 r9:af88e000 r8:af88fe30 r7:80951db4 r6:000000b0 r5:00000005
   r4:80e0be8c

  [<80951db4] (do_translation_fault) from [<80116858] 
(do_DataAbort+0x4c/0xd0)
   r7:80951db4 r6:000000b0 r5:00000005 r4:80e0be8c

  [<8011680c] (do_DataAbort) from [<801019b4] (__dabt_svc+0x54/0x80)
  Exception stack(0xaf88fe30 to 0xaf88fe78)
  fe20:                                     80bc9e34 80bc9e34 af88fe9c 
af88fe98
  fe40: b5ee2ec0 00000001 00000000 7f30130c af84d5c0 b2f7d204 7f300550 
af88fe94
  fe60: 00000078 af88fe80 af88fe9c 8066cd4c 20070013 ffffffff
   r8:af84d5c0 r7:af88fe64 r6:ffffffff r5:20070013 r4:8066cd4c

  [<8066cd24] (__dev_printk) from [<8066d00c] (_dev_err+0x5c/0x80)

  [<8066cfb0] (_dev_err) from [<7f2ff588] (stub_rx_loop+0x4ec/0xc18 
[usbip_host])
   r3:00000001 r2:00000001 r1:7f30130c

  [<7f2ff09c] (stub_rx_loop [usbip_host]) from [<801462d0] 
(kthread+0x144/0x170)
   r10:b6781d8c r9:b1c3fe5c r8:b2f7d204 r7:af88e000 r6:00000000 r5:b6406700
   r4:b1c3fe40

  [<8014618c] (kthread) from [<801010ac] (ret_from_fork+0x14/0x28)
  Exception stack(0xaf88ffb0 to 0xaf88fff8)
  ffa0:                                     00000000 00000000 00000000 
00000000
  ffc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
  ffe0: 00000000 00000000 00000000 00000000 00000013 00000000
   r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:8014618c
   r4:b6406700




  [dumpcommon]kdb   -summary

  sysname    Linux
  release    5.4.72-v7
  version    #1 SMP Mon Oct 19 11:12:20 UTC 2020
  machine    armv7l
  nodename   raspberrypi-cm3
  domainname (none)
  date       2020-09-20 11:48:10 tz_minuteswest 0
  uptime     01:10
  load avg   2.70 2.49 2.26

  MemTotal:         946992 kB
  MemFree:          788836 kB
  Buffers:            5596 kB
  [dumpcommon]kdb   -cpu

  Currently on cpu 1
  Available cpus: 0(I), 1, 2-3(I)



