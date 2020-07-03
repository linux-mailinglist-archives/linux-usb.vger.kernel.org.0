Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 794E9213EB1
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgGCRl6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726035AbgGCRl6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:41:58 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1871C061794
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:41:57 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id r12so33506487wrj.13
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=As4hY4i9MK8iV/24T8EMNeA73jw6PU1siON2AJDWkyg=;
        b=EAm+moPX549aWgfLSIIEtg1s6FbbNXpi4BLs2cMLGg3US93Xf2FKBNL7b/Ex6v/KGv
         OVyZGPU/1QIQ945gCBdqPI32KpoQA1qxSWRHxj8yCyPGAA35BXSjou9ybf+DbZ9eXAx5
         Nif/HVYYFPQg7gRjCW4iNAehlZYNqfzuqkwtK4akIOUBpUMGdMue6vb8z/pfCyAIwATE
         2j8rUQ8Gg2jG2EdyDFbOOW+SQXGF3K9OpOFejYx4DPzN99ttxXGC8l9IZadQ423lTr06
         mm5CBKMQOfyDp/2pJbPmHqi2Dn+2sDFQ118ZxYxTaQDG2hDXmQUv4+M0vHnwH/gzU2oO
         eO/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=As4hY4i9MK8iV/24T8EMNeA73jw6PU1siON2AJDWkyg=;
        b=NE8PsDt5I+LkB1nWtc9gdeAwTGmmCDfhzBwYT8jf8ZlsCGC3DZWeE1rs6LqkiA/d9d
         i7hLvJo/Pi8FQ9cJx1IM4F6Rng2eNn2HBnyKHVpTTSouNt8J/XtfSy1bGtB2Puh5kX3y
         z+6WiXirZOUx/OCtqxtD2j2Yx88dedx9/yZ+Z0fOLKToGLyxD8NgC0rkSm6RuWha1nDw
         6GKf1n1xoilh9yTT5TS9IZw4nxzIvP55DpoZeq0q2YhOdl5z7B5xuQh3hNFixpF95S/O
         iP05SV+O2sBPAM2daW3eD1nc5CdPdnXWpXtVyyqU69fjE0qm3cWARHG6DPNoSlctbiVD
         KISQ==
X-Gm-Message-State: AOAM530U3ADPruPgN3rKu66x10h/cz896lpRtvKFwU2aIXjjVPgnTHyY
        TuUD/VPLObMtSJq6FXBLJgf35A==
X-Google-Smtp-Source: ABdhPJxL+2NW/+3Cvrw8qiuUura3g5ZSBVYDIQcc5J8oi2F8pt9r+S3zJ9piJWXAJ7Eu5S5IpGYlyA==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr37168565wro.214.1593798116249;
        Fri, 03 Jul 2020 10:41:56 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:41:55 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 00/30] Fix a bunch more W=1 issues in USB
Date:   Fri,  3 Jul 2020 18:41:18 +0100
Message-Id: <20200703174148.2749969-1-lee.jones@linaro.org>
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
  usb: mtu3: mtu3_debug: Add forward declaration of 'struct ssusb_mtk'
  usb: host: ohci-s3c2410: Demote obvious misuse of kerneldoc to
    standard comment block
  usb: core: ledtrig-usbport: Demote obvious misuse of kerneldoc to
    standard comment blocks
  usb: misc: sisusbvga: sisusb_init: Mark all 'static const' arrays as
    __maybe_unused
  usb: atm: ueagle-atm: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: misc: adutux: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: chipidea: core: Document hw_port_test_set()'s missing 'ci'
    argument
  usb: gadget: udc: core: Fix a bunch of kerneldoc misdemeanours
  usb: chipidea: otg: Fix kerneldoc issues relating to description of
    'ci'
  usb: chipidea: debug: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: chipidea: udc: Add missing descriptions for function arg 'ci'
  usb: chipidea: udc: Help out kerneldoc headers that have tried, demote
    the others
  usb: host: xhci: Demote obvious misuse of kerneldoc to standard
    comment block
  usb: host: xhci-mem: Demote obvious misuse of kerneldoc to standard
    comment block
  usb: host: xhci-dbgcap: File headers are not good candidates for
    kerneldoc
  usb: host: xhci-dbgtty: File headers are not good candidates for
    kerneldoc
  usb: chipidea: udc: Fix a few kerneldoc issues
  usb: host: xhci-debugfs: Use 'gnu_printf' format notation
  usb: storage: alauda: Remove set but unchecked variable
  usb: typec: altmodes: displayport: File headers are not good
    candidates for kerneldoc
  usb: typec: altmodes: displayport: Supply missing displayport.h
    include file
  usb: typec: tcpm: fusb302: Use 'gnu_printf' format notation
  usb: chipidea: usbmisc_imx: Demote obvious misuse of kerneldoc to
    standard comment block
  usb: misc: iowarrior: Fix odd corruption issue in the file header
  usb: misc: iowarrior: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: gadget: function: u_serial: Repair misdocumented function
    argument
  usb: misc: ldusb: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: musb: musb_dsps: Demote obvious misuse of kerneldoc to standard
    comment blocks
  usb: gadget: usbstring: Repair misspelled function argument 'langid'
  usb: gadget: udc: dummy_hcd: Repair misspelled function argument
    'dummy_hcd'

 drivers/usb/atm/ueagle-atm.c             |  4 +-
 drivers/usb/chipidea/core.c              |  1 +
 drivers/usb/chipidea/debug.c             | 10 ++--
 drivers/usb/chipidea/otg.c               |  6 ++-
 drivers/usb/chipidea/udc.c               | 52 ++++++++++++-------
 drivers/usb/chipidea/usbmisc_imx.c       |  2 +-
 drivers/usb/core/ledtrig-usbport.c       |  6 +--
 drivers/usb/gadget/function/u_serial.c   |  2 +-
 drivers/usb/gadget/udc/core.c            | 18 ++++---
 drivers/usb/gadget/udc/dummy_hcd.c       |  2 +-
 drivers/usb/gadget/usbstring.c           |  2 +-
 drivers/usb/host/ohci-s3c2410.c          |  2 +-
 drivers/usb/host/xhci-dbgcap.c           |  2 +-
 drivers/usb/host/xhci-dbgtty.c           |  2 +-
 drivers/usb/host/xhci-debugfs.c          |  1 +
 drivers/usb/host/xhci-mem.c              |  2 +-
 drivers/usb/host/xhci.c                  |  2 +-
 drivers/usb/misc/adutux.c                |  6 +--
 drivers/usb/misc/iowarrior.c             | 16 +++---
 drivers/usb/misc/ldusb.c                 | 24 ++++-----
 drivers/usb/misc/sisusbvga/sisusb_init.h | 66 ++++++++++++------------
 drivers/usb/mtu3/mtu3_debug.h            |  2 +
 drivers/usb/musb/musb_dsps.c             |  8 +--
 drivers/usb/storage/alauda.c             |  3 +-
 drivers/usb/typec/altmodes/displayport.c |  3 +-
 drivers/usb/typec/tcpm/fusb302.c         |  1 +
 26 files changed, 134 insertions(+), 111 deletions(-)

-- 
2.25.1

