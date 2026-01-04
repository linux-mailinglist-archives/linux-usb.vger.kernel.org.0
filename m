Return-Path: <linux-usb+bounces-31888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5659DCF07B6
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 02:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9187B3011416
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 01:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC591F4CB3;
	Sun,  4 Jan 2026 01:41:16 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8D1E7C03;
	Sun,  4 Jan 2026 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767490876; cv=none; b=LkrIP/GKOMLM8BzVeUksfvJ8rGjd/+AjT2+Jy1QlVSRS2J6pt2MAX9CCew7Jc5F98knz5pHMwDs+dyl0AsQ5Jf9vrF+083qikVsh9zntLXns2q4XKqLJKnjNSkVHEIda1Pjje4GN7vZowQeIRvKBvlXOFcuenff9qvyEyRhB5Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767490876; c=relaxed/simple;
	bh=sukF+HLWzcwzlOW9mzjcbVDENYR58LaY7GrnVEarMVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jQYJHvpNIbVqTCrfp7jY0KH3rPVzbmSne897UlLHx7+8uf6M17dBKGGbpkGQURkJSzVgH5qssic4b/oT1CFeSmTZFdOHXw3hhEsmxMy/Lld7ZE8qPSVgvuiqVA2OEGXgnPKhsv/bd93seYB8rl2G0cs3JUjR4JV4izz16h6N6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.26])
	by APP-03 (Coremail) with SMTP id rQCowAA3T9YpxVlpeARJAw--.62026S2;
	Sun, 04 Jan 2026 09:41:00 +0800 (CST)
Date: Sun, 4 Jan 2026 09:40:57 +0800
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
Message-ID: <aVnFKX43C8wl4QiB@duge-virtual-machine>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-3-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230-jumping-visionary-coyote-c0be31@quoll>
 <aVPQNIhyfR/Da/gk@duge-virtual-machine>
 <572407e8-bac7-4277-bfbd-ed42327b0ff4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <572407e8-bac7-4277-bfbd-ed42327b0ff4@kernel.org>
X-CM-TRANSID:rQCowAA3T9YpxVlpeARJAw--.62026S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF48GFyrJr4xtF1DtrWfGrg_yoWDtrc_XF
	WDAw1xCw47CFZrtws7KF4kJry3Ka47GryjqrZ5Xr4jvr13ur95Aw4rC34xJw1kGFWUKF15
	Gr10vw4rW34YgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbsxYjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z2
	80aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07b0SoAUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

On Tue, Dec 30, 2025 at 03:00:26PM +0100, Krzysztof Kozlowski wrote:
> On 30/12/2025 14:14, Jiayu Du wrote:
> > On Tue, Dec 30, 2025 at 08:39:19AM +0100, Krzysztof Kozlowski wrote:
> >> On Tue, Dec 30, 2025 at 10:37:21AM +0800, Jiayu Du wrote:
> > This hisys memory area not only includes the usbphy registers,
> > but also contains the registers of sd/mmc phy. Therefore, the
> > hisys node is necessary and cannot be folded.
> 
> Can be. There is absolutely nothing stopping it.
> 
> Anyway, define all nodes.

I will fold the child into the parent in v2, thanks for your guidance.

> > 
> > 
> > If what I said above is accepted by you, do I still need to
> > merge the two usb phy nodes by defining one phy with phy-cells=2?
> 
> You should read your datasheet, not exactly rely on me guessing. In
> current form of the binding, you must fold the child into the parent.
> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


