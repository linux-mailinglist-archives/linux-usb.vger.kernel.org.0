Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A11965E8B7D
	for <lists+linux-usb@lfdr.de>; Sat, 24 Sep 2022 12:29:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbiIXK30 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Sep 2022 06:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230469AbiIXK3X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Sep 2022 06:29:23 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6571311ED77
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 03:29:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1E5A3B81028
        for <linux-usb@vger.kernel.org>; Sat, 24 Sep 2022 10:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAE1C43470;
        Sat, 24 Sep 2022 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664015359;
        bh=kOPdef61u9J3NjrGOgmrag2fBIjSFkVPOz6ll926H5Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dtC0+FwJhzSsxre81UO4oHzcdch/NQHtHTP5kosygArwuh/JFpsCA0+ooym5m9xlL
         rGeRV2H1+xCvSaRh8d2rP07omaTtSBZiTCiQ0zFxnD1pakCa4/CK100FTrCEvai7Na
         bEmsrMEqvkbVoFmKRywyJVw/jBC/O1DwMn758T69B+vN8JB3RaTKqNTvPFLS5dBQcu
         ptJUhx+BJNxjxeR7Ej5uBNvpQC/CRvU+z+uphOaXAqRemhzpj+7TAs2srXM7kS51/G
         2UXyNVpOK4X4h2xBi1rFqgDg9oGV8/132a9n024JRiEooLD9s9+zjbArttjnHOs/Vd
         XCidMG6foOh1w==
Received: by pali.im (Postfix)
        id 951051113; Sat, 24 Sep 2022 12:29:16 +0200 (CEST)
From:   =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH v3 1/7] USB: serial: ftdi_sio: Fix divisor overflow
Date:   Sat, 24 Sep 2022 12:27:12 +0200
Message-Id: <20220924102718.2984-2-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220924102718.2984-1-pali@kernel.org>
References: <20220924102718.2984-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The baud rate generating divisor is a 17-bit wide (14 bits integer part
and 3 bits fractional part).

Example:
  base clock = 48 MHz
  requested baud rate = 180 Baud
  divisor = 48,000,000 / (16 * 180) = 0b100000100011010.101

  In this case the MSB gets discarded because of the overflow, and the
  actually used divisor will be 0b100011010.101 = 282.625, resulting
  in baud rate 10615 Baud, instead of the requested 180 Baud.

The best possible thing to do in this case is to generate lowest possible
baud rate (in the example it would be 183 Baud), by using maximum possible
divisor.

In case of divisor overflow, use maximum possible divisor.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Pali Rohár <pali@kernel.org>
Tested-by: Marek Behún <kabel@kernel.org>
Signed-off-by: Marek Behún <kabel@kernel.org>
Cc: stable@vger.kernel.org
---
 drivers/usb/serial/ftdi_sio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 52d59be92034..b2febe8d573a 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1162,6 +1162,8 @@ static unsigned short int ftdi_232am_baud_base_to_divisor(int baud, int base)
 	int divisor3 = DIV_ROUND_CLOSEST(base, 2 * baud);
 	if ((divisor3 & 0x7) == 7)
 		divisor3++; /* round x.7/8 up to x+1 */
+	if (divisor3 > GENMASK(16, 0))
+		divisor3 = GENMASK(16, 0);
 	divisor = divisor3 >> 3;
 	divisor3 &= 0x7;
 	if (divisor3 == 1)
@@ -1186,6 +1188,8 @@ static u32 ftdi_232bm_baud_base_to_divisor(int baud, int base)
 	u32 divisor;
 	/* divisor shifted 3 bits to the left */
 	int divisor3 = DIV_ROUND_CLOSEST(base, 2 * baud);
+	if (divisor3 > GENMASK(16, 0))
+		divisor3 = GENMASK(16, 0);
 	divisor = divisor3 >> 3;
 	divisor |= (u32)divfrac[divisor3 & 0x7] << 14;
 	/* Deal with special cases for highest baud rates. */
@@ -1209,6 +1213,8 @@ static u32 ftdi_2232h_baud_base_to_divisor(int baud, int base)
 
 	/* hi-speed baud rate is 10-bit sampling instead of 16-bit */
 	divisor3 = DIV_ROUND_CLOSEST(8 * base, 10 * baud);
+	if (divisor3 > GENMASK(16, 0))
+		divisor3 = GENMASK(16, 0);
 
 	divisor = divisor3 >> 3;
 	divisor |= (u32)divfrac[divisor3 & 0x7] << 14;
-- 
2.20.1

