Return-Path: <linux-usb+bounces-32388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF6D2439C
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 12:41:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA9D33049C6A
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 11:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D503793BF;
	Thu, 15 Jan 2026 11:39:43 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC238361657;
	Thu, 15 Jan 2026 11:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768477183; cv=none; b=QCIlNng7ejdeqdFmh2w7NSk6HxiCiWfDbAGLef+aMcDKukS9abdWlQM7UM53dBZQD8kiMG3f6kX2CiaHaQr8UPtnx8f9ZG+OrTwnLjPi/ccxrSBh2SzhxZ9ToxwqJc0VIbatddlS2kgzLJJguCCwLtqm/NOV/UsUwIuZewAkanQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768477183; c=relaxed/simple;
	bh=OUDxttc+TrkS1/SKkfxsCtEnthsYHfMYRd5fFscgGJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vg98vpKkYZsWHqPcD9LaFyqU0ybtJHFzxNesDj7Ga3sGmnjsm7CTUIVC5AK7wGlNSO6YOJZBpsOnLAZMe6+TTkxUdI8B0Dh267QzusZXsxk3/WnnsmoEZzq9soTSnCF2X5nhfzuXOYDgNFOPoFdkljpb/1zJwzr6ywJoDj7h25w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhHf0Whp6EcVBQ--.27569S2;
	Thu, 15 Jan 2026 19:39:13 +0800 (CST)
Date: Thu, 15 Jan 2026 19:39:11 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: vkoul@kernel.org, linux-usb@vger.kernel.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, cyy@cyyself.name,
	alex@ghiti.fr, pjw@kernel.org, kingxukai@zohomail.com,
	conor@kernel.org, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	neil.armstrong@linaro.org, gaohan@iscas.ac.cn,
	linux-phy@lists.infradead.org, gregkh@linuxfoundation.org,
	18771902331@163.com, devicetree@vger.kernel.org,
	TroyMitchell988@gmail.com
Subject: Re: [PATCH v2 2/4] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC
Message-ID: <aWjR3zQqgi7ZHUEZ@duge-virtual-machine>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn>
 <176846580373.38125.3306033410225962520.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176846580373.38125.3306033410225962520.robh@kernel.org>
X-CM-TRANSID:zQCowAB3zhHf0Whp6EcVBQ--.27569S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF1UZFW8ArWxGFy3uryUJrb_yoW8WFW8pa
	y2ka9I9FZ0gFy3J397tr97KFy5Xrs3A3yftr1Ygr9rtF15X3W0q3ySgw4j9F1UWr4rA3W2
	vrWa934xGrW2yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bIBTOUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Jan 15, 2026 at 02:30:03AM -0600, Rob Herring (Arm) wrote:
> 
> On Thu, 15 Jan 2026 14:42:20 +0800, Jiayu Du wrote:
> > Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> > for the DWC2 IP which is used by Canaan K230.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> > ---
> >  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.example.dtb: usb-phy@91585000 (canaan,k230-usb-phy): reg: [[0, 2438483968], [0, 1024]] is too long
> 	from schema $id: http://devicetree.org/schemas/phy/canaan,k230-usb-phy.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260115064223.21926-3-jiayu.riscv@isrc.iscas.ac.cn
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
I will run the make dt_binding_check, and then fix it in v3.

Regards,
Jiayu Du


