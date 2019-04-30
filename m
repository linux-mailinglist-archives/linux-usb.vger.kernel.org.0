Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04D72FC16
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 17:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbfD3PCQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 11:02:16 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:37182 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbfD3PCQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 11:02:16 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3UF2F1o104230;
        Tue, 30 Apr 2019 10:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1556636535;
        bh=W+EIVd1GTxbWhqLJbZgkIb5FZDcPtuS8RamESCZgmtY=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=fj5THqMiNSPLYbFSoarPzfgqm1adhhyWNh7zK1/nsGic8G7ikeylXajq3+QabY97k
         WuMDPPHKsuKbBGZW/AXBE/zLvRjdjzsdnU/lF2SUjnBjuSeI2xP6JAhw/oxeLykyh3
         sCMx+39Mh64PH2A/dfFHsILbjeaNY17xJlnp2UR8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3UF2FUE038045
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 30 Apr 2019 10:02:15 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 30
 Apr 2019 10:02:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 30 Apr 2019 10:02:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3UF2F87050595;
        Tue, 30 Apr 2019 10:02:15 -0500
Date:   Tue, 30 Apr 2019 10:02:15 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/6] musb patches for v5.2-rc1
Message-ID: <20190430150215.GA5971@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
References: <20190430145942.1128-1-b-liu@ti.com>
 <20190430145942.1128-9-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190430145942.1128-9-b-liu@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please ignore this specific email. Sorry for the noise.

-Bin.

On Tue, Apr 30, 2019 at 09:59:42AM -0500, Bin Liu wrote:
> Hi Greg,
> 
> Here are the musb patches for v5.2 rc1. There are all small fixes or
> improvements. Please let me know if any change is needed.
> 
> There is one of the patches marked for stable. I will send it to stable
> tree later after they get into v5.2 rc.
> 
> Thanks,
> -Bin.
> ---
> 
> Kefeng Wang (1):
>   usb: musb: dsps: Use dev_get_drvdata()
> 
> Paul Cercueil (3):
>   dt-bindings: usb: Add usb-phy property to the jz4740-musb node
>   usb: musb: jz4740: Let the platform probe the PHY
>   usb: musb: jz4740: obtain USB PHY from devicetree
> 
> Samuel Holland (1):
>   soc: sunxi: Fix missing dependency on REGMAP_MMIO
> 
> Tony Lindgren (1):
>   usb: musb: omap2430: Add support for idling phy when musb is idle
> 
>  .../bindings/usb/ingenic,jz4740-musb.txt      |  8 ++++++++
>  drivers/soc/sunxi/Kconfig                     |  1 +
>  drivers/usb/musb/Kconfig                      |  2 +-
>  drivers/usb/musb/jz4740.c                     | 19 +++++++------------
>  drivers/usb/musb/musb_dsps.c                  |  6 ++----
>  drivers/usb/musb/omap2430.c                   |  6 ++++++
>  6 files changed, 25 insertions(+), 17 deletions(-)
> 
> -- 
> 2.17.1
> 
