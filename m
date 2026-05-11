Return-Path: <linux-usb+bounces-37275-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGwlC6wjAmocoAEAu9opvQ
	(envelope-from <linux-usb+bounces-37275-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 20:45:00 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D02514976
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 20:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AEF6B3001A51
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 18:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0454B8DFE;
	Mon, 11 May 2026 18:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igTHHhLx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF77F4BCAC5;
	Mon, 11 May 2026 18:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525091; cv=none; b=HjOhSITAMr3o/vazojT5rw/s0kX5PrlPUDr9SJU+9VJ2HpiSyIXLVtg3UTfGmbUNK6xzfV++xhJmopiNTaWAwxocbkuoXOBIN6uGygZQM9dFwveXDrVOtkskmK/jwABu318uy4w9JTRl/OHYaeckIBZKqfAUnXmVF6iq9Kh6S80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525091; c=relaxed/simple;
	bh=mDXPS7J4RWKADDX+Cdfgk9DP16IzJTZdD9YfhJ/SJ2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rlwfM2ZP1D3czh94kedyMlRS34g+5+CXbu1Qb3KplBBTfnbWI+Vs8Nj/zCrrkp36zVCQ0GYm7g7XduIW67tffycmNAxPdu2ZQSrpZKr8IL2d1pMf9SoF28Xk3iyrg4ARFnsPIlUIWbQAEHb6I/AJdyeh9IiZC0rmfIclb5krOSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igTHHhLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54399C2BCB0;
	Mon, 11 May 2026 18:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778525091;
	bh=mDXPS7J4RWKADDX+Cdfgk9DP16IzJTZdD9YfhJ/SJ2g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=igTHHhLxxUgZ+ioeXvf9DTcSbNcWJ6mVJ0jFLj9y+jPPtZlERi8r10XUb9NMe/4k6
	 SqoyfaOx1dazvAXeGRQMrwbbvMgeEyxaJiw6dmWuXcx/dMJcKpJ/YRfSXqMb5vDMUL
	 8aOV8kPYaJMWnEO/NJ/BEfbZmqzlIzERgUWkthhNGH9ZF5ilGsNJZDi/ga35FWi5Rp
	 n1NS7qyMHB7QiQCHfVwk7ITEbFxv4qks1lUZdDEI8wSYpn9LjHfKNYo9HoNA8siJef
	 zaSkvQmPsDkB+GIGwl1sZcGqeUC3i6xwsvnc5K2scGalZgdlWfD4p9Msj8l/QVDd/8
	 zE04N3pGUZbBQ==
Message-ID: <551c246d-7ff6-49e5-bb14-3f49f7649e54@kernel.org>
Date: Mon, 11 May 2026 20:44:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
References: <20260505-topic-dwc3_tunneling_state-v1-0-4aaa6c3c14cb@oss.qualcomm.com>
 <20260505-topic-dwc3_tunneling_state-v1-2-4aaa6c3c14cb@oss.qualcomm.com>
 <afpyvhadqZw0xfTB@vbox>
 <1163a026-03b2-4860-a422-eb276920b4aa@oss.qualcomm.com>
 <afzP+uoUALSji95Q@hu-jackp-lv.qualcomm.com> <af0SM3C5qHc73DM8@vbox>
 <670f9a9f-54b9-4109-986e-5071caf1dcaf@oss.qualcomm.com>
 <af5sfCOfBa7mYqPw@vbox>
 <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <0431f8ff-545b-4533-8bb3-d4f3d2e30032@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 22D02514976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37275-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sven@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.0.0.1:email,qualcomm.com:email,portsc.tm:url]
X-Rspamd-Action: no action

Hi,

On 11.05.26 11:06, Konrad Dybcio wrote:
> On 5/9/26 1:31 AM, Thinh Nguyen wrote:
>> On Fri, May 08, 2026, Konrad Dybcio wrote:
>>> On 5/8/26 12:46 AM, Thinh Nguyen wrote:
>>>> On Thu, May 07, 2026, Jack Pham wrote:
>>>>> On Thu, May 07, 2026 at 12:34:50PM +0200, Konrad Dybcio wrote:
>>>>>> On 5/7/26 1:40 AM, Thinh Nguyen wrote:
>>>>>>> On Tue, May 05, 2026, Konrad Dybcio wrote:
>>>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>>
>>>>>>>> The Thunderbolt framework relies on the USB core to create device links
>>>>>>>> for tunneled ports, so that the USB3 controller is only kept
>>>>>>>> runtime-resumed for the duration of the tunneling. This depends on
>>>>>>>> first knowing whether a connection is tunneled or native.
>>>>>>>>
>>>>>>>> Add the logic to handle that for DWC3 controllers.
>>>>>>>>
>>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>>> ---
>>>>>>>>   drivers/usb/dwc3/core.c | 12 ++++++++++++
>>>>>>>>   drivers/usb/dwc3/core.h | 18 ++++++++++++++++++
>>>>>>>>   drivers/usb/dwc3/host.c | 12 ++++++++++++
>>>>>>>>   3 files changed, 42 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>>>>>> index 65213896de99..7cec4911e278 100644
>>>>>>>> --- a/drivers/usb/dwc3/core.c
>>>>>>>> +++ b/drivers/usb/dwc3/core.c
>>>>>>>> @@ -162,6 +162,18 @@ void dwc3_set_prtcap(struct dwc3 *dwc, u32 mode, bool ignore_susphy)
>>>>>>>>   }
>>>>>>>>   EXPORT_SYMBOL_GPL(dwc3_set_prtcap);
>>>>>>>>   
>>>>>>>> +enum usb_link_tunnel_mode dwc3_link_tunnel_mode(struct dwc3 *dwc, u8 port)
>>>>>>>> +{
>>>>>>>> +	/* Prior versions had no CIO support */
>>>>>>>> +	if (!DWC3_VER_IS_WITHIN(DWC31, 191A, ANY))
>>>>>>>> +		return USB_LINK_NATIVE;
>>>>>>>> +
>>>>>>>> +	if (dwc3_readl(dwc, DWC3_CIOCTRL(port)) & DWC3_CIOCTRL_CIO_EN)
>>>>>>>
>>>>>>> The CIO register block only exists if DWC1_USB31_EN_CIO is set (and
>>>>>>> DWC_USB31_EN_USB2_ONLY is not set). In most cases, this register block
>>>>>>> will be reserved, register read of reserved block should be 0. But we
>>>>>>> can't guarantee that it will always be the case.
>>>>>>
>>>>>> That's inconvenient because..
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> We shouldn't need to be doing this. This should be checked from the
>>>>>>> xHCI driver. Check xHCI spec for PORTSC.TM and USB3 tunneling support
>>>>>>> capability (section 7.11).
>>>>>>
>>>>>> ..I'm seeing only caps 0/1/2 (and 10 on some but not all) advertised
>>>>>> (I ran a for-loop checking offsets 0..=255)
>>>>>
>>>>> Right.  That section in xHCI spec was only added in the 1.2b revision.
>>>>> However the DWC31 IP versions that current Qualcomm USB4-capable SoCs
>>>>> are using are 2.00a (and a customized version of 1.91a) which are only
>>>>> compliant to xHCI 1.1 so this capability is not there, even though the
>>>>> CIO register block exists.  So short of having the proper XHCI bit, this
>>>>> is the next best, non-SoC specific alternative we've found that can
>>>>> allow XHCI driver to identify when it is operating in tunnel mode.
>>>>>
>>>>
>>>> I see. If you're using 2.00a, then we can't use the xHCI's capability
>>>> register and PORTSC.TM.
>>>>
>>>> Can we match the compatible string to check for CIO capability and have
>>>> this passed from your glue driver before accessing the CIO registers?
>>>
>>> Hm, we currently use a shared compatible string for the USB3+4 (1.91a-xxx)
>>> and USB2 (3.30a) hosts on the USB4-capable platforms..
>>
>> Ok.
>>
>>>
>>> Another idea would be to bail out if
>>>
>>> !device_property_present(dev, "usb4-host-interface")
>>>
>>> which would place the burden of making sure the DT makes sense on the
>>> programmer (which is OK in my view)
>>>
>>
>> For the DWC3_CIOCTRL_CIO_EN to be set, it needs to be done by the type-c
>> driver after detecting alternate mode right? How is it being done now?
>> Can the udev->tunnel_mode be updated directly by your type-c driver
>> when it sets DWC3_CIOCTRL_CIO_EN?
> 
> For us, it seems to be hardwired (not sure if actually, but definitely
> effectively) to a separate register which is used to select the right
> clock mux for the USB3 protocol adapter to work (which is to be set if
> USB3 tunneling is going to be used)

Same for Apple Silicon: We have to switch the PIPE interface and some 
unknown clock from USB3 to USB3-via-USB4 inside the Type-C PHY driver.
For Apple Silicon we use apple,tXXXX-dwc3 as the base compatible and 
then match on that with a dwc3 glue driver like Thinh suggested when I 
upstreamed usb3 support which calls into the Type-C PHY to do this at 
just the right moment.

> 
> Moreover, the register definition for our SoCs calls all fields of
> CIOCTRL read-only, whereas the DWC programming guide says they're R/W -
> possibly supporting my theory above
> 
> FWIW, our Type-C infra is as such:
> 
> 1. thick firmware layer running on a MCU that performs mode&PD handshakes
> 2. drivers/soc/qcom/pmic_glink_altmode.c receives notifications of what
>     the FW had negotiated with regards to mode
> 3. a relatively small subset of UCSI provides PD data (and some altmode
>     data)
This is similar to Apple Silicon.

> 4. drivers/phy/qualcomm/phy-qcom-qmp-combo.c reprograms the PHY based
>     on typec_mux events in native cases, or to USB4/TBT mode if the router
>     driver requests it [that last part is not yet upstream]
> 5. [optionally] retimer drivers in between (most often Parade PS883x
>     series via drivers/usb/typec/mux/ps883x.c), which act as an
>     additional typec_mux/switch in the chain
> 6. [not upstream yet] USB4 router driver consumes some typec_mux
>     parameters (orientation, cable and partner capabilities) and sends a
>     command to another MCU to high-speed link establishment. It also sets
>     the aforementioned magic register.

I'm not sure if mux is the correct framework here. On Apple Silicon we 
also need an out-of-band notification from the PD controller to the USB4 
NHI here but the NHI isn't a mux in the typec sense. And how do you 
ensure that 4 happens before 6 if you use the typec mux framework or 
does that not matter for your platform?
Currently I use [1] and [2] in my work-in-progress tree though I'm not 
quite happy with it yet.

> 
> At a glance, 2. seems like a reasonably fitting place to set it, however:
> * it does not have any sort of a handle to the typec_connector (it
> only acts like a mux that sets another mux), and
> * it may be going away in the future
> 
> so I'd much prefer to keep this logic somewhere near where this iteration
> of the patch does - I think it'll be useful for more implementations, as
> I'd imagine it'd be fairly commonplace to hardwire CIOCTRL_CIO_EN and
> another part of the pipeline that must logically be online for USB4 to
> be useful
> 
> +Sven, on ASi, is CIOCTRL_CIO_EN (dwc3base + (0xcd20 + ((port) * 0x30))
> written to manually?

I don't think so, but we need a manual out-of-band notification to both 
PCIe, tunneled DisplayPort and USB3 once the tunnel has been brought 
upside the NHI (i.e. long after the typec altmode is entered) and all 
this has to be represented in the device tree as well.
DWC3 on Apple platforms is very cursed and has to be fully offline while 
the Type-C switches modes and must only be brought up then once the 
tunnel inside the NHI has already been established.

My current WIP code uses a tbt_oob_notify for all that that I introduced 
and something like this in the dt to represent the connections:

/* USB4 */
&usb4_1_acio {
	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		/* 1: USB4 port */
		port@1 {
			reg = <1>;
			usb4_1_acio_tbt: endpoint {
				remote-endpoint = <&typec1_con_tbt>;
			};
		};

		/* 2: unused(?) USB4 port */
		/* 3: PCIe, TBD */
		/* 4: USB3, TBD */
		/* 5: DP0, TBD */
		/* 6: DP1, TBD */
	};
};

Still not completely happy with that as well.
Does PCIe tunneling also need additional OOB notifications for you?


Sven



[1] 
https://github.com/AsahiLinux/linux/commit/b51ae0383e8f201aa0d2997d875f4b4993848b06
[2] 
https://github.com/AsahiLinux/linux/commit/827a9bfedbc78d7ad56c0c286382fe15d70d4f95


