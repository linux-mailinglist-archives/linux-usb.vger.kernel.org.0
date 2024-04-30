Return-Path: <linux-usb+bounces-9947-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F9C8B81C9
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 23:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0137285CBC
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2024 21:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0172A1A38E1;
	Tue, 30 Apr 2024 21:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ES5qfRE6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0361836C7;
	Tue, 30 Apr 2024 21:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714511542; cv=none; b=jg1xiKEqMXlVWBLtl8pkIIt5B3iPpvL6/EPhJwP6O6ikV6Jp/vCeRjSEahGIwQ1o4EJoWNbXOusbWhYStWfNJg4EcT0EY36qZu/rqzjAFMh4fb3+r/UDKhPIL/nEwCL5EzJjtt4wOfZNLCZlsYkVFATB+sGiZtpRnZbs3sRT13U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714511542; c=relaxed/simple;
	bh=fGCCdoxDDwrpsaWn5ssJe2ZzuI+POHe/6T6wY2dl4EM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bVfTGrAQuKXk1kcUKA6fOItBNjzUQsQhscOdfdtjRkMbK8iCYkap6xlYZyE6Jx3u9T2qe/DSFB84IvEGqI8CJU/sjPOShnyE3Sp1C6mMcnlawQ1u8R2K++I9PTNk61RM2khv6hqunWETMMxwtBL8H9i+e0IgLn8FwV5henvZ9Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ES5qfRE6; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a5872b74c44so700917766b.3;
        Tue, 30 Apr 2024 14:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714511538; x=1715116338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GcnpSXZy6JDkGcppflz6R7DNg7mZYjTuYj+LMJnFTq8=;
        b=ES5qfRE64QpMFZ+EtlRtZaPfZ2bWRSY2nLddxljnZeVBee86PgiW8OnX0A2Cn/D9Hc
         vbVKoyW+MoBfAE3zJDN46f5V/lHWFlG0A575IxFHsgsE3WJZGKXmeHrTi3lBjp1G+wam
         xU1Tkp3oi72fbR7IGG5lVMz8/oxDn5QuO6bQtQIRKcHSZuYqSsrD/vEPmqiuMZULhB5t
         A02QhA9dUXL7lUUXonwzBVXYiRefONreUPURw8AKckNqL1BwSegAqEcZsRWifD9toPCy
         3EuNM2yuuZIUAqUnn4EYWiXmK96erc79KaNh4TOcLx8TnkumysRwgl1D/KnDH/Q6Su/g
         yveA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714511538; x=1715116338;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GcnpSXZy6JDkGcppflz6R7DNg7mZYjTuYj+LMJnFTq8=;
        b=svftopVm3SYfz+Xon6qHkmlwNEck5f5x3QtJG3BFf8A7Ma+Tl+Vm8LoeuRqlnsD26o
         Sf9sOTXhiwR9ekSAWeyKv7gclXo9A2T0f6Xi7qmC2cP9UFUoRCTbpLg/ezpkQxGoGFYx
         qmA3LyqjWm643LpkB5FxEuElOCvokk2tvthMOhw2xjjUGafymjYqZAlwa+ji4e64eUfc
         m+4aL9lPnkb5JUgeWWdF2cVgXVuzKGcHBA8yjquyvNMukQZe2yAcmodU4Kyevu8U2S/l
         K0DdoTxEGIsNJ+BYAbTKOwlMR4qVSKiTk9P1I2pMVbpIwu/hfJCVuuTblxGI9aHwmAef
         WKtg==
X-Forwarded-Encrypted: i=1; AJvYcCVkWsMyYBmvK0RUMO6sBxFpwj5/UwNYqO7VJDgodN9WvjehnEbdD6LQugP4ZWdMX+STmaeKaeu3pdi/cqENZnixrKR9oxeo9YossTAJERJTTaiHwSddFupvJGj09I7Y4A+U3/tR6ftT
X-Gm-Message-State: AOJu0YzB/LioB3ZoL3iaB60IS3w3bUOtSomqRi5hEro9YpsSmxYZTWYi
	Dnq0EsLkk5DJrh0NeAJS2HzzSt96vmY5r+jAJcJosMtEOAUmTQSJ
X-Google-Smtp-Source: AGHT+IHScK6NaZYscJrmuCOhuBhDo6Rf5QLlz7M+DL6z8J/8fZPDjWBNoYYLl5X+xiJqbHVbajCLUA==
X-Received: by 2002:a17:906:26d7:b0:a58:86c0:1275 with SMTP id u23-20020a17090626d700b00a5886c01275mr526498ejc.30.1714511538362;
        Tue, 30 Apr 2024 14:12:18 -0700 (PDT)
Received: from ?IPV6:2a02:a466:68ed:1:785f:7673:480b:1453? (2a02-a466-68ed-1-785f-7673-480b-1453.fixed6.kpn.net. [2a02:a466:68ed:1:785f:7673:480b:1453])
        by smtp.gmail.com with ESMTPSA id i22-20020a1709061cd600b00a55a10eb070sm12493999ejh.214.2024.04.30.14.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 14:12:17 -0700 (PDT)
Message-ID: <9dab0c4f-cfae-4212-9a27-518454314eef@gmail.com>
Date: Tue, 30 Apr 2024 23:12:17 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] usb: gadget: u_ether: Replace netif_stop_queue with
 netif_device_detach
From: Ferry Toth <fntoth@gmail.com>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
 gregkh@linuxfoundation.org, s.hauer@pengutronix.de, jonathanh@nvidia.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_linyyuan@quicinc.com, paul@crapouillou.net, quic_eserrao@quicinc.com,
 erosca@de.adit-jv.com
References: <20240405113855.GA121923@vmlxhi-118.adit-jv.com>
 <321e908e-0d10-4e36-8dc4-6997c73fe2eb@gmail.com>
 <ZhbOZsp-XHemVhQz@smile.fi.intel.com>
 <20240411142637.GA110162@vmlxhi-118.adit-jv.com>
 <ZhgSPCq6sVejRjbj@smile.fi.intel.com>
 <be8904bd-71ea-4ae1-b0bc-9170461fd0d9@gmail.com>
 <Zh6BsK8F3gCzGJfE@smile.fi.intel.com>
 <20240417151342.GA56989@vmlxhi-118.adit-jv.com>
 <d94f37cf-8140-4f89-aa67-53f9291faff3@gmail.com>
 <5dae4b62-24d4-4942-934a-38c548a2fdbc@gmail.com>
 <20240430153243.GA129136@vmlxhi-118.adit-jv.com>
 <8041106f-0be0-4ed9-990e-1f62902b30e9@gmail.com>
Content-Language: en-US
In-Reply-To: <8041106f-0be0-4ed9-990e-1f62902b30e9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Op 30-04-2024 om 21:40 schreef Ferry Toth:
> Hi,
> 
> Op 30-04-2024 om 17:32 schreef Hardik Gajjar:
>> On Sun, Apr 28, 2024 at 11:07:36PM +0200, Ferry Toth wrote:
>>> Hi,
>>>
>>> Op 25-04-2024 om 23:27 schreef Ferry Toth:
>>>> Hi,
>>>>
>>>> Op 17-04-2024 om 17:13 schreef Hardik Gajjar:
>>>>> On Tue, Apr 16, 2024 at 04:48:32PM +0300, Andy Shevchenko wrote:
>>>>>> On Thu, Apr 11, 2024 at 10:52:36PM +0200, Ferry Toth wrote:
>>>>>>> Op 11-04-2024 om 18:39 schreef Andy Shevchenko:
>>>>>>>> On Thu, Apr 11, 2024 at 04:26:37PM +0200, Hardik Gajjar wrote:
>>>>>>>>> On Wed, Apr 10, 2024 at 08:37:42PM +0300, Andy Shevchenko wrote:
>>>>>>>>>> On Sun, Apr 07, 2024 at 10:51:51PM +0200, Ferry Toth wrote:
>>>>>>>>>>> Op 05-04-2024 om 13:38 schreef Hardik Gajjar:
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>>>>> Exactly. And this didn't happen before the 2 patches.
>>>>>>>>>>>
>>>>>>>>>>> To be precise: /sys/class/net/usb0 is not
>>>>>>>>>>> removed and it is a link, the link
>>>>>>>>>>> target 
>>>>>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/net/usb0
>>>>>>>>>>> no
>>>>>>>>>>> longer exists
>>>>>>>>> So, it means that the /sys/class/net/usb0 is
>>>>>>>>> present, but the symlink is
>>>>>>>>> broken. In that case, the dwc3 driver should
>>>>>>>>> recreate the device, and the
>>>>>>>>> symlink should become active again
>>>>>>>
>>>>>>> Yes, on first enabling gadget (when device mode is activated):
>>>>>>>
>>>>>>> root@yuna:~# ls
>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>> driver  net  power  sound  subsystem  suspended  uevent
>>>>>>>
>>>>>>> Then switching to host mode:
>>>>>>>
>>>>>>> root@yuna:~# ls
>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>> ls: cannot access
>>>>>>> '/sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/':
>>>>>>> No such file
>>>>>>> or directory
>>>>>>>
>>>>>>> Then back to device mode:
>>>>>>>
>>>>>>> root@yuna:~# ls
>>>>>>> /sys/devices/pci0000:00/0000:00:11.0/dwc3.0.auto/gadget.0/
>>>>>>> driver  power  sound  subsystem  suspended  uevent
>>>>>>>
>>>>>>> net is missing. But, network functions:
>>>>>>>
>>>>>>> root@yuna:~# ping 10.42.0.1
>>>>>>> PING 10.42.0.1 (10.42.0.1): 56 data bytes
>>>>>>>
>>>>>>> Mass storage device is created and removed each time as expected.
>>>>>>
>>>>>> So, what's the conclusion? Shall we move towards revert of those
>>>>>> two changes?
>>>>>
>>>>>
>>>>> As promised, I have the tested the this patch with the dwc3 gadget.
>>>>> I could not reproduce
>>>>> the issue.
>>>>>
>>>>> I can see the usb0 exist all the time and accessible regardless of
>>>>> the role switching of the USB mode (peripheral <-> host)
>>>>>
>>>>> Following are the logs:
>>>>> //Host to device
>>>>>
>>>>> console:/sys/bus/platform/devices/a800000.ssusb # echo "peripheral"
>>>>>> mode
>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ls
>>>>> a800000.dwc3/gadget/net/
>>>>> usb0
>>>>>
>>>>> //device to host
>>>>> console:/sys/bus/platform/devices/a800000.ssusb # echo "host" > mode
>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ls
>>>>> a800000.dwc3/gadget/net/
>>>>> usb0
>>>>
>>>> That is weird. When I switch to host mode (using the physical switch),
>>>> the whole gadget directory is removed (now testing 6.9.0-rc5)
>>>>
>>>> Switching back to device mode, that gadget directory is recreated. And
>>>> gadget/sound as well, but not gadget/net.
>>>>
>>>>> s a800000.dwc3/gadget/net/usb0
>>>>> <
>>>>> addr_assign_type    duplex             phys_port_name
>>>>> addr_len            flags              phys_switch_id
>>>>> address             gro_flush_timeout  power
>>>>> broadcast           ifalias            proto_down
>>>>> carrier             ifindex            queues
>>>>> carrier_changes     iflink             speed
>>>>> carrier_down_count  link_mode          statistics
>>>>> carrier_up_count    mtu                subsystem
>>>>> dev_id              name_assign_type   tx_queue_len
>>>>> dev_port            netdev_group       type
>>>>> device              operstate          uevent
>>>>> dormant             phys_port_id       waiting_for_supplier
>>>>> console:/sys/bus/platform/devices/a800000.ssusb # ifconfig -a usb0
>>>>> usb0      Link encap:Ethernet  HWaddr 3a:8b:63:97:1a:9a
>>>>>             BROADCAST MULTICAST  MTU:1500  Metric:1
>>>>>             RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>>>>>             TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>>>>>             collisions:0 txqueuelen:1000
>>>>>             RX bytes:0 TX bytes:0
>>>>>
>>>>> console:/sys/bus/platform/devices/a800000.ssusb #
>>>>>
>>>>> I strongly advise against reverting the patch solely based on the
>>>>> observed issue of removing the /sys/class/net/usb0 directory while
>>>>> the usb0 interface remains available.
>>>>
>>>> There's more to it. I also mentioned that switching the role or
>>>> unplugging the cable leaves the usb0 connection.
>>>>
>>>> I have while in host mode:
>>>> root@yuna:~# ifconfig -a usb0
>>>> usb0: flags=-28605<UP,BROADCAST,RUNNING,MULTICAST,DYNAMIC>  mtu 1500
>>>>           inet 10.42.0.221  netmask 255.255.255.0  broadcast 
>>>> 10.42.0.255
>>>>           inet6 fe80::a8bb:ccff:fedd:eef1  prefixlen 64  scopeid 
>>>> 0x20<link>
>>>>
>>>>
>>>> You don't see that because you didn't create a connection at all.
>>>>
>>>>> Instead, I recommend enabling FTRACE to trace the functions involved
>>>>> and identify which faulty call is responsible for removing usb0.
>>>>
>>>> Switching from device -> host -> device:
>>>>
>>>> root@yuna:~# trace-cmd record -p function_graph -l *gether_*
>>>>     plugin 'function_graph'
>>>> Hit Ctrl^C to stop recording
>>>> ^CCPU0 data recorded at offset=0x1c8000
>>>>       188 bytes in size (4096 uncompressed)
>>>> CPU1 data recorded at offset=0x1c9000
>>>>       0 bytes in size (0 uncompressed)
>>>> root@yuna:~# trace-cmd report
>>>> cpus=2
>>>>        irq/68-dwc3-725   [000]   514.575337: funcgraph_entry:      #
>>>> 2079.480 us |  gether_disconnect();
>>>>        irq/68-dwc3-946   [000]   524.263731: funcgraph_entry:      +
>>>> 11.640 us  |  gether_disconnect();
>>>>        irq/68-dwc3-946   [000]   524.263743: funcgraph_entry:      !
>>>> 116.520 us |  gether_connect();
>>>>        irq/68-dwc3-946   [000]   524.268029: funcgraph_entry:      #
>>>> 2057.260 us |  gether_disconnect();
>>>>        irq/68-dwc3-946   [000]   524.270089: funcgraph_entry:      !
>>>> 109.000 us |  gether_connect();
>>>
>>> I tried to get a more useful trace:
>>> root@yuna:/sys/kernel/tracing# echo 'gether_*' > set_ftrace_filter
>>> root@yuna:/sys/kernel/tracing# echo 'eem_*' >> set_ftrace_filter
>>> root@yuna:/sys/kernel/tracing# echo function > current_tracer
>>> root@yuna:/sys/kernel/tracing# echo 'reset_config' >> set_ftrace_filter
>>> -> switch to host mode then back to device
>>> root@yuna:/sys/kernel/tracing# cat trace
>>> # tracer: function
>>> #
>>> # entries-in-buffer/entries-written: 53/53   #P:2
>>> #
>>> #                                _-----=> irqs-off/BH-disabled
>>> #                               / _----=> need-resched
>>> #                              | / _---=> hardirq/softirq
>>> #                              || / _--=> preempt-depth
>>> #                              ||| / _-=> migrate-disable
>>> #                              |||| /     delay
>>> #           TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
>>> #              | |         |   |||||     |         |
>>>       irq/68-dwc3-523     [000] D..3.   133.990254: reset_config
>>> <-__composite_disconnect
>>>       irq/68-dwc3-523     [000] D..3.   133.992274: eem_disable
>>> <-reset_config
>>>       irq/68-dwc3-523     [000] D..3.   133.992276: gether_disconnect
>>> <-reset_config
>>>       kworker/1:3-443     [001] ...1.   134.022453: eem_unbind
>>> <-purge_configs_funcs
>>>
>>> -> to device mode
>>>
>>>       kworker/1:3-443     [001] ...1.   148.630773: eem_bind
>>> <-usb_add_function
>>>       irq/68-dwc3-734     [000] D..3.   149.155209: eem_set_alt
>>> <-composite_setup
>>>       irq/68-dwc3-734     [000] D..3.   149.155215: gether_disconnect
>>> <-eem_set_alt
>>>       irq/68-dwc3-734     [000] D..3.   149.155220: gether_connect
>>> <-eem_set_alt
>>>       irq/68-dwc3-734     [000] D..3.   149.157287: eem_set_alt
>>> <-composite_setup
>>>       irq/68-dwc3-734     [000] D..3.   149.157292: gether_disconnect
>>> <-eem_set_alt
>>>       irq/68-dwc3-734     [000] D..3.   149.159338: gether_connect
>>> <-eem_set_alt
>>>       irq/68-dwc3-734     [000] D..2.   149.239625: eem_unwrap 
>>> <-rx_complete
>>> ...
>>>
>>> I don't know where to look exactly. Any hints?
>>
>> do you see anything related to gether_cleanup() after eem_unbind() ?
> 
> Nope. It's a pitty that the trace formatting got messed up above. But as 
> you can see I traced gether_* and eem_*. After eem_unbind no traced 
> function is called, until I flip the switch to device mode.
> The ... at the end is where I cut uninteresting eem_unwrap <-rx_complete 
> and eem_wrap <-eth_start_xmit lines.
> 
>> If not then, you may try to enable tracing of TCP/IP stack and network 
>> side to check who deleting the sysfs entry
> 
> Yes, that's a vast amount of functions to trace. And I don't see how 
> that would be related to the patch we're discussing here. I was hoping 
> for a little more targeted hint.

Now filtering 'gether_*', 'eem_*', '*configfs_*', 'composite_*', 
'usb_fun*', 'reset_config' and 'device_remove_file' leads me to:

TIMESTAMP  FUNCTION
    |         |
   49.952477: eem_wrap <-eth_start_xmit
   55.072455: eem_wrap <-eth_start_xmit
   55.072621: eem_unwrap <-rx_complete
   59.011540: configfs_composite_reset <-usb_gadget_udc_reset
   59.011545: composite_reset <-configfs_composite_reset
   59.011548: reset_config <-__composite_disconnect
   59.013565: eem_disable <-reset_config
   59.013567: gether_disconnect <-reset_config
   59.049560: device_remove_file <-device_remove
   59.051185: configfs_composite_disconnect <-usb_gadget_disco
   59.051189: composite_disconnect <-configfs_composite_discon
   59.051195: configfs_composite_unbind <-gadget_unbind_driver
   59.052519: eem_unbind <-purge_configs_funcs
   59.052529: composite_dev_cleanup <-configfs_composite_unbin
   59.052537: device_remove_file <-composite_dev_cleanup

device_remove_file gets called twice, once by device_remove after 
gether_disconnect (that the one). The 2nd time by composite_dev_cleanup 
(removing the gadget)

> You may recall the whole issue did not occur before this patch got applied.
> 
>> Hardik
>>
>>
>>>
>>>>
>>>>> According to current kernel architecture of u_ether driver, only
>>>>> gether_cleanup should remove the usb0 interface along with its
>>>>> kobject and sysfs interface.
>>>>> I suggest sharing the analysis here to understand why this practice
>>>>> is not followed in your use case or driver ?
>>>>
>>>> Yes, I'll try to trace where that happens.
>>>>
>>>> Nevertheless, the disappearance of the net/usb0 directory seems
>>>> harmless? But the usb: net device remaining after disconnect or role
>>>> switch is not good, as the route remains.
>>>>
>>>> May be they are 2 separate problems. Could you try to reproduce what
>>>> happens if you make eem connection and then unplug?
>>>>
>>>>> I am curious why the driver was developed without adhering to the
>>>>> kernel's gadget architecture.
>>>
>>> I don't know what you mean here. Which driver do you mean?
>>>
>>>>>>
>>>>>>>>> I have the dwc3 IP base usb controller, Let me check
>>>>>>>>> with this patch and
>>>>>>>>> share result here.  May be we need some fix in dwc3
>>>>>>> Would have been nice if someone could test on other
>>>>>>> controller as well. But
>>>>>>> another instance of dwc3 is also very welcome.
>>>>>>>> It's quite possible, please test on your side.
>>>>>>>> We are happy to test any fixes if you come up with.
>>>>>>
>>>>>> -- 
>>>>>> With Best Regards,
>>>>>> Andy Shevchenko
>>>>>>
>>>>>>
>>>>
> 

