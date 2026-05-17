Return-Path: <linux-usb+bounces-37548-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8B9JH0TDCWrZogQAu9opvQ
	(envelope-from <linux-usb+bounces-37548-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:31:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8D7561347
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 15:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2C133002905
	for <lists+linux-usb@lfdr.de>; Sun, 17 May 2026 13:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7974B3B2FEA;
	Sun, 17 May 2026 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vRSDUQlz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE5305698;
	Sun, 17 May 2026 13:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779024699; cv=none; b=HTH/op72MlzMs/ohjbyKQaL+G7iqWbSj/vWv7JyzzQQlTwo6WY4zIFGwgLAgw2dXzChTwA68LzZnra1+RDi/dMM7sle5Pu5t2iPQkqqijpTiocOoQNe3DKr5FY9E5yfa9fuIUqROvDm/EfI9C2IZEjAEWrAqezSh5jm/308qirI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779024699; c=relaxed/simple;
	bh=IOITomRVBjW8JyHrXWDU15HH3RUKKw8cqpKEE3tx5+w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=YC9wOgneNnjMAP39lVA20Xu7nPGbVUGilykDqxX70s86Gr1jiTzGfg0GYTlq64WxjjBw1AGBlwpZbpaZ8cH0Nfv/Tg/qpmNvjKRSpvJ+XclRf6NWejEXqf8FwtVwKWFKeXxOGkspruVHCA+F1+edkVPjRqzof8KWued8VpMro38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vRSDUQlz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FCF9C2BCB0;
	Sun, 17 May 2026 13:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779024698;
	bh=IOITomRVBjW8JyHrXWDU15HH3RUKKw8cqpKEE3tx5+w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=vRSDUQlzohHA/FWqGFxnoNCKuAfC3laCZBBCLUUoYSTRVmug4W2ThJTrAHf/06xlG
	 Hs0XSJ18tDV+NOeDUa+YRFkrgoMpr6OCZSNLZNK88ffkfv3aS6wCuZZ3eMfnj0Y/sA
	 3JD7SOZiPaWO/tBeooFFo7wVSKPbe2RBIVka+XQQgadg3fWU3mzeo1g2GnBC6l4DsG
	 JIwthJyXuP2eDJb/Mm02Qg/6HCZyyC7QJIO1s6uXWsNfUMb5tM8A1q0eI9FoEbJY7c
	 nsnm/utsBSxoLICcy8IqlwNmHsovTLE+IIPfgaFlln75kGedz1Ni8CqmxpRmd9ud0C
	 vZBsFYQpilMXA==
Message-ID: <a1264253-ee93-4671-ae3b-3a1bd307f65a@kernel.org>
Date: Sun, 17 May 2026 15:31:34 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [PATCH 2/2] usb: dwc3: Notify XHCI core of tunneled status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Jack Pham <jack.pham@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "usb4-upstream@oss.qualcomm.com" <usb4-upstream@oss.qualcomm.com>,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, asahi@lists.linux.dev
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
 <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
 <551c246d-7ff6-49e5-bb14-3f49f7649e54@kernel.org>
 <9d8092f2-d04d-4c53-a0da-6da272d3b447@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9d8092f2-d04d-4c53-a0da-6da272d3b447@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0D8D7561347
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37548-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sven@kernel.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux.dev:email,0.0.0.1:email]
X-Rspamd-Action: no action

cc: asahi@lists.linux.dev

On 12.05.26 13:56, Konrad Dybcio wrote:
> On 5/11/26 8:44 PM, Sven Peter wrote:
>> Hi,
>>
>> On 11.05.26 11:06, Konrad Dybcio wrote:
>>> On 5/9/26 1:31 AM, Thinh Nguyen wrote:
>>>> On Fri, May 08, 2026, Konrad Dybcio wrote:
>>>>> On 5/8/26 12:46 AM, Thinh Nguyen wrote:
>>>>>> On Thu, May 07, 2026, Jack Pham wrote:
>>>>>>> On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
>>>>>>>> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
>>>>>>>>> On Tue, May 05, 2026, Konrad Dybcio wrote:
>>>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> 
>>> 4. drivers/phy/qualcomm/phy-qcom-qmp-combo.c reprograms the PHY based
>>>      on typec_mux events in native cases, or to USB4/TBT mode if the router
>>>      driver requests it [that last part is not yet upstream]
>>> 5. [optionally] retimer drivers in between (most often Parade PS883x
>>>      series via drivers/usb/typec/mux/ps883x.c), which act as an
>>>      additional typec_mux/switch in the chain
>>> 6. [not upstream yet] USB4 router driver consumes some typec_mux
>>>      parameters (orientation, cable and partner capabilities) and sends a
>>>      command to another MCU to high-speed link establishment. It also sets
>>>      the aforementioned magic register.
>>
>> I'm not sure if mux is the correct framework here. On Apple Silicon we also need an out-of-band notification from the PD controller to the USB4 NHI here but the NHI isn't a mux in the typec sense. And how do you ensure that 4 happens before 6 if you use the typec mux framework or does that not matter for your platform?
> 
> Some mux provider drivers (e.g. the PS883x one) call typec_mux_get/set()
> explicitly, and combining that with the right of_graph things end up
> working naturally (perhaps to some degree by luck?).

It's luck, it was the wrong order for Apple Silicon :-)
I just don't think it's appropriate to describe the native host 
interface as a mux (at least on Apple Silicon) since the mux is inside 
the Type-C PHY even though the mux framework happens to transport almost 
all the correct information.
I also don't think it makes sense to describe that thing as a mux inside 
the device tree.

> 
> With the QMPPHY specifically, it already exposes a separate struct phy
> for the USB3 sub-block and another one for DP. I added a third one for
> USB4, which when activated, programs it into USB4 mode and de facto
> blocks the driver from acting as a typec_mux (simply via an early return
> from mux_set) for the duration of the USB4PHY being in use (the router
> takes care of lane assignment and orientation, when active).
> 
> Making this predictable (and controllable from the router driver) was
> paramount, as the device will crash if the router is attempted to be
> brought online at the wrong time, since most of its clocks are derived
> from the on-PHY PLL. Similarly, the suspend flows also require tight
> control of the PHY's power state.

Yeah, that's similar to Apple Silicon except that we drive all the 
synchronization from the Type-C PD controller because we have even more 
components that all have to kept in sync on those platforms.

> 
> 
> I ended up modeling the router as a mux&switch, since like I mentioned,
> it needs a number of parameters that already come via these frameworks
> (cable type/speed, orientation, etc.) and the drivers needs to talk to
> the MCU immediately after the PHY and retimer are set up, so that only
> made sense.
> 
>> Currently I use [1] and [2] in my work-in-progress tree though I'm not quite happy with it yet.
> 
> I took a look at your branch and predictably we faced some common
> obstacles.. Although I'm jealous of RTKIT..
> 
>>> At a glance, 2. seems like a reasonably fitting place to set it, however:
>>> * it does not have any sort of a handle to the typec_connector (it
>>> only acts like a mux that sets another mux), and
>>> * it may be going away in the future
>>>
>>> so I'd much prefer to keep this logic somewhere near where this iteration
>>> of the patch does - I think it'll be useful for more implementations, as
>>> I'd imagine it'd be fairly commonplace to hardwire CIOCTRL_CIO_EN and
>>> another part of the pipeline that must logically be online for USB4 to
>>> be useful
>>>
>>> +Sven, on ASi, is CIOCTRL_CIO_EN (dwc3base + (0xcd20 + ((port) * 0x30))
>>> written to manually?
>>
>> I don't think so, but we need a manual out-of-band notification to both PCIe, tunneled DisplayPort and USB3 once the tunnel has been brought upside the NHI (i.e. long after the typec altmode is entered) and all this has to be represented in the device tree as well.
> 
> The DP situation in our impl is.. colorful as well.
> Generally I think we only need to reset the protocol adapters, which
> happen to live within the router's address space, making it contained
> within the TBT driver.

Yeah, for us it's separate and there's the display co-processor which 
has to get an OOB notification for any established USB4/TBT tunnel.
It's a big mess essentially.

>> DWC3 on Apple platforms is very cursed and has to be fully offline while the Type-C switches modes and must only be brought up then once the tunnel inside the NHI has already been established.
> 
>> My current WIP code uses a tbt_oob_notify for all that that I introduced and something like this in the dt to represent the connections:
>>
>> /* USB4 */
>> &usb4_1_acio {
>>      ports {
>>          #address-cells = <1>;
>>          #size-cells = <0>;
>>
>>          /* 1: USB4 port */
>>          port@1 {
>>              reg = <1>;
>>              usb4_1_acio_tbt: endpoint {
>>                  remote-endpoint = <&typec1_con_tbt>;
>>              };
>>          };
>>
>>          /* 2: unused(?) USB4 port */
> 
> Any chance port2 is used for lane bonding?

None, port 2 isn't connected to anything. That (?) is just a leftover. 
The host router block can probably support two ports with shared 
bandwidth but Apple instead decided to create a separate host router for 
each port.

> 
>>          /* 3: PCIe, TBD */
>>          /* 4: USB3, TBD */
>>          /* 5: DP0, TBD */
>>          /* 6: DP1, TBD */
>>      };
>> };
>>
>> Still not completely happy with that as well.
>> Does PCIe tunneling also need additional OOB notifications for you?
> 
> No, simply enabling the path works, after which we get the normal hotplug
> events

Lucky you! We need to enable the PCIe tunnels inside the pcie driver 
*after* the tunnel is up inside the NHI because otherwise the 
co-processor firmware will crash. There's also some weirdness going on 
with PCIe hotplug events below the root bridge that I have yet to figure 
out. From what I can tell XNU manually injects these events whenever the 
TBT tunnel changes. We can see that weirdness with long chains like a 
USB4 hub -> Another TBT dock -> Apple's TBT display -> TBT-to-ethernet 
adapter.
I've added generic out-of-bound notifications for that but not quite 
happy with it yet.


Please also cc me on any thunderbolt submissions. If your work goes in 
first I can just rebase mine on top of your tree and see if we need 
anything more.


Sven



