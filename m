Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC2A227F52
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 13:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728389AbgGULww (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 07:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726698AbgGULwv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 07:52:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADE4DC0619D8
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 04:52:49 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id z2so20951905wrp.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YZopNL5/8ANY4qnCt9+wKywvq9+QBDbxQFIaGJPGSkU=;
        b=TgrGhm+v1Mg3jVuL3BVaIhy8BL4lZKWs1CJ5bFyF8NCqc/f9wNyORftQhIAIS+awPP
         lXfjUjWffFMBQ2bsP4cZY1Kvkw1IR7iTvP/AeVPsgUtQPuf/ew4WV66IVqGxg59czy1/
         0hK9NHIXNYTuW0pWAP/TbkSXMR7X1C+GnBPEeK5VP1a06mrAejxwDn7uvoHrW5qMXraU
         VM/Xx8uECxzqCY48+v4TYcTNadfgAyqfTTPPZXZpBR8Ty4ZeeetMqIq3iRLUZ1P/eT2i
         +/YN/KGYQ+p6Cv2VDBkyV0d4+mhKQMWnvCkYPI75nGeG2dpPF3ImzwWb8hq4rZiOYjiN
         etyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YZopNL5/8ANY4qnCt9+wKywvq9+QBDbxQFIaGJPGSkU=;
        b=uYfSiITEdBS9XgJbNDLiz5FDIMN7tAla+THz03ikCWnxMypV65JVAQWcnOCUXEYMAl
         xzdI4e+qehRvULoISDETQaEZIdBpuX25q0+bqgQrxRG3xoxPnS9zG+IP94tnnJiAGlnO
         ICO72Of7LdIAAsa9TvVZHC3uY9xV+3v2MFR95TvxUjxldaXSxprHnNxBVKo+jzDevOWM
         4Lpb/xkKwYt0G/K+Q3esTNEkZJw9wcWsf+pZU3eHrYj0JMm8bpUxK8Lcw+L59mdi4YkE
         iBtw/yrJKRejJbcwyhtIVO+QmumB/MROHbk+IGU+yvLAmxqNRCpRkbykkAGUa8ajbn6Y
         em1A==
X-Gm-Message-State: AOAM5300lh3H0qkF4y5Z7+8GUsOMFzvzzZu957nOM5+rumsZpqhPI1Ik
        gvUOiegKjbTrgAwGGG3SfzOUMw==
X-Google-Smtp-Source: ABdhPJzkuMo6BVRg+eIcLsNrunYrL7MrNDfMCxb56XFQ8NXNkSdiOirXEPWIr6xsfVjqdIMtGKLThA==
X-Received: by 2002:a5d:490c:: with SMTP id x12mr13034598wrq.238.1595332368446;
        Tue, 21 Jul 2020 04:52:48 -0700 (PDT)
Received: from dell ([2.27.167.94])
        by smtp.gmail.com with ESMTPSA id s203sm3250315wms.32.2020.07.21.04.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 04:52:47 -0700 (PDT)
Date:   Tue, 21 Jul 2020 12:52:46 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ben Dooks <ben@simtec.co.uk>
Subject: Re: [PATCH v2 1/8] usb: dwc2: gadget: Make use of GINTMSK2
Message-ID: <20200721115246.GE621928@dell>
References: <20200715093209.3165641-1-lee.jones@linaro.org>
 <20200715093209.3165641-2-lee.jones@linaro.org>
 <566f2d65-1b5a-ed2a-f33f-516b66be2624@synopsys.com>
 <87blk9p5ia.fsf@kernel.org>
 <5862f649-8058-7e39-cb43-2a4b09303333@synopsys.com>
 <875zahp0i0.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875zahp0i0.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 Jul 2020, Felipe Balbi wrote:

> Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> writes:
> 
> > Hi Felipe,
> >
> > On 7/21/2020 1:43 PM, Felipe Balbi wrote:
> >> Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> writes:
> >> 
> >>> On 7/15/2020 1:32 PM, Lee Jones wrote:
> >>>> The value obtained from GINTSTS2 should be masked with the GINTMSK2
> >>>> value.  Looks like this has been broken since
> >>>> dwc2_gadget_wkup_alert_handler() was added back in 2018.
> >>>>
> >>>> Also fixes the following W=1 warning:
> >>>>
> >>>>    drivers/usb/dwc2/gadget.c: In function ‘dwc2_gadget_wkup_alert_handler’:
> >>>>    drivers/usb/dwc2/gadget.c:259:6: warning: variable ‘gintmsk2’ set but not used [-Wunused-but-set-variable]
> >>>>    259 | u32 gintmsk2;
> >>>>    | ^~~~~~~~
> >>>>
> >>>> Cc: Minas Harutyunyan <hminas@synopsys.com>
> >>>> Cc: Ben Dooks <ben@simtec.co.uk>
> >>>> Fixes: 187c5298a1229 ("usb: dwc2: gadget: Add handler for WkupAlert interrupt")
> >>>> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> >>>
> >>> Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> >> 
> >> Should I apply the entire series or only 1/8?
> >> 
> > In this series only 2 patches are related to dwc2, which I'm already Acked:
> >
> > [PATCH v2 1/8] usb: dwc2: gadget: Make use of GINTMSK2
> > [PATCH v2 2/8] usb: dwc2: gadget: Avoid pointless read of EP control 
> > register
> >
> > I can't acked other patches from this series, because they are not 
> > related to dwc2.
> 
> heh, I saw that after sending the email, sorry :-)

Also, all patches are already in -next, courtesy of Greg.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
