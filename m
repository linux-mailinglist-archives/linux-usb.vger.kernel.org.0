Return-Path: <linux-usb+bounces-33695-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YTd0IdTnnmk/XwQAu9opvQ
	(envelope-from <linux-usb+bounces-33695-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:15:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D06B21971CF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 13:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4508E302D9EC
	for <lists+linux-usb@lfdr.de>; Wed, 25 Feb 2026 12:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07883ACF1E;
	Wed, 25 Feb 2026 12:15:12 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC61F5842;
	Wed, 25 Feb 2026 12:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772021712; cv=none; b=mPZZ/xIon4fYbknx0FMd3Kp5DyrZ+CIXOlwUIQWa0ShRkCKJs0ZxrFZYK86PUyxsRS4pi7Cgn7d4fRpvAQHlt1zEgqXakEKRQSeLyC2VNAUuLKR0Ali0sx4/rbZhAj6w8zgH/AMc7s+x1M3byS4xQKwnnUOUbwzAShLRj5CrD+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772021712; c=relaxed/simple;
	bh=lfMqTA1aUdeM2rMnaquQA8d58gsfaOzsornyEBzxsbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RysQ+2yjzT6H5LmFS+ILBUY4izrlm7dt6S2IMGTn8nkFAgjodG7ryQKmHDrUNG81D1esQJjQjVqxJd/SNKvOACF8PHiBXNd5kaH/SLc6fjoVKh4cYZQPoDfgkvIBgkuxUQsRae3xR7RpeJ6ynMfhkgsuEWCqoaZiu2HCLgDpg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [112.53.146.143])
	by APP-03 (Coremail) with SMTP id rQCowAAHItm2555pSx1OCQ--.33021S2;
	Wed, 25 Feb 2026 20:14:48 +0800 (CST)
Date: Wed, 25 Feb 2026 20:14:46 +0800
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org, gregkh@linuxfoundation.org, conor@kernel.org
Cc: neil.armstrong@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] Add USB support for Canaan K230
Message-ID: <aZ7ntvit57TaPgyw@duge-virtual-machine>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
 <aYCLGLvbKZy+WyxI@duge-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYCLGLvbKZy+WyxI@duge-virtual-machine>
X-CM-TRANSID:rQCowAAHItm2555pSx1OCQ--.33021S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyDXrWkCFyxGFWfGF4kZwb_yoW5WFW5pa
	y2kF43CF4DJFWIqa97tw1rGF98ZFs5Jry5Gryaq3sxXa4UZr1UAwn3G3y5ZFyDJFs5Cryj
	vF15GFy7GFyUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvvb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33695-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[iscas.ac.cn];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiayu.riscv@isrc.iscas.ac.cn,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_TWELVE(0.00)[15]
X-Rspamd-Queue-Id: D06B21971CF
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 07:31:36PM +0800, Jiayu Du wrote:
> On Wed, Jan 21, 2026 at 10:55:21PM +0800, Jiayu Du wrote:
> > Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
> > and made relevant changes to the DTS.
> > 
> > This series is based on the initial 100ask K230 DshanPi series [1] which
> > is based on the clock and pinctrl series. Check the details in the link.
> > 
> > Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
> > 
> > Changes in v5:
> > - Changed the year of Copyright to 2026.
> > - Add blank line after the declaration of variables
> > - Fix wrong alignment.
> > - Link to v4: https://lore.kernel.org/all/20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn/
> > 
> > Changes in v4:
> > - Shrink reg length to match the address/size-cells in k230-usb-phy yaml.
> > - Move all PHY instance creation and initialization from xlate to probe.
> > - Modify xlate function to only perform index lookup for PHY instances.
> > - Define all register base offsets macros at the top of file instead of
> >   hard-coding magic numbers directly in probe.
> > - Link to v2: https://lore.kernel.org/all/20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn/
> > 
> > Changes in v3:
> > - Please ignore v3.
> > 
> > Changes in v2:
> > - Fold the child into the parent in dtsi.
> > - Define one usbphy with phy-cells=1.
> > - Delete the clock of the usbphy as it is not needed.
> > - Link to v1: https://lore.kernel.org/all/20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn/
> > 
> > Jiayu Du (4):
> >   dt-bindings: phy: Add Canaan K230 USB PHY
> >   dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
> >   phy: usb: Add driver for Canaan K230 USB 2.0 PHY
> >   riscv: dts: canaan: Add syscon and USB nodes for K230
> > 
> >  .../bindings/phy/canaan,k230-usb-phy.yaml     |  35 +++
> >  .../devicetree/bindings/usb/dwc2.yaml         |   3 +
> >  .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  17 ++
> >  arch/riscv/boot/dts/canaan/k230.dtsi          |  35 +++
> >  drivers/phy/Kconfig                           |   1 +
> >  drivers/phy/Makefile                          |   1 +
> >  drivers/phy/canaan/Kconfig                    |  14 +
> >  drivers/phy/canaan/Makefile                   |   2 +
> >  drivers/phy/canaan/phy-k230-usb.c             | 284 ++++++++++++++++++
> >  9 files changed, 392 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
> >  create mode 100644 drivers/phy/canaan/Kconfig
> >  create mode 100644 drivers/phy/canaan/Makefile
> >  create mode 100644 drivers/phy/canaan/phy-k230-usb.c
> > 
> > -- 
> > 2.52.0
> > 
> Hello Vinod, could you please take a look at this patch? Thank you!
> 
> Regards,
> Jiayu Du

Hi Vinod, will you review this patch? Thank you again!

Regards,
Jiayu Du

> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


