Return-Path: <linux-usb+bounces-33034-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oO32OVW7gWm7JAMAu9opvQ
	(envelope-from <linux-usb+bounces-33034-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 10:09:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 07359D69B0
	for <lists+linux-usb@lfdr.de>; Tue, 03 Feb 2026 10:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 17F6030D2FDA
	for <lists+linux-usb@lfdr.de>; Tue,  3 Feb 2026 09:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF11395D98;
	Tue,  3 Feb 2026 09:05:07 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E9E2F39C2;
	Tue,  3 Feb 2026 09:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770109507; cv=none; b=ITpgJsGOsVrZKkF1mR7eoLDwBq+lLq7l2kgd3K59BBK0XxJtRtERq/d5xTUdU5F9xsBkukhH+2bf7OcxAQM0gmtXCZkWFbnKpqkRmRAJv6xNo30Q5MRAXeP8PGXLALl+peHehJ6w2dg7NXD0ueBRoFiotzsnkEOR9QqhrdJIRE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770109507; c=relaxed/simple;
	bh=7WK4I57EnZqvj4mOpORIQJyejA5VJFgKYoUMYxcDxH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HC3r6sixKb437XrcmOLfA2WOFGAKr6zBgEtbaXPNvLwl5M2f6WkjN0nrOiE0U+4hIBgBK7f9id+AAzQH28J3g5oAePHMBuVX4qPRTOssoQYTPEmg6XVnHqd3mphj9xB5VS7XEWgcDrt2XOgHVQ3vWnLouUTb+SGoX/yOnz3lTio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 68b8ce2e00df11f1b0f03b4cfa9209d1-20260203
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:9e5969f7-e1dd-4525-a73e-5ac688bc3978,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:ebfddd431a755f20feb03c85843246ba,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 68b8ce2e00df11f1b0f03b4cfa9209d1-20260203
X-User: lijiayi@kylinos.cn
Received: from [172.25.120.57] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lijiayi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 854647471; Tue, 03 Feb 2026 17:04:55 +0800
Message-ID: <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
Date: Tue, 3 Feb 2026 17:04:53 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
To: Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
References: <aXLM5vk0gDNjLPyY@acelan-Precision-5480>
 <20260123120112.GQ2275908@black.igk.intel.com>
 <aXbTfLUJ-lEfNzgX@acelan-Precision-5480>
 <20260126054231.GR2275908@black.igk.intel.com>
 <aXcWNw9Qfo5L9WVi@acelan-Precision-5480>
 <20260126115654.GS2275908@black.igk.intel.com>
 <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
From: Jayi Li <lijiayi@kylinos.cn>
In-Reply-To: <20260129065003.GS2275908@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33034-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[kylinos.cn];
	FREEMAIL_TO(0.00)[linux.intel.com,canonical.com,gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lijiayi@kylinos.cn,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kylinos.cn:mid,canonical.com:url]
X-Rspamd-Queue-Id: 07359D69B0
X-Rspamd-Action: no action

Hi,

在 2026/1/29 14:50, Mika Westerberg 写道:
> On Thu, Jan 29, 2026 at 01:45:51PM +0800, Chia-Lin Kao (AceLan) wrote:
>> On Tue, Jan 27, 2026 at 11:17:01AM +0100, Mika Westerberg wrote:
>>> On Tue, Jan 27, 2026 at 09:45:13AM +0100, Mika Westerberg wrote:
>>>> On Tue, Jan 27, 2026 at 01:04:20PM +0800, Chia-Lin Kao (AceLan) wrote:
>>>>> On Mon, Jan 26, 2026 at 12:56:54PM +0100, Mika Westerberg wrote:
>>>>>> On Mon, Jan 26, 2026 at 03:48:48PM +0800, Chia-Lin Kao (AceLan) wrote:
>>>>>>> On Mon, Jan 26, 2026 at 06:42:31AM +0100, Mika Westerberg wrote:
>>>>>>>> On Mon, Jan 26, 2026 at 11:30:47AM +0800, Chia-Lin Kao (AceLan) wrote:
>>>>>>>>> Hi,
>>>>>>>>> On Fri, Jan 23, 2026 at 01:01:12PM +0100, Mika Westerberg wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On Fri, Jan 23, 2026 at 10:04:11AM +0800, Chia-Lin Kao (AceLan) wrote:
>>>>>>>>>>>> Can you comment out call to tb_switch_xhci_connect() and see if that
>>>>>>>>>>>> changes anything?
>>>>>>>>>>> Here is what I modified, and the problem becomes a little bit complicated.
>>>>>>>>>> Okay I see it did not change anything (well this is kind of what I
>>>>>>>>>> expected). Thanks for trying.
>>>>>>>>>>
>>>>>>>>>> I see in your log that the PCIe tunnel is established just fine. It's just
>>>>>>>>>> that there is no PCIe hotplug happening or it is happening but the PCIe
>>>>>>>>>> Downstream Port is not waking up.
>>>>>>>>>>
>>>>>>>>>> I figured you have following USB4/TB topology, right?
>>>>>>>>>>
>>>>>>>>>>    AMD Host <-> GR Hub <-> TB3 Hub
>>>>>>>>>>                    ^
>>>>>>>>>>                    |
>>>>>>>>>>                  TB3 Hub
>>>>>>>>> Should be more like this
>>>>>>>>>    AMD Host <-> Dell TB4 Dock <-> OWC Envoy Express (1-502)
>>>>>>>>>                               \
>>>>>>>>>                                <-> OWC Envoy Express (1-702)
>>>>>>>>> or
>>>>>>>>>    AMD Host (1-0, domain1)
>>>>>>>>>        |
>>>>>>>>>        └─ Port 2 ──→ Dell Thunderbolt 4 Dock (1-2)
>>>>>>>>>                        ├─ Port 5 ──→ OWC Envoy Express (1-502)
>>>>>>>>>                        └─ Port 7 ──→ OWC Envoy Express (1-702)
>>>>>>>> Okay so the same ;-)
>>>>>>>>
>>>>>>>>>> What if you run 'lspci' after the issue reproduces? Does that bring the
>>>>>>>>>> missing PCIe devices? I suspect that this is due to older TB3 devices that
>>>>>>>>>> they may need bit more time to get the PCIe link (going over the tunnel) up
>>>>>>>>>> and running.
>>>>>>>>> lspci doesn't bring back the missing tbt storage.
>>>>>>>> Forgot to mention that let it (the whole topology) enter runtime suspend
>>>>>>>> before you run lspci.
>>>>>>> https://people.canonical.com/~acelan/bugs/tbt_storage/dmesg_lspci.log
>>>>>>>
>>>>>>> The behavior is strange, the following 3 devices keep entering D3cold and then comes back
>>>>>>> to D0 quickly. So, I'm not sure if the lspci do the actions you want.
>>>>>> Yes. I should have mentioned so the lspci is there exactly to trigger
>>>>>> runtime resume of the topology. I was hoping the PCIe links get
>>>>>> re-established properly then.
>>>>>>
>>>>>> Can you do so that you:
>>>>>>
>>>>>> 1. Plug in the dock.
>>>>>> 2. Plug in the other storage to the dock.
>>>>>> 3. Block runtime PM from the PCIe Downstream Port that should lead to the
>>>>>>     second storage device PCIe Upstream Port
>>>>>>
>>>>>>   # echo on > /sys/bus/pci/devices/DEVICE/power/control
>>>>>>
>>>>>> 4. Connect the second storage device and enable PCIe tunnel.
>>>>>>
>>>>>> Does that make it work each time?
>>>>> Yes, follow the steps makes it work.
>>>>>
>>>>>     echo on | sudo tee /sys/bus/pci/devices/*/*/power/control
>>>>>
>>>>> Re-plug the dock, need to disable the runpm again.
>>>> But can you just block it from the PCIe Downstream Port that leads to the
>>>> "non-working" storage before you enable PCIe tunnel? Not for all the
>>>> devices.
>>>>
>>>> (let me know if you want help locating the correct device).
>>>>
>>>> Does it still work?
>> Here's the full PCI device chain graph:
>>
>>      0000:00:01.2 - AMD PCI Root Port
>>          |
>>          └─ 0000:61:00.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
>>                 |
>>                 └─ 0000:62:02.0 - Intel Thunderbolt 4 Bridge [Goshen Ridge 2020]
>>                        |
>>                        └─ 0000:83:00.0 - Intel TBT3 Bridge (Upstream Port) [Alpine Ridge LP]
>>                               |
>>                               └─ 0000:84:01.0 - Intel TBT3 Bridge (Downstream Port) [Alpine Ridge LP]
>>                                      |
>>                                      └─ 0000:85:00.0 - Sandisk PC SN740 NVMe SSD (nvme2)
>>
>> When the tbt storage is not recognized, we don't have 83:00.0 and its
>> downstream port 84:01.0.
>>
>> $ ls /sys/bus/pci/devices
>> 0000:00:00.0  0000:00:02.1  0000:00:08.1  0000:00:18.1  0000:00:18.7  0000:62:04.0  0000:c3:00.0  0000:c5:00.5  0000:c7:00.4
>> 0000:00:00.2  0000:00:02.3  0000:00:08.2  0000:00:18.2  0000:61:00.0  0000:a2:00.0  0000:c4:00.0  0000:c5:00.7  0000:c7:00.5
>> 0000:00:01.0  0000:00:02.4  0000:00:08.3  0000:00:18.3  0000:62:00.0  0000:a3:01.0  0000:c5:00.0  0000:c6:00.0  0000:c7:00.6
>> 0000:00:01.1  0000:00:02.5  0000:00:14.0  0000:00:18.4  0000:62:01.0  0000:a4:00.0  0000:c5:00.1  0000:c6:00.1
>> 0000:00:01.2  0000:00:03.0  0000:00:14.3  0000:00:18.5  0000:62:02.0  0000:c1:00.0  0000:c5:00.2  0000:c7:00.0
>> 0000:00:02.0  0000:00:08.0  0000:00:18.0  0000:00:18.6  0000:62:03.0  0000:c2:00.0  0000:c5:00.4  0000:c7:00.3
>>
>> Disable runpm on 62:02.0, then we have 83:00.0 and its downstream port
>> 84:01.0 and 85:00.0, and then the tbt storage is recognized.
> Okay that means there is nothing wrong with the PCIe tunnel itself it's
> just that the PCIe side either does not get the PME or does not see that
> the PCIe link becomes active (e.g the PCIe Downstream Port runtime suspends
> itself before the link status changes).
>
> PME work so that there is wake first on Intel it's GPE that wakes up the
> root port and then PCIe stack wakes up devices and then the PME message is
> sent to the root complex.
>
> If you do this on Intel host do you see the same?

I also encountered a similar issue where the PCIe hotplug IRQ is not 
received
after path setup completion. This was observed specifically during 
Thunderbolt 3
device hotplug testing.

To investigate, I applied a debug patch (attached below) to dump 
ADP_PCIE_CS_0.
I observed that when the issue occurs, the PCIe upstream port's LTSSM is 
not in the DETECT state,
yet the PE (Port Enable) bit remains set to 1.

My workaround is to check the LTSSM state before the path setup.
If this specific anomaly is detected, I explicitly set PE to 0 to reset 
the link state.
With this change, the link returns to the correct state. After the path 
setup completes,
the PCIe hotplug IRQ is received correctly.

I'm not sure if this is relevant to this issue, but sharing just in case.

Here is the debug patch I used to observe the ADP_PCIE_CS_0 state:

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index d5d1f520571b..d8808cb614a4 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -491,6 +491,25 @@ void tb_path_deactivate(struct tb_path *path)
         path->activated = false;
  }

+void print_adp_pcie_cs_0(struct tb_port *port)
+{
+       u32 val;
+       int ret;
+
+       if (!port || !port->cap_adap ||
+           (!tb_port_is_pcie_down(port) && !tb_port_is_pcie_up(port)))
+               return;
+
+       ret = tb_port_read(port, &val, TB_CFG_PORT,
+                          port->cap_adap + ADP_PCIE_CS_0, 1);
+
+       if (ret)
+               tb_port_warn(port, "failed to read ADP_PCIE_CS_0: %d\n", 
ret);
+       else
+               tb_port_info(port, "ADP_PCIE_CS_0 = 0x%08x\n", val);
+}
+EXPORT_SYMBOL_GPL(print_adp_pcie_cs_0);
+
  /**
   * tb_path_activate() - activate a path
   * @path: Path to activate
@@ -582,6 +601,17 @@ int tb_path_activate(struct tb_path *path)
         }
         path->activated = true;
         tb_dbg(path->tb, "path activation complete\n");
+
+       if (path) {
+               pr_info("tb_path_activated: Path %s activated, length: 
%d\n",
+                       path->name, path->path_length);
+
+               for (i = 0; i < path->path_length; i++) {
+  print_adp_pcie_cs_0(path->hops[i].in_port);
+  print_adp_pcie_cs_0(path->hops[i].out_port);
+               }
+       }
+
         return 0;
  err:
         tb_WARN(path->tb, "path activation failed\n");
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index b1458b741b7d..22c70f18f0ff 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -208,6 +208,9 @@ static int tb_pci_activate(struct tb_tunnel *tunnel, 
bool activate)
                         return res;
         }

+       print_adp_pcie_cs_0(tunnel->src_port);
+       print_adp_pcie_cs_0(tunnel->dst_port);
+
         return activate ? 0 : tb_pci_set_ext_encapsulation(tunnel, 
activate);
  }

@@ -2191,6 +2194,9 @@ int tb_tunnel_restart(struct tb_tunnel *tunnel)
                 }
         }

+       print_adp_pcie_cs_0(tunnel->src_port);
+       print_adp_pcie_cs_0(tunnel->dst_port);
+
         if (tunnel->init) {
                 res = tunnel->init(tunnel);
                 if (res)


