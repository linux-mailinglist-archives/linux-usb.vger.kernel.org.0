Return-Path: <linux-usb+bounces-31843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 90252CE9C2D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 14:15:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 417E0301EFB3
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 13:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF086221DAC;
	Tue, 30 Dec 2025 13:15:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2842D2AEE4;
	Tue, 30 Dec 2025 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100519; cv=none; b=G54+4kaGhTvZLUsIUxbZwz55UlJAYAYsR3m/h7hA2TDZNcwxPTQ9VLV3ef1e3jCSF8xDrJjWAcvD0LzXtDEAO54W64arQzLGrztmdNb0jq4/UebiCBcFNGmJwnOLamBi17wr8tEFCCSU06hp4oHIJ84aZuh+0WsY5YkYrK4jK5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100519; c=relaxed/simple;
	bh=pkIc6LzLszAxCZ0DbsZw7IMl29WtKbww7eFuUTQsLPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cprdm7pJz7/NNeyvrJ8PYaYuy9YNnFcoKyV70+ziArkp3lXVqAdp8UrcH+VmTnIDsSmI8clpjgTM5theqaSzyL2ILJmcrYHiGXIsh/rjP6Yea8IUsAAilDoSGlLEmzsYWWDZ/t5oILiZmnryaBsAA2ySo/OeSWpvz3n6MH/gMb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.253])
	by APP-05 (Coremail) with SMTP id zQCowADHWAw00FNpCvqIAg--.28864S2;
	Tue, 30 Dec 2025 21:14:30 +0800 (CST)
Date: Tue, 30 Dec 2025 21:14:28 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: soc: canaan: Add top syscon for Canaan
 K230 SoC
Message-ID: <aVPQNIhyfR/Da/gk@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-jumping-visionary-coyote-c0be31@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-jumping-visionary-coyote-c0be31@quoll>
X-CM-TRANSID:zQCowADHWAw00FNpCvqIAg--.28864S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr13ZF43Xry3Kr4xZF4UCFg_yoW8uFyUpF
	y7GFWjkF4DXr4Fyr48try8WF9xG3yDKrZ8Zr1rtryDJ398uFW0yF4jgF93ur4UWFs7Zw42
	vF45Zas7Cr1DJaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07betCcUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Tue, Dec 30, 2025 at 08:39:19AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
> > The Canaan K230 SoC top system controller provides register access
> > to configure related modules. It includes a USB2 PHY and eMMC/SDIO PHY.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
...
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  usb-phy@70:
> > +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
> 
> So that's why you did not have example there? But where did you explain
> merging strategy/constraints/dependencies? How maintainers can now they
> can apply this or not?

Sorry, I will update in v2.

> 
> 
> > +    unevaluatedProperties: false
> > +
> > +  usb-phy@90:
> > +    $ref: schemas/phy/canaan,k230-usb-phy.yaml#
> > +    unevaluatedProperties: false
> 
> Anyway, these are not really real children. Defining child per phy,
> where each such phy is just few registers, is way too granular. Instead
> define one phy with phy-cells=2.
> 
> You also MUST make this device - hisys - binding complete. If you do
> not, then my review is: fold the children here, because you do not have
> any other resources for the parent.

This hisys memory area not only includes the usbphy registers,
but also contains the registers of sd/mmc phy. Therefore, the
hisys node is necessary and cannot be folded.


If what I said above is accepted by you, do I still need to
merge the two usb phy nodes by defining one phy with phy-cells=2?

> 
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    hi_sys_config: syscon@91585000 {
> > +        compatible = "canaan,k230-hisys-cfg", "syscon", "simple-mfd";
> > +        reg = <0x91585000 0x400>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        usbphy0: usb-phy@70 {
> > +            compatible = "canaan,k230-usb-phy";
> > +            reg = <0x70 0x1C>, <0xb0 0x8>;
> > +            clocks = <&sysclk K230_HS_USB0_AHB_GATE>;
> 
> You never bothered to test your code. Community is not a testing
> service. It's your job to TEST IT before sending.

Sorry, I've realized this now. I'll test it.

Best regards,
jiayu

>
> Best regards,
> Krzysztof
> 


