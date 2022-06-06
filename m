Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D89053EBF4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jun 2022 19:09:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbiFFJLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jun 2022 05:11:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232580AbiFFJLs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jun 2022 05:11:48 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68045248F2
        for <linux-usb@vger.kernel.org>; Mon,  6 Jun 2022 02:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654506707; x=1686042707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=91EvlQEsHIlZRmS4QFe1SJBJwPS2dNmLA5q9tzmepYk=;
  b=L4hWApKRGofUM4o7BVH5cg/rzcqKHJstFmx1NuFL+H4qFMp5E+7n/W85
   fSf07Nzd8i735kFklVNa6926bOatO5R7T9vArIZYTjsN1QcfsMQunLlxt
   TTFC71Sa2wX2ZLcSxaFMBfQhVk3x1a8wDoc7FXgbOyTY75NelHT343qnr
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 06 Jun 2022 02:11:47 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 02:11:46 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 6 Jun 2022 02:11:45 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 6 Jun 2022 02:11:41 -0700
Date:   Mon, 6 Jun 2022 14:41:38 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Lukas Bulwahn" <lukas.bulwahn@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        John Youn <John.Youn@synopsys.com>,
        "Pavan Kondeti" <quic_pkondeti@quicinc.com>
Subject: Re: [RFC PATCH 4/4] usb: xhci: Introduce Synopsys glue extension for
 DWC_usb3x
Message-ID: <20220606091138.GA19757@hu-pkondeti-hyd.qualcomm.com>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fdd35b176f74e80fd75e4f75731e0f26c0808c89.1654310542.git.Thinh.Nguyen@synopsys.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh,

On Fri, Jun 03, 2022 at 07:48:28PM -0700, Thinh Nguyen wrote:
> Synopsys DWC_usb3x IPs are used on many different platforms. Since they
> share the same IP, often the quirks are common across different
> platforms and versions. This drives the need to find a way to handle all
> the common (and platform specific) quirks and separate its logic from
> dwc3 and xhci core logic. Hopefully this helps reduce introducing new
> device properties while maintaining abstraction.
> 
> So, let's create a xhci-snps glue extension that can apply to xhci-plat
> and xhci-pci glue drivers and teach it to handle DWC_usb3x hosts. For
> this particular change, we'll start with xhci-plat glue driver.
> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  drivers/usb/host/Kconfig     |   8 ++
>  drivers/usb/host/Makefile    |   3 +
>  drivers/usb/host/xhci-plat.c |  40 ++++++++
>  drivers/usb/host/xhci-plat.h |   3 +
>  drivers/usb/host/xhci-snps.c | 185 +++++++++++++++++++++++++++++++++++
>  drivers/usb/host/xhci-snps.h |  32 ++++++
>  6 files changed, 271 insertions(+)
>  create mode 100644 drivers/usb/host/xhci-snps.c
>  create mode 100644 drivers/usb/host/xhci-snps.h
> 
> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 57ca5f97a3dc..efbfb79baf44 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -62,6 +62,14 @@ config USB_XHCI_PLATFORM
>  
>  	  If unsure, say N.
>  
> +config USB_XHCI_SNPS
> +	bool "xHCI fine tune for Synopsys platforms"
> +	help
> +	  Say 'Y' to enable additional fine tune for Synopsys DWC_usb3x xHCI
> +	  controllers.
> +
> +	  If unsure, say N.
> +

Can this work without compiling in dwc3? i.e directly adding xhci-plat from
device tree or some wrapper to create platform device assuming that DWC3
core is initialized and forced in HOST role?

Thanks,
Pavan
