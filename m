Return-Path: <linux-usb+bounces-37444-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPe4F1jyBWq3dgIAu9opvQ
	(envelope-from <linux-usb+bounces-37444-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 18:03:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 101DD5446A3
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 18:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7FADF30BE3D7
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2026 16:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8911B32861E;
	Thu, 14 May 2026 16:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="em/MXqlU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645A3016F7;
	Thu, 14 May 2026 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774443; cv=none; b=QtSZA7xYU0nzalVYVCzYjK8/3B7pSs+Y70C+6VhacrExJ8QLPAX/fw6x71g3KUC68N3RfRTL0xsJuknc3L2AB8J0rgFvUTFZcx6WZi5hdUGs7ab+n4FetZcOUuRv0EVfYbZBeCIVq5ZQQik0+hrH4MdCDKxYFNCHwy0Y2beKfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774443; c=relaxed/simple;
	bh=aYIL80rw3C3EF35cMMlhXqCBtlwG7P1QQusFd7N/ghs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZAnzxHUPQ5iVslYDMGkwipOth2BgLEB0bGfRmMzaQSYtQnzTGFH0sUkweMad/zdD5GHGNY1o/kCshvGSwsImQyYRN05nHRJ1OIiye5Ah2Qml3FLiwqYswH8yatTnJqfjs2lfYVeHOI9C7FZ6k5zY9nnoPsdm1DGzutC4R4Ipf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=em/MXqlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA94C2BCB3;
	Thu, 14 May 2026 16:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778774442;
	bh=aYIL80rw3C3EF35cMMlhXqCBtlwG7P1QQusFd7N/ghs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=em/MXqlU3TAY/8GnuMO8/XcHtFL1qNc9dqnURgTg7r+mFc7moSSYxpGuZ10RyE+Nr
	 yLWlFFYcGhvPy8OdZRymbUrHib5JjCNE/fxdhBHqRBH1yA8YhNkcsQXDYkDnSQdCcQ
	 tJmhgVTysQfMtRloqRkOpmmrMKkKmJ6kOmucOFMcAkZ4yW2la60SEKmTHUbcsmvN4M
	 VfOWN/2+hcIaDpPGUe7TuoevqNMQRIDkKNHqgP1HB+GeetUYNb4mCqq5RuKatrGy7x
	 MO22us0v8xIJXtXcxSmviu8984HfScWa++ln/7zTeUn6OIbQ++d0X4O0TFBuu6T/xy
	 VcMUbcf5j4/Ag==
Message-ID: <a51d0e53-3134-475d-a19f-67d7d0695cfe@kernel.org>
Date: Thu, 14 May 2026 18:00:38 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
To: "Pandey, Radhey Shyam" <radheys@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com,
 p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260429173050.1772377-1-radhey.shyam.pandey@amd.com>
 <20260429173050.1772377-2-radhey.shyam.pandey@amd.com>
 <20260503-enchanted-galago-of-relaxation-dcda7f@quoll>
 <f9f25ef4-a541-45a2-b98c-4a411239993b@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <f9f25ef4-a541-45a2-b98c-4a411239993b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 101DD5446A3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37444-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fe200000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On 07/05/2026 21:01, Pandey, Radhey Shyam wrote:
>> On Wed, Apr 29, 2026 at 11:00:47PM +0530, Radhey Shyam Pandey wrote:
>>>   additionalProperties: false
>>>   
>>>   examples:
>>> @@ -156,3 +193,30 @@ examples:
>>>               };
>>>           };
>>>       };
>>> +  - |
>>> +    #include <dt-bindings/power/xlnx-zynqmp-power.h>
>>> +    #include <dt-bindings/reset/xlnx-zynqmp-resets.h>
>>> +    #include <dt-bindings/phy/phy.h>
>>> +    usb {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <1>;
>> Please follow DTS coding style.
> Thanks for the review. will fix it in next version.
>>> +        compatible = "xlnx,versal2-mmi-dwc3";
>> I really doubt that DWC3 block comes without addressing space
>> (registers), so either you just misrepresented things, like created a
>> fake block and syscon, or forgot to combine DWC3 with the wrapper.
>>
>> And if you built with W=1 your DTS you would see errors. How do you see
>> it now? Where do you place it? Wrapper must be outside of soc, but DWC3
>> child must be inside. Did you read submitting patches and writing
>> bindings documents?
> Apologies for missing the DTS sanity check earlier. I am summarizing the
> problem statement and possible solution. Please review.
> 
> For MMI USB in current implementation it need a parent/child
> representation. However, the parent IP is shared across DP, USB,
> and HDCP, so it cannot have a USB-dedicated parent reg space.
> 
> 1. Versal platform
>    - Parent: USB wrapper IP → has its own I/O space
>    - Child: USB DWC3
> 
> 2. Versal Gen2 platform - MMI USB
>    - Parent subsystem combines DP, USB, and HDCP in a single I/O space
>    - Children:
>      - USB DWC3
>      - DP
>      - HDCP
> 
> To model the Versal Gen2 MMI USB parent register space, I introduced
> xlnx,usb-syscon, allowing the DWC3 driver to access parent registers
> via a syscon handle, addressing the v1 review comment.

Syscon phandle is not to express such relationsship.

> 
> However, making reg optional satisfies schema validation but fails
> DTB checks.
> 
> versal2.dtsi:1: Warning (simple_bus_reg):
> /axi/mmi-usb: missing or empty reg/ranges property

Yep, exactly.

> 
> To fix it i think we can switch from parent/child representation to
> flat DT representation for the Versal Gen2 platform, similar to
> existing implementations in qcom,snps-dwc3 and Google Tensor G5 DWC3
> bindings[1].
> 
> The Google Tensor DWC3 binding uses a syscon phandle to access USB
> configuration registers, which aligns well with the Versal Gen2 MMI

Not true. Just read the binding. If you refer to Tensor, then to access
A FEW configuration registers. If you refer to LGA, then it has address
space.

> USB IP, where wrapper subsystem shares a common register space for
> USB along with other IPs.



> 
> If this approach looks fine , will create binding for MMI USB using
> this flat representation and send out next version.
> 
> usb@fe200000 {
> compatible = "xlnx,versal2-mmi-dwc3";
> reg = <0xfe200000 0x40000>;
> xlnx,usb-syscon = <&udh_slcr 0x005c 0x0070 0x00c4 0x00f8>;
> <snip>
> };

So I am confused. We ask, since long time, to have unified child.
Several platforms were already converted. What are you discussing with
in such case?

Are you going to have unified node or not?


Best regards,
Krzysztof

