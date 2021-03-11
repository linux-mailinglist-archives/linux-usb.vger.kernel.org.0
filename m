Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F354336E2B
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 09:48:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhCKIsn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 03:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbhCKIsf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 03:48:35 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F553C061574
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 00:48:35 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id s7so9866484plg.5
        for <linux-usb@vger.kernel.org>; Thu, 11 Mar 2021 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9ipk2X1DXQbAZMqLuc39QzOVpw53dOdrjEf9bVo9r78=;
        b=ysKzyEa9LkPeHGGfGDHaoKtD/NlsHHOKvYlLFOKUXSvAfQW8DJQ7oRoJ5mHzhiJrPi
         MaZTx31QzpMbeix9zjzzSzaM5OYtnXvtlGJsF0qsG4NtrdhMwy2yHRB6sCfMBb11/WM8
         HfLMotmU7nLxgLKBGFNTsDQ6jB8J8xcbgcMN2jxNck9pQIknJ0ToJFOlDVzO0VOyzkSI
         oUAWEiO5KylOAw538KAF5shZ7yzl3A/nSO9IpLmtQP/RXEvUrlyNmANX+xVJL2QFb2BY
         PlcKSiiKtOBkxK+Q21EmTKdK2EbNr86XYxaOUIxXYboJlnTjh9Q2QPLA+cI9CLtpCteU
         bCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9ipk2X1DXQbAZMqLuc39QzOVpw53dOdrjEf9bVo9r78=;
        b=VRn8jG8a5TF0nlXxBLU8IjDkd3V6xLoh6dkVCiLieb+Ig4lFVRIpFstWEXmmuddd9F
         XS1i2aqv215VBYLHldDyB6Ki3birp2gCi6Y9t84UXcSoo9/Wdmj/PgIyzf1BNmb/ZRjW
         aDER03DAaKp+WjvsHp4WNiftrQoUzgd8r12NyX9wvKrKEhrCTay0cGDn/yEhrNkg83l3
         /d6v2UCPa2EG53Oo8Yz7iyhQ/oHBASZ9RPk7FiYM5P5qTBtx6NhFicPp/5IKLW0xw7Mg
         ru9en4nJZn1JxuUWaOtxpVtAYTsCyXNMzjk+LLbfOvjNhxYCg3pta7EH1rBxHejT9do7
         c+rg==
X-Gm-Message-State: AOAM533KoCLCOSuMZW4q7uzPZ+B9NRED+fhdI6dyIBGtx6xYJ0a7yJJT
        /j8nQx7nkKS86LALtL+Sio0lWg==
X-Google-Smtp-Source: ABdhPJyahd78ops5WrqbAEWWT6uaYEfmCV/g97/NAiieFbMByIyXE+cKLHlvjji6+BamNcpHjYFlMw==
X-Received: by 2002:a17:90a:f28e:: with SMTP id fs14mr7799886pjb.100.1615452514661;
        Thu, 11 Mar 2021 00:48:34 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id na8sm1519663pjb.2.2021.03.11.00.48.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Mar 2021 00:48:34 -0800 (PST)
Date:   Thu, 11 Mar 2021 16:48:29 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: skip interconnect init for ACPI probe
Message-ID: <20210311084828.GV17424@dragon>
References: <20210311060318.25418-1-shawn.guo@linaro.org>
 <94984a60-444f-a2f5-1928-3eeba2342f2e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94984a60-444f-a2f5-1928-3eeba2342f2e@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 11, 2021 at 11:32:01AM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 11.03.2021 9:03, Shawn Guo wrote:
> 
> > The ACPI probe starts failing since commit bea46b981515 ("usb: dwc3:
> > qcom: Add interconnect support in dwc3 driver"), because there is no
> > interconnect support for ACPI, and of_icc_get() call in
> > dwc3_qcom_interconnect_init() will just return -EINVAL.
> > 
> > Fix the problem by skipping interconnect init for ACPI probe, and then
> > the NULL icc_path_ddr will simply just scheild all ICC calls.
> 
>    Scheild?

s/scheild/shield

Shawn
