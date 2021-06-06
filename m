Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C47ED39D20C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 00:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbhFFWyz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Jun 2021 18:54:55 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhFFWyz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Jun 2021 18:54:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62AF180F;
        Mon,  7 Jun 2021 00:53:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623019983;
        bh=rsiOyhfHAzfgkB1WYLFQjrFL15QyHBn+Nq4N2sJWwKI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pPVv3fmSqNGeKm1TUKpCiOII3AAAAIFIIR+2p06CAnl+wjjJrwv6GP3nJCaywDB7z
         iDY7hV7Tw85VxSfHuHnAUX+oWi4TRToGbsrosazltdTBClj+5b4mp0QYgwU2nm9E3w
         3kR2ng2SKOfw4ulfGkAE7wRcWg2ISMvK7FtD+usk=
Date:   Mon, 7 Jun 2021 01:52:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 0/9] usb: isp1760: extend support for isp1763
Message-ID: <YL1Rwj6BJG5dfpK8@pendragon.ideasonboard.com>
References: <20210513084717.2487366-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210513084717.2487366-1-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

I'm afraid I won't have time to review this in the near future, so feel
free to get it merged without my tags.

On Thu, May 13, 2021 at 09:47:08AM +0100, Rui Miguel Silva wrote:
> The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB
> controller.  There is already support for the isp1760 and isp1761 in
> tree, this series extend the support also for the isp1763.
> 
> Move register access using regmap, remove some platform data and code,
> refactor the mempool, use dr_mode to align to existing bindings, then
> add the support for isp1763 host mode, add bindings files that did not
> existed and at the end add also support for peripheral mode for
> isp1763.
> 
> @Laurent and @Sebastian, I add both of you in the bindings files as
> maintainers (it is a mandatory field)since you were the ones which
> contributed with the initial code and peripheral code, let me know if
> you are ok with it.  If yes I may send a follow up to add also entries
> in MAINTAINERS file that it is also missing.
> 
> v3 [4] -> v4:
> Rob Herring (bindings):
> - add device controller interrupt
> - correct additionalProperties field
> 
> v2 [3] -> v3:
> kernel test bot:
> - add select REGMAP_MMIO
> 
> v1 [2] -> v2:
> 
> kernel test robot:
> - add two patches (1/9 and 3/9) to fix dozens of pre-existing sparse
>   warnings so that this series does not introduce new ones.
>   No sparse warning left.
> - fix duplication of regmap fields
> 
> Laurent:
> - move initializers from .h to .c
> - change interrupt registers setup from field to one shot register
>   setting (did not change hcd hw mode init because I think it did not
>   make the difference and even avoid artifact around setting twice the
>   register)
> 
> Rob test bot:
> - fix suffix at compatible string to clean up warning in bindings
> 
> Cheers,
>    Rui
> 
> [0]: https://developer.arm.com/tools-and-software/development-boards/fpga-prototyping-boards/mps3
> [1]: https://media.digikey.com/pdf/Data%20Sheets/ST%20Ericsson%20PDFs/ISP1763A.pdf
> [2]: https://lore.kernel.org/linux-devicetree/20210504101910.18619-1-rui.silva@linaro.org/
> [3]: https://lore.kernel.org/linux-usb/20210511085101.2081399-1-rui.silva@linaro.org/
> [4]: https://lore.kernel.org/linux-usb/20210512090529.2283637-1-rui.silva@linaro.org/
> 
> Rui Miguel Silva (9):
>   usb: isp1760: fix strict typechecking
>   usb: isp1760: move to regmap for register access
>   usb: isp1760: use relaxed primitives
>   usb: isp1760: remove platform data struct and code
>   usb: isp1760: hcd: refactor mempool config and setup
>   usb: isp1760: use dr_mode binding
>   usb: isp1760: add support for isp1763
>   dt-bindings: usb: nxp,isp1760: add bindings
>   usb: isp1763: add peripheral mode
> 
>  .../devicetree/bindings/usb/nxp,isp1760.yaml  |   69 ++
>  arch/arm/boot/dts/arm-realview-eb.dtsi        |    2 +-
>  arch/arm/boot/dts/arm-realview-pb1176.dts     |    2 +-
>  arch/arm/boot/dts/arm-realview-pb11mp.dts     |    2 +-
>  arch/arm/boot/dts/arm-realview-pbx.dtsi       |    2 +-
>  arch/arm/boot/dts/vexpress-v2m-rs1.dtsi       |    2 +-
>  arch/arm/boot/dts/vexpress-v2m.dtsi           |    2 +-
>  drivers/usb/isp1760/Kconfig                   |    5 +-
>  drivers/usb/isp1760/isp1760-core.c            |  513 ++++++++-
>  drivers/usb/isp1760/isp1760-core.h            |   44 +-
>  drivers/usb/isp1760/isp1760-hcd.c             | 1021 ++++++++++++-----
>  drivers/usb/isp1760/isp1760-hcd.h             |   57 +-
>  drivers/usb/isp1760/isp1760-if.c              |   41 +-
>  drivers/usb/isp1760/isp1760-regs.h            |  435 ++++---
>  drivers/usb/isp1760/isp1760-udc.c             |  250 ++--
>  drivers/usb/isp1760/isp1760-udc.h             |   13 +-
>  include/linux/usb/isp1760.h                   |   19 -
>  17 files changed, 1769 insertions(+), 710 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
>  delete mode 100644 include/linux/usb/isp1760.h

-- 
Regards,

Laurent Pinchart
