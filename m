Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592F148CFE7
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 02:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiAMBCf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 20:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbiAMBCe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 20:02:34 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5EBC06173F
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:34 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id v1so6209066ioj.10
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HI62eVu2jYNCy+N5CPGLJpJE1N50CuUHESMKIxdZAJk=;
        b=Kx3Q5GFrQmjcJsB1f70BwqOoheU84saqlMdlT7WxH3uNndiCgAPHNsSAVnBUoWiQqB
         c3YJtQ1rKlSzRzf72CLlw60jgNLILjb2DgHVeFYJUInb2rbIdYDJJTk72h/ZdcrEudAo
         INykB1bseH5ib128BoEUYnlor/MLcBcMS/JxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HI62eVu2jYNCy+N5CPGLJpJE1N50CuUHESMKIxdZAJk=;
        b=PmNFiOk/bFxWVsYZGpRgAs+BERMps1X/KyuEKOckf70+YlHXfdVIdeiRrsMuEObNZY
         kBjRc2iLl8q5jMwYupI6KKzWa0gEjpYD2bgVKfGkfMxGKRLGc8+TisNSOb38539eVvhO
         xlk2VlXpIeqon39yKuF+oLKwGbEjD5frLxTu0X6LWZbPg37RWhH4OP0iRUxJCU4t4lDu
         K3qTIX/V5H/ipAASJLAy9UJp4F3WUB8EHffkSGiBpbrTO4f5su2BIuEFNt0iZ72jIwFc
         OrtND62caFnmnL0mmg36zqRsWMjHVATvq62cr7ZhWCiwsmkJrcSkGEPWLUyvKykkhO24
         y5VQ==
X-Gm-Message-State: AOAM530YBmqKvUg/Nb/Lt79OA2UDE5v6C6jyb/SI+tITKIHQLCxtgeEQ
        DZqFYDheXoc4LlfF5x1KjUZ0Ejn3QHO0Fw==
X-Google-Smtp-Source: ABdhPJwbJ4HQnqtIErCVwL/HBxTsVLtPSmUKTBF44YOKen1AWJGJ7e0rD9DSB4XHWASenmDZOFavOA==
X-Received: by 2002:a05:6602:2c47:: with SMTP id x7mr1088081iov.94.1642035753396;
        Wed, 12 Jan 2022 17:02:33 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id y8sm1038285ilu.72.2022.01.12.17.02.32
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 17:02:32 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id f24so325817ioc.0
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:32 -0800 (PST)
X-Received: by 2002:a05:6638:514:: with SMTP id i20mr993481jar.207.1642035752285;
 Wed, 12 Jan 2022 17:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20220112111028.v19.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Jan 2022 17:02:20 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XqCrKiLQsA5pdLRu9dGyE6vxUiB375PqjeS_n8E6_7Ag@mail.gmail.com>
Message-ID: <CAD=FV=XqCrKiLQsA5pdLRu9dGyE6vxUiB375PqjeS_n8E6_7Ag@mail.gmail.com>
Subject: Re: [PATCH v19 3/5] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jan 12, 2022 at 11:11 AM Matthias Kaehlcke <mka@chromium.org> wrote=
:
>
> The main issue this driver addresses is that a USB hub needs to be
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
> Technically the driver consists of two drivers, the platform driver
> described above and a very thin USB driver that subclasses the
> generic driver. The purpose of this driver is to provide the platform
> driver with the USB devices corresponding to the hub(s) (a hub
> controller may provide multiple 'logical' hubs, e.g. one to support
> USB 2.0 and another for USB 3.x).
>
> Note: the current series only supports hubs connected directly to
> a root hub, support for other configurations could be added if
> needed.
>
> Co-developed-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Acked-by: Alan Stern <stern@rowland.harvard.edu>
> ---
>
> Changes in v19:
> - added VID:PID pairs and compatible strings for RTS5414 hub
> - updated comments with RTS5411 USB versions to reflect those
>   reported/supported by the hub
>
> Changes in v18:
> - introduced hidden Kconfig option to align module vs. builtin
>   choice with CONFIG_USB (thanks Doug!)
> - refactored onboard_hub_create_pdevs()
>
> Changes in v17:
> - updated date and kernel version in ABI documentation for
>   'always_powered_in_suspend' attribute
> - removed obsolete .yaml entry from MAINTAINERS file
> - added entry for ABI documentation to MAINTAINERS file
> - renamed struct 'udev_node' to 'usbdev_node'
> - changed return logic in onboard_hub_suspend/resume() to
>   get rid of 'rc' variable
> - added helper set_udev_link_name() to set link names for
>   onboard hub USB devices
> - use of_parse_phandle() instead of of_property_read_u32() +
>   of_find_node_by_phandle() combo
> - defer probing in _find_onboard_hub() if the platform device
>   isn't bound yet
> - initialize list head passed as parameter to
>   onboard_hub_create_pdevs() instead of relying on the caller
>   to do so
> - don't require the 'companion-hub' property to be specified.
>   This is needed to support hubs without companion hub
> - use devm_kzalloc() to allocate platform device list entries
>   and stop freeing them explicitly
> - remove unnecessary INIT_LIST_HEAD() of platform device list
>   entries
> - use '%pOF' to print DT node name
> - delete platform device list entries from the list of devices
>   in onboard_hub_destroy_pdevs(). It shouldn't be strictly
>   necessary, but better be on the safe side.
>
> Changes in v16:
> - none
>
> Changes in v15:
> - none
>
> Changes in v14:
> - none
>
> Changes in v13:
> - none
>
> Changes in v12:
> - use IS_ENABLED(CONFIG_USB_ONBOARD_HUB_MODULE) in onboard_hub.h to
>   also check for the driver built as module
> - include onboard_hub.h again from the driver to make sure there are
>   prototype declarations for the public functions
> - remove indentation from label in onboard_hub_create_pdevs()
>
> Changes in v11:
> - added onboard_hub_create/destroy_pdevs() helpers, to support multiple o=
nboard
>   hubs connected to the same parent hub
> - don't include =E2=80=98onboard_hub.h=E2=80=99 from the onboard hub driv=
er
> - updated commit message
> - added =E2=80=98Acked-by' from Alan
>
> Changes in v10:
> - always use of_is_onboard_usb_hub() stub unless ONBOARD_USB_HUB=3Dy/m
>
> Changes in v9:
> - none
>
> Changes in v8:
> - none
>
> Changes in v7:
> - don't declare stub for of_is_onboard_usb_hub() when
>   CONFIG_COMPILE_TEST is defined
>
> Changes in v6:
> - use 'companion-hub' to locate the platform device, instead of
>   scanning through the nodes of the parent
> - added ABI documentation for 'always_powered_in_suspend'
> - sysfs_emit() instead of sprintf() in always_powered_in_suspend_show()
> - register sysfs attribute through driver.dev_groups
> - evaluate return value of driver_attach() in _probe()
> - use dev_warn() instead of WARN_ON() in _probe()
> - include 'onboard_hub.h'
>
> Changes in v5:
> - the platform device is now instantiated from the same DT node
>   as the 'primary' USB hub device
>   - use the USB compatible strings for the platform device
>   - refactored _find_onboard_hub() to search the parents child
>     nodes for a platform device with a matching compatible string
>   - added exported function of_is_onboard_usb_hub() to allow other
>     drivers (like xhci_plat) to check if one of their child DT nodes
>     is a supported hub
> - use late suspend to make sure info about wakeup enabled descendants
>   is updated
> - call driver_attach() for the USB driver in onboard_hub_probe() to
>   make sure the driver is re-attached after the device_release_driver()
>   calls in onboard_hub_remove()
> - renamed sysfs attribute 'power_off_in_suspend' to
>   'always_powered_in_suspend'
> - added sysfs symlinks between platform device and USB devices
> - marked 'onboard_hub_pm_ops' as __maybe_unused
> - removed 'realtek' compatible string which is not needed at this
>   point
> - fix log for regulator_disable() failure
>
> Changes in v4:
> - updated Kconfig documentation
> - changed the loop in onboard_hub_remove() to release the hub lock
>   before unbinding the USB device and make self deadlock prevention
>   less clunky
> - fixed return value in onboard_hub_usbdev_probe()
> - added entry to MAINTAINERS file
>
> Changes in v3:
> - updated the commit message
> - updated description in Kconfig
> - remove include of 'core/usb.h'
> - use 'is_powered_on' flag instead of 'has_wakeup_capable_descendants'
> - added 'going_away' flag to struct onboard_hub
>   - don't allow adding new USB devices when the platform device is going =
away
>   - don't bother with deleting the list item in onboard_hub_remove_usbdev=
()
>     when the platform device is going away
> - don't assume in onboard_hub_suspend() that all USB hub devices are
>   connected to the same controller
> - removed unnecessary devm_kfree() from onboard_hub_remove_usbdev()
> - fixed error handling in onboard_hub_remove_usbdev()
> - use kstrtobool() instead of strtobool() in power_off_in_suspend_store()
> - unbind USB devices in onboard_hub_remove() to avoid dangling references
>   to the platform device
> - moved put_device() for platform device to _find_onboard_hub()
> - changed return value of onboard_hub_remove_usbdev() to void
> - evaluate return value of onboard_hub_add_usbdev()
> - register 'power_off_in_suspend' as managed device attribute
> - use USB_DEVICE macro instead manual initialization
> - add unwinding to onboard_hub_init()
> - updated MODULE_DESCRIPTION
> - use module_init() instead of device_initcall()
>
> Changes in v2:
> - check wakeup enabled state of the USB controller instead of
>   using 'wakeup-source' property
> - use sysfs attribute instead of DT property to determine if
>   the hub should be powered off at all during system suspend
> - added missing brace in onboard_hub_suspend()
> - updated commit message
> - use pm_ptr for pm_ops as suggested by Alan
>
> Changes in v1:
> - renamed the driver to 'onboard_usb_hub'
> - single file for platform and USB driver
> - USB hub devices register with the platform device
>   - the DT includes a phandle of the platform device
> - the platform device now controls when power is turned off
> - the USB driver became a very thin subclass of the generic USB
>   driver
> - enabled autosuspend support
>
>  .../sysfs-bus-platform-onboard-usb-hub        |   8 +
>  MAINTAINERS                                   |   7 +
>  drivers/usb/misc/Kconfig                      |  23 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 494 ++++++++++++++++++
>  include/linux/usb/onboard_hub.h               |  18 +
>  6 files changed, 551 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-=
usb-hub
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 include/linux/usb/onboard_hub.h

Sorry for not reviewing v18, but this looks peachy to me now.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
