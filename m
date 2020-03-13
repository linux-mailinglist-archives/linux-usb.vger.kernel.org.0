Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9B9184D44
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2020 18:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgCMRHf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Mar 2020 13:07:35 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:53501 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgCMRHe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Mar 2020 13:07:34 -0400
Received: by mail-wm1-f65.google.com with SMTP id 25so10808384wmk.3;
        Fri, 13 Mar 2020 10:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SftGljlnlL7hMnN4mOOIGMf/UgKRZHL5wuxB7TMWOqQ=;
        b=nYqUPZVuYxN6szJQeHIaUPARwytJHySa7CM99anocIVEvJEkSbhiR1VYEZd9Y8ukWZ
         gfRdfo5L8R4p3/HukQelSvlqnG3iLoV+QqWcsOCXc8ABunhEh9Jz4w7/UqDs+B5x4414
         v8AoI6BXa2i78Rd3HI6FMDQ40cLjqt+buYb1KG8p/77hPbiJeRYi8XqNPSTCjA7//ZLT
         y4vTLCKSVMtoZiYC4SpM1v7RaKzc3kvyKYgHxDFBNcPqUMoXHsgnAFoNx+sBtjBDHOB+
         7Ui9cWGrQyPCvJ78Fp5HYqTQRT4cdeVAyIWFcakkq3nTZ4jtED/T7I94L84ojv/syx9v
         apAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SftGljlnlL7hMnN4mOOIGMf/UgKRZHL5wuxB7TMWOqQ=;
        b=M5kfs6Kow8l/7vCfaepLk9F4MlilyzoEg9U9AAVUynRh61x8Jrg4p7mtpR8ubHMyry
         dpMcRDQpVDs0t0DCZbAOeceQ1G7LcplsIJ9klQVbQS/P7n3S9ypUSltybYzeimH8PFPj
         TwiTpIK5vaFLz+kb+uhxqJ1Id5NoOkg7GzfgMi8QHnKBoGYVCVYacm9PjWHyOtBUKz3t
         sS7kvqhLBre0c8dfJafaAtUi90QJy/haV7zxskWzoDJTLKawOdcu6riXJrKtv2TGUw1G
         hBc68TcK0wYm1Dv2LEGPemtk3ebznJXY+MTR3M7HZaY/azhJWXgEuxhXeQ5NBCJn9vrI
         l+3A==
X-Gm-Message-State: ANhLgQ18cpBP5UB66JoTrkbt1y3tCGTwZTONXF6QO5Vn0QxjBplaXmnB
        ICYDPBdv9r5iGwc7/zgySk4=
X-Google-Smtp-Source: ADFU+vv5yr0dpy28YsR7Pkj4nv5g/iVBy3bk0E8bgCYHd8ogJ5JRgvmS64hbXxHshk533tHdSWdAHw==
X-Received: by 2002:a7b:cc8a:: with SMTP id p10mr11763201wma.10.1584119252659;
        Fri, 13 Mar 2020 10:07:32 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id y69sm18262525wmd.46.2020.03.13.10.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2020 10:07:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] usb: tegra: Changes for v5.7-rc1
Date:   Fri, 13 Mar 2020 18:07:30 +0100
Message-Id: <20200313170730.2924259-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg, Felipe,

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.7-usb

for you to fetch changes up to 9dd4fbef2f88ccf46f5294805bf121d6554791e8:

  usb: gadget: tegra-xudc: Support multiple device modes (2020-03-13 17:16:28 +0100)

It occurred to me that I could just as well send this pull request to
you guys, rather than take it via ARM SoC. Kishon already acked all the
patches for the PHY tree that this series depends on, so I've included
them here as a dependency.

Let me know if you'd prefer that I take this through ARM SoC.

Thanks,
Thierry

----------------------------------------------------------------
usb: tegra: Changes for v5.7-rc1

These changes add USB OTG support for the XUSB host and XUSB device
controllers found on NVIDIA Tegra SoCs.

----------------------------------------------------------------
JC Kuo (2):
      phy: tegra: xusb: Protect Tegra186 soc with config
      phy: tegra: xusb: Add Tegra194 support

Jon Hunter (1):
      phy: tegra: xusb: Don't warn on probe defer

Nagarjuna Kristam (10):
      phy: tegra: xusb: Add usb-role-switch support
      phy: tegra: xusb: Add usb-phy support
      phy: tegra: xusb: Add support to get companion USB 3 port
      phy: tegra: xusb: Add set_mode support for USB 2 phy on Tegra210
      phy: tegra: xusb: Add set_mode support for UTMI phy on Tegra186
      usb: xhci-tegra: Add OTG support
      usb: gadget: tegra-xudc: Remove usb-role-switch support
      usb: gadget: tegra-xudc: Add usb-phy support
      usb: gadget: tegra-xudc: Use phy_set_mode() to set/unset device mode
      usb: gadget: tegra-xudc: Support multiple device modes

Thierry Reding (1):
      Merge branch 'for-5.7/phy' into for-5.7/usb

 drivers/phy/tegra/Kconfig           |   1 +
 drivers/phy/tegra/Makefile          |   1 +
 drivers/phy/tegra/xusb-tegra186.c   | 261 ++++++++++++++++++++++++++--------
 drivers/phy/tegra/xusb-tegra210.c   | 131 +++++++++++++----
 drivers/phy/tegra/xusb.c            | 189 +++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h            |  10 ++
 drivers/usb/gadget/udc/Kconfig      |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c | 273 +++++++++++++++++++++++++-----------
 drivers/usb/host/xhci-tegra.c       | 228 +++++++++++++++++++++++++++++-
 include/linux/phy/tegra/xusb.h      |   2 +
 10 files changed, 926 insertions(+), 171 deletions(-)
