Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB069271628
	for <lists+linux-usb@lfdr.de>; Sun, 20 Sep 2020 19:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgITRBJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Sep 2020 13:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726311AbgITRBJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Sep 2020 13:01:09 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C64C061755
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2020 10:01:09 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id y15so10225924wmi.0
        for <linux-usb@vger.kernel.org>; Sun, 20 Sep 2020 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuDM+KMkFfVRc1GQXPuWk9d5jae9Nh20MzSdVMI3z1E=;
        b=MLW8LAYDwwrFegjMJvXGhobC/Gj5SsM4SN+dElbJej7l4XEsPqZSncEvpQ8Nfj2UNs
         h8URK2FDbbxprZTnjNbqXYmseRICZVQs/kFNp15e/fMa6U3UuznB+l4+Jk31SjBNklHg
         bK1vQ+aulP7jXa2asVzSLWi/GjhAMCPv58l3LFNS5wY655H6W+x0mfATxPmkGlcACn+q
         eje7ECJVKTNfkHp8BBB69srW6j32PntRSi+IDV7JBfuvp9E/1Iq+ZEJ4RjsMdFdFffdw
         wPNFJRbUMfytQ/cp8XZuyLUvemdkXky8A/xLGPrpQlyKeeZ69ownxOIVlOB5WvQ8CvTP
         ykwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KuDM+KMkFfVRc1GQXPuWk9d5jae9Nh20MzSdVMI3z1E=;
        b=N6Cjeti8i+iR5X/uFX4QCjK6ig8Y3w745R05EWVXnK16vaa7jqJePXrJLsmcsI7p+Y
         2wYC+223DZeP0iDOGVZIG3V/ZFL+H8FkFORhBQNzSWlQ1xIWYma/jjT5j0PKz64KMtO+
         3zF6iaskJiteV+nSlj1nawtdJtrLrakIwQ9riafHHkmZkKjx3aJWYQUUUXk+gLznpam1
         1ymu1RhCyuMm9tCf+lTitSUiDv1MIzQVCmrA88zKacvZukCcZIHIRrGRA7SRuPMczbyd
         bHIHoxyjBE7A7eppvUW0STYbe7dYWVFBbMZlxJWY7GdpmghJn5ebBl2XPz/OQLrJ56uQ
         faQQ==
X-Gm-Message-State: AOAM530mOuvesX1vxunAolUmBjd/oaelxYTiOX3hU0QLjQCj9GM40Tfl
        3flCoRwjkQY66Zm3jTPkQHVP83BEZDL/xotE
X-Google-Smtp-Source: ABdhPJzSF/o3ndc5DbV/Vs8JSV0ZCskRRiIGD9scBZTNPTuympsPcEbVhyPAZfUloB1APLs7H5r6Qg==
X-Received: by 2002:a1c:4e16:: with SMTP id g22mr24707780wmh.99.1600621267820;
        Sun, 20 Sep 2020 10:01:07 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o4sm15628555wru.55.2020.09.20.10.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2020 10:01:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Ilja Van Sprundel <ivansprundel@ioactive.com>,
        Brooke Basile <brookebasile@gmail.com>,
        stable <stable@kernel.org>
Subject: [PATCH] USB: gadget: f_ncm: Fix NDP16 datagram validation
Date:   Sun, 20 Sep 2020 18:01:58 +0100
Message-Id: <20200920170158.1217068-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

commit 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
adds important bounds checking however it unfortunately also introduces  a
bug with respect to section 3.3.1 of the NCM specification.

wDatagramIndex[1] : "Byte index, in little endian, of the second datagram
described by this NDP16. If zero, then this marks the end of the sequence
of datagrams in this NDP16."

wDatagramLength[1]: "Byte length, in little endian, of the second datagram
described by this NDP16. If zero, then this marks the end of the sequence
of datagrams in this NDP16."

wDatagramIndex[1] and wDatagramLength[1] respectively then may be zero but
that does not mean we should throw away the data referenced by
wDatagramIndex[0] and wDatagramLength[0] as is currently the case.

Breaking the loop on (index2 == 0 || dg_len2 == 0) should come at the end
as was previously the case and checks for index2 and dg_len2 should be
removed since zero is valid.

I'm not sure how much testing the above patch received but for me right now
after enumeration ping doesn't work. Reverting the commit restores ping,
scp, etc.

The extra validation associated with wDatagramIndex[0] and
wDatagramLength[0] appears to be valid so, this change removes the incorrect
restriction on wDatagramIndex[1] and wDatagramLength[1] restoring data
processing between host and device.

Fixes: 2b74b0a04d3e ("USB: gadget: f_ncm: add bounds checks to ncm_unwrap_ntb()")
Cc: Ilja Van Sprundel <ivansprundel@ioactive.com>
Cc: Brooke Basile <brookebasile@gmail.com>
Cc: stable <stable@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/usb/gadget/function/f_ncm.c | 30 ++---------------------------
 1 file changed, 2 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/gadget/function/f_ncm.c b/drivers/usb/gadget/function/f_ncm.c
index b4206b0dede5..1f638759a953 100644
--- a/drivers/usb/gadget/function/f_ncm.c
+++ b/drivers/usb/gadget/function/f_ncm.c
@@ -1189,7 +1189,6 @@ static int ncm_unwrap_ntb(struct gether *port,
 	const struct ndp_parser_opts *opts = ncm->parser_opts;
 	unsigned	crc_len = ncm->is_crc ? sizeof(uint32_t) : 0;
 	int		dgram_counter;
-	bool		ndp_after_header;
 
 	/* dwSignature */
 	if (get_unaligned_le32(tmp) != opts->nth_sign) {
@@ -1216,7 +1215,6 @@ static int ncm_unwrap_ntb(struct gether *port,
 	}
 
 	ndp_index = get_ncm(&tmp, opts->ndp_index);
-	ndp_after_header = false;
 
 	/* Run through all the NDP's in the NTB */
 	do {
@@ -1232,8 +1230,6 @@ static int ncm_unwrap_ntb(struct gether *port,
 			     ndp_index);
 			goto err;
 		}
-		if (ndp_index == opts->nth_size)
-			ndp_after_header = true;
 
 		/*
 		 * walk through NDP
@@ -1312,37 +1308,13 @@ static int ncm_unwrap_ntb(struct gether *port,
 			index2 = get_ncm(&tmp, opts->dgram_item_len);
 			dg_len2 = get_ncm(&tmp, opts->dgram_item_len);
 
-			if (index2 == 0 || dg_len2 == 0)
-				break;
-
 			/* wDatagramIndex[1] */
-			if (ndp_after_header) {
-				if (index2 < opts->nth_size + opts->ndp_size) {
-					INFO(port->func.config->cdev,
-					     "Bad index: %#X\n", index2);
-					goto err;
-				}
-			} else {
-				if (index2 < opts->nth_size + opts->dpe_size) {
-					INFO(port->func.config->cdev,
-					     "Bad index: %#X\n", index2);
-					goto err;
-				}
-			}
 			if (index2 > block_len - opts->dpe_size) {
 				INFO(port->func.config->cdev,
 				     "Bad index: %#X\n", index2);
 				goto err;
 			}
 
-			/* wDatagramLength[1] */
-			if ((dg_len2 < 14 + crc_len) ||
-					(dg_len2 > frame_max)) {
-				INFO(port->func.config->cdev,
-				     "Bad dgram length: %#X\n", dg_len);
-				goto err;
-			}
-
 			/*
 			 * Copy the data into a new skb.
 			 * This ensures the truesize is correct
@@ -1359,6 +1331,8 @@ static int ncm_unwrap_ntb(struct gether *port,
 			ndp_len -= 2 * (opts->dgram_item_len * 2);
 
 			dgram_counter++;
+			if (index2 == 0 || dg_len2 == 0)
+				break;
 		} while (ndp_len > 2 * (opts->dgram_item_len * 2));
 	} while (ndp_index);
 
-- 
2.27.0

