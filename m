Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7AAE350FD20
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 14:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350014AbiDZMi2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 08:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347148AbiDZMi0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 08:38:26 -0400
Received: from pnkfpffh.outbound-mail.sendgrid.net (pnkfpffh.outbound-mail.sendgrid.net [50.31.63.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CD92261F
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 05:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=s1; bh=UM3WO5Rdk0FcgGPqPdNTy1fKqZIy1X8oS4grG46SWpM=;
        b=Uj27L54v5UJZd+nIrTr4gHzf7s2/JOP14jrNhg0FOkAJt84Tp4DSavGlIui9gubu/PHH
        h1Zl7dPGVR00Rm82sbBjBZD8fpDrwRrmRzgDASQ6QhS5zVfg1z0+kDA6yRzbiKQ2dwLezV
        D9vp7JYlDeWICRSY8HeY3WMr+wDEU0aIKdAp9IgukkT4V+zGBYAhNIJmxAFlWD1Jzq+vbE
        6Vx182UVIPekWLCtjcThw4C1SiWJKRjW1DyJa4lUOjSY2V/hb9Yr8xzqyDyD/i3/DdgZvE
        97WxDGvoCtZ+uZ5E6qEcRhTP+bV2cERaGGG5N2niMNPmMxFhOuCqDS/gNRNvBiBA==
Received: by filterdrecv-5645d9c87f-64zxs with SMTP id filterdrecv-5645d9c87f-64zxs-1-6267E6A6-2B
        2022-04-26 12:33:42.514119269 +0000 UTC m=+1694971.141824537
Received: from midgard.internal.axentia.se (unknown)
        by geopod-ismtpd-3-0 (SG) with ESMTP
        id Mn_eKhEkRuKJd9Z74ebuYQ
        Tue, 26 Apr 2022 12:33:42.128 +0000 (UTC)
From:   Daniels Umanovskis <du@axentia.se>
Subject: [PATCH 0/2] usb: usb251xb: configurable reset delay
Date:   Tue, 26 Apr 2022 12:33:42 +0000 (UTC)
Message-Id: <20220426123329.775-1-du@axentia.se>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?Q0J120W4ZU2dvxvzBhStZcyp23eAYLPzAz2fSUg6MjfeWGicT4FGxyT7O14zxp?=
 =?us-ascii?Q?kiRPCLaCzZjS7wquF0+OL7XucdVdgT6qp07OX2r?=
 =?us-ascii?Q?vbce6gwmHuPZm5HUQjLGS+z18dTumHYZcrqhLKO?=
 =?us-ascii?Q?Ho=2FXSnbo7U2PM5Ou4ZBNeIE0FjZC=2FfvVYtcTG+3?=
 =?us-ascii?Q?fxBz7p7sTCpSGmAghK=2FVO8CSrgoqhe6iyPVM4Gh?=
 =?us-ascii?Q?E95wkyeJiZot7NirTtSbVq8tVNvuqprydLDHpf?=
To:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Daniels Umanovskis <du@axentia.se>
X-Entity-ID: eEMfc9IaaDEroFpbtZJ/HA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Microchip USB251xB hub, according to its datasheet, is operational
500us after deasserting reset on startup and can then be attached or
configured.

I ran into a batch of such hubs, of the 2512Bi variant,
that didn't appear to work or only worked sporadically. Debugging the
issue revealed that these specific hubs do not typically manage to
reset within 500us. Instead they become operational 800us
or so after deasserting the RESET_N signal.

This is probably a faulty batch of the chips but making the reset delay
configurable through dt bindings allows these chips to be used.

Daniels Umanovskis (2):
  dt-bindings: usb: usb251xb: add documentation for reset-delay-us
  usb: usb251xb: make power-up reset delay configurable in device tree

 Documentation/devicetree/bindings/usb/usb251xb.txt | 2 ++
 drivers/usb/misc/usb251xb.c                        | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.30.2

