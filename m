Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB4A213E79
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbgGCRVz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgGCRVy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:21:54 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8C8C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:21:52 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a6so22737927wmm.0
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=8ete6I4ixSjbonl8sGfOuxL0bZF6e3pE/Fs8ioQCGKQ=;
        b=mfAZokO+WjGIsaCnXXptSbe05uvi4l7PSLIxYAaKNw444xSdOO4zv8QucMewmHfitM
         5wtOXBgXg8fP6E3JyQpl0HAr/fpB4sDFRKlFPefdk9+fczavZ4UjuXpLp/YicK4Rcr3U
         TFqIhhRhx4yRK5PU6DBK9SZSfTLEwLBDt7i/4T0rHDzniT/pmRbJoTmH0njqmkoF/1fg
         1PEyklputJfe5lw27QjiN7iIRVBhd1t6HO1xZxtMWugVAXqAALUNQIZZjwVkSVpE9TtJ
         w9UwaCMAYOd4oQR6x2l5T+DQqjUMgOCxsBSLifHex5Lfl2Tpa9vLAtwfG7WYAS8/yBuf
         3OWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=8ete6I4ixSjbonl8sGfOuxL0bZF6e3pE/Fs8ioQCGKQ=;
        b=bH5NeNizRUGF5ixBM6WSm7pk9w1CwrA76ZBdM24In0CUM9y8/cElSNt2wX5an9/TVm
         X4oHMODoVMzOqcEp4fHX64tGTC0tk7i6saN1qJoIgTu1I0fZmdBad3HZd7GNGlXWU8bF
         +Ea68dtWMYNlyFploO+tQgV1feSTPxlV6/UFHPb26WV7Nt+GRk5M1+NcMEkhSBXRqWZd
         XZehjbF1ebif5LpWMTJLRN/vKJmNau3eeYjnD3kHkGLwSPWwten9X+KqGJU/2kxNX6Fu
         LawTkj+BbnAu8ETdfuv9WqzSFPC8ykoorJYZUpksrZkFzl6oZcSVgMmL/0O8Jlez+uhN
         TpVA==
X-Gm-Message-State: AOAM530FCPpdgjDxewFU/cmM6oCIrJwBzAXc7iONM1WdrZrzLlu/Sf5a
        GmG/eHhjLvBK7CDp8myV2sL4tg==
X-Google-Smtp-Source: ABdhPJwgqFiZK7yvPBmX2Ha7Poc2II8t97vwg4ExlUBs3GokKuV9Cz8COt1NQZk47tn4YMKaSWa/0A==
X-Received: by 2002:a1c:80c8:: with SMTP id b191mr35735658wmd.37.1593796911630;
        Fri, 03 Jul 2020 10:21:51 -0700 (PDT)
Received: from dell ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x18sm14464840wrq.13.2020.07.03.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:21:50 -0700 (PDT)
Date:   Fri, 3 Jul 2020 18:21:48 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/30] Fix a bunch of W=1 issues in USB
Message-ID: <20200703172148.GD2743379@dell>
References: <20200702144625.2533530-1-lee.jones@linaro.org>
 <20200703073725.GA2370189@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200703073725.GA2370189@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 03 Jul 2020, Greg KH wrote:

> On Thu, Jul 02, 2020 at 03:45:55PM +0100, Lee Jones wrote:
> > This set is part of a larger effort attempting to clean-up W=1
> > kernel builds, which are currently overwhelmingly riddled with
> > niggly little warnings.
> > 
> > Lee Jones (30):
> >   usb: phy: phy: Fix-up a whole bunch of formatting issues
> >   usb: host: pci-quirks: Demote function header from kerneldoc to
> >     comment block
> >   usb: common: debug: Demote comment blocks which are obviously not
> >     kerneldoc
> >   usb: common: usb-conn-gpio: Demote comment block which is clearly not
> >     kerneldoc
> >   usb: dwc3: drd: File headers are not doc headers
> >   usb: dwc3: ulpi: File headers are not doc headers
> >   usb: common: ulpi: Fix a few kerneldoc related issues
> >   usb: dwc3: dwc3-omap: Do not read DMA status
> >   usb: dwc2: gadget: Do not read GINTMSK2
> >   usb: dwc2: gadget: Remove assigned but never used 'maxsize'
> >   usb: dwc2: gadget: Avoid pointless read of EP control register
> >   usb: host: ehci-omap: Provide documentation for
> >     ehci_hcd_omap_probe()'s arg 'pdev'
> >   usb: cdns3: core: Fix incorrect formatting and misspelled function arg
> >     docs
> >   usb: cdns3: ep0: Fix a bunch of kerneldoc issues
> >   usb: dwc3: dwc3-haps: Function headers are not suitable for kerneldoc
> >   usb: mtu3: mtu3_trace: Function headers are not suitable for kerneldoc
> >   usb: cdns3: gadget: Fix a bunch of kernel doc issues
> >   usb: dwc3: dwc3-of-simple: Function headers are not good candidates
> >     for kerneldoc
> >   usb: host: isp1362: Mark the many unused ISP1362_REG entries as
> >     __maybe_unused
> >   usb: host: ohci-at91: Demote kerneldoc headers down to basic comment
> >     blocks
> >   usb: host: ohci: Mark cc_to_error as __maybe_unused
> >   usb: cdns3: ep0: Move 'zlp' description to appropriate function header
> >   usb: host: oxu210hp-hcd: Move declaration of 'qtd' into 'ifdef
> >     OXU_URB_TRACE'
> >   usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h include file
> >   usb: mtu3: mtu3_core: Demote obvious misuse of kerneldoc to standard
> >     comment block
> >   usb: c67x00: c67x00-ll-hpi: Demote obvious misuse of kerneldoc to
> >     standard comment blocks
> >   usb: class: cdc-wdm: Provide description for usb_cdc_wdm_register()'s
> >     manage_power arg
> >   usb: c67x00: c67x00-hcd: Demote obvious misuse of kerneldoc to
> >     standard comment blocks
> >   usb: class: usbtmc: File headers are not good candidates for kerneldoc
> >   usb: c67x00: c67x00-sched: Demote obvious misuse of kerneldoc to
> >     standard comment blocks
> 
> I've applied 25 of these, if you could rebase and resend the remaining
> ones, after fixing up the review comments made on them, that would be
> wonderful.

Will do.  Thanks Greg.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
