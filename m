Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763BB4F8847
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 22:11:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiDGTvi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 15:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiDGTvh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 15:51:37 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50280391D23
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 12:46:35 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id q26so7621032edc.7
        for <linux-usb@vger.kernel.org>; Thu, 07 Apr 2022 12:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oG7QGG0qLuu7UAzIG1Bg4Q3x6YRNa51g4KnJdDoxZnk=;
        b=ZK2dkVcSaT3PUCivKCgAbyo17Td3p3xP6iMAtYZu8QH3+HTFSSkggQ7Qw19X3u+0An
         49mFmGnSm+tcMKYGE0PM/1XkBST5fOW7HmmcINLHR9tJByV+in5HMJkHY1JpqyTZnxrm
         ZUYDQwA+BJMbs4fXm2hHTg8TchvHoNfY/vKaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oG7QGG0qLuu7UAzIG1Bg4Q3x6YRNa51g4KnJdDoxZnk=;
        b=vzZs9G1ohRlHsoLO/iISnXV9UTnbaZq9mZv32jOC4JLj1Jwygmll1ectnr6IcwgWkO
         2SAFAU2uFHtPBtFvPCdXNF1a3tdWH1JRwmgg+2rGue6Iqr1P2XutO5ik1f8M4P0/YQWn
         ebmHmtsjty745znb6KSqRuXgypi0RbgxJJtrK/P3bd2g8R/l9exUpp0oeZH8ufbyvmUj
         1XVhfsIU3lDmEc8VV4wO6ZUhzva7sChBPCNtnTPMmXnOP6sJEP8KoONUxp1FlOAgReh1
         UI98mjFrLl+KkIcb+pCDjCrLQ5TXyjirDcpQPt6fF5p1oM+JiKeY9RxdmQ+8N+/fQxmC
         RMwg==
X-Gm-Message-State: AOAM532Ktw3XWqRVGuoRSatNNA99MrantxbtSNUKdLpKksiMdtdsfe6J
        Y3bt8Ap0kucpvfrkBvHFzud6Ol21O1UHdrTW
X-Google-Smtp-Source: ABdhPJw9zd74a6QW5CniiIskauPtL/5MOapIt2AD3FB+DrCp7np/sN2/FwbVeNDZpgKcKg7IdGLPFw==
X-Received: by 2002:a05:6402:d7:b0:413:673:ba2f with SMTP id i23-20020a05640200d700b004130673ba2fmr16024070edu.29.1649360498066;
        Thu, 07 Apr 2022 12:41:38 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id g9-20020a056402424900b0041d10255257sm745566edb.46.2022.04.07.12.41.35
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 12:41:36 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id h4so9319768wrc.13
        for <linux-usb@vger.kernel.org>; Thu, 07 Apr 2022 12:41:35 -0700 (PDT)
X-Received: by 2002:adf:e591:0:b0:206:1202:214 with SMTP id
 l17-20020adfe591000000b0020612020214mr12102514wrm.342.1649360495080; Thu, 07
 Apr 2022 12:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220217184254.4141705-1-mka@chromium.org>
In-Reply-To: <20220217184254.4141705-1-mka@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Apr 2022 12:41:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XswQj+L6rRuWH-PdoGp9vVsWKTwz1bFM_fagy55tKqEg@mail.gmail.com>
Message-ID: <CAD=FV=XswQj+L6rRuWH-PdoGp9vVsWKTwz1bFM_fagy55tKqEg@mail.gmail.com>
Subject: Re: [PATCH v21 0/3] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Michal Simek <michal.simek@xilinx.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Li Jun <jun.li@nxp.com>, Peter Chen <peter.chen@nxp.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Feb 17, 2022 at 10:43 AM Matthias Kaehlcke <mka@chromium.org> wrote=
:
>
> This series adds:
> - the onboard_usb_hub_driver
> - glue in the generic HCD code to create and destroy the
>   onboard_usb_hub platform devices if needed
> - device tree changes that add RTS5411 entries for the QCA SC7180
>   based boards trogdor and lazor
> - a couple of stubs for platform device functions to avoid
>   unresolved symbols with certain kernel configs
>
> The main issue the driver addresses is that a USB hub needs to be
> powered before it can be discovered. For discrete onboard hubs (an
> example for such a hub is the Realtek RTS5411) this is often solved
> by supplying the hub with an 'always-on' regulator, which is kind
> of a hack. Some onboard hubs may require further initialization
> steps, like changing the state of a GPIO or enabling a clock, which
> requires even more hacks. This driver creates a platform device
> representing the hub which performs the necessary initialization.
> Currently it only supports switching on a single regulator, support
> for multiple regulators or other actions can be added as needed.
> Different initialization sequences can be supported based on the
> compatible string.
>
> Besides performing the initialization the driver can be configured
> to power the hub off during system suspend. This can help to extend
> battery life on battery powered devices which have no requirements
> to keep the hub powered during suspend. The driver can also be
> configured to leave the hub powered when a wakeup capable USB device
> is connected when suspending, and power it off otherwise.
>
> Changes in v21:
> - dropped patch 'driver core: Export device_is_bound()'
> - refactored _find_onboard_hub()
> - removed 'onboard_hub_dev' symlinks from USB devices
> - dropped patch 'arm64: dts: qcom: sc7180-trogdor: Add nodes for onboard =
USB hub'
>   (will be sent separately)
> - rebased series on v5.17-rc4
>
> Changes in v20:
> - addressed review comments from Stephen
> - changed DT node names for hubs
>
> Changes in v19:
> - added VID:PID pairs and compatible strings for RTS5414 hub
> - updated comments with RTS5411 USB versions to reflect those
>   reported/supported by the hub
> - rebased series on v5.16
>
> Changes in v18:
> - introduced hidden Kconfig option to align module vs. builtin
>   choice with CONFIG_USB (thanks Doug!)
> - added patch 'driver core: Export device_is_bound()'
> - also adjust device tree of pompom rev1
> - dropped the following patches, which aren't needed anymore by this
>   series (though they might still be useful on their own):
>   - usb: Specify dependencies on USB_XHCI_PLATFORM with 'depends on'
>   - arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM
>   - ARM: configs: Explicitly enable USB_XHCI_PLATFORM where needed
>
> Changes in v17:
> - rebased on top of v5.16-rc1
> - moved creation of onboard_hub platform devices from xhci_platform
>   to the generic HCD code
> - addressed review comments for the onboard_hub driver
> - moved Kconfig/defconfig changes to the end of the series. The
>   onboard_hub driver doesn't depend on XHCI_PLATFORM anymore,
>   hence these changes aren't really required for the driver, but
>   they still seem to be a worthwhile improvement
>
> Changes in v16:
> - added patch 'ARM: configs: Explicitly enable USB_XHCI_PLATFORM
>   where needed' to keep arm32 defconfigs effectively unchanged
>
> Changes in v15:
> - adjusted dependencies of USB_DWC3_CORE to make sure it can only
>   be enabled when at least one of USB_DWC3_HOST, USB_DWC3_GADGET
>   or USB_DWC3_DUAL_ROLE is selectable
>
> Changes in v14:
> - rebased on top of v5.14-rc1
> - dropped DT binding patch which landed in v5.13
>
> Changes in v13:
> - added patch "usb: Specify dependency on USB_XHCI_PLATFORM with
>   'depends on'" to the series to avoid Kconfig conflicts
> - added patch "arm64: defconfig: Explicitly enable USB_XHCI_PLATFORM"
>   to the series to keep effective defconfig unchanged
>
> Changes in v12:
> - onboard_hub driver: use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE)
>   in onboard_hub.h to also check for the driver built as module
> - onboard_hub_driver: include onboard_hub.h again to make sure there
>   are prototype declarations for the public functions
>
> Changes in v11:
> - support multiple onboard hubs connected to the same parent
> - don't include =E2=80=98onboard_hub.h=E2=80=99 from the onboard hub driv=
er
>
> Changes in v10:
> - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=3Dy/m
> - keep 'regulator-boot-on' property for pp3300_hub
>
> Changes in v9:
> - added dependency on ONBOARD_USB_HUB (or !ONBOARD_USB_HUB) to
>   USB_PLATFORM_XHCI
>
> Changes in v7:
> - updated DT binding
> - series rebased on qcom/arm64-for-5.13
>
> Changes in v6:
> - updated summary
>
> Changes in v5:
> - cover letter added
>
> Matthias Kaehlcke (3):
>   of/platform: Add stubs for of_platform_device_create/destroy()
>   usb: misc: Add onboard_usb_hub driver
>   usb: core: hcd: Create platform devices for onboard hubs in probe()
>
>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>  MAINTAINERS                                   |   7 +
>  drivers/usb/core/hcd.c                        |   6 +
>  drivers/usb/misc/Kconfig                      |  23 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 510 ++++++++++++++++++
>  include/linux/of_platform.h                   |  22 +-
>  include/linux/usb/hcd.h                       |   1 +
>  include/linux/usb/onboard_hub.h               |  18 +
>  9 files changed, 592 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-=
usb-hub
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h

With v5.18-rc1 out the door, I wonder if it's a good time to look at
this series again. Are there any hidden blockers that it's waiting
for?

-Doug
