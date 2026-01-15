Return-Path: <linux-usb+bounces-32393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A88E0D24FB0
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 15:36:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8D1DE301B4B7
	for <lists+linux-usb@lfdr.de>; Thu, 15 Jan 2026 14:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2513A1E6C;
	Thu, 15 Jan 2026 14:35:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AB23EA94;
	Thu, 15 Jan 2026 14:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768487759; cv=none; b=roUS2BrA+RhbgYjTsNGW4SWx/H2cAsVflgJTBNcghrAoMvBSL1lbKYfDjklYpZtz8a0/YhTToj9Mv7jg7U5QeJOlPuyAipjzVazq0t4oEouwpGGdv4s9JgmyAilcsVLshdnbFlaLn1S/gJpdlQSk62BYlMTtDgOQWzgVrrIUCu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768487759; c=relaxed/simple;
	bh=+JPCdv1FjP4/AWTrZQX/Bmri1JyVdhDdo20MZLgPe6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2N2+bW/cfX4m7++CHyTcRs8jxoHRpG5XaEa71NlCCUqBc93uZ/YqqfO7Z8aA876ySm2cv/JyGegJyU1NLvW19XRzrgkbEVdvBZEAuRsU7IXncy3eVlFvQucYuBm9QnAtM9VFNmhwIt7+0gpPAkLAs52jOK+ftboPokIaSyj5z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowAAXqw4f+2hpvPUXBQ--.42438S2;
	Thu, 15 Jan 2026 22:35:13 +0800 (CST)
Date: Thu, 15 Jan 2026 22:35:11 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: conor@kernel.org, neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, 18771902331@163.com, cyy@cyyself.name,
	TroyMitchell988@gmail.com, kingxukai@zohomail.com,
	linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, gaohan@iscas.ac.cn
Subject: Re: [PATCH v2 3/4] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aWj7HyeDQU6ytGz3@duge-virtual-machine>
References: <20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20260115064223.21926-4-jiayu.riscv@isrc.iscas.ac.cn>
 <aWjYHK1cTj8Dbz2B@vaman>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWjYHK1cTj8Dbz2B@vaman>
X-CM-TRANSID:zQCowAAXqw4f+2hpvPUXBQ--.42438S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF45Kry8Jw1UAw1xCrW5GFg_yoW8WFy7pF
	Z5XF1jqF43Jr97WrWSvF4kGr1Svws5Kw1UCryak3yrWwnIvr4xCayjg3y5Zwn5ZFZ5AFyI
	9r1jqFyxCFZIkrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07bIBTOUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Jan 15, 2026 at 05:35:48PM +0530, Vinod Koul wrote:
> On 15-01-26, 14:42, Jiayu Du wrote:
> 
> > +static struct phy *k230_usb_phy_xlate(struct device *dev,
> > +				      const struct of_phandle_args *args)
> > +{
> > +	struct k230_usb_phy_global *global = dev_get_drvdata(dev);
> > +	struct k230_usb_phy_instance *phy_inst;
> > +	struct phy *phy;
> > +
> > +	if (args->args[0] >= MAX_PHYS)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	phy_inst = devm_kzalloc(dev, sizeof(*phy_inst), GFP_KERNEL);
> > +	if (!phy_inst)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	phy_inst->global = global;
> > +	phy_inst->index = args->args[0];
> > +
> > +	phy = devm_phy_create(dev, NULL, &k230_usb_phy_ops);
> > +	if (IS_ERR(phy))
> > +		return ERR_PTR(PTR_ERR(phy));
> > +
> > +	phy_set_drvdata(phy, phy_inst);
> 
> This seems wrong place, why is this not done in the driver probe?

You are right, creating phy instances in the xlate function is not
the right place. I will move the allocation and devm_phy_creat to
the probe phase to create both instances.

> > +	global->reg_test_offset[0] = 0x70;
> > +	global->reg_ctl_offset[0] = 0xb0;
> > +	global->reg_test_offset[1] = 0x90;
> > +	global->reg_ctl_offset[1] = 0xb8;
> 
> Where are these magic values coming from?

These offsets are from K230 Technical Reference Manual section 12.6.4.2.
The TRM is here[1]. I will define them as macros with descriptive names.

Link:
https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf[1]

I will send v2 with these changes soon.

Regards,
Jiayu Du


