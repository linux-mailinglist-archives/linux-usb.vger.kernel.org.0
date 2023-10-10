Return-Path: <linux-usb+bounces-1376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C459D7C005B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 17:27:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5668C281EE0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 15:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDCA27455;
	Tue, 10 Oct 2023 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ED32744A
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 15:26:57 +0000 (UTC)
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C4999
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 08:26:56 -0700 (PDT)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id 5BC4976268;
	Tue, 10 Oct 2023 15:26:55 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 5262346F8C;
	Tue, 10 Oct 2023 15:26:55 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.2
X-Spam-Level:
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id C6yqAtVrAjgh; Tue, 10 Oct 2023 15:26:54 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id 79F2846F87;
	Tue, 10 Oct 2023 15:26:54 +0000 (UTC)
Message-ID: <efa08b04-94aa-4150-bf24-850e739bc3f2@interlog.com>
Date: Tue, 10 Oct 2023 11:26:53 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: [typec] ucsi.c: ucsi_register_partner_pdos() leak
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org
References: <161b4007-3360-4268-ab66-bc19aa8f360e@interlog.com>
 <ZSUMXdw9nanHtnw2@kuha.fi.intel.com> <ZSVcTQfIHJtctJlj@kuha.fi.intel.com>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <ZSVcTQfIHJtctJlj@kuha.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2023-10-10 10:14, Heikki Krogerus wrote:
> On Tue, Oct 10, 2023 at 11:33:36AM +0300, Heikki Krogerus wrote:
>> Hi Douglas,
>>
>> Please always CC the mailing list. I'm not the only person working on
>> this code.

Okay.

>>
>> On Sun, Oct 08, 2023 at 06:59:19PM -0400, Douglas Gilbert wrote:
>>> Hi,
>>> I was debugging something else in lk 6.6.0-rc1 and was tailing
>>> /var/log/syslog and noticed several:
>>>     kmemleak: 6 new suspected memory leaks
>>> messages so I had a look and saw many of these:
>>>
>>> unreferenced object 0xffff8882943a4df8 (size 8):
>>>    comm "kworker/u32:41", pid 73935, jiffies 4437924777 (age 6489.122s)
>>>    hex dump (first 8 bytes):
>>>      70 64 35 00 82 88 ff ff                          pd5.....
>>>    backtrace:
>>>      [<ffffffff812d247c>] __kmalloc_node_track_caller+0x4c/0x150
>>>      [<ffffffff815c8585>] kvasprintf+0x65/0xd0
>>>      [<ffffffff81b1b56c>] kobject_set_name_vargs+0x1c/0x90
>>>      [<ffffffff8178f30e>] dev_set_name+0x4e/0x70
>>>      [<ffffffffa05f78b4>] usb_power_delivery_register+0x84/0xe0 [typec]
>>>      [<ffffffffa0748112>] ucsi_register_partner_pdos+0x62/0x190 [typec_ucsi]
>>>      [<ffffffffa07464a8>] ucsi_poll_worker+0x38/0x110 [typec_ucsi]
>>>      [<ffffffff810a9d48>] process_one_work+0x1d8/0x4b0
>>>      [<ffffffff810ab149>] worker_thread+0x1c9/0x3b0
>>>      [<ffffffff810b60d2>] kthread+0xf2/0x130
>>>      [<ffffffff8102d588>] ret_from_fork+0x28/0x40
>>>      [<ffffffff81001aeb>] ret_from_fork_asm+0x1b/0x30
>>>
>>> and similar variants involving UCSI. Looking at ucsi_register_partner_pdos()
>>> there seems to be a leak of con->partner_pd if one other the other functions
>>> that depend on it fail. If it was my code, I would replace most of the
>>> returns in that function with 'goto err;' branches which would then call
>>>     usb_power_delivery_unregister(con->partner_pd);
>>
>> No, partner_pd object isn't there only for the PDOs. We need it even
>> when PDO details are not supported by the interface (PDO details are
>> optional in UCSI).
>>
>> I don't see any leak here. All these object, including partner_pd, are
>> unregistered in the end as they should, no?
> 
> I found an issue that I think is causing the problem. The link between
> the typec and PD devices is never removed in this driver. That will
> prevent the device from ever being released.

Great.

I wonder if this code in ucsi_register_partner_pdos() is problematic:

         if (con->partner_pd)
                 return 0;

         con->partner_pd = usb_power_delivery_register(NULL, &desc);
         if (IS_ERR(con->partner_pd))
                 return PTR_ERR(con->partner_pd);
         ....

If usb_power_delivery_register() fails it places a hacked, non-zero value
in con->partner_pd. So if usb_power_delivery_register() is called again
the first "if" will then be taken (as if it had already been set up
properly). If ucsi_register_partner_pdos() is properly interleaved with
ucsi_unregister_partner_pdos() than there should not be a problem in
this case. That said, I think the above code would be more robust if
a local was declared and only after usb_power_delivery_register()
succeeded, do something like:
         con->partner_pd = partner_pd;


Perhaps more USB developers should be setting CONFIG_DEBUG_KMEMLEAK in
their kernel builds. Associated with looking at this issue I did several
unloads then loads of the typec_ucsi and ucsi_acpi modules. Thereafter
cat /sys/kernel/debug/kmemleak began to show several:

unreferenced object 0xffff88810f2b0cc0 (size 96):
   comm "irq/124-pciehp", pid 223, jiffies 4294896705 (age 39641.506s)
   hex dump (first 32 bytes):
     00 00 00 00 00 00 00 00 00 00 00 00 ad 4e ad de  .............N..
     ff ff ff ff 00 00 00 00 ff ff ff ff ff ff ff ff  ................
   backtrace:
     [<ffffffff812d3d7e>] kmalloc_node_trace+0x1e/0xb0
     [<ffffffffa037736c>] xhci_alloc_command+0xac/0x130 [xhci_hcd]
     [<ffffffffa037356f>] xhci_disable_slot+0x1f/0x120 [xhci_hcd]
     [<ffffffffa0374993>] xhci_free_dev+0xd3/0x190 [xhci_hcd]
     [<ffffffffa02cc184>] usb_disconnect+0x204/0x2d0 [usbcore]
     [<ffffffffa02cc03f>] usb_disconnect+0xbf/0x2d0 [usbcore]
     [<ffffffffa02cc03f>] usb_disconnect+0xbf/0x2d0 [usbcore]
     [<ffffffffa02cc03f>] usb_disconnect+0xbf/0x2d0 [usbcore]
     [<ffffffffa02d2579>] usb_remove_hcd+0x1d9/0x240 [usbcore]
     [<ffffffffa020c050>] xhci_pci_remove+0x40/0x90 [xhci_pci]
     [<ffffffff8166d11e>] pci_device_remove+0x2e/0x90
     [<ffffffff817aea30>] device_release_driver_internal+0x1a0/0x210
     [<ffffffff81661f17>] pci_stop_bus_device+0x67/0x90
     [<ffffffff81661ed7>] pci_stop_bus_device+0x27/0x90
     [<ffffffff81661ee8>] pci_stop_bus_device+0x38/0x90
     [<ffffffff81661fb9>] pci_stop_and_remove_bus_device+0x9/0x20

Doug Gilbert




