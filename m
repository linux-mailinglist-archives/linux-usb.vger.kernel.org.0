Return-Path: <linux-usb+bounces-35903-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOcXLIydzmnfowYAu9opvQ
	(envelope-from <linux-usb+bounces-35903-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 18:47:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3632238C26C
	for <lists+linux-usb@lfdr.de>; Thu, 02 Apr 2026 18:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F8643105046
	for <lists+linux-usb@lfdr.de>; Thu,  2 Apr 2026 16:36:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB6D93F166A;
	Thu,  2 Apr 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o74/Yl2v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663881C861D;
	Thu,  2 Apr 2026 16:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147809; cv=none; b=ErPd7QBK/gi7laAWJBwk4yA84SuHpNl0Zp4XudMXyZYob9ffmaz4yiOFAhDai7NHL11hCjvXEkT7B/8gcbYvqthZIKRbldNi1AZwZY/CIFw1/x21VHrAZv3moEZ2AKkCXg01l9+txZqx+013ax2EwaekFB1z88iJtG8HHlZbd1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147809; c=relaxed/simple;
	bh=ZziQI+L2TPJPg9vzRV+c96lmFlIjt5A3GhQ/nKXHWTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D5uZsFDgzfZOM7hSUvhG9ZfRHMsTpvy9kM6XES8Jk1NSXWtgRPMIiMlecJUFwgTWNu6WnJuBwW7UI1Xs34x+ciKbrlSt8E2IlDp5oP/XT/9zPdqKk3SFeWwuZzJRgEj5G0QGar6cnaUsjWeYq6r9PVQ7A/sNoxBtmnemVzkrRFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o74/Yl2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F82C116C6;
	Thu,  2 Apr 2026 16:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775147809;
	bh=ZziQI+L2TPJPg9vzRV+c96lmFlIjt5A3GhQ/nKXHWTg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o74/Yl2vwckDQCqDswuI2eZoPtoMfkyoF/DjNlbERA7Vd06FDP5GZ3aJrgnjgadGL
	 KsBsubE+NUZDFO+9i86lMoQT6reVgwozlVnz5Lod1tKM47lqemfW6MHDTvcaNcKich
	 pJE0kaXKFZQTN9jvQfE/d+NG5MLWlAQNd+OUXPCXC3Ts8+i34SW9Kyd/ADrluAqf7a
	 9YH4RL6ys3DWE9qhgAhwEOQX0pBKNdouXe/NpOw+o7J1RJYORnSeQFloxxYPN2ouui
	 qy3irQ2Yozh0oKlsPcEvc4Kz2xUSdvHeZhK6DlEEJ2HzAEkm7sOuAqRtYT2L6vPglF
	 NOwiPpwJECdOQ==
Message-ID: <6cee7587-a7f6-4e69-893f-4c89dd0aa2bf@kernel.org>
Date: Thu, 2 Apr 2026 18:36:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: usb: dwc3-xilinx: Add MMI USB support
 on Versal Gen2 platform
To: "Pandey, Radhey Shyam" <radheys@amd.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michal.simek@amd.com, Thinh.Nguyen@synopsys.com,
 p.zabel@pengutronix.de, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, git@amd.com
References: <20260330190304.1841593-1-radhey.shyam.pandey@amd.com>
 <20260330190304.1841593-2-radhey.shyam.pandey@amd.com>
 <20260331-jellyfish-of-pragmatic-prowess-a230fc@quoll>
 <3d64cd29-d981-4e84-8106-8085250fc502@amd.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <3d64cd29-d981-4e84-8106-8085250fc502@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
	TAGGED_FROM(0.00)[bounces-35903-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: 3632238C26C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 31/03/2026 11:18, Pandey, Radhey Shyam wrote:
>> On Tue, Mar 31, 2026 at 12:33:01AM +0530, Radhey Shyam Pandey wrote:
>>> Versal Gen2 platform multimedia integrated (MMI) module has a USB3.2 Gen
>>> 2x1 Dual Role Device IP. Introduce a new compatibility string to support
>>> it. The USB wrapper registers reside in the MMI UDH system-level control
>>> registers (SLCR) block, so instead of a dedicated reg property, add
>>> xlnx,usb-syscon phandle with four cells specifying register offsets for
>>> USB2 PHY, USB3 PHY, USB DRD, and USB power configuration within the SLCR.
>>>
>>> Signed-off-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
>>> ---
>>> Changes for v2:
>>> - Add blank line after compatible as suggested by Krzysztof.
>>> - Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
>>>    IP from Synopsys is part of the dedicated Multimedia Interface. The
>>>    Versal Gen2 platform also includes a separate USB 2.0 controller,
>>>    and the mmi suffix uniquely distinguishes between the two USB
>>>    controllers. MMI is an independent subsystem particularly targeted for
>>>    deployment in Multi-Media related applications. The MMI block include
>>>    following submodules: UDH: USB3.2 Gen 2x1 Dual Role Device, DisplayPort
>>>    Transmit Controller, Security Module (ESM) for DisplayPort and HDMI
>>>    Controllers, DP AUX-I2C PHY.
>>> - For MMI USB define parent address space i.e UDH block.
>>> - Fix inconsistent MHz spacing to use SI convention with spaces.
>>> - Move description before $ref and items in xlnx,usb-syscon property.
>>> - Restore original zynqmp-dwc3 example, add new versal2-mmi-dwc3 example.
>>> - Use 'usb' node name (without unit address) for versal2 example since
>>>    it has no reg property.
>>> - Use 1/1 address/size configuration in versal2 example, use lowercase
>>>    hex in syscon offsets.
>>> ---
>>>   .../devicetree/bindings/usb/dwc3-xilinx.yaml  | 70 ++++++++++++++++++-
>>>   1 file changed, 67 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>>> index d6823ef5f9a7..5e31b961aff7 100644
>>> --- a/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/dwc3-xilinx.yaml
>>> @@ -15,6 +15,8 @@ properties:
>>>         - enum:
>>>             - xlnx,zynqmp-dwc3
>>>             - xlnx,versal-dwc3
>>> +          - xlnx,versal2-mmi-dwc3
>> I am not going to ask the same questions.
> 
> I have provided the explanation in v2 changelog.
> Retain the mmi suffix in the compatible string, as this USB 3.2 Gen2
> IP from Synopsys is part of the dedicated Multimedia Interface. The
> Versal Gen2 platform also includes a separate USB 2.0 controller,
> and the mmi suffix uniquely distinguishes between the two USB
> controllers.
> 
> Let me know if you still have reservation in this approach (using
> <vendor>,<soc>-<subsystem>-<ip>). Or any other alternative
> based on IP version etc please suggest.

Commit msg must explain that you have two different devices. And then
explain what is the difference between versal2-dwc3 and versal2-mmi-dwc3.

Best regards,
Krzysztof

