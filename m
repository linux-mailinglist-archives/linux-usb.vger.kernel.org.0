Return-Path: <linux-usb+bounces-31887-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B3CF07A5
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 02:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AF36630011A5
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 01:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C5D1EF36C;
	Sun,  4 Jan 2026 01:38:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5407D14B96E;
	Sun,  4 Jan 2026 01:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767490694; cv=none; b=NRQZtWBGi8nvdN1wFIzEOjRryJXuMTiZdDlsRS5EiqkoctQrzqxLyiCDe/JeLhVokl3sAfg/PnCkbdo1ushKx+GUWmbrs1GwBYw/Dqrg9uroZKiRdW/gb71Ngr6CJ2wJXbTnLfrwSMoRHuzBKJFpcwmkJymM62Xusyn62Q5kjPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767490694; c=relaxed/simple;
	bh=TaVoauf7Ih98vRBjjk/gaeABr7IwgbgWseWXOYsr+HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BT/ZrKr3lW1KOGaXmFzjdngRUr8h4AML1r9tMDNDgQ6NqsavaxhwIHrpoFb5Z5cclarVwzIaNVpKQYwsLgGlSzTxDrAFHPEH39eTv2/CjR0rbXpZiDRNvzH+0CRHNqVijqqZa3p1ZU+/u6U9RfHHY2IHJe6bH4g1MaywGKYlgQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.26])
	by APP-03 (Coremail) with SMTP id rQCowAAXFbxDxFlp5eBIAw--.15S2;
	Sun, 04 Jan 2026 09:37:09 +0800 (CST)
Date: Sun, 4 Jan 2026 09:37:07 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Vinod Koul <vkoul@kernel.org>
Cc: conor@kernel.org, gregkh@linuxfoundation.org, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: usb: Add driver for Canaan K230 USB 2.0 PHY
Message-ID: <aVnEQ4+coOd397Hk@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-5-jiayu.riscv@isrc.iscas.ac.cn>
 <aVZQ4YVXGryHz0ds@vaman>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVZQ4YVXGryHz0ds@vaman>
X-CM-TRANSID:rQCowAAXFbxDxFlp5eBIAw--.15S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFykWr1xAryUKFy5uw1ftFb_yoW8WFWxpa
	95Ja1UtFs7WF40vFsF9w18Ja4SqFZ3GwnI9w15CrWvqas0qrW0kFy3CFs8Z3Z7WF1kZr10
	yrW8ta48uFn8uaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjxUqiFxDUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Thu, Jan 01, 2026 at 04:18:01PM +0530, Vinod Koul wrote:
> On 30-12-25, 10:37, Jiayu Du wrote:
> > Add driver for the USB 2.0 PHY in Canaan K230 SoC, which supports PHY
> > initialization, power management and USB mode switching.
> > 
> > Add Kconfig/Makefile under drivers/phy/canaan/.
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
...
> > +#define TEST_CTL3_OFFSET	0x0C
> 
> Lowercase hex values please.. do you need a test register :-)

Sorry, I will convert the hex to lowercase.

In the TRM manual, the registers are named TEST_CTL and they are
used to describe the otg0 phy port control. The TRM manual is here[1].
The description of this register is located on page 1015.

Therefore, I have retained the names as stated in the TRM manual.

Link:
https://kendryte-download.canaan-creative.com/developer/k230/HDK/K230%E7%A1%AC%E4%BB%B6%E6%96%87%E6%A1%A3/K230_Technical_Reference_Manual_V0.3.1_20241118.pdf
[1]

> > +	FIELD_PREP(USB_CTL0_PLLPTUNE_MASK, 0xC) | \
> 
> lower hex here and rest

I will fix it in v2.

> 
> > +	ret = regmap_update_bits(phy->regmap, phy->reg_test_offset +
> > +				 TEST_CTL3_OFFSET, val, val);
> 
> so we are writing to a test register..?

As I mentioned above, this is actually otg0 phy port control
register.

> > +	int ret;
> > +	u32 offset;
> > +	struct regmap *regmap;
> > +	struct phy *generic_phy;
> > +	struct k230_usb_phy *phy;
> > +	struct phy_provider *provider;
> > +	struct device *dev = &pdev->dev;
> 
> reverse christmas  tree order would look better...

I will fix it in v2.

> > +
> > +
> 
> why two lines...?

I will fix it in v2.

> 
> > +MODULE_LICENSE("GPL");
> > -- 
> > 2.52.0
> 
> -- 
> ~Vinod

Regards,
Jiayu Du


