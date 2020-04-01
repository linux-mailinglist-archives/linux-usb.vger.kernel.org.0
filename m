Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3988E19A64B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 09:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731879AbgDAHee (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 03:34:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:46212 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731849AbgDAHed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 03:34:33 -0400
Received: by mail-lf1-f66.google.com with SMTP id q5so19544844lfb.13
        for <linux-usb@vger.kernel.org>; Wed, 01 Apr 2020 00:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P0UZlrczpXwgSzx0JjhZzmZKN5WAKFbAD3Y+om2KU98=;
        b=RUSGJNiC99M1Y5tGEu2LKpVxwCIbaOrQKP7aN/+ybgr38OmKDDDe5048mZn8OuU7MI
         G6iwSmIsJmNFuJba9TrvQcAP+Gh9UCH+0H+IiQnNMI/Kge0z7qv82tHrMSpOvjE1hCKX
         ikvQjdnEWmJ+BBjWBz5QXm3yS6bdxfY0+OieB9FF4ipYYPR05WBxkAFAAnFrxsU733js
         8aj2TwzpbRugatQYgkWyGqhmLIvzmad4mXFYt/gK8TI12pTWE87uyRjucA4ETBNb0egk
         9J5/EUvRA3UtY0RWy4a9yyJ32r4qwtiIZTdrcUo/wa90uQiPwcc08KCVE0JAQ9WihIWz
         VpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=P0UZlrczpXwgSzx0JjhZzmZKN5WAKFbAD3Y+om2KU98=;
        b=AgXD/4lZAmtkrhSrT+FYuQupDn0hmulyqvQ6iH4p5PeMC6fGcGSlQHq3b1E3aDFXQl
         4sag2d7xObng8ov7pOgmRDuIB9bBgt7qF2BKXDqlIwpmX28BTqeRo6aqiCnwQ2VwJam3
         0WdS5sgcag05cO7/tnn6UhvZMLXrkMqML4OugrZe7YFjXO24mQxiEO/VIh1HEgWC7Ho2
         sm0O95J2v4JaHZbXqrwTZOsJGKL1LnP2cnOMIgzIW2xTr+ZeEKHJnMZLNbJc6V3ijkwQ
         wMfTIoF370cg5ekz3bFOQoZReWnPuCkUMsT3tldZbdh8Lgi/YhLwBvr/p7UNCRyLX2Vo
         n3jw==
X-Gm-Message-State: AGi0PubzRvrYLrX5Nuj6BGogLCGoGBBQzjX0k37/CJgAqtBs5vyOeV3a
        8oiV9mf9WLKYKiGY/UyatsFyJ5OV
X-Google-Smtp-Source: APiQypJOlvePWlNy/NwH5kiByfgSfWL4gq4IWnwLaKL+XHMviDkcNh44sqhSyI5/wGE9EEsukp+s4w==
X-Received: by 2002:a19:6749:: with SMTP id e9mr13255207lfj.122.1585726465483;
        Wed, 01 Apr 2020 00:34:25 -0700 (PDT)
Received: from saruman.elisa-laajakaista.fi (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id g5sm939119lfj.14.2020.04.01.00.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 00:34:24 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Date:   Wed,  1 Apr 2020 10:32:42 +0300
Message-Id: <20200401073249.340400-1-balbi@kernel.org>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi guys,

in order to make our Universal Serial Community more welcoming, we have
decided to remove unnecessary acronyms from the code. This will be very
useful for newcomers as they won't have to guess what USB or XHCI means
and, instead, have it *always* spelled out.

I'm sure most of us here have suffered before trying to figure out what
an acronym means and we all know how much that hinders our hability to
focus on engineering. Let us all come together under an acronym-free
drivers/universal_serial_bus (note that renaming of directory will
happen in future commits after the code is completely cleaned up from
acronyms).

Granted, the patches are a little big, but I think they can still be
squeezed during the merge window since there are no functional changes.

Felipe Balbi (7):
  universal serial bus: remove acronyms
  open host controller interface: remove acronyms
  universal host controller interface: remove acronyms
  enhanced host controller interface: remove acronyms
  extensible host controller interface: remove acronyms
  designware cores universal serial bus3: remove acronyms
  designware cores universal serial bus2: remove acronyms

 drivers/usb/Kconfig                           |  148 +-
 drivers/usb/Makefile                          |   92 +-
 drivers/usb/atm/Kconfig                       |   46 +-
 drivers/usb/atm/Makefile                      |   12 +-
 drivers/usb/atm/cxacru.c                      |  348 +-
 drivers/usb/atm/speedtch.c                    |  372 +-
 drivers/usb/atm/ueagle-atm.c                  |  546 +--
 drivers/usb/atm/usbatm.c                      |  330 +-
 drivers/usb/atm/usbatm.h                      |   80 +-
 drivers/usb/atm/xusbatm.c                     |  176 +-
 drivers/usb/c67x00/Makefile                   |    4 +-
 drivers/usb/c67x00/c67x00-drv.c               |   10 +-
 drivers/usb/c67x00/c67x00-hcd.c               |  100 +-
 drivers/usb/c67x00/c67x00-hcd.h               |   34 +-
 drivers/usb/c67x00/c67x00-ll-hpi.c            |   74 +-
 drivers/usb/c67x00/c67x00-sched.c             |  112 +-
 drivers/usb/c67x00/c67x00.h                   |   88 +-
 drivers/usb/cdns3/Kconfig                     |   58 +-
 drivers/usb/cdns3/Makefile                    |   14 +-
 drivers/usb/cdns3/cdns3-imx.c                 |   68 +-
 drivers/usb/cdns3/cdns3-pci-wrap.c            |   18 +-
 drivers/usb/cdns3/cdns3-ti.c                  |  128 +-
 drivers/usb/cdns3/core.c                      |  190 +-
 drivers/usb/cdns3/core.h                      |   36 +-
 drivers/usb/cdns3/debug.h                     |   34 +-
 drivers/usb/cdns3/drd.c                       |   44 +-
 drivers/usb/cdns3/drd.h                       |   12 +-
 drivers/usb/cdns3/ep0.c                       |  222 +-
 drivers/usb/cdns3/gadget-export.h             |    4 +-
 drivers/usb/cdns3/gadget.c                    |  424 +--
 drivers/usb/cdns3/gadget.h                    |  680 ++--
 drivers/usb/cdns3/host-export.h               |    6 +-
 drivers/usb/cdns3/host.c                      |   22 +-
 drivers/usb/cdns3/trace.c                     |    2 +-
 drivers/usb/cdns3/trace.h                     |   40 +-
 drivers/usb/chipidea/Kconfig                  |   36 +-
 drivers/usb/chipidea/Makefile                 |   20 +-
 drivers/usb/chipidea/bits.h                   |   46 +-
 drivers/usb/chipidea/ci.h                     |   68 +-
 drivers/usb/chipidea/ci_hdrc_imx.c            |  140 +-
 drivers/usb/chipidea/ci_hdrc_imx.h            |   18 +-
 drivers/usb/chipidea/ci_hdrc_msm.c            |   10 +-
 drivers/usb/chipidea/ci_hdrc_pci.c            |   28 +-
 drivers/usb/chipidea/ci_hdrc_tegra.c          |   10 +-
 drivers/usb/chipidea/ci_hdrc_usb2.c           |   40 +-
 drivers/usb/chipidea/ci_hdrc_zevio.c          |   10 +-
 drivers/usb/chipidea/core.c                   |  242 +-
 drivers/usb/chipidea/debug.c                  |   30 +-
 drivers/usb/chipidea/host.c                   |  152 +-
 drivers/usb/chipidea/host.h                   |    8 +-
 drivers/usb/chipidea/otg.c                    |   12 +-
 drivers/usb/chipidea/otg.h                    |    6 +-
 drivers/usb/chipidea/otg_fsm.c                |   58 +-
 drivers/usb/chipidea/otg_fsm.h                |   10 +-
 drivers/usb/chipidea/udc.c                    |  412 +--
 drivers/usb/chipidea/udc.h                    |   18 +-
 drivers/usb/chipidea/ulpi.c                   |    6 +-
 drivers/usb/chipidea/usbmisc_imx.c            |  570 +--
 drivers/usb/class/Kconfig                     |   40 +-
 drivers/usb/class/Makefile                    |   10 +-
 drivers/usb/class/cdc-acm.c                   |  448 +--
 drivers/usb/class/cdc-acm.h                   |   14 +-
 drivers/usb/class/cdc-wdm.c                   |  210 +-
 drivers/usb/class/usblp.c                     |  994 ++---
 drivers/usb/class/usbtmc.c                    | 1018 +++---
 drivers/usb/common/Kconfig                    |   38 +-
 drivers/usb/common/Makefile                   |   16 +-
 drivers/usb/common/common.c                   |  158 +-
 drivers/usb/common/common.h                   |   16 +-
 drivers/usb/common/debug.c                    |  170 +-
 drivers/usb/common/led.c                      |   36 +-
 drivers/usb/common/ulpi.c                     |    8 +-
 drivers/usb/common/usb-conn-gpio.c            |  112 +-
 drivers/usb/common/usb-otg-fsm.c              |   50 +-
 drivers/usb/core/Kconfig                      |   76 +-
 drivers/usb/core/Makefile                     |   20 +-
 drivers/usb/core/buffer.c                     |   24 +-
 drivers/usb/core/config.c                     |  444 +--
 drivers/usb/core/devices.c                    |  236 +-
 drivers/usb/core/devio.c                      | 1072 +++---
 drivers/usb/core/driver.c                     |  824 ++---
 drivers/usb/core/endpoint.c                   |   74 +-
 drivers/usb/core/file.c                       |  166 +-
 drivers/usb/core/generic.c                    |  100 +-
 drivers/usb/core/hcd-pci.c                    |  198 +-
 drivers/usb/core/hcd.c                        | 1054 +++---
 drivers/usb/core/hub.c                        | 2486 ++++++-------
 drivers/usb/core/hub.h                        |   92 +-
 drivers/usb/core/ledtrig-usbport.c            |  206 +-
 drivers/usb/core/message.c                    |  932 ++---
 drivers/usb/core/notify.c                     |   46 +-
 drivers/usb/core/of.c                         |   38 +-
 drivers/usb/core/otg_whitelist.h              |   52 +-
 drivers/usb/core/phy.c                        |   72 +-
 drivers/usb/core/phy.h                        |   32 +-
 drivers/usb/core/port.c                       |  242 +-
 drivers/usb/core/quirks.c                     |  406 +--
 drivers/usb/core/sysfs.c                      |  498 +--
 drivers/usb/core/urb.c                        |  346 +-
 drivers/usb/core/usb-acpi.c                   |  132 +-
 drivers/usb/core/usb.c                        |  562 +--
 drivers/usb/core/usb.h                        |  252 +-
 drivers/usb/dwc2/Kconfig                      |   76 +-
 drivers/usb/dwc2/Makefile                     |   32 +-
 drivers/usb/dwc2/core.c                       |  584 +--
 drivers/usb/dwc2/core.h                       |  586 +--
 drivers/usb/dwc2/core_intr.c                  |  324 +-
 drivers/usb/dwc2/debug.h                      |   10 +-
 drivers/usb/dwc2/debugfs.c                    |  122 +-
 drivers/usb/dwc2/gadget.c                     | 1930 +++++-----
 drivers/usb/dwc2/hcd.c                        | 2088 +++++------
 drivers/usb/dwc2/hcd.h                        |  412 +--
 drivers/usb/dwc2/hcd_ddma.c                   |  508 +--
 drivers/usb/dwc2/hcd_intr.c                   |  978 ++---
 drivers/usb/dwc2/hcd_queue.c                  |  578 +--
 drivers/usb/dwc2/hw.h                         |   80 +-
 drivers/usb/dwc2/params.c                     |  374 +-
 drivers/usb/dwc2/pci.c                        |   82 +-
 drivers/usb/dwc2/platform.c                   |  264 +-
 drivers/usb/dwc3/Kconfig                      |  106 +-
 drivers/usb/dwc3/Makefile                     |   42 +-
 drivers/usb/dwc3/core.c                       | 1086 +++---
 drivers/usb/dwc3/core.h                       | 1530 ++++----
 drivers/usb/dwc3/debug.h                      |  240 +-
 drivers/usb/dwc3/debugfs.c                    |  558 +--
 drivers/usb/dwc3/drd.c                        |  428 +--
 drivers/usb/dwc3/dwc3-exynos.c                |   84 +-
 drivers/usb/dwc3/dwc3-haps.c                  |   72 +-
 drivers/usb/dwc3/dwc3-keystone.c              |  118 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c            |  434 +--
 drivers/usb/dwc3/dwc3-of-simple.c             |   92 +-
 drivers/usb/dwc3/dwc3-omap.c                  |  486 +--
 drivers/usb/dwc3/dwc3-pci.c                   |  170 +-
 drivers/usb/dwc3/dwc3-qcom.c                  |  284 +-
 drivers/usb/dwc3/dwc3-st.c                    |  244 +-
 drivers/usb/dwc3/ep0.c                        |  632 ++--
 drivers/usb/dwc3/gadget.c                     | 1868 +++++-----
 drivers/usb/dwc3/gadget.h                     |  118 +-
 drivers/usb/dwc3/host.c                       |   74 +-
 drivers/usb/dwc3/io.h                         |   24 +-
 drivers/usb/dwc3/trace.c                      |    2 +-
 drivers/usb/dwc3/trace.h                      |  148 +-
 drivers/usb/dwc3/ulpi.c                       |   68 +-
 drivers/usb/early/Makefile                    |    6 +-
 drivers/usb/early/ehci-dbgp.c                 |  438 +--
 drivers/usb/early/xhci-dbc.c                  |   96 +-
 drivers/usb/early/xhci-dbc.h                  |   22 +-
 drivers/usb/gadget/Kconfig                    |  344 +-
 drivers/usb/gadget/Makefile                   |   14 +-
 drivers/usb/gadget/composite.c                |  890 ++---
 drivers/usb/gadget/config.c                   |  144 +-
 drivers/usb/gadget/configfs.c                 |  384 +-
 drivers/usb/gadget/configfs.h                 |   14 +-
 drivers/usb/gadget/epautoconf.c               |   86 +-
 drivers/usb/gadget/function/Makefile          |   94 +-
 drivers/usb/gadget/function/f_acm.c           |  332 +-
 drivers/usb/gadget/function/f_ecm.c           |  364 +-
 drivers/usb/gadget/function/f_eem.c           |  182 +-
 drivers/usb/gadget/function/f_fs.c            |  392 +-
 drivers/usb/gadget/function/f_hid.c           |  246 +-
 drivers/usb/gadget/function/f_loopback.c      |  192 +-
 drivers/usb/gadget/function/f_mass_storage.c  |  196 +-
 drivers/usb/gadget/function/f_mass_storage.h  |   16 +-
 drivers/usb/gadget/function/f_midi.c          |  316 +-
 drivers/usb/gadget/function/f_ncm.c           |  458 +--
 drivers/usb/gadget/function/f_obex.c          |  180 +-
 drivers/usb/gadget/function/f_phonet.c        |  242 +-
 drivers/usb/gadget/function/f_printer.c       |  338 +-
 drivers/usb/gadget/function/f_rndis.c         |  366 +-
 drivers/usb/gadget/function/f_serial.c        |  142 +-
 drivers/usb/gadget/function/f_sourcesink.c    |  368 +-
 drivers/usb/gadget/function/f_subset.c        |  206 +-
 drivers/usb/gadget/function/f_tcm.c           |  956 ++---
 drivers/usb/gadget/function/f_uac1.c          |  272 +-
 drivers/usb/gadget/function/f_uac1_legacy.c   |  228 +-
 drivers/usb/gadget/function/f_uac2.c          |  474 +--
 drivers/usb/gadget/function/f_uvc.c           |  262 +-
 drivers/usb/gadget/function/f_uvc.h           |    2 +-
 drivers/usb/gadget/function/g_zero.h          |   12 +-
 drivers/usb/gadget/function/rndis.c           |   30 +-
 drivers/usb/gadget/function/storage_common.c  |  106 +-
 drivers/usb/gadget/function/storage_common.h  |   36 +-
 drivers/usb/gadget/function/tcm.h             |   92 +-
 drivers/usb/gadget/function/u_audio.c         |   48 +-
 drivers/usb/gadget/function/u_audio.h         |   16 +-
 drivers/usb/gadget/function/u_ecm.h           |    4 +-
 drivers/usb/gadget/function/u_eem.h           |    4 +-
 drivers/usb/gadget/function/u_ether.c         |  168 +-
 drivers/usb/gadget/function/u_ether.h         |   84 +-
 .../usb/gadget/function/u_ether_configfs.h    |   16 +-
 drivers/usb/gadget/function/u_fs.h            |   16 +-
 drivers/usb/gadget/function/u_gether.h        |    4 +-
 drivers/usb/gadget/function/u_hid.h           |    6 +-
 drivers/usb/gadget/function/u_midi.h          |    4 +-
 drivers/usb/gadget/function/u_ncm.h           |    6 +-
 drivers/usb/gadget/function/u_phonet.h        |   10 +-
 drivers/usb/gadget/function/u_printer.h       |    4 +-
 drivers/usb/gadget/function/u_rndis.h         |    8 +-
 drivers/usb/gadget/function/u_serial.c        |  192 +-
 drivers/usb/gadget/function/u_serial.h        |   28 +-
 drivers/usb/gadget/function/u_tcm.h           |    8 +-
 drivers/usb/gadget/function/u_uac1.h          |    4 +-
 drivers/usb/gadget/function/u_uac1_legacy.c   |    6 +-
 drivers/usb/gadget/function/u_uac1_legacy.h   |   14 +-
 drivers/usb/gadget/function/u_uac2.h          |    4 +-
 drivers/usb/gadget/function/u_uvc.h           |    6 +-
 drivers/usb/gadget/function/uvc.h             |   22 +-
 drivers/usb/gadget/function/uvc_configfs.c    |   12 +-
 drivers/usb/gadget/function/uvc_queue.c       |    4 +-
 drivers/usb/gadget/function/uvc_v4l2.c        |   14 +-
 drivers/usb/gadget/function/uvc_v4l2.h        |    2 +-
 drivers/usb/gadget/function/uvc_video.c       |   50 +-
 drivers/usb/gadget/function/uvc_video.h       |    2 +-
 drivers/usb/gadget/functions.c                |   44 +-
 drivers/usb/gadget/legacy/Kconfig             |  352 +-
 drivers/usb/gadget/legacy/Makefile            |   48 +-
 drivers/usb/gadget/legacy/acm_ms.c            |  112 +-
 drivers/usb/gadget/legacy/audio.c             |  118 +-
 drivers/usb/gadget/legacy/cdc2.c              |  106 +-
 drivers/usb/gadget/legacy/dbgp.c              |  144 +-
 drivers/usb/gadget/legacy/ether.c             |  180 +-
 drivers/usb/gadget/legacy/g_ffs.c             |  230 +-
 drivers/usb/gadget/legacy/gmidi.c             |   96 +-
 drivers/usb/gadget/legacy/hid.c               |   96 +-
 drivers/usb/gadget/legacy/inode.c             |  274 +-
 drivers/usb/gadget/legacy/mass_storage.c      |  102 +-
 drivers/usb/gadget/legacy/multi.c             |  236 +-
 drivers/usb/gadget/legacy/ncm.c               |   90 +-
 drivers/usb/gadget/legacy/nokia.c             |  246 +-
 drivers/usb/gadget/legacy/printer.c           |  100 +-
 drivers/usb/gadget/legacy/raw_gadget.c        |  214 +-
 drivers/usb/gadget/legacy/serial.c            |  110 +-
 drivers/usb/gadget/legacy/tcm_usb_gadget.c    |  128 +-
 drivers/usb/gadget/legacy/webcam.c            |  102 +-
 drivers/usb/gadget/legacy/zero.c              |  178 +-
 drivers/usb/gadget/u_f.c                      |   16 +-
 drivers/usb/gadget/u_f.h                      |   24 +-
 drivers/usb/gadget/u_os_desc.h                |   90 +-
 drivers/usb/gadget/udc/Kconfig                |  294 +-
 drivers/usb/gadget/udc/Makefile               |   72 +-
 drivers/usb/gadget/udc/amd5536udc.h           |   18 +-
 drivers/usb/gadget/udc/amd5536udc_pci.c       |   10 +-
 drivers/usb/gadget/udc/aspeed-vhub/Kconfig    |    8 +-
 drivers/usb/gadget/udc/aspeed-vhub/Makefile   |    2 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c     |   32 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c      |  108 +-
 drivers/usb/gadget/udc/aspeed-vhub/ep0.c      |   26 +-
 drivers/usb/gadget/udc/aspeed-vhub/epn.c      |   52 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c      |  294 +-
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h     |   36 +-
 drivers/usb/gadget/udc/at91_udc.c             |  212 +-
 drivers/usb/gadget/udc/at91_udc.h             |   18 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c       |  952 ++---
 drivers/usb/gadget/udc/atmel_usba_udc.h       |  378 +-
 drivers/usb/gadget/udc/bcm63xx_udc.c          |  566 +--
 drivers/usb/gadget/udc/bdc/Kconfig            |   16 +-
 drivers/usb/gadget/udc/bdc/Makefile           |    6 +-
 drivers/usb/gadget/udc/bdc/bdc.h              |   38 +-
 drivers/usb/gadget/udc/bdc/bdc_cmd.c          |   34 +-
 drivers/usb/gadget/udc/bdc/bdc_core.c         |   22 +-
 drivers/usb/gadget/udc/bdc/bdc_dbg.c          |    2 +-
 drivers/usb/gadget/udc/bdc/bdc_dbg.h          |    4 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c           |  392 +-
 drivers/usb/gadget/udc/bdc/bdc_pci.c          |    6 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c          |   74 +-
 drivers/usb/gadget/udc/core.c                 |  578 +--
 drivers/usb/gadget/udc/dummy_hcd.c            |  848 ++---
 drivers/usb/gadget/udc/fotg210-udc.c          |  138 +-
 drivers/usb/gadget/udc/fotg210.h              |   16 +-
 drivers/usb/gadget/udc/fsl_mxc_udc.c          |   34 +-
 drivers/usb/gadget/udc/fsl_qe_udc.c           |  652 ++--
 drivers/usb/gadget/udc/fsl_qe_udc.h           |  270 +-
 drivers/usb/gadget/udc/fsl_udc_core.c         |  604 +--
 drivers/usb/gadget/udc/fsl_usb2_udc.h         |  248 +-
 drivers/usb/gadget/udc/fusb300_udc.c          | 1204 +++---
 drivers/usb/gadget/udc/fusb300_udc.h          |  948 ++---
 drivers/usb/gadget/udc/goku_udc.c             |  184 +-
 drivers/usb/gadget/udc/goku_udc.h             |   22 +-
 drivers/usb/gadget/udc/gr_udc.c               |  238 +-
 drivers/usb/gadget/udc/gr_udc.h               |   20 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c          |  746 ++--
 drivers/usb/gadget/udc/m66592-udc.c           |  188 +-
 drivers/usb/gadget/udc/m66592-udc.h           |   40 +-
 drivers/usb/gadget/udc/max3420_udc.c          |  294 +-
 drivers/usb/gadget/udc/mv_u3d.h               |   66 +-
 drivers/usb/gadget/udc/mv_u3d_core.c          |  258 +-
 drivers/usb/gadget/udc/mv_udc.h               |  130 +-
 drivers/usb/gadget/udc/mv_udc_core.c          |  410 +--
 drivers/usb/gadget/udc/net2272.c              |  270 +-
 drivers/usb/gadget/udc/net2272.h              |   64 +-
 drivers/usb/gadget/udc/net2280.c              |  608 ++--
 drivers/usb/gadget/udc/net2280.h              |   46 +-
 drivers/usb/gadget/udc/omap_udc.c             |  384 +-
 drivers/usb/gadget/udc/omap_udc.h             |   14 +-
 drivers/usb/gadget/udc/pch_udc.c              |  286 +-
 drivers/usb/gadget/udc/pxa25x_udc.c           |  374 +-
 drivers/usb/gadget/udc/pxa25x_udc.h           |   24 +-
 drivers/usb/gadget/udc/pxa27x_udc.c           |  430 +--
 drivers/usb/gadget/udc/pxa27x_udc.h           |  124 +-
 drivers/usb/gadget/udc/r8a66597-udc.c         |  214 +-
 drivers/usb/gadget/udc/r8a66597-udc.h         |   12 +-
 drivers/usb/gadget/udc/renesas_usb3.c         | 2540 ++++++-------
 drivers/usb/gadget/udc/s3c-hsudc.c            |  186 +-
 drivers/usb/gadget/udc/s3c2410_udc.c          |  354 +-
 drivers/usb/gadget/udc/s3c2410_udc.h          |   16 +-
 drivers/usb/gadget/udc/snps_udc_core.c        |  278 +-
 drivers/usb/gadget/udc/snps_udc_plat.c        |   18 +-
 drivers/usb/gadget/udc/tegra-xudc.c           |  740 ++--
 drivers/usb/gadget/udc/trace.c                |    2 +-
 drivers/usb/gadget/udc/trace.h                |  112 +-
 drivers/usb/gadget/udc/udc-xilinx.c           | 1060 +++---
 drivers/usb/gadget/usbstring.c                |   16 +-
 drivers/usb/host/Kconfig                      |  612 ++--
 drivers/usb/host/Makefile                     |  130 +-
 drivers/usb/host/bcma-hcd.c                   |  158 +-
 drivers/usb/host/ehci-atmel.c                 |  176 +-
 drivers/usb/host/ehci-dbg.c                   |  386 +-
 drivers/usb/host/ehci-exynos.c                |  226 +-
 drivers/usb/host/ehci-fsl.c                   |  508 +--
 drivers/usb/host/ehci-fsl.h                   |   46 +-
 drivers/usb/host/ehci-grlib.c                 |  116 +-
 drivers/usb/host/ehci-hcd.c                   |  912 ++---
 drivers/usb/host/ehci-hub.c                   |  852 ++---
 drivers/usb/host/ehci-mem.c                   |  174 +-
 drivers/usb/host/ehci-mv.c                    |  232 +-
 drivers/usb/host/ehci-mxc.c                   |  114 +-
 drivers/usb/host/ehci-npcm7xx.c               |  106 +-
 drivers/usb/host/ehci-omap.c                  |  160 +-
 drivers/usb/host/ehci-orion.c                 |  260 +-
 drivers/usb/host/ehci-pci.c                   |  208 +-
 drivers/usb/host/ehci-platform.c              |  226 +-
 drivers/usb/host/ehci-pmcmsp.c                |  198 +-
 drivers/usb/host/ehci-ppc-of.c                |  148 +-
 drivers/usb/host/ehci-ps3.c                   |  118 +-
 drivers/usb/host/ehci-q.c                     |  628 ++--
 drivers/usb/host/ehci-sched.c                 | 1022 +++---
 drivers/usb/host/ehci-sh.c                    |  106 +-
 drivers/usb/host/ehci-spear.c                 |  132 +-
 drivers/usb/host/ehci-st.c                    |  168 +-
 drivers/usb/host/ehci-sysfs.c                 |   68 +-
 drivers/usb/host/ehci-tegra.c                 |  290 +-
 drivers/usb/host/ehci-timer.c                 |  318 +-
 drivers/usb/host/ehci-xilinx-of.c             |  130 +-
 drivers/usb/host/ehci.h                       |  488 +--
 drivers/usb/host/fhci-dbg.c                   |   42 +-
 drivers/usb/host/fhci-hcd.c                   |  280 +-
 drivers/usb/host/fhci-hub.c                   |  154 +-
 drivers/usb/host/fhci-mem.c                   |    8 +-
 drivers/usb/host/fhci-q.c                     |   54 +-
 drivers/usb/host/fhci-sched.c                 |  474 +--
 drivers/usb/host/fhci-tds.c                   |  152 +-
 drivers/usb/host/fhci.h                       |  278 +-
 drivers/usb/host/fotg210-hcd.c                |  412 +--
 drivers/usb/host/fotg210.h                    |   90 +-
 drivers/usb/host/fsl-mph-dr-of.c              |  194 +-
 drivers/usb/host/imx21-dbg.c                  |   20 +-
 drivers/usb/host/imx21-hcd.c                  |  398 +-
 drivers/usb/host/imx21-hcd.h                  |  404 +-
 drivers/usb/host/isp116x-hcd.c                |  282 +-
 drivers/usb/host/isp116x.h                    |   34 +-
 drivers/usb/host/isp1362-hcd.c                |  384 +-
 drivers/usb/host/isp1362.h                    |   66 +-
 drivers/usb/host/max3421-hcd.c                |  342 +-
 drivers/usb/host/ohci-at91.c                  |  338 +-
 drivers/usb/host/ohci-da8xx.c                 |  324 +-
 drivers/usb/host/ohci-dbg.c                   |  300 +-
 drivers/usb/host/ohci-exynos.c                |  200 +-
 drivers/usb/host/ohci-hcd.c                   |  826 ++---
 drivers/usb/host/ohci-hub.c                   |  498 +--
 drivers/usb/host/ohci-mem.c                   |   64 +-
 drivers/usb/host/ohci-nxp.c                   |  132 +-
 drivers/usb/host/ohci-omap.c                  |  246 +-
 drivers/usb/host/ohci-pci.c                   |  202 +-
 drivers/usb/host/ohci-platform.c              |  202 +-
 drivers/usb/host/ohci-ppc-of.c                |  160 +-
 drivers/usb/host/ohci-ps3.c                   |  106 +-
 drivers/usb/host/ohci-pxa27x.c                |  300 +-
 drivers/usb/host/ohci-q.c                     |  534 +--
 drivers/usb/host/ohci-s3c2410.c               |  178 +-
 drivers/usb/host/ohci-sa1111.c                |  188 +-
 drivers/usb/host/ohci-sm501.c                 |  134 +-
 drivers/usb/host/ohci-spear.c                 |  140 +-
 drivers/usb/host/ohci-st.c                    |  152 +-
 drivers/usb/host/ohci-tmio.c                  |  160 +-
 drivers/usb/host/ohci.h                       |  356 +-
 drivers/usb/host/oxu210hp-hcd.c               |  704 ++--
 drivers/usb/host/pci-quirks.c                 |  478 +--
 drivers/usb/host/pci-quirks.h                 |   48 +-
 drivers/usb/host/r8a66597-hcd.c               |  436 +--
 drivers/usb/host/r8a66597.h                   |   22 +-
 drivers/usb/host/sl811-hcd.c                  |  288 +-
 drivers/usb/host/sl811.h                      |   12 +-
 drivers/usb/host/sl811_cs.c                   |    4 +-
 drivers/usb/host/ssb-hcd.c                    |  116 +-
 drivers/usb/host/u132-hcd.c                   |  566 +--
 drivers/usb/host/uhci-debug.c                 |  308 +-
 drivers/usb/host/uhci-grlib.c                 |  128 +-
 drivers/usb/host/uhci-hcd.c                   |  596 +--
 drivers/usb/host/uhci-hcd.h                   |  464 +--
 drivers/usb/host/uhci-hub.c                   |  304 +-
 drivers/usb/host/uhci-pci.c                   |  204 +-
 drivers/usb/host/uhci-platform.c              |  132 +-
 drivers/usb/host/uhci-q.c                     |  884 ++---
 drivers/usb/host/xhci-dbg.c                   |   18 +-
 drivers/usb/host/xhci-dbgcap.c                |  396 +-
 drivers/usb/host/xhci-dbgcap.h                |   76 +-
 drivers/usb/host/xhci-dbgtty.c                |   72 +-
 drivers/usb/host/xhci-debugfs.c               |  352 +-
 drivers/usb/host/xhci-debugfs.h               |   68 +-
 drivers/usb/host/xhci-ext-caps.c              |   54 +-
 drivers/usb/host/xhci-ext-caps.h              |   96 +-
 drivers/usb/host/xhci-histb.c                 |  216 +-
 drivers/usb/host/xhci-hub.c                   |  996 ++---
 drivers/usb/host/xhci-mem.c                   | 1532 ++++----
 drivers/usb/host/xhci-mtk-sch.c               |  184 +-
 drivers/usb/host/xhci-mtk.c                   |  302 +-
 drivers/usb/host/xhci-mtk.h                   |   68 +-
 drivers/usb/host/xhci-mvebu.c                 |   36 +-
 drivers/usb/host/xhci-mvebu.h                 |   18 +-
 drivers/usb/host/xhci-pci.c                   |  426 +--
 drivers/usb/host/xhci-plat.c                  |  340 +-
 drivers/usb/host/xhci-plat.h                  |   22 +-
 drivers/usb/host/xhci-rcar.c                  |  186 +-
 drivers/usb/host/xhci-rcar.h                  |   50 +-
 drivers/usb/host/xhci-ring.c                  | 1752 ++++-----
 drivers/usb/host/xhci-tegra.c                 |  794 ++--
 drivers/usb/host/xhci-trace.c                 |    4 +-
 drivers/usb/host/xhci-trace.h                 |  290 +-
 drivers/usb/host/xhci.c                       | 3234 ++++++++---------
 drivers/usb/host/xhci.h                       |  916 ++---
 drivers/usb/image/Kconfig                     |   16 +-
 drivers/usb/image/Makefile                    |    6 +-
 drivers/usb/image/mdc800.c                    |  160 +-
 drivers/usb/image/microtek.c                  |  148 +-
 drivers/usb/image/microtek.h                  |    6 +-
 drivers/usb/isp1760/Kconfig                   |   44 +-
 drivers/usb/isp1760/Makefile                  |    6 +-
 drivers/usb/isp1760/isp1760-core.c            |   12 +-
 drivers/usb/isp1760/isp1760-hcd.c             |  296 +-
 drivers/usb/isp1760/isp1760-hcd.h             |    8 +-
 drivers/usb/isp1760/isp1760-if.c              |   22 +-
 drivers/usb/isp1760/isp1760-regs.h            |   10 +-
 drivers/usb/isp1760/isp1760-udc.c             |  206 +-
 drivers/usb/isp1760/isp1760-udc.h             |   14 +-
 drivers/usb/misc/Kconfig                      |  174 +-
 drivers/usb/misc/Makefile                     |   54 +-
 drivers/usb/misc/adutux.c                     |  140 +-
 drivers/usb/misc/appledisplay.c               |  102 +-
 drivers/usb/misc/chaoskey.c                   |  180 +-
 drivers/usb/misc/cypress_cy7c63.c             |   58 +-
 drivers/usb/misc/cytherm.c                    |   94 +-
 drivers/usb/misc/ehset.c                      |   96 +-
 drivers/usb/misc/emi26.c                      |   54 +-
 drivers/usb/misc/emi62.c                      |   52 +-
 drivers/usb/misc/ezusb.c                      |   68 +-
 drivers/usb/misc/ftdi-elan.c                  |  486 +--
 drivers/usb/misc/idmouse.c                    |  100 +-
 drivers/usb/misc/iowarrior.c                  |  270 +-
 drivers/usb/misc/isight_firmware.c            |   38 +-
 drivers/usb/misc/ldusb.c                      |  396 +-
 drivers/usb/misc/legousbtower.c               |  198 +-
 drivers/usb/misc/lvstest.c                    |  230 +-
 drivers/usb/misc/sisusbvga/Kconfig            |   28 +-
 drivers/usb/misc/sisusbvga/Makefile           |    8 +-
 drivers/usb/misc/sisusbvga/sisusb.c           | 1416 ++++----
 drivers/usb/misc/sisusbvga/sisusb.h           |  184 +-
 drivers/usb/misc/sisusbvga/sisusb_con.c       |  856 ++---
 drivers/usb/misc/sisusbvga/sisusb_init.c      |   50 +-
 drivers/usb/misc/sisusbvga/sisusb_init.h      |   58 +-
 drivers/usb/misc/sisusbvga/sisusb_struct.h    |    6 +-
 drivers/usb/misc/trancevibrator.c             |   48 +-
 drivers/usb/misc/usb251xb.c                   |  558 +--
 drivers/usb/misc/usb3503.c                    |  222 +-
 drivers/usb/misc/usb4604.c                    |   92 +-
 drivers/usb/misc/usb_u132.h                   |   40 +-
 drivers/usb/misc/usblcd.c                     |  154 +-
 drivers/usb/misc/usbsevseg.c                  |  130 +-
 drivers/usb/misc/usbtest.c                    |  754 ++--
 drivers/usb/misc/uss720.c                     |  146 +-
 drivers/usb/misc/yurex.c                      |  134 +-
 drivers/usb/mon/Kconfig                       |   10 +-
 drivers/usb/mon/Makefile                      |    6 +-
 drivers/usb/mon/mon_bin.c                     |   52 +-
 drivers/usb/mon/mon_main.c                    |   62 +-
 drivers/usb/mon/mon_stat.c                    |   10 +-
 drivers/usb/mon/mon_text.c                    |   56 +-
 drivers/usb/mon/usb_mon.h                     |   20 +-
 drivers/usb/mtu3/Kconfig                      |   38 +-
 drivers/usb/mtu3/Makefile                     |   10 +-
 drivers/usb/mtu3/mtu3.h                       |   94 +-
 drivers/usb/mtu3/mtu3_core.c                  |  190 +-
 drivers/usb/mtu3/mtu3_debug.h                 |   16 +-
 drivers/usb/mtu3/mtu3_debugfs.c               |  152 +-
 drivers/usb/mtu3/mtu3_dr.c                    |  258 +-
 drivers/usb/mtu3/mtu3_dr.h                    |   60 +-
 drivers/usb/mtu3/mtu3_gadget.c                |  112 +-
 drivers/usb/mtu3/mtu3_gadget_ep0.c            |  154 +-
 drivers/usb/mtu3/mtu3_host.c                  |  160 +-
 drivers/usb/mtu3/mtu3_hw_regs.h               |  432 +--
 drivers/usb/mtu3/mtu3_plat.c                  |  320 +-
 drivers/usb/mtu3/mtu3_qmu.c                   |   40 +-
 drivers/usb/mtu3/mtu3_trace.h                 |    4 +-
 drivers/usb/musb/Kconfig                      |  122 +-
 drivers/usb/musb/Makefile                     |   44 +-
 drivers/usb/musb/am35x.c                      |  342 +-
 drivers/usb/musb/cppi_dma.c                   |  398 +-
 drivers/usb/musb/cppi_dma.h                   |   10 +-
 drivers/usb/musb/da8xx.c                      |  382 +-
 drivers/usb/musb/davinci.c                    |  338 +-
 drivers/usb/musb/davinci.h                    |   74 +-
 drivers/usb/musb/jz4740.c                     |  106 +-
 drivers/usb/musb/mediatek.c                   |  378 +-
 drivers/usb/musb/musb_core.c                  | 2172 +++++------
 drivers/usb/musb/musb_core.h                  |  404 +-
 drivers/usb/musb/musb_cppi41.c                |  248 +-
 drivers/usb/musb/musb_debug.h                 |   18 +-
 drivers/usb/musb/musb_debugfs.c               |  256 +-
 drivers/usb/musb/musb_dma.h                   |  120 +-
 drivers/usb/musb/musb_dsps.c                  |  574 +--
 drivers/usb/musb/musb_gadget.c                | 1566 ++++----
 drivers/usb/musb/musb_gadget.h                |   92 +-
 drivers/usb/musb/musb_gadget_ep0.c            |  750 ++--
 drivers/usb/musb/musb_host.c                  | 1458 ++++----
 drivers/usb/musb/musb_host.h                  |  102 +-
 drivers/usb/musb/musb_io.h                    |   38 +-
 drivers/usb/musb/musb_regs.h                  |  472 +--
 drivers/usb/musb/musb_trace.c                 |    8 +-
 drivers/usb/musb/musb_trace.h                 |  188 +-
 drivers/usb/musb/musb_virthub.c               |  316 +-
 drivers/usb/musb/musbhsdma.c                  |  368 +-
 drivers/usb/musb/omap2430.c                   |  346 +-
 drivers/usb/musb/omap2430.h                   |    8 +-
 drivers/usb/musb/sunxi.c                      |  778 ++--
 drivers/usb/musb/tusb6010.c                   |  994 ++---
 drivers/usb/musb/tusb6010.h                   |  356 +-
 drivers/usb/musb/tusb6010_omap.c              |  342 +-
 drivers/usb/musb/ux500.c                      |  214 +-
 drivers/usb/musb/ux500_dma.c                  |  116 +-
 drivers/usb/phy/Kconfig                       |  164 +-
 drivers/usb/phy/Makefile                      |   34 +-
 drivers/usb/phy/of.c                          |   36 +-
 drivers/usb/phy/phy-ab8500-usb.c              |  646 ++--
 drivers/usb/phy/phy-am335x-control.c          |  110 +-
 drivers/usb/phy/phy-am335x-control.h          |    4 +-
 drivers/usb/phy/phy-am335x.c                  |   30 +-
 drivers/usb/phy/phy-fsl-usb.c                 |  184 +-
 drivers/usb/phy/phy-fsl-usb.h                 |  198 +-
 drivers/usb/phy/phy-generic.c                 |  108 +-
 drivers/usb/phy/phy-generic.h                 |   12 +-
 drivers/usb/phy/phy-gpio-vbus-usb.c           |   44 +-
 drivers/usb/phy/phy-isp1301-omap.c            |  112 +-
 drivers/usb/phy/phy-isp1301.c                 |   22 +-
 drivers/usb/phy/phy-keystone.c                |   82 +-
 drivers/usb/phy/phy-mv-usb.c                  |   88 +-
 drivers/usb/phy/phy-mv-usb.h                  |   34 +-
 drivers/usb/phy/phy-mxs-usb.c                 |  456 +--
 drivers/usb/phy/phy-omap-otg.c                |   18 +-
 drivers/usb/phy/phy-tahvo.c                   |  190 +-
 drivers/usb/phy/phy-tegra-usb.c               |  380 +-
 drivers/usb/phy/phy-twl6030-usb.c             |  260 +-
 drivers/usb/phy/phy-ulpi-viewport.c           |   12 +-
 drivers/usb/phy/phy-ulpi.c                    |   78 +-
 drivers/usb/phy/phy.c                         |  400 +-
 drivers/usb/renesas_usbhs/Kconfig             |   16 +-
 drivers/usb/renesas_usbhs/Makefile            |   14 +-
 drivers/usb/renesas_usbhs/common.c            |  502 +--
 drivers/usb/renesas_usbhs/common.h            |  110 +-
 drivers/usb/renesas_usbhs/fifo.c              |  972 ++---
 drivers/usb/renesas_usbhs/fifo.h              |   90 +-
 drivers/usb/renesas_usbhs/mod.c               |  190 +-
 drivers/usb/renesas_usbhs/mod.h               |  126 +-
 drivers/usb/renesas_usbhs/mod_gadget.c        |  914 ++---
 drivers/usb/renesas_usbhs/mod_host.c          | 1056 +++---
 drivers/usb/renesas_usbhs/pipe.c              |  462 +--
 drivers/usb/renesas_usbhs/pipe.h              |  122 +-
 drivers/usb/renesas_usbhs/rcar2.c             |   28 +-
 drivers/usb/renesas_usbhs/rcar2.h             |    2 +-
 drivers/usb/renesas_usbhs/rcar3.c             |   68 +-
 drivers/usb/renesas_usbhs/rcar3.h             |    6 +-
 drivers/usb/renesas_usbhs/rza.c               |   32 +-
 drivers/usb/renesas_usbhs/rza.h               |    4 +-
 drivers/usb/renesas_usbhs/rza2.c              |   30 +-
 drivers/usb/roles/Kconfig                     |   28 +-
 drivers/usb/roles/Makefile                    |    4 +-
 drivers/usb/roles/class.c                     |  202 +-
 .../usb/roles/intel-xhci-usb-role-switch.c    |   78 +-
 drivers/usb/serial/Kconfig                    |  434 +--
 drivers/usb/serial/Makefile                   |  112 +-
 drivers/usb/serial/Makefile-keyspan_pda_fw    |    4 +-
 drivers/usb/serial/aircable.c                 |   40 +-
 drivers/usb/serial/ark3116.c                  |  120 +-
 drivers/usb/serial/belkin_sa.c                |  142 +-
 drivers/usb/serial/belkin_sa.h                |   18 +-
 drivers/usb/serial/bus.c                      |   92 +-
 drivers/usb/serial/ch341.c                    |  118 +-
 drivers/usb/serial/console.c                  |   96 +-
 drivers/usb/serial/cp210x.c                   |  620 ++--
 drivers/usb/serial/cyberjack.c                |  108 +-
 drivers/usb/serial/cypress_m8.c               |  242 +-
 drivers/usb/serial/cypress_m8.h               |   14 +-
 drivers/usb/serial/digi_acceleport.c          |  248 +-
 drivers/usb/serial/empeg.c                    |   32 +-
 drivers/usb/serial/ezusb_convert.pl           |    8 +-
 drivers/usb/serial/f81232.c                   |  158 +-
 drivers/usb/serial/f81534.c                   |  226 +-
 drivers/usb/serial/ftdi_sio.c                 | 2100 +++++------
 drivers/usb/serial/ftdi_sio.h                 |   14 +-
 drivers/usb/serial/ftdi_sio_ids.h             |  334 +-
 drivers/usb/serial/garmin_gps.c               |  210 +-
 drivers/usb/serial/generic.c                  |  244 +-
 drivers/usb/serial/io_edgeport.c              |  486 +--
 drivers/usb/serial/io_edgeport.h              |   10 +-
 drivers/usb/serial/io_ti.c                    |  384 +-
 drivers/usb/serial/io_ti.h                    |    2 +-
 drivers/usb/serial/io_usbvend.h               |  108 +-
 drivers/usb/serial/ipaq.c                     |  950 ++---
 drivers/usb/serial/ipw.c                      |  100 +-
 drivers/usb/serial/ir-usb.c                   |  162 +-
 drivers/usb/serial/iuu_phoenix.c              |  212 +-
 drivers/usb/serial/iuu_phoenix.h              |    8 +-
 drivers/usb/serial/keyspan.c                  |  566 +--
 drivers/usb/serial/keyspan_pda.c              |  208 +-
 drivers/usb/serial/keyspan_usa26msg.h         |    8 +-
 drivers/usb/serial/keyspan_usa28msg.h         |   12 +-
 drivers/usb/serial/keyspan_usa49msg.h         |    8 +-
 drivers/usb/serial/keyspan_usa67msg.h         |    6 +-
 drivers/usb/serial/keyspan_usa90msg.h         |    2 +-
 drivers/usb/serial/kl5kusb105.c               |  182 +-
 drivers/usb/serial/kl5kusb105.h               |   64 +-
 drivers/usb/serial/kobil_sct.c                |  224 +-
 drivers/usb/serial/kobil_sct.h                |   80 +-
 drivers/usb/serial/mct_u232.c                 |  162 +-
 drivers/usb/serial/mct_u232.h                 |   70 +-
 drivers/usb/serial/metro-usb.c                |  174 +-
 drivers/usb/serial/mos7720.c                  |  272 +-
 drivers/usb/serial/mos7840.c                  |  278 +-
 drivers/usb/serial/mxuport.c                  |  220 +-
 drivers/usb/serial/navman.c                   |   36 +-
 drivers/usb/serial/omninet.c                  |   56 +-
 drivers/usb/serial/opticon.c                  |  128 +-
 drivers/usb/serial/option.c                   | 2658 +++++++-------
 drivers/usb/serial/oti6858.c                  |  156 +-
 drivers/usb/serial/oti6858.h                  |    6 +-
 drivers/usb/serial/pl2303.c                   |  338 +-
 drivers/usb/serial/pl2303.h                   |   22 +-
 drivers/usb/serial/qcaux.c                    |   48 +-
 drivers/usb/serial/qcserial.c                 |  214 +-
 drivers/usb/serial/quatech2.c                 |  242 +-
 drivers/usb/serial/safe_serial.c              |   66 +-
 drivers/usb/serial/sierra.c                   |  430 +--
 drivers/usb/serial/spcp8x5.c                  |  106 +-
 drivers/usb/serial/ssu100.c                   |  102 +-
 drivers/usb/serial/symbolserial.c             |   54 +-
 drivers/usb/serial/ti_usb_3410_5052.c         |  330 +-
 drivers/usb/serial/upd78f0730.c               |   68 +-
 drivers/usb/serial/usb-serial-simple.c        |   86 +-
 drivers/usb/serial/usb-serial.c               |  552 +--
 drivers/usb/serial/usb-wwan.h                 |   42 +-
 drivers/usb/serial/usb_debug.c                |   72 +-
 drivers/usb/serial/usb_wwan.c                 |  306 +-
 drivers/usb/serial/visor.c                    |  278 +-
 drivers/usb/serial/visor.h                    |    8 +-
 drivers/usb/serial/whiteheat.c                |  210 +-
 drivers/usb/serial/whiteheat.h                |    8 +-
 drivers/usb/serial/wishbone-serial.c          |   44 +-
 drivers/usb/serial/xsens_mt.c                 |   36 +-
 drivers/usb/storage/Kconfig                   |  118 +-
 drivers/usb/storage/Makefile                  |   44 +-
 drivers/usb/storage/alauda.c                  |  252 +-
 drivers/usb/storage/cypress_atacb.c           |   66 +-
 drivers/usb/storage/datafab.c                 |  204 +-
 drivers/usb/storage/debug.c                   |   28 +-
 drivers/usb/storage/debug.h                   |   22 +-
 drivers/usb/storage/ene_ub6250.c              |  368 +-
 drivers/usb/storage/freecom.c                 |  226 +-
 drivers/usb/storage/initializers.c            |   42 +-
 drivers/usb/storage/initializers.h            |   18 +-
 drivers/usb/storage/isd200.c                  |  308 +-
 drivers/usb/storage/jumpshot.c                |  200 +-
 drivers/usb/storage/karma.c                   |   60 +-
 drivers/usb/storage/onetouch.c                |  128 +-
 drivers/usb/storage/option_ms.c               |   52 +-
 drivers/usb/storage/protocol.c                |   36 +-
 drivers/usb/storage/protocol.h                |   18 +-
 drivers/usb/storage/realtek_cr.c              |  198 +-
 drivers/usb/storage/scsiglue.c                |  120 +-
 drivers/usb/storage/scsiglue.h                |   16 +-
 drivers/usb/storage/sddr09.c                  |  242 +-
 drivers/usb/storage/sddr55.c                  |  212 +-
 drivers/usb/storage/shuttle_usbat.c           | 1074 +++---
 drivers/usb/storage/sierra_ms.c               |   58 +-
 drivers/usb/storage/transport.c               |  488 +--
 drivers/usb/storage/transport.h               |   58 +-
 drivers/usb/storage/uas-detect.h              |   62 +-
 drivers/usb/storage/uas.c                     |  262 +-
 drivers/usb/storage/unusual_alauda.h          |   12 +-
 drivers/usb/storage/unusual_cypress.h         |   16 +-
 drivers/usb/storage/unusual_datafab.h         |   36 +-
 drivers/usb/storage/unusual_devs.h            |  832 ++---
 drivers/usb/storage/unusual_ene_ub6250.h      |    8 +-
 drivers/usb/storage/unusual_freecom.h         |   12 +-
 drivers/usb/storage/unusual_isd200.h          |   30 +-
 drivers/usb/storage/unusual_jumpshot.h        |   10 +-
 drivers/usb/storage/unusual_karma.h           |    8 +-
 drivers/usb/storage/unusual_onetouch.h        |   14 +-
 drivers/usb/storage/unusual_realtek.h         |   32 +-
 drivers/usb/storage/unusual_sddr09.h          |   26 +-
 drivers/usb/storage/unusual_sddr55.h          |   16 +-
 drivers/usb/storage/unusual_uas.h             |   36 +-
 drivers/usb/storage/unusual_usbat.h           |   18 +-
 drivers/usb/storage/usb.c                     |  378 +-
 drivers/usb/storage/usb.h                     |   74 +-
 drivers/usb/storage/usual-tables.c            |   28 +-
 drivers/usb/typec/Kconfig                     |   54 +-
 drivers/usb/typec/altmodes/Kconfig            |    6 +-
 drivers/usb/typec/altmodes/displayport.c      |   28 +-
 drivers/usb/typec/altmodes/nvidia.c           |   14 +-
 drivers/usb/typec/bus.c                       |    8 +-
 drivers/usb/typec/bus.h                       |   10 +-
 drivers/usb/typec/class.c                     |  174 +-
 drivers/usb/typec/hd3ss3220.c                 |   40 +-
 drivers/usb/typec/mux.c                       |   32 +-
 drivers/usb/typec/mux/Kconfig                 |    8 +-
 drivers/usb/typec/mux/Makefile                |    2 +-
 drivers/usb/typec/mux/pi3usb30532.c           |   94 +-
 drivers/usb/typec/tcpm/Kconfig                |   26 +-
 drivers/usb/typec/tcpm/Makefile               |    2 +-
 drivers/usb/typec/tcpm/fusb302.c              |  836 ++---
 drivers/usb/typec/tcpm/fusb302_reg.h          |  332 +-
 drivers/usb/typec/tcpm/tcpci.c                |   10 +-
 drivers/usb/typec/tcpm/tcpci.h                |    8 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c        |    4 +-
 drivers/usb/typec/tcpm/tcpm.c                 |  154 +-
 drivers/usb/typec/tcpm/wcove.c                |  358 +-
 drivers/usb/typec/tps6598x.c                  |   18 +-
 drivers/usb/typec/ucsi/Kconfig                |   10 +-
 drivers/usb/typec/ucsi/displayport.c          |   16 +-
 drivers/usb/typec/ucsi/trace.h                |    2 +-
 drivers/usb/typec/ucsi/ucsi.c                 |   20 +-
 drivers/usb/typec/ucsi/ucsi.h                 |   16 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             |    6 +-
 drivers/usb/usb-skeleton.c                    |  176 +-
 drivers/usb/usbip/Kconfig                     |   68 +-
 drivers/usb/usbip/Makefile                    |   16 +-
 drivers/usb/usbip/stub.h                      |   16 +-
 drivers/usb/usbip/stub_dev.c                  |  108 +-
 drivers/usb/usbip/stub_main.c                 |   34 +-
 drivers/usb/usbip/stub_rx.c                   |  252 +-
 drivers/usb/usbip/stub_tx.c                   |   90 +-
 drivers/usb/usbip/usbip_common.c              |  272 +-
 drivers/usb/usbip/usbip_common.h              |  306 +-
 drivers/usb/usbip/usbip_event.c               |   96 +-
 drivers/usb/usbip/vhci.h                      |   44 +-
 drivers/usb/usbip/vhci_hcd.c                  |  524 +--
 drivers/usb/usbip/vhci_rx.c                   |   76 +-
 drivers/usb/usbip/vhci_sysfs.c                |   48 +-
 drivers/usb/usbip/vhci_tx.c                   |   64 +-
 drivers/usb/usbip/vudc.h                      |   42 +-
 drivers/usb/usbip/vudc_dev.c                  |  104 +-
 drivers/usb/usbip/vudc_main.c                 |    4 +-
 drivers/usb/usbip/vudc_rx.c                   |   74 +-
 drivers/usb/usbip/vudc_sysfs.c                |   48 +-
 drivers/usb/usbip/vudc_transfer.c             |   78 +-
 drivers/usb/usbip/vudc_tx.c                   |   64 +-
 764 files changed, 86304 insertions(+), 86304 deletions(-)

-- 
2.26.0

