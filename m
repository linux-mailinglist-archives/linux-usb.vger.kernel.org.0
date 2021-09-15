Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD4040C6C2
	for <lists+linux-usb@lfdr.de>; Wed, 15 Sep 2021 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237544AbhIONy7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Sep 2021 09:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbhIONy6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Sep 2021 09:54:58 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 938B3C061764
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 06:53:39 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id i3-20020a056830210300b0051af5666070so3652399otc.4
        for <linux-usb@vger.kernel.org>; Wed, 15 Sep 2021 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HwjbH00wRESHYMYUExbSRvopc6T9zQ3iIx4fTcZjMp4=;
        b=reAu9Z61V/HwvYNdt004ZeKTqf5+0/ApKJP+5N/r+/qGsbgnz2HOHAxW7NfSuMVGAP
         0V+Bqen8LTnhDWfiniXhb1tb+S74os8nk1rAasMp7vbHCpz0wc6K05ikbczIRil8F67V
         vN5DRVpzQfC48DeRlh8PCjrBfUdiEo7bA6FHMcEJZhR0zWHSX6OGKysMuR/FPo7OFnLQ
         wCtPvlILNfQq09RFRv7LAL2HMKuNeFRO3Rkr1b+xMTLJyMeKhOSBGm3ZfxlMujhDPo39
         NvEWmc+wWBwfiqu90b1sv6ekp4i0v1JeBui+lM7dklia5reDBJlSc2TXoH2Pg+hWfLBa
         uhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HwjbH00wRESHYMYUExbSRvopc6T9zQ3iIx4fTcZjMp4=;
        b=ZTCO7P50dWzEu7IZxuVr7szEIQAwEo3BKWcoffWkRHFP6ufQcXEcfBS+lp3uVBVU4Y
         +IIuB+zLhrZMZFqwmeCUJFZn/PLIN4/cDPd59uP2bi+gf4ibYGFXMrJUDvbQANhuTbYl
         WjXUKYyBaMea3Z39SAw9nyc44uHSf5UwIerc3YUOQ7xQCwsl6XhgnTIlCHFHoo/Cym9y
         0aIk7WrZ/5K46YXmIhnojA/Qpku++3MxyM/scP0BBcRLk0u2JU/+wkbKcSb2zcwlDUmN
         uVb9+2XW5spBGWQAcY8RnX7FzXW85bBJN2jAyKEewXgn0P+1yJ95Ogt1WNn7V8wn5bH2
         F/mA==
X-Gm-Message-State: AOAM532fBqK4QtykDQJ05XfmfQS75UffKbvEFmh7AUDZ+TuB9R5PmJsx
        KjLKNv+tCEkSSxgUKMoEfyiwyA==
X-Google-Smtp-Source: ABdhPJxKxZ47iQlZbZE9UmINHqLSepFFmYLSojE3Zu5UPEhdQwynq+j3ajZxZMIhv1xqe4Jchn+sfg==
X-Received: by 2002:a9d:4694:: with SMTP id z20mr19640996ote.379.1631714018845;
        Wed, 15 Sep 2021 06:53:38 -0700 (PDT)
Received: from yoga (rrcs-97-77-166-58.sw.biz.rr.com. [97.77.166.58])
        by smtp.gmail.com with ESMTPSA id q36sm17361oiw.35.2021.09.15.06.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:53:38 -0700 (PDT)
Date:   Wed, 15 Sep 2021 08:53:35 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org,
        wcheng@codeaurora.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YUH639jO4qf4Za/K@yoga>
References: <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
 <ce5f12dd-ddc1-6a9c-3dfb-aa44ea166828@linaro.org>
 <YSZned9v1+ajzVx0@ripper>
 <90d17c95-1cf3-89aa-94ad-920e4781f866@linaro.org>
 <YSaizDpqNRZcBGIc@ripper>
 <87ilzsafu5.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ilzsafu5.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu 26 Aug 01:15 CDT 2021, Felipe Balbi wrote:

> 
> Hi,
> 
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> > On Wed 25 Aug 10:59 PDT 2021, Bryan O'Donoghue wrote:
> >
> >> On 25/08/2021 16:53, Bjorn Andersson wrote:
> >> > But in the case of Type-C altmode several of our boards have either an
> >> > external gpio-based SBU-pin-swapper or some redriver on I2C with this
> >> > functionality, so we need a way to tell both the PHY and this external
> >> > contraption about the orientation.
> >> 
> >> Its a very similar problem to orientation switch
> >> 
> >> As an example
> >> 
> >> - redriver may need to fix up signal integrity for
> >>   lane switching
> >> 
> >> - PHY needs to toggle lanes from one IP block to another
> >> 
> >
> > Right, conceptually the problem is similar, but IMHO there's a big
> > difference in that the redriver and PHY are two physically separate
> > entities - on different buses. The dwc3 glue and core represent the same
> > piece of hardware.
> 
> no they don't. The glue is a real piece of HW that adapts the "generic"
> synopsys IP to a given SoC. OMAP, for example, was adapting Synopsys'
> proprietary interface to the Sonics interconnect, while some others may
> adapt it to AXI or PCI or whatever.
> 
> They are different HW blocks, the glue (in many cases) has its own IRQ,
> its own address space, its own register file, and so on. Granted, the
> glue also serves as an access port from CPU to the synopsys core, but
> that's handled by `ranges' DT property.
> 

So what you're saying is that the "Qualcomm glue" is the hardware, and
the core is just the basis for that design?

Regardless, on the Qualcomm platforms we have need to inform both
devices about role changes, how do we do this? (Without platform_data
and preferably without having to duplicate the typec code in the glue
and core and the two device nodes in DT)

Regards,
Bjorn
