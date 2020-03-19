Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC03718B974
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2020 15:34:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727388AbgCSOeQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 19 Mar 2020 10:34:16 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43516 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgCSOeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 19 Mar 2020 10:34:16 -0400
Received: by mail-wr1-f66.google.com with SMTP id b2so3261274wrj.10;
        Thu, 19 Mar 2020 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nfQ6F2PE338m3GErOu5+Kdz+or/DSCE2c+Aqh0n3mQo=;
        b=c1iaYYi5ynzFZcQB07mx8mY6EY3n7OACdAlYOfRwvgtye7XpvgD8bLsYpzsNp0s5JO
         pjVEzB0aGKwtyDVwm+V3Xsvw6PeR++F4meHBS4PrFjgl3Mdf9D6XqbymrlBqB2pSH3H1
         abg+AZkBgUYuI6/8MCWsVEC70uATBNZrXWpx8SIhSVAJzg8G/3xYrhhzhqX90Oe65ltu
         hXEkE/41+TTkA4Zm6ZC7Hl6lRXlVJ962KEb3F3MB3trbMutHdNK2y6Syc4SKrwcKdWio
         llVe92kLWS0bzTyzR8wRbSdXLB32nsZiphrsYTCgLEGvr2b+dA+sFNxtIIYIfXK+MDeC
         Bo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nfQ6F2PE338m3GErOu5+Kdz+or/DSCE2c+Aqh0n3mQo=;
        b=dEI0QZN5FcuiNogNMp+mlBSTSdnWNTmWVGEX91dEPcYzM42AoUycOhYT+1UBNFRnEX
         OiVeLOtXG+BpWi9D7IJr2YoIXuuTqayOYyC3HYHzTPw9q7bqGlPGtrTFqi+polt4/V6I
         zIMbFiULpP2Tezwi6VwenMYg3HKllpi4MT1/EW1FsM7iOZayyW8bomAAOFITcFzAAGYd
         MohDLP8QMNMgeJb3aJ0VSTs+5vNSGf0Tiy6HLBEZfdoDCdGwMqH/Z4Ub31EHdOJI3Y9F
         T8jwbULMX2b3agr5Gb1i//EzvZEc/inG+GB5lXiOkRGOKALF0+JNEi9cM1YsiNqpEGHz
         hXRA==
X-Gm-Message-State: ANhLgQ3axA17J0jtSnbnVBxul6XEghuOSM3d6D1cOlKqsdWY1KXZa8m7
        ywsbOtVhe0EF+QmVODgMnuE=
X-Google-Smtp-Source: ADFU+vtp1QtBKRUdVMKTXLskPJNrpnN3gIf9lf4RFJVel7GM0EiE9OR/YeJ5oBMLTZ6m+z3XqUApSw==
X-Received: by 2002:a5d:4842:: with SMTP id n2mr4598564wrs.112.1584628453603;
        Thu, 19 Mar 2020 07:34:13 -0700 (PDT)
Received: from localhost (pD9E51CDC.dip0.t-ipconnect.de. [217.229.28.220])
        by smtp.gmail.com with ESMTPSA id p15sm3636936wro.68.2020.03.19.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 07:34:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL v2] usb: tegra: Changes for v5.7-rc1
Date:   Thu, 19 Mar 2020 15:34:11 +0100
Message-Id: <20200319143411.3266037-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313170730.2924259-1-thierry.reding@gmail.com>
References: <20200313170730.2924259-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg, Felipe,

The following changes since commit ca9e742b5c27c230b0bf003aecba2433a60ba837:

  USB: c67x00: Use the correct style for SPDX License Identifier (2020-03-17 20:03:28 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.7-usb-v2

for you to fetch changes up to b4e19931c98a088fbd80b5c3f892261c9a0e6c23:

  usb: gadget: tegra-xudc: Support multiple device modes (2020-03-19 14:18:57 +0100)

This is a version of the earlier pull request[0], rebased on top of
Greg's usb-next branch and the resulting conflicts resolved. I've also
added a couple of patches in here that fix minor issues that were
reported since last week.

Thanks,
Thierry

----------------------------------------------------------------
usb: tegra: Changes for v5.7-rc1

These changes add USB OTG support for the XUSB host and XUSB device
controllers found on NVIDIA Tegra SoCs.

----------------------------------------------------------------
Corentin Labbe (1):
      phy: tegra: Select USB_PHY

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

Thierry Reding (4):
      phy: tegra: Print -EPROBE_DEFER error message at debug level
      phy: tegra: Fix regulator leak
      phy: tegra: Don't use device-managed API to allocate ports
      Merge branch 'for-5.7/phy' into for-5.7/usb

 drivers/phy/tegra/Kconfig           |   2 +
 drivers/phy/tegra/Makefile          |   1 +
 drivers/phy/tegra/xusb-tegra124.c   |   6 +
 drivers/phy/tegra/xusb-tegra186.c   | 265 ++++++++++++++++++++++++++--------
 drivers/phy/tegra/xusb-tegra210.c   | 136 ++++++++++++++----
 drivers/phy/tegra/xusb.c            | 263 +++++++++++++++++++++++++++++++++-
 drivers/phy/tegra/xusb.h            |  25 ++++
 drivers/usb/gadget/udc/Kconfig      |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c | 275 ++++++++++++++++++++++++------------
 drivers/usb/host/xhci-tegra.c       | 228 +++++++++++++++++++++++++++++-
 include/linux/phy/tegra/xusb.h      |   2 +
 11 files changed, 1024 insertions(+), 180 deletions(-)
