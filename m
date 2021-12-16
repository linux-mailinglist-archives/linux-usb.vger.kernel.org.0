Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1B3478100
	for <lists+linux-usb@lfdr.de>; Fri, 17 Dec 2021 00:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbhLPX4m (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 18:56:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229539AbhLPX4l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 18:56:41 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9C5CC061401
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 15:56:41 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id fv9-20020a17090b0e8900b001a6a5ab1392so951877pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 15:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qfdGylNHpttDgBez5cht2DYfHPgx7qkn9YTiTcn4MeA=;
        b=abXnDM0+Uarpvz+2qnOD4yB3sfoc2cik1tzmBSbkJYrdEHdoEhqpAXLoAS+9HMLcGa
         3nwOlFn69pJOP1F7l5xWzHlQaN/tYci4mLiaKu45q3SFyT2SQvvYul2hVmYYjQBWojsQ
         768KcnF9jVpNTVw1YzyW0uEs6aJ+TgnGqZGRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qfdGylNHpttDgBez5cht2DYfHPgx7qkn9YTiTcn4MeA=;
        b=QKoV2le6JC0dp+fHdtZNZsLK+xuXXrT5q6Ga4V15q4ZhpVaKb/LfBIkCUlWoDngKRN
         p++tLbhei4baXzK/n+yuh5+FUNcZC4vb3OQMn86LxEoIasD1tPGptHQCyq1bNjF9Go6i
         +05BTtMUMHvYIb1hvQscit1RLU4RyKvm7pCLAXF0K/mba3drkqJwGsqKspxbbC+Tt5NE
         BrtdEAQbgovnrgJxXCK82l+YalWcOsVpahQlrdtk76IUN8A3yRL4/kShC9LuiXXhEYDX
         1Z7y8KOpUOoZIoF4KHgn0jDFL3//D+UD17joxvb6tI43GcaFyzuwzrHP4RauQZL1UGMS
         +sDQ==
X-Gm-Message-State: AOAM530sMTvKDSQmMc0r4Q+i4APFS6QXXsaJYUBgcKfpHAOvzQ9WYE4q
        Sbdi7zZ7NHDw3IqJLqRSMhmCmkDGgGfcow==
X-Google-Smtp-Source: ABdhPJycBoVkGQxMMxjDLxo2CE2YaaUcyispOtyAWCRkHr/tOr5hKfzUcxNzZmkHqoL/YQrFdchIhg==
X-Received: by 2002:a17:90a:c986:: with SMTP id w6mr8898697pjt.27.1639699001289;
        Thu, 16 Dec 2021 15:56:41 -0800 (PST)
Received: from localhost ([2620:15c:202:201:81:c257:d961:22b7])
        by smtp.gmail.com with UTF8SMTPSA id t67sm7212453pfd.24.2021.12.16.15.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Dec 2021 15:56:40 -0800 (PST)
Date:   Thu, 16 Dec 2021 15:56:38 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v17 7/7] usb: Specify dependencies on USB_XHCI_PLATFORM
 with 'depends on'
Message-ID: <YbvSNta4jCxizaTa@google.com>
References: <20211116200739.924401-1-mka@chromium.org>
 <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211116120642.v17.7.If248f05613bbb06a44eb0b0909be5d97218f417b@changeid>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Nov 16, 2021 at 12:07:39PM -0800, Matthias Kaehlcke wrote:
> Some USB controller drivers that depend on the xhci-plat driver
> specify this dependency using 'select' in Kconfig. This is not
> recommended for symbols that have other dependencies as it may
> lead to invalid configurations. Use 'depends on' to specify the
> dependency instead of 'select'.
> 
> For dwc3 specify the dependency on USB_XHCI_PLATFORM in
> USB_DWC3_HOST and USB_DWC3_DUAL_ROLE. Also adjust the
> dependencies of USB_DWC3_CORE to make sure that at least one
> of USB_DWC3_HOST, USB_DWC3_GADGET or USB_DWC3_DUAL_ROLE can be
> selected.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Note: This patch has been removed from the onboard_usb_hub series,
together with "ARM: configs: Explicitly enable USB_XHCI_PLATFORM
where needed" and "arm64: defconfig: Explicitly enable
USB_XHCI_PLATFORM". These patches aren't any longer needed for the
series. If maintainers think they are useful independently from
the series please pick them or let me know what needs to be
changed to get them landed.
