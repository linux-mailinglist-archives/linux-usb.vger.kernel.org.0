Return-Path: <linux-usb+bounces-31834-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A00CE9214
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 10:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 04742300297D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 09:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDF326F467;
	Tue, 30 Dec 2025 09:04:44 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844AD24291E;
	Tue, 30 Dec 2025 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767085483; cv=none; b=LqJrv4CJciKbpxnENHm8/oIO1si19R3FHir9RAOrlBoWrq8HZ69XH6uZgy/BPHSjhsVp9o6y9LvfMvvS8/7yld3d3LPE+PFc8NUep6by1kyCSGfuqGRnx3TwcZyVNv5wJKQRMyAEaOuVzdc/w3O6X7nXO4QujJx/nihvTDconvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767085483; c=relaxed/simple;
	bh=i8TP5fpPyorOtPoUkNCBX/Ctd9R40ANYxB1MxdCiMS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TiDGrKCwTmAG2Y+9Ri9qcPuO3PyY8FGE/MR0ET30mcF2Pq3sWv5yJR+lgtwdFRjziCTz8tmWikl0yB1Lm0Bog00naMjyfbbPUU4pHZR2F8O1T+traMx9NoZf0RZvtJnfHh07nxfLStJMFfW+DEhlFeqI1vkNydCnxEr1lLQREq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowADHcm6XlVNpQBFYAg--.11893S2;
	Tue, 30 Dec 2025 17:04:26 +0800 (CST)
Date: Tue, 30 Dec 2025 17:04:21 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: conor@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, neil.armstrong@linaro.org, krzk+dt@kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT
 schema
Message-ID: <aVOVlQXAQyr3aI1+@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-2-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-tricky-hasty-koala-2fc9f0@quoll>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230-tricky-hasty-koala-2fc9f0@quoll>
X-CM-TRANSID:qwCowADHcm6XlVNpQBFYAg--.11893S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYq7k0a2IF6w4xM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWUuVWrJwAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAa
	Y2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4
	A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY
	1x02628vn2kIc2xKxwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUtVW8Zw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU2xR6UUUUU
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Tue, Dec 30, 2025 at 08:36:06AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 30, 2025 at 10:37:20AM +0800, Jiayu Du wrote:
> > k230-usb-phy driver supports USB 2.0 phys integrated in Canaan
> 
> Describe hardware, not driver.
> 
> > K230 SoC. Add YAML schema for its binding.
> 
> There is no such stuff as YAML schema for a binding. Look at other
> commits how they phrase it.
> 
> > 
> > Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
I'm truly sorry for taking up your time. Thank you for your patience.
I will carefully revise and test it.

Regards,
Jiayu Du


