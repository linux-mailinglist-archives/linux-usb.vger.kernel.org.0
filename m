Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDB8322F8D4
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 21:18:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgG0TS3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 15:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728643AbgG0TS2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jul 2020 15:18:28 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC45DC0619D5
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t6so10444843pgq.1
        for <linux-usb@vger.kernel.org>; Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2xySvV1IjY/ykAIVcs+vE5LOnvW22SWhPjf5yGr8ub4=;
        b=naMvyOJdT0LmNEVjAZJNPFto3+cHVILBVTkAr9eDy2kEWatCjbsevbDKbZEUwUxrN1
         03PXmw7vaaifaTs5uxCJxs/K0Mn5g3/tJ2r2VLcCYE6VH4I/9dtNCbtcdADpwbwuUFmA
         TeD/KFkaSOzBnAybvvjtjX5wmagf37ExNGMpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2xySvV1IjY/ykAIVcs+vE5LOnvW22SWhPjf5yGr8ub4=;
        b=q4+kR1WaUOdwDWy4SjETclCBawolmkQqD1rMdoHQbloiDgiw2vsIlFwhtSQlp8a1mo
         R17blr+sGp811tlx9rg2pefx3H08iOY3TkCwtR1UmpOL86cSK3XK2C21ZbzXVP1HtMMB
         64RD3XoVugGQqCiiNlhxY8IaYnN9W1lDU6p/OIuDFxZ6JBRGmhVZb55Id784rpi1tkKm
         DytChQcpWhtt2LgRKzCLJjdFNIHX3ikVj84Ne0gliqpn3MHzftyq0CGzaElJ0FTxwpg3
         oSmxOfi4FaFEW0L1Qakx+XbrRQL+UMad6P99V0UGCjaoGLegaM62aKIXMC6+tRAiCxcI
         AWWw==
X-Gm-Message-State: AOAM531ofjYObi1fIpAprVSKd9WB3DNO7u7E9y6irOjhxcGWHiEW3dCc
        V6k4Nx690ztIku+6O51jgY4vbQ==
X-Google-Smtp-Source: ABdhPJxHxU54eoeuYUvz0gC8SenG8BHXpKDdQtpJ9uHUXR3Pw/fdpX8ZlqWMdFH8+3KSnha9vSr3vQ==
X-Received: by 2002:a63:df03:: with SMTP id u3mr20314068pgg.84.1595877508338;
        Mon, 27 Jul 2020 12:18:28 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f3sm356807pju.54.2020.07.27.12.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 12:18:27 -0700 (PDT)
Date:   Mon, 27 Jul 2020 12:18:26 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v10 1/2] usb: dwc3: qcom: Add interconnect support in
 dwc3 driver
Message-ID: <20200727191826.GC3191083@google.com>
References: <1595528857-25357-1-git-send-email-sanm@codeaurora.org>
 <1595528857-25357-2-git-send-email-sanm@codeaurora.org>
 <20200727191719.GB3191083@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200727191719.GB3191083@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 12:17:19PM -0700, Matthias Kaehlcke wrote:
> On Thu, Jul 23, 2020 at 11:57:36PM +0530, Sandeep Maheswaram wrote:
> > Add interconnect support in dwc3-qcom driver to vote for bus
> > bandwidth.
> > 
> > This requires for two different paths - from USB to
> > DDR. The other is from APPS to USB.
> > 
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> 
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

Sorry, that was meant for v11
