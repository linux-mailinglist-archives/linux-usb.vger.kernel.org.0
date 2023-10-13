Return-Path: <linux-usb+bounces-1555-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDBF7C7CF1
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 07:16:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93D52B209D3
	for <lists+linux-usb@lfdr.de>; Fri, 13 Oct 2023 05:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580F62903;
	Fri, 13 Oct 2023 05:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=triops.cz header.i=@triops.cz header.b="vMuPAJzJ";
	dkim=pass (2048-bit key) header.d=triops.cz header.i=@triops.cz header.b="vMuPAJzJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554BF5677
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 05:16:41 +0000 (UTC)
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D879B7
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 22:16:39 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
	by cmgsmtp with ESMTPSA
	id rAXLqtqSLSqGRrAXMqje0R; Fri, 13 Oct 2023 07:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1697174196; bh=MKaCBf+NN6NQE31g/yrJsgc1l4UabtczalQFId3+UQM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=vMuPAJzJ2WApkp50w5Adkw+y21wG/I3G3AaOrPkwhibf5NUfuVw4Uw+3m+2cCB/vk
	 GBAVgn7WlJ2kugyEa9TaGSauhAUl2R+Wc+R+76juDWEEatywinTWPXqztw3hvR90aI
	 avOntojfwq9eLMNQFzYYk9qHc2i5xNPkaRFAcaNEPLkycR3hM/kaKlccOZNFhi4yYi
	 zVQ72hZmhcpfC6oRiDJ4gCOtLRUbHmIe5IiqdD5IfemuFIVwkcSEJcclr9kQb2q//c
	 /hNYgaWHIAJRue56SqAYUqbVQ2o8eTPyuMrj6zfosjq+rdi6bkZ7/MuUK6UJ4+gTNS
	 PX8Yb8Zg+0s6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
	t=1697174196; bh=MKaCBf+NN6NQE31g/yrJsgc1l4UabtczalQFId3+UQM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=vMuPAJzJ2WApkp50w5Adkw+y21wG/I3G3AaOrPkwhibf5NUfuVw4Uw+3m+2cCB/vk
	 GBAVgn7WlJ2kugyEa9TaGSauhAUl2R+Wc+R+76juDWEEatywinTWPXqztw3hvR90aI
	 avOntojfwq9eLMNQFzYYk9qHc2i5xNPkaRFAcaNEPLkycR3hM/kaKlccOZNFhi4yYi
	 zVQ72hZmhcpfC6oRiDJ4gCOtLRUbHmIe5IiqdD5IfemuFIVwkcSEJcclr9kQb2q//c
	 /hNYgaWHIAJRue56SqAYUqbVQ2o8eTPyuMrj6zfosjq+rdi6bkZ7/MuUK6UJ4+gTNS
	 PX8Yb8Zg+0s6Q==
Date: Fri, 13 Oct 2023 07:16:35 +0200
From: Ladislav Michl <oss-lists@triops.cz>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [RFC] usb: dwc3: dwc3-octeon: Fix USB PHY High-Speed PLL
 Initialization
Message-ID: <ZSjSs5vLutIDU2MO@lenoch>
References: <ZShGmL4mph91Ncib@lenoch>
 <20231012222328.ts3z3csvxi4obkig@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231012222328.ts3z3csvxi4obkig@synopsys.com>
X-CMAE-Envelope: MS4wfJxRungZaA/DPliCP63h16nSj4Dj3VqGMmO1q6aeNh43SNTSa3zkBn3hzpvvF6XIUfuusu6eWrZWtrCbVcTW9YiLQILsiqqKWfdyq90D6WOEDMKj/Yml
 1RX+U6Rj4ErEOj0PoRGwlhuGEOpHYQoEjSWMfH9TCo4tb/KysfgJU/66vS1vJQTWMzx6QRqrBuBd8A4Q5IYXDzidKFsNyOrkHZs=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Oct 12, 2023 at 10:23:30PM +0000, Thinh Nguyen wrote:
> On Thu, Oct 12, 2023, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > Implement workaround for Octeon Known Issue Id 29206:
> > | The USB high speed logic contains a PLL that must lock during
> > | initialization for correct operation. In very rare circumstances,
> > | it is possible for the PLL to fail to start correctly.
> > | Workaround
> > | After initialization, check the USB PLL lock register via the
> > | UPHY CR interface. If the PLL is not running, power it down and
> > | back up and restart the initialization.
> 
> Minor nit: Can we replace "|" with tabs. I think it's easier to read.

Ok.
 
> > PLL initialization code taken from Cavium's vendor bootloader:
> > u-boot/drivers/usb/host/xhci-octeon.c:octeon3_usb_clocks_start
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > ---
> >  NOTE:
> >  This patch fixes initialization issue found on some CN7020 based boards.
> >  Without this patch, controller sometimes fails to detect devices connected.
> >  Original code comes from Cavium released u-boot monster patch, which seems
> >  to suffer from mistakes made while resolving merge conflicts when upgrading
> >  to newer u-boot.
> >  Testing revealed that only single reinit is needed to properly lock PLL,
> >  this agrees with comment in Cavium's u-boot code, which is claiming the
> >  same. However, same as in u-boot code, reinit is attempted three times.
> >  (in could be done using while loop instead of goto, just let me know
> >  which way do you prefer)
> >  SoCs suffering from this problem would fail to initialize PHY about
> >  several tens times of thousand boots. This patch always restored
> >  functional state.
> 
> What kernel version did you use? Perhaps it has the same issue due to
> the commit e835c0a4e23c ("usb: dwc3: don't reset device side if dwc3 was
> configured as host-only")

Production devices are running 6.1.y, patch was developed and tested against
6.1.38, then ported to 6.6-rc5. The purpose of this RFC was to figure out
how to handle situation when informations are comming from NDA document
and code is based on the one coming from unpublished vendor tree.

> Did you test this against Greg's usb-linus branch with the fix for the
> above?

Do you mean "usb: dwc3: Soft reset phy on probe for host" patch? I had
noticed it, however this patch was not tested with that fix.

Cavium's u-boot is also resetting PHYs similar way it is done there,
but I ommited this change as testing revealed it is not needed.

Please see dwc3_uphy_pll_reset function and comment above it.
Without hardware documentation I can only guess whenever it makes sense.

Regards,
	ladis

