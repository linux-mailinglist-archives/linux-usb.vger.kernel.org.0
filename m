Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6E914E7E2F
	for <lists+linux-usb@lfdr.de>; Sat, 26 Mar 2022 01:33:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiCZAen (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Mar 2022 20:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiCZAem (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Mar 2022 20:34:42 -0400
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B1021C71E
        for <linux-usb@vger.kernel.org>; Fri, 25 Mar 2022 17:33:06 -0700 (PDT)
Received: from mailhost.synopsys.com (sv2-mailhost2.synopsys.com [10.205.2.134])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 5B15941E2F;
        Sat, 26 Mar 2022 00:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1648254786; bh=BDSgxcgr3MCaZLhq36RStvVYH8QJws4nJQknYwqNKaU=;
        h=Date:From:Subject:To:Cc:From;
        b=E+zvcSLZnPwb6cgLMWrqZHYTJLiw6fGopBCSPMqQDpcoQ9+O3uQZhgpDHs+lcAVlR
         LXbtyQXHY5RYaH6dGLjFMn75yGoCgDtcvSt08ZEizIzsdthmHazeTDxoEUFm1Fdwdn
         6+8IQI2Sq1izn9Rh8saweT1HzjysIx9dZ09LfVmEp456x/lNB7o8AmTVAxaGi2PY3H
         4satIghhXdVXUusUbZPY1aopt+Fi4phnU+fvZV266ZWIyegmowjAJ04Qm136CVp6kq
         5RfQJ8/R+GOy3LWgdsgekqpH/q2/vXO0FqY5+JbT9qwS28f7vQdHcRIRDRaEi4SXwE
         n80HqXlIL+QAQ==
Received: from te-lab16-v2 (nanobot.internal.synopsys.com [10.204.48.11])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mailhost.synopsys.com (Postfix) with ESMTPSA id 95A85A009C;
        Sat, 26 Mar 2022 00:33:04 +0000 (UTC)
Received: by te-lab16-v2 (sSMTP sendmail emulation); Fri, 25 Mar 2022 17:33:04 -0700
Date:   Fri, 25 Mar 2022 17:33:04 -0700
Message-Id: <bf1e225b660d0bb68ccdb3ce1bd7bd2d33edb817.1648253632.git.Thinh.Nguyen@synopsys.com>
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Subject: [PATCH] usb: common: debug: Hex dump non-standard control requests
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Cc:     John Youn <John.Youn@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb_decode_ctrl() only decodes standard control requests. Don't attempt
to decode non-standard requests. Just dump the content of the requests.

Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/common/debug.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
index 075f6b1b2a1a..cb38725f9276 100644
--- a/drivers/usb/common/debug.c
+++ b/drivers/usb/common/debug.c
@@ -208,6 +208,20 @@ static void usb_decode_set_isoch_delay(__u8 wValue, char *str, size_t size)
 	snprintf(str, size, "Set Isochronous Delay(Delay = %d ns)", wValue);
 }
 
+static void usb_hex_dump_ctrl(char *str, size_t size, __u8 bRequestType,
+			      __u8 bRequest, __u16 wValue, __u16 wIndex,
+			      __u16 wLength)
+{
+	snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
+		 bRequestType, bRequest,
+		 (u8)(cpu_to_le16(wValue) & 0xff),
+		 (u8)(cpu_to_le16(wValue) >> 8),
+		 (u8)(cpu_to_le16(wIndex) & 0xff),
+		 (u8)(cpu_to_le16(wIndex) >> 8),
+		 (u8)(cpu_to_le16(wLength) & 0xff),
+		 (u8)(cpu_to_le16(wLength) >> 8));
+}
+
 /**
  * usb_decode_ctrl - Returns human readable representation of control request.
  * @str: buffer to return a human-readable representation of control request.
@@ -233,6 +247,12 @@ const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 			    __u8 bRequest, __u16 wValue, __u16 wIndex,
 			    __u16 wLength)
 {
+	if ((bRequestType & USB_TYPE_MASK) != USB_TYPE_STANDARD) {
+		usb_hex_dump_ctrl(str, size, bRequestType, bRequest,
+				  wValue, wIndex, wLength);
+		return str;
+	}
+
 	switch (bRequest) {
 	case USB_REQ_GET_STATUS:
 		usb_decode_get_status(bRequestType, wIndex, wLength, str, size);
@@ -272,14 +292,9 @@ const char *usb_decode_ctrl(char *str, size_t size, __u8 bRequestType,
 		usb_decode_set_isoch_delay(wValue, str, size);
 		break;
 	default:
-		snprintf(str, size, "%02x %02x %02x %02x %02x %02x %02x %02x",
-			 bRequestType, bRequest,
-			 (u8)(cpu_to_le16(wValue) & 0xff),
-			 (u8)(cpu_to_le16(wValue) >> 8),
-			 (u8)(cpu_to_le16(wIndex) & 0xff),
-			 (u8)(cpu_to_le16(wIndex) >> 8),
-			 (u8)(cpu_to_le16(wLength) & 0xff),
-			 (u8)(cpu_to_le16(wLength) >> 8));
+		usb_hex_dump_ctrl(str, size, bRequestType, bRequest,
+				  wValue, wIndex, wLength);
+		break;
 	}
 
 	return str;

base-commit: 46d2c20b0b10cf07a2a24b047a09195ba96c84f7
-- 
2.28.0

