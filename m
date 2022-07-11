Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8249562700
	for <lists+linux-usb@lfdr.de>; Fri,  1 Jul 2022 01:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232091AbiF3XWq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 19:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233017AbiF3XWg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 19:22:36 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FF5C59265
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:22:32 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id fw3so898007ejc.10
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=67eEBFbEdBxLq+SuT6crAOTXnL4x5bIQdSu9RdaqVYw=;
        b=HcbUlIVBXvIEyWaGW7qlIdsjz16NrMeyn0ijZZf7FhJSXIhPi9JBKsO9g+3fUXZ8pS
         aR6c08MAhTt59Q2T6/PpfCagnfc58JTuogEvpXfkkperYR+OGHg11EjYAr5+wlZI0JgY
         stjsdhDMTGeaFPkLJYo0LCqV/R8+hBxCd7uKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=67eEBFbEdBxLq+SuT6crAOTXnL4x5bIQdSu9RdaqVYw=;
        b=5TR6fnu2Z7POdGbuxH+ep/FgdJP2c70olrLCQI7lNYSH+07U4wUFv7IajcLtal61P3
         09RcvSEt/0OI0MrgQV6sMvMuM5e7tEwdAef/ITqEIl/5ePTLuXaHPw7VWC+R/cT8HrzW
         d1+uYHXh+tcgZL0PQy/Xb4i4JO5AcW97NFoCK9A1Itgle1SBdrSn6nlvv/jBUSHXpS/t
         GnbsMnsM9dA74Cw4vNDCIxe+zXinDUXNv3jYhoLwsk2pNqy/38sLae7OCW0vhtWmIAKU
         r+ENSrNacOwCw2w8+/DAciJWiZNv+9qK4p+GRF4fupMZNghGR20n0TrSjiK0fm+gLMZE
         k0AA==
X-Gm-Message-State: AJIora/6QuywIl6IK6G0e2zIoysgNWmPq2ZOaLTAgBf0LOku1uchntWY
        H4y5+srm2G2ofcB78b6kg7WDKSkJzWP4SGxzEBc=
X-Google-Smtp-Source: AGRyM1trnMQBDd45/X2xh0TRJgHhPe8GhbnwgSH1wuJdtDnD8x9Hpnf2uGx7QfpFB82YWEr5o/jAQw==
X-Received: by 2002:a17:907:3f14:b0:726:9f27:ad36 with SMTP id hq20-20020a1709073f1400b007269f27ad36mr11665571ejc.659.1656631350585;
        Thu, 30 Jun 2022 16:22:30 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906671200b00718e4e64b7bsm9660222ejp.79.2022.06.30.16.22.30
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 16:22:30 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so506654wmb.5
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 16:22:30 -0700 (PDT)
X-Received: by 2002:a7b:c14c:0:b0:3a0:4a8b:e2e5 with SMTP id
 z12-20020a7bc14c000000b003a04a8be2e5mr14212798wmi.188.1656630949206; Thu, 30
 Jun 2022 16:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220630193530.2608178-1-mka@chromium.org> <20220630123445.v24.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
In-Reply-To: <20220630123445.v24.3.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 30 Jun 2022 16:15:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_dqs7Yan2YWqbud10SuTgV2twpGZ9QC9k7pLnBde7Ew@mail.gmail.com>
Message-ID: <CAD=FV=U_dqs7Yan2YWqbud10SuTgV2twpGZ9QC9k7pLnBde7Ew@mail.gmail.com>
Subject: Re: [PATCH v24 3/4] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jun 30, 2022 at 12:35 PM Matthias Kaehlcke <mka@chromium.org> wrote=
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
> Co-developed-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> Signed-off-by: Ravi Chandra Sadineni <ravisadineni@chromium.org>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v24:
> - changed USB_ONBOARD_HUB from bool to tristate and fixed Makefile
>   entry
> - renamed 'companion-hub' property to 'peer-hub'
> - added comment to onboard_hub_create_pdevs() doc that explains the
>   somewhat convoluted logic of the function
> - only cancel the driver attach work in onboard_hub_remove() if the
>   function wasn't called by the work itself
>
> Changes in v23:
> - refactored onboard_hub_create_pdevs()
>   - bail out before the loop for root hubs connected to
>     the secondary HCD
>   - check for exisiting pdev in the companion hub branch
>     instead of doing it afterwards
> - added note about the role of the platform devices to
>   documentation of onboard_hub_create_pdevs()
> - got rid of CONFIG_USB_ONBOARD_HUB_ACTUAL, it's not needed anymore
>   now that onboard_hub_create/destroy_pdevs() are linked into the USB
>   core
> - added some more details to comment about the need to re-attach the
>   USB driver
>
> Changes in v22:
> - moved onboard_hub_create_pdevs(), onboard_hub_destroy_pdevs() and
>   of_is_onboard_usb_hub() into a separate file to allow them to be
>   linked into the USB core module (if CONFIG_USB=3Dm)
> - Added extra checks to ensure only one platform device is created
>   for each physical hub. This is necessary because
>   onboard_hub_create_pdevs() is now called from hub_probe() instead
>   of usb_add_hcd(). As a result the function is called twice for
>   typical USB3 hub, once for the USB3 part of the hub, and once for
>   USB <=3D 2.x. Generally the parent hub downstream of the primary HCD
>   creates the onboard hub platform device.
> - use kzalloc() instead of devm_kzalloc() to allocate list entries. Using
>   managed memory can cause issues since the managed memory is allocated
>   before the device is probed.
> - use a workqueue to (re-)attach the USB driver during/after _probe().
>   This is necessary to avoid self-deadlocks on systems with nested
>   onboard hubs.
> - don't initialize list_head in onboard_hub_create_pdevs(), this needs
>   to be done by the owner, to ensure that onboard_hub_destroy_pdevs()
>   is called with a struct that was properly initialized even when
>   onboard_hub_create_pdevs() is not called.
> - moved 'onboard_hub_match' into an include, so it can be used
>   by both the the onboard hub driver and of_is_onboard_usb_hub()
> - removed note from the commit message which said that currently only
>   onboard hubs connected to a root hub are supported. This isn't the
>   case anymore.
> - updated kernel version and date in sysfs documentation
> - removed tags from Doug and Alan since this version changes quite
>   a few things
>
> Changes in v21:
> - refactored _find_onboard_hub()
>   - check presence of drvdata instead of using device_is_bound()
>   - return -ENODEV if the platform device can't be found
>   - always check drvdata, not only when looking for the companion
>     hub
>   - added comment explaining probe deferral
> - removed 'onboard_hub_dev' symlinks from USB devices
> - updated documentation of 'always_powered_in_suspend' sysfs attribute
>
> Changes in v20:
> - s/nontrivial/non-trivial/ in Kconfig doc
> - added include of 'export.h'
> - initialize variable 'power_off' in onboard_hub_suspend() at
>   declaration time
> - renamed set_udev_link_name() to get_udev_link_name()
> - use kzalloc to allocate struct usbdev_node instead of devm_kzalloc()
> - release the lock in onboard_hub_add_usbdev() before calling
>   get_udev_link_name()
> - free struct usbdev_node in onboard_hub_remove_usbdev(), now that
>   it doesn't used managed memory
> - make struct onboard_hub const in always_powered_in_suspend_show()
> - call put_device() if pdev is not bound in _find_onboard_hub()
> - get driver data before calling put_device() in _find_onboard_hub()
> - log platform device name when sysfs link creation fails in
>   onboard_hub_usbdev_probe()
> - added kernel doc for onboard_hub_create_pdevs() and
>   onboard_hub_destroy_pdevs()
> - added 'Reviewed-by' tag from Doug
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
>  drivers/usb/core/Makefile                     |   4 +
>  drivers/usb/misc/Kconfig                      |  16 +
>  drivers/usb/misc/Makefile                     |   1 +
>  drivers/usb/misc/onboard_usb_hub.c            | 428 ++++++++++++++++++
>  drivers/usb/misc/onboard_usb_hub.h            |  17 +
>  drivers/usb/misc/onboard_usb_hub_pdevs.c      | 142 ++++++
>  include/linux/usb/onboard_hub.h               |  18 +
>  9 files changed, 641 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-platform-onboard-=
usb-hub
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.c
>  create mode 100644 drivers/usb/misc/onboard_usb_hub.h
>  create mode 100644 drivers/usb/misc/onboard_usb_hub_pdevs.c
>  create mode 100644 include/linux/usb/onboard_hub.h

Reviewed-by: Douglas Anderson <dianders@chromium.org>
