Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464E32126F0
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 16:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729910AbgGBOqb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 10:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729908AbgGBOqa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 10:46:30 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07445C08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  2 Jul 2020 07:46:30 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id w3so15820926wmi.4
        for <linux-usb@vger.kernel.org>; Thu, 02 Jul 2020 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxQUrFUHojhxAJjrZVe9SERt2Gz5Hxh7N9BqgnXWQ4I=;
        b=PbxWD7XWYOoiXaa68JGMYTP7VIRMea/cI8ollGsySgvw9apT8lKhJ29TCzF2y/TP0T
         mfVj4TvNq1WK+Hs0KYonxqndTJ17CxAtJEKmkDbEi1Io8+KSxQJyRHMdrHOukeSDdOzi
         Cx2We2TE1e+OA+EE1h18/U8qsR3Vd6D7OIixq2ijGobzhjAgbcI7nrgCrBJAtdLdni5w
         bNTkVjnZ3EruhDZtbK3YGlS5ccpFqkB/q+db2esd5AMu2CIarfE2wpeeExWurIwnyknB
         xz4Xdz1bfprkxdEuPNArH6s9AsklJ6SDss9zHDSZduwJRRNrIDB3lanwFsPgDLzkXpfQ
         hjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YxQUrFUHojhxAJjrZVe9SERt2Gz5Hxh7N9BqgnXWQ4I=;
        b=eN+B0wAiEPG69ccEr1VhCahPxqHaHgHsHg3hGJa8+8ygKk5qtOM72JJQyHHjAVEsMX
         FQBfMrkpyMuYMj8RWxJRNbID7Pn9+w8WcFjL73VkFKfD4lm0GPugFJYqgkY8DGZ0vEXb
         h9qJEPbPr5N29zmG7Eon2tIA+v00CgDMu9r5nY8jS3QgEtl0TPnxAv0Ioo/IpL3nL2ni
         pEjFixhnkhPJhvUiUlbuOtVI9taArrF8gupE1DHY1MRfuO5+sX5SsAKyvIJZUceJO4Jr
         2LVndLE81wXSGtxtgwZ7qZzkoqG99hUmPSY+K3bbdDMMNQKKM+4p5Z0XRm0r2wODtgKm
         A9LQ==
X-Gm-Message-State: AOAM533l8lMzbZ8N7u+KqxlIrHCPESwRNJ489sPOi8S9gZck4V2MkiUY
        432fVtE8VwuNfLwLqJNm2RJlUg==
X-Google-Smtp-Source: ABdhPJwbH8oy0oeGJEOQ74bSYU70r0nhOOUVOMNBDTT7apYm5WiPReqtn+KFNi+kV8uNdA6g+K+ENw==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr30458048wmb.3.1593701188661;
        Thu, 02 Jul 2020 07:46:28 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id g14sm7002737wrw.83.2020.07.02.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2020 07:46:28 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 00/30] Fix a bunch of W=1 issues in USB
Date:   Thu,  2 Jul 2020 15:45:55 +0100
Message-Id: <20200702144625.2533530-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (30):
  usb: phy: phy: Fix-up a whole bunch of formatting issues
  usb: host: pci-quirks: Demote function header from kerneldoc to
    comment block
  usb: common: debug: Demote comment blocks which are obviously not
    kerneldoc
  usb: common: usb-conn-gpio: Demote comment block which is clearly not
    kerneldoc
  usb: dwc3: drd: File headers are not doc headers
  usb: dwc3: ulpi: File headers are not doc headers
  usb: common: ulpi: Fix a few kerneldoc related issues
  usb: dwc3: dwc3-omap: Do not read DMA status
  usb: dwc2: gadget: Do not read GINTMSK2
  usb: dwc2: gadget: Remove assigned but never used 'maxsize'
  usb: dwc2: gadget: Avoid pointless read of EP control register
  usb: host: ehci-omap: Provide documentation for
    ehci_hcd_omap_probe()'s arg 'pdev'
  usb: cdns3: core: Fix incorrect formatting and misspelled function arg
    docs
  usb: cdns3: ep0: Fix a bunch of kerneldoc issues
  usb: dwc3: dwc3-haps: Function headers are not suitable for kerneldoc
  usb: mtu3: mtu3_trace: Function headers are not suitable for kerneldoc
  usb: cdns3: gadget: Fix a bunch of kernel doc issues
  usb: dwc3: dwc3-of-simple: Function headers are not good candidates
    for kerneldoc
  usb: host: isp1362: Mark the many unused ISP1362_REG entries as
    __maybe_unused
  usb: host: ohci-at91: Demote kerneldoc headers down to basic comment
    blocks
  usb: host: ohci: Mark cc_to_error as __maybe_unused
  usb: cdns3: ep0: Move 'zlp' description to appropriate function header
  usb: host: oxu210hp-hcd: Move declaration of 'qtd' into 'ifdef
    OXU_URB_TRACE'
  usb: mtu3: mtu3_trace: Supply missing mtu3_debug.h include file
  usb: mtu3: mtu3_core: Demote obvious misuse of kerneldoc to standard
    comment block
  usb: c67x00: c67x00-ll-hpi: Demote obvious misuse of kerneldoc to
    standard comment blocks
  usb: class: cdc-wdm: Provide description for usb_cdc_wdm_register()'s
    manage_power arg
  usb: c67x00: c67x00-hcd: Demote obvious misuse of kerneldoc to
    standard comment blocks
  usb: class: usbtmc: File headers are not good candidates for kerneldoc
  usb: c67x00: c67x00-sched: Demote obvious misuse of kerneldoc to
    standard comment blocks

 drivers/usb/c67x00/c67x00-hcd.c    |  6 ++--
 drivers/usb/c67x00/c67x00-ll-hpi.c |  6 ++--
 drivers/usb/c67x00/c67x00-sched.c  | 26 ++++++++--------
 drivers/usb/cdns3/core.c           |  8 ++---
 drivers/usb/cdns3/ep0.c            | 12 ++++++--
 drivers/usb/cdns3/gadget.c         | 11 ++++---
 drivers/usb/class/cdc-wdm.c        |  3 +-
 drivers/usb/class/usbtmc.c         |  2 +-
 drivers/usb/common/debug.c         |  4 +--
 drivers/usb/common/ulpi.c          |  5 +--
 drivers/usb/common/usb-conn-gpio.c |  2 +-
 drivers/usb/dwc2/gadget.c          |  7 +----
 drivers/usb/dwc3/drd.c             |  2 +-
 drivers/usb/dwc3/dwc3-haps.c       |  2 +-
 drivers/usb/dwc3/dwc3-of-simple.c  |  2 +-
 drivers/usb/dwc3/dwc3-omap.c       |  7 +----
 drivers/usb/dwc3/ulpi.c            |  2 +-
 drivers/usb/host/ehci-omap.c       |  1 +
 drivers/usb/host/isp1362.h         |  2 +-
 drivers/usb/host/ohci-at91.c       |  5 ++-
 drivers/usb/host/ohci.h            |  2 +-
 drivers/usb/host/oxu210hp-hcd.c    |  7 ++---
 drivers/usb/host/pci-quirks.c      |  2 +-
 drivers/usb/mtu3/mtu3_core.c       |  2 +-
 drivers/usb/mtu3/mtu3_trace.c      |  3 +-
 drivers/usb/phy/phy.c              | 49 +++++++++++++++---------------
 26 files changed, 90 insertions(+), 90 deletions(-)

-- 
2.25.1

