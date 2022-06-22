Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3499554A6A
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 15:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349994AbiFVNEy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 09:04:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiFVNEv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 09:04:51 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2067EE0B3
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903089; x=1687439089;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cD6loB9Vms5aqUj8mQhHVmslSoLHNbSElmDSCr9sutQ=;
  b=C14ZGRY2nyeph3PikWO2y848yF7busbszglnaCb4lBsixba9Djm/zbxE
   L6BjoUN+VzKelQIRzKA2kfixkpn/9X4/yi3EDnzoDWLfjdT5+7abjPOgq
   PytYVQa9K/A1sgDjA/xe6KyZpkgREy8cVXbojb0TzWk2v05RtrejiUP0X
   I4XFd3k3MdMZstG9Is2zBfX/iDK/aOsYmwRh6/ptw0X8+1DM5qJ5ZCRRo
   NlrzNrECgUC1VO2CFxqPx9n9WYtzBcTUhDJZYFRbRSt3X2w7z7vv75gF3
   8JMZF9GY8n1eGUp4vfOsZO60X+jmrOoNTMWJSWQAjHVeOB7xL7KQnI28m
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605516"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 22 Jun 2022 15:04:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 22 Jun 2022 15:04:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903087; x=1687439087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cD6loB9Vms5aqUj8mQhHVmslSoLHNbSElmDSCr9sutQ=;
  b=P4vqNL7Of/XK6UOV51rEoDKR0CLNJnmsmoAmsyASCqaTOygwBWq9z4ic
   VZ5SwJKXy6lYEGnj5d7VQ4G2ssi4qk91P39K0eJqbn4ILBYarfjXE7gpX
   deHwjiDlTS4zeb1f7RlBUhosZ+W9BJZkIIAVXIw5m87Lzdxcs/p+QhQIv
   xPa12GK3u6qOJIEP3Pk+GTTbdVCHV+pjt2mzfMmOt8hV1N4smBaVDpUAx
   b3+xc4AXaA5IkCE0CsKlcqGH/ZCeiDDuu4GpJZEUcbG3xF2YF1SJvJ6m1
   Z0O7zo+HFwvvTcu70pL1U0+wvVnyxKbCNUvJ7xMegYR68qZ2D1WGswZGX
   A==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605515"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 23132280056;
        Wed, 22 Jun 2022 15:04:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 0/4] USB support for TQMa8MPxL + MBa8MPxL
Date:   Wed, 22 Jun 2022 15:04:36 +0200
Message-Id: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi everybody,

this is an RFC for USB support on TQMa8MPxL + MBa8MPxL. DT support is currently
in progress at [1]. This series is on top of that.
The DT configuration itself (patch 4) is rather straight forward, but leads to
the following dmesg errors regarding superspeed ports:
> [    8.549243] hub 2-1:1.0: hub_ext_port_status failed (err = -110)
> [   22.885263] usb 2-1: Failed to suspend device, error -110

This hardware works fine using the downstream kernel, because for imx8mp this
ITP sync feature is enabled conditionally [2] & [3].
Hacking this into mainline resulted in a working superspeed setup as well. I
also noticed that on some android kernel [4] depending in IP core version either
GCTL.SOFTITPSYNC or GFLADJ.GFLADJ_REFCLK_LPM_SEL is enabled unconditionally.
So I opted for the latter one using some quirk (patch 1-3).

I have to admit I do not know what this is actually about, nor why my setup
does not work without this change or why this fixed my problem. So maybe
someone with more knowledge can say if this is the way to go or what this is
about.

Note: I excluded the DT guys (for now) as this is more about usb internals, the
DT patches are for completeness.

Thanks and best regards,
Alexander

[1] https://patchwork.kernel.org/project/linux-arm-kernel/cover/20220622114949.889274-1-alexander.stein@ew.tq-group.com/
[2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/dwc3-imx8mp.c?h=lf-5.10.y#n134
[3] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n333
[4] https://android.googlesource.com/kernel/msm/+/87a6b154766907020cc74c7726e8a68aaa9d7f6b%5E%21/#F0

Alexander Stein (4):
  dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
  usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
  arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to USB nodes
  arm64: dts: tqma8mpql: add USB support

 .../devicetree/bindings/usb/snps,dwc3.yaml    |  5 ++
 .../freescale/imx8mp-tqma8mpql-mba8mpxl.dts   | 68 ++++++++++++++++++-
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  2 +
 drivers/usb/dwc3/core.c                       |  8 ++-
 drivers/usb/dwc3/core.h                       |  2 +
 5 files changed, 83 insertions(+), 2 deletions(-)

-- 
2.25.1

