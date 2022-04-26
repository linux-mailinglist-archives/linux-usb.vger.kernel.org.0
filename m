Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B5550FD1F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 14:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350010AbiDZMia (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Apr 2022 08:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349998AbiDZMi3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 08:38:29 -0400
Received: from pnkfpffh.outbound-mail.sendgrid.net (pnkfpffh.outbound-mail.sendgrid.net [50.31.63.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0378F26D9
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
        h=from:subject:in-reply-to:references:mime-version:to:cc:
        content-transfer-encoding:content-type;
        s=s1; bh=RrLMc7YEIvvrCxGx5Vwj3xRkR1+bqOfHKLFzXrdpbc0=;
        b=JExwz+2Zp38GBYLC7qxDXGqnaC+kYd+Vgw5thPttIvV06mAg9iiDULtYG3Y+9sKpSzA+
        LJ+OR5c3DcufKyBCQu2zQjFuVRChvfmJEaXwA9ONgjc+xF1qVjR2ZphrBwMQzkP5ZnXxH9
        ekTdwO8I9esgu+xhQEjpNh1DTBy/exjD6AuhSVSaObcxoSAdwwEsskFoeWVbHL3Z5UfQbJ
        JOCeDEp8Q0SKNfcN/vcj4ohkCAJ4uK6aHGq7IATwP1J3nZVOOYvEJIwqPtOaIqUC7ZnH9r
        KrJdbFuUGNyQfRGPHbBA2NvG5ue5UwcWiKTpSxw5ZZrNCDIMK1DKlW9iVqE5N4Fg==
Received: by filterdrecv-5645d9c87f-rl4kk with SMTP id filterdrecv-5645d9c87f-rl4kk-1-6267E6AB-33
        2022-04-26 12:33:47.465219873 +0000 UTC m=+1694969.561547146
Received: from midgard.internal.axentia.se (unknown)
        by geopod-ismtpd-3-0 (SG) with ESMTP
        id 5DhQvuEGSQ6Q4oyZMYJApQ
        Tue, 26 Apr 2022 12:33:47.159 +0000 (UTC)
From:   Daniels Umanovskis <du@axentia.se>
Subject: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Date:   Tue, 26 Apr 2022 12:33:47 +0000 (UTC)
Message-Id: <20220426123329.775-2-du@axentia.se>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220426123329.775-1-du@axentia.se>
References: <20220426123329.775-1-du@axentia.se>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?Q0J120W4ZU2dvxvzBhStZcyp23eAYLPzAz2fSUg6MjfeWGicT4FGxyT7O14zxp?=
 =?us-ascii?Q?kiRPCLaCzZjS7wquF0+OL7Xp00izHgGiJjr0TiV?=
 =?us-ascii?Q?txcuoH0pMBLfwrhU1JicvAcZctNDMtA2jP0=2FlVb?=
 =?us-ascii?Q?nDySQ1d7SNciRCIuoSK1+7jldW9fJ7GuQP=2FzMQz?=
 =?us-ascii?Q?t477atn2gjZldKEvLuw5J1U5xwD7u9alVic5ycJ?=
 =?us-ascii?Q?IRO6xTg0GddkDtqxOST77UZJ1VGPcAgjOeHidJ?=
To:     richard.leitner@skidata.com, linux-usb@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Daniels Umanovskis <du@axentia.se>
X-Entity-ID: eEMfc9IaaDEroFpbtZJ/HA==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Next patch implements support for this property

Signed-off-by: Daniels Umanovskis <du@axentia.se>
---
 Documentation/devicetree/bindings/usb/usb251xb.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/usb251xb.txt b/Documentation/devicetree/bindings/usb/usb251xb.txt
index 1a934eab175e..d95c8ae518e7 100644
--- a/Documentation/devicetree/bindings/usb/usb251xb.txt
+++ b/Documentation/devicetree/bindings/usb/usb251xb.txt
@@ -12,6 +12,8 @@ Required properties :
 
 Optional properties :
  - reset-gpios : Should specify the gpio for hub reset
+ - reset-delay-us: Specifies delay in microseconds after reset deassert
+        on hub power-up. (32 bit, default is 500us)
  - vdd-supply : Should specify the phandle to the regulator supplying vdd
  - skip-config : Skip Hub configuration, but only send the USB-Attach command
  - vendor-id : Set USB Vendor ID of the hub (16 bit, default is 0x0424)
-- 
2.30.2

