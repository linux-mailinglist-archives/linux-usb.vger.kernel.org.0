Return-Path: <linux-usb+bounces-10570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71E8CF919
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 08:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BA221C20C1C
	for <lists+linux-usb@lfdr.de>; Mon, 27 May 2024 06:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 280A3125BA;
	Mon, 27 May 2024 06:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="N5rpRHzx"
X-Original-To: linux-usb@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07F914A90;
	Mon, 27 May 2024 06:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716791370; cv=none; b=NqJa7PZyDH+ADWXOSHSec1qSkdM6HEDrIzSNjum95/3bHQlVKQm1qfUlkcf84xI3slEKLbq0FAYJ66Un5zJ09xs18eHlRA9JiYnz8TJwzz3GGqcwZIOPoBY8vB6NQBhK6x8hS6VydDG1LlSBzJy6GVtpVAhFKPx/QGN020al2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716791370; c=relaxed/simple;
	bh=T9BdJoC4Q9Slbng/cpBW/EFmdspoUW3Pg8Pgut0Ijkg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEbvili5JwcUDUu/MJlzFG1a4VCrG90oTk8W5rfCGsa1+z4c1ah9Y+IMT6vakt6NV9kZ4w0XsYqFMXwglwduol3b2IQMAzChRrNlH8W2qJIPvVlYnOHU1e1AXITOMoHdYRtqev4xl9v1IrEo5xcAkzlVIJ4ZaicJOJj1oFvC448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=N5rpRHzx; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=5u5ERDeSVcgmdxse2/bp9sR3SQ/ZkPWwzOAGoAhaIOE=;
	t=1716791368; x=1717223368; b=N5rpRHzxCd4+damESCeCsm9vsKPDWtZ9U0etrFsPUDl4Pc6
	uZ1EcqWdD0GDFW16ONh8gHk/lj6QE0D6/F1qG0MDCjCH/4ry+85R+oVu2OIOCAZPvRpg6RcJfNeFl
	FuvFzO0YtaK20luiGjuubJEPzyqIqfDz9O/tgr0sXmOeMKkjhV+ni9aSK8GHdswi8Bd+QinS2yvki
	NGaK4b92oE4arc/Yep04jBf4/4YlZg83E2XkU0sY0WRMLiECx4i182ghWD5pVadHORZ0/RixGcrWK
	Lahdud/1bZ9gaspxm0vnwbVxtNvbRMCCzBjaCDUJt46sal4sUKzX2JuZkeVF4VKw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sBTrG-0007F0-T5; Mon, 27 May 2024 08:29:23 +0200
Message-ID: <adbef33a-491f-4fa3-b6c0-49f791381a24@leemhuis.info>
Date: Mon, 27 May 2024 08:29:22 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: u_ether: Replace netif_stop_queue with
 netif_device_detach
To: gregkh@linuxfoundation.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, s.hauer@pengutronix.de,
 jonathanh@nvidia.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_linyyuan@quicinc.com,
 paul@crapouillou.net, quic_eserrao@quicinc.com, erosca@de.adit-jv.com,
 Ferry Toth <fntoth@gmail.com>, Hardik Gajjar <hgajjar@de.adit-jv.com>
References: <Zh6BsK8F3gCzGJfE@smile.fi.intel.com>
 <20240417151342.GA56989@vmlxhi-118.adit-jv.com>
 <d94f37cf-8140-4f89-aa67-53f9291faff3@gmail.com>
 <5dae4b62-24d4-4942-934a-38c548a2fdbc@gmail.com>
 <20240430153243.GA129136@vmlxhi-118.adit-jv.com>
 <8041106f-0be0-4ed9-990e-1f62902b30e9@gmail.com>
 <9dab0c4f-cfae-4212-9a27-518454314eef@gmail.com>
 <20240502152916.GA7995@vmlxhi-118.adit-jv.com>
 <64ffb6e4-d0c9-4e53-a314-a174097516b1@gmail.com>
 <7013cad9-7331-45be-b115-e9e1f253bcea@gmail.com>
 <20240510094520.GA8362@vmlxhi-118.adit-jv.com>
 <6f7b11ed-e387-4d51-b0f4-3af8d4e32a16@gmail.com>
 <fbc1a8c4-a459-4892-af75-d4176e606bd5@gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fbc1a8c4-a459-4892-af75-d4176e606bd5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716791368;f4132b6f;
X-HE-SMSGID: 1sBTrG-0007F0-T5

Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
for once, to make this easily accessible to everyone.

Seems more that four months after the report[1] there is still no
resolution for this regression in sight. This is not how it should be.

Greg, could you maybe chime in here and share your opinion? From my "I
do not know anything about the details of this problem" point of view it
looks like reverting the culprit (f49449fbc21e7e ("usb: gadget: u_ether:
Replace netif_stop_queue with netif_device_detach")) might be the best
option for now, unless of course that creates a regression as well --
but you are the best to judge here.

[1] https://lore.kernel.org/all/ZaQS5x-XK08Jre6I@smile.fi.intel.com/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

On 26.05.24 22:52, Ferry Toth wrote:
> Op 15-05-2024 om 20:38 schreef Ferry Toth:
>>
>> Sorry to have kept you waiting, I was away for a short break.
>>
>> Patch tested below.
>>
>> Op 10-05-2024 om 11:45 schreef Hardik Gajjar:
>>> On Thu, May 02, 2024 at 10:32:16PM +0200, Ferry Toth wrote:
>>>> Oops, sorry, wrong file attached . Now correct one.
>>>>
>>>> Op 02-05-2024 om 22:13 schreef Ferry Toth:
>>>>> Op 02-05-2024 om 17:29 schreef Hardik Gajjar:
>>>>>> On Tue, Apr 30, 2024 at 11:12:17PM +0200, Ferry Toth wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> Op 30-04-2024 om 21:40 schreef Ferry Toth:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> Op 30-04-2024 om 17:32 schreef Hardik Gajjar:
>>>>>>>>> On Sun, Apr 28, 2024 at 11:07:36PM +0200, Ferry Toth wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> Op 25-04-2024 om 23:27 schreef Ferry Toth:
>>>>>>>>>>> Hi,
>>>>>>>>>>>
>>>>>>>>>>> Op 17-04-2024 om 17:13 schreef Hardik Gajjar:
>>>>>>>>>>>> On Tue, Apr 16, 2024 at 04:48:32PM +0300, Andy Shevchenko
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>> On Thu, Apr 11, 2024 at 10:52:36PM +0200, Ferry Toth wrote:
>>>>>>>>>>>>>> Op 11-04-2024 om 18:39 schreef Andy Shevchenko:
>>>>>>>>>>>>>>> On Thu, Apr 11, 2024 at 04:26:37PM +0200, Hardik Gajjar
>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>> On Wed, Apr 10, 2024 at
>>>>>>>>>>>>>>>> 08:37:42PM +0300, Andy
>>>>>>>>>>>>>>>> Shevchenko wrote:
>>>>>>>>>>>>>>>>> On Sun, Apr 07, 2024 at 10:51:51PM +0200, Ferry Toth
>>>>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>>>>>> Op 05-04-2024 om 13:38 schreef Hardik Gajjar:
>>>>>>>>>>>>>
>>>>>>>>>>>>> ...
>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Exactly. And this didn't happen before the 2 patches.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> To be precise: /sys/class/net/usb0 is not
>>>>>>>>>>>>>>>>>> removed and it is a link, the link
>>>>>>>>>>>>>>>>>> target
>>>>>>>>>>>>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/net/usb0
>>>>>>>>>>>>>>>>>> no
>>>>>>>>>>>>>>>>>> longer exists
>>>>>>>>>>>>>>>> So, it means that the /sys/class/net/usb0 is
>>>>>>>>>>>>>>>> present, but the symlink is
>>>>>>>>>>>>>>>> broken. In that case, the dwc3 driver should
>>>>>>>>>>>>>>>> recreate the device, and the
>>>>>>>>>>>>>>>> symlink should become active again
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Yes, on first enabling gadget (when device mode is
>>>>>>>>>>>>>> activated):
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> root@yuna:~# ls
>>>>>>>>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>>>>>>>>> driver  net  power  sound  subsystem  suspended  uevent
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Then switching to host mode:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> root@yuna:~# ls
>>>>>>>>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>>>>>>>>> ls: cannot access
>>>>>>>>>>>>>> '/sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/':
>>>>>>>>>>>>>> No such file
>>>>>>>>>>>>>> or directory
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Then back to device mode:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> root@yuna:~# ls
>>>>>>>>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>>>>>>>>> driver  power  sound  subsystem  suspended  uevent
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> net is missing. But, network functions:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> root@yuna:~# ping 10.42.0.1
>>>>>>>>>>>>>> PING 10.42.0.1 (10.42.0.1): 56 data bytes
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Mass storage device is created and removed each time as
>>>>>>>>>>>>>> expected.
>>>>>>>>>>>>>
>>>>>>>>>>>>> So, what's the conclusion? Shall we move towards revert of
>>>>>>>>>>>>> those
>>>>>>>>>>>>> two changes?
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> As promised, I have the tested the this patch with the dwc3
>>>>>>>>>>>> gadget.
>>>>>>>>>>>> I could not reproduce
>>>>>>>>>>>> the issue.
>>>>>>>>>>>>
>>>>>>>>>>>> I can see the usb0 exist all the time and accessible
>>>>>>>>>>>> regardless of
>>>>>>>>>>>> the role switching of the USB mode (peripheral <-> host)
>>>>>>>>>>>>
>>>>>>>>>>>> Following are the logs:
>>>>>>>>>>>> //Host to device
>>>>>>>>>>>>
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb # echo
>>>>>>>>>>>> "peripheral"
>>>>>>>>>>>>> mode
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ls
>>>>>>>>>>>> a800000.dwc3/gadget/net/
>>>>>>>>>>>> usb0
>>>>>>>>>>>>
>>>>>>>>>>>> //device to host
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb
>>>>>>>>>>>> # echo "host" > mode
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ls
>>>>>>>>>>>> a800000.dwc3/gadget/net/
>>>>>>>>>>>> usb0
>>>>>>>>>>>
>>>>>>>>>>> That is weird. When I switch to host mode (using
>>>>>>>>>>> the physical switch),
>>>>>>>>>>> the whole gadget directory is removed (now testing 6.9.0-rc5)
>>>>>>>>>>>
>>>>>>>>>>> Switching back to device mode, that gadget
>>>>>>>>>>> directory is recreated. And
>>>>>>>>>>> gadget/sound as well, but not gadget/net.
>>>>>>>>>>>
>>>>>>>>>>>> s a800000.dwc3/gadget/net/usb0
>>>>>>>>>>>> <
>>>>>>>>>>>> addr_assign_type    duplex             phys_port_name
>>>>>>>>>>>> addr_len            flags              phys_switch_id
>>>>>>>>>>>> address             gro_flush_timeout  power
>>>>>>>>>>>> broadcast           ifalias            proto_down
>>>>>>>>>>>> carrier             ifindex            queues
>>>>>>>>>>>> carrier_changes     iflink             speed
>>>>>>>>>>>> carrier_down_count  link_mode          statistics
>>>>>>>>>>>> carrier_up_count    mtu                subsystem
>>>>>>>>>>>> dev_id              name_assign_type   tx_queue_len
>>>>>>>>>>>> dev_port            netdev_group       type
>>>>>>>>>>>> device              operstate          uevent
>>>>>>>>>>>> dormant             phys_port_id       waiting_for_supplier
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ifconfig
>>>>>>>>>>>> -a usb0
>>>>>>>>>>>> usb0      Link encap:Ethernet  HWaddr 3a:8b:63:97:1a:9a
>>>>>>>>>>>>               BROADCAST MULTICAST  MTU:1500  Metric:1
>>>>>>>>>>>>               RX packets:0 errors:0 dropped:0 overruns:0
>>>>>>>>>>>> frame:0
>>>>>>>>>>>>               TX packets:0 errors:0 dropped:0 overruns:0
>>>>>>>>>>>> carrier:0
>>>>>>>>>>>>               collisions:0 txqueuelen:1000
>>>>>>>>>>>>               RX bytes:0 TX bytes:0
>>>>>>>>>>>>
>>>>>>>>>>>> console:/sys/bus/platform/devices/a800000.ssusb #
>>>>>>>>>>>>
>>>>>>>>>>>> I strongly advise against reverting the patch solely based
>>>>>>>>>>>> on the
>>>>>>>>>>>> observed issue of removing the /sys/class/net/usb0 directory
>>>>>>>>>>>> while
>>>>>>>>>>>> the usb0 interface remains available.
>>>>>>>>>>>
>>>>>>>>>>> There's more to it. I also mentioned that switching the role or
>>>>>>>>>>> unplugging the cable leaves the usb0 connection.
>>>>>>>>>>>
>>>>>>>>>>> I have while in host mode:
>>>>>>>>>>> root@yuna:~# ifconfig -a usb0
>>>>>>>>>>> usb0: flags=-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC> 
>>>>>>>>>>> mtu 1500
>>>>>>>>>>>             inet 10.42.0.221  netmask 255.255.255.0  broadcast
>>>>>>>>>>> 10.42.0.255
>>>>>>>>>>>             inet6 fe80::a8bb:ccff:fedd:eef1  prefixlen 64
>>>>>>>>>>> scopeid 0x20<link>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> You don't see that because you didn't create a connection at
>>>>>>>>>>> all.
>>>>>>>>>>>
>>>>>>>>>>>> Instead, I recommend enabling FTRACE to
>>>>>>>>>>>> trace the functions involved
>>>>>>>>>>>> and identify which faulty call is responsible for removing
>>>>>>>>>>>> usb0.
>>>>>>>>>>>
>>>>>>>>>>> Switching from device -> host -> device:
>>>>>>>>>>>
>>>>>>>>>>> root@yuna:~# trace-cmd record -p function_graph -l *gether_*
>>>>>>>>>>>       plugin 'function_graph'
>>>>>>>>>>> Hit Ctrl^C to stop recording
>>>>>>>>>>> ^CCPU0 data recorded at offset=0x1c8000
>>>>>>>>>>>         188 bytes in size (4096 uncompressed)
>>>>>>>>>>> CPU1 data recorded at offset=0x1c9000
>>>>>>>>>>>         0 bytes in size (0 uncompressed)
>>>>>>>>>>> root@yuna:~# trace-cmd report
>>>>>>>>>>> cpus=2
>>>>>>>>>>>          irq/68-dwc3-725   [000]   514.575337:
>>>>>>>>>>> funcgraph_entry:      #
>>>>>>>>>>> 2079.480 us |  gether_disconnect();
>>>>>>>>>>>          irq/68-dwc3-946   [000]   524.263731:
>>>>>>>>>>> funcgraph_entry:      +
>>>>>>>>>>> 11.640 us  |  gether_disconnect();
>>>>>>>>>>>          irq/68-dwc3-946   [000]   524.263743:
>>>>>>>>>>> funcgraph_entry:      !
>>>>>>>>>>> 116.520 us |  gether_connect();
>>>>>>>>>>>          irq/68-dwc3-946   [000]   524.268029:
>>>>>>>>>>> funcgraph_entry:      #
>>>>>>>>>>> 2057.260 us |  gether_disconnect();
>>>>>>>>>>>          irq/68-dwc3-946   [000]   524.270089:
>>>>>>>>>>> funcgraph_entry:      !
>>>>>>>>>>> 109.000 us |  gether_connect();
>>>>>>>>>>
>>>>>>>>>> I tried to get a more useful trace:
>>>>>>>>>> root@yuna:/sys/kernel/tracing# echo 'gether_*' >
>>>>>>>>>> set_ftrace_filter
>>>>>>>>>> root@yuna:/sys/kernel/tracing# echo 'eem_*' >> set_ftrace_filter
>>>>>>>>>> root@yuna:/sys/kernel/tracing# echo function > current_tracer
>>>>>>>>>> root@yuna:/sys/kernel/tracing# echo 'reset_config'
>>>>>>>>>>>> set_ftrace_filter
>>>>>>>>>> -> switch to host mode then back to device
>>>>>>>>>> root@yuna:/sys/kernel/tracing# cat trace
>>>>>>>>>> # tracer: function
>>>>>>>>>> #
>>>>>>>>>> # entries-in-buffer/entries-written: 53/53   #P:2
>>>>>>>>>> #
>>>>>>>>>> #                                _-----=> irqs-off/BH-disabled
>>>>>>>>>> #                               / _----=> need-resched
>>>>>>>>>> #                              | / _---=> hardirq/softirq
>>>>>>>>>> #                              || / _--=> preempt-depth
>>>>>>>>>> #                              ||| / _-=> migrate-disable
>>>>>>>>>> #                              |||| /     delay
>>>>>>>>>> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
>>>>>>>>>> #              | |         |   |||||     |         |
>>>>>>>>>>         irq/68-dwc3-523     [000] D..3.   133.990254:
>>>>>>>>>> reset_config
>>>>>>>>>> <-__composite_disconnect
>>>>>>>>>>         irq/68-dwc3-523     [000] D..3.   133.992274: eem_disable
>>>>>>>>>> <-reset_config
>>>>>>>>>>         irq/68-dwc3-523     [000] D..3.   133.992276:
>>>>>>>>>> gether_disconnect
>>>>>>>>>> <-reset_config
>>>>>>>>>>         kworker/1:3-443     [001] ...1.   134.022453: eem_unbind
>>>>>>>>>> <-purge_configs_funcs
>>>>>>>>>>
>>>>>>>>>> -> to device mode
>>>>>>>>>>
>>>>>>>>>>         kworker/1:3-443     [001] ...1.   148.630773: eem_bind
>>>>>>>>>> <-usb_add_function
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.155209: eem_set_alt
>>>>>>>>>> <-composite_setup
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.155215:
>>>>>>>>>> gether_disconnect
>>>>>>>>>> <-eem_set_alt
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.155220:
>>>>>>>>>> gether_connect
>>>>>>>>>> <-eem_set_alt
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.157287: eem_set_alt
>>>>>>>>>> <-composite_setup
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.157292:
>>>>>>>>>> gether_disconnect
>>>>>>>>>> <-eem_set_alt
>>>>>>>>>>         irq/68-dwc3-734     [000] D..3.   149.159338:
>>>>>>>>>> gether_connect
>>>>>>>>>> <-eem_set_alt
>>>>>>>>>>         irq/68-dwc3-734     [000] D..2.   149.239625: eem_unwrap
>>>>>>>>>> <-rx_complete
>>>>>>>>>> ...
>>>>>>>>>>
>>>>>>>>>> I don't know where to look exactly. Any hints?
>>>>>>>>>
>>>>>>>>> do you see anything related to gether_cleanup() after
>>>>>>>>> eem_unbind() ?
>>>>>>>>
>>>>>>>> Nope. It's a pitty that the trace formatting got messed up
>>>>>>>> above. But as
>>>>>>>> you can see I traced gether_* and eem_*. After eem_unbind no traced
>>>>>>>> function is called, until I flip the switch to device mode.
>>>>>>>> The ... at the end is where I cut uninteresting eem_unwrap
>>>>>>>> <-rx_complete
>>>>>>>> and eem_wrap <-eth_start_xmit lines.
>>>>>>>>
>>>>>>>>> If not then, you may try to enable tracing of TCP/IP stack and
>>>>>>>>> network side to check who deleting the sysfs entry
>>>>>>>>
>>>>>>>> Yes, that's a vast amount of functions to trace. And I don't see
>>>>>>>> how
>>>>>>>> that would be related to the patch we're discussing here. I was
>>>>>>>> hoping
>>>>>>>> for a little more targeted hint.
>>>>>>>
>>>>>>> Now filtering 'gether_*', 'eem_*', '*configfs_*', 'composite_*',
>>>>>>> 'usb_fun*',
>>>>>>> 'reset_config' and 'device_remove_file' leads me to:
>>>>>>>
>>>>>>> TIMESTAMP  FUNCTION
>>>>>>>      |         |
>>>>>>>     49.952477: eem_wrap <-eth_start_xmit
>>>>>>>     55.072455: eem_wrap <-eth_start_xmit
>>>>>>>     55.072621: eem_unwrap <-rx_complete
>>>>>>>     59.011540: configfs_composite_reset <-usb_gadget_udc_reset
>>>>>>>     59.011545: composite_reset <-configfs_composite_reset
>>>>>>>     59.011548: reset_config <-__composite_disconnect
>>>>>>>     59.013565: eem_disable <-reset_config
>>>>>>>     59.013567: gether_disconnect <-reset_config
>>>>>>>     59.049560: device_remove_file <-device_remove
>>>>>>>     59.051185: configfs_composite_disconnect <-usb_gadget_disco
>>>>>>>     59.051189: composite_disconnect <-configfs_composite_discon
>>>>>>>     59.051195: configfs_composite_unbind <-gadget_unbind_driver
>>>>>>>     59.052519: eem_unbind <-purge_configs_funcs
>>>>>>>     59.052529: composite_dev_cleanup <-configfs_composite_unbin
>>>>>>>     59.052537: device_remove_file <-composite_dev_cleanup
>>>>>>>
>>>>>>> device_remove_file gets called twice, once by device_remove after
>>>>>>> gether_disconnect (that the one). The 2nd time by
>>>>>>> composite_dev_cleanup
>>>>>>> (removing the gadget)
>>>>>>
>>>>>> I believe that the device_remove_file function is only removing
>>>>>> suspend-specific attributes, not the complete gadget.
>>>>>> Typically, when you perform the role switch, the Gadget start/stop
>>>>>> function in your UDC driver is called. These functions should not
>>>>>> delete the gadget
>>>>>>
>>>>>> To investigate further, could you please enable the DWC3 functions
>>>>>> in ftrace and check who is removing the gadget?
>>>>>> I can also enable this on my system and compare the logs with yours,
>>>>>> but I will be in PI planning for 1.5 weeks and may not be able to
>>>>>> provide immediate support.
>>>>>
>>>>> Yes, but of course adding dwc3_* (and usb_*) also traces host mode, so
>>>>> trace is 600kb. I cut uninteresting stuff before
>>>>> configfs_composite_reset <-usb_gadget_udc_reset and after
>>>>> __dwc3_set_mode,
>>>>> <https://urldefense.proofpoint.com/v2/url?u=http-3A__300linesremain.Seeattachedtar.gzforyouto&d=DwIDaQ&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=SAhjP5GOmrADp1v_EE5jWoSuMlYCIt9gKduw-DCBPLs&m=zdiBhk-2V5AXxu707QAhbCgWR4qNVRARBmxN17nVB69gVOm-QPqrJeKpo4_trszw&s=ixagWKgLs6wQDJfwh4vIDQNDiy8GZnK9KnUELIfiJz0&e=>
>>>>> compare.
>>>>>
>>> Could you please try with the following patch and see if your issue
>>> resolves ?
>>>
>>> diff --git a/drivers/usb/gadget/function/f_eem.c
>>> b/drivers/usb/gadget/function/f_eem.c
>>> index 3b445bd88498..c2a904475083 100644
>>> --- a/drivers/usb/gadget/function/f_eem.c
>>> +++ b/drivers/usb/gadget/function/f_eem.c
>>> @@ -247,7 +247,7 @@ static int eem_bind(struct usb_configuration *c,
>>> struct usb_function *f)
>>>       struct usb_composite_dev *cdev = c->cdev;
>>>       struct f_eem        *eem = func_to_eem(f);
>>>       struct usb_string    *us;
>>> -    int            status;
>>> +    int            status = 0;
>>>       struct usb_ep        *ep;
>>>       struct f_eem_opts    *eem_opts;
>>> @@ -260,16 +260,20 @@ static int eem_bind(struct usb_configuration
>>> *c, struct usb_function *f)
>>>        * with list_for_each_entry, so we assume no race condition
>>>        * with regard to eem_opts->bound access
>>>        */
>>> +    mutex_lock(&eem_opts->lock);
>>> +    gether_set_gadget(eem_opts->net, cdev->gadget);
>>> +
>>>       if (!eem_opts->bound) {
>>> -        mutex_lock(&eem_opts->lock);
>>> -        gether_set_gadget(eem_opts->net, cdev->gadget);
>>>           status = gether_register_netdev(eem_opts->net);
>>> -        mutex_unlock(&eem_opts->lock);
>>> -        if (status)
>>> -            return status;
>>> -        eem_opts->bound = true;
>>>       }
>>> +    mutex_unlock(&eem_opts->lock);
>>> +
>>> +    if (status)
>>> +        goto fail;
>>> +
>>> +    eem_opts->bound = true;
>>> +
>>>       us = usb_gstrings_attach(cdev, eem_strings,
>>>                    ARRAY_SIZE(eem_string_defs));
>>>
>>
>> After switching from host -> device -> host the usb0 device as seen by
>> ifconfig remains "RUNNING" and in the routing table.
>>
>> FYI This is the regression.
> 
> For us, I don't see any advantages in having this patch and only the
> downside. Do you have any further ideas / patches that we could test.
> 
> Otherwise, it might be best to go with the original suggestion and
> revert until it gets sorted out?
> 
>> Also /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/net is
>> still missing.
>>
>> After deeper diving into v6.1.0, I found the latter a longer existing
>> bug, not caused by your patch.
>>
>> More over, this doesn't seem to do any harm.
>>
>> The first issue does, as we try to route traffic over a device that no
>> longer exists.
>>
>>>>>> Additionally, please check if you have any customized DWC patches
>>>>>> that may be causing this problem.
>>>>>>
>>>>>>>
>>>>>>>> You may recall the whole issue did not occur before this
>>>>>>>> patch got applied.
>>>>>>>>
>>>>>>>>> Hardik
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> According to current kernel architecture of u_ether driver,
>>>>>>>>>>>> only
>>>>>>>>>>>> gether_cleanup should remove the usb0 interface along with its
>>>>>>>>>>>> kobject and sysfs interface.
>>>>>>>>>>>> I suggest sharing the analysis here to understand why this
>>>>>>>>>>>> practice
>>>>>>>>>>>> is not followed in your use case or driver ?
>>>>>>>>>>>
>>>>>>>>>>> Yes, I'll try to trace where that happens.
>>>>>>>>>>>
>>>>>>>>>>> Nevertheless, the disappearance of the net/usb0 directory seems
>>>>>>>>>>> harmless? But the usb: net device remaining after disconnect
>>>>>>>>>>> or role
>>>>>>>>>>> switch is not good, as the route remains.
>>>>>>>>>>>
>>>>>>>>>>> May be they are 2 separate problems. Could you try to
>>>>>>>>>>> reproduce what
>>>>>>>>>>> happens if you make eem connection and then unplug?
>>>>>>>>>>>
>>>>>>>>>>>> I am curious why the driver was developed without adhering
>>>>>>>>>>>> to the
>>>>>>>>>>>> kernel's gadget architecture.
>>>>>>>>>>
>>>>>>>>>> I don't know what you mean here. Which driver do you mean?
>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> I have the dwc3 IP base usb controller, Let me check
>>>>>>>>>>>>>>>> with this patch and
>>>>>>>>>>>>>>>> share result here.  May be we need some fix in dwc3
>>>>>>>>>>>>>> Would have been nice if someone could test on other
>>>>>>>>>>>>>> controller as well. But
>>>>>>>>>>>>>> another instance of dwc3 is also very welcome.
>>>>>>>>>>>>>>> It's quite possible, please test on your side.
>>>>>>>>>>>>>>> We are happy to test any fixes if you come up with.
>>>>>>>>>>>>>
>>>>>>>>>>>>> -- 
>>>>>>>>>>>>> With Best Regards,
>>>>>>>>>>>>> Andy Shevchenko

