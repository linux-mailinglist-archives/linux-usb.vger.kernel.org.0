Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98E483372FE
	for <lists+linux-usb@lfdr.de>; Thu, 11 Mar 2021 13:48:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232956AbhCKMri (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Mar 2021 07:47:38 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:53735 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232825AbhCKMrR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Mar 2021 07:47:17 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id EDF212F52;
        Thu, 11 Mar 2021 07:47:16 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 11 Mar 2021 07:47:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eliasrudberg.se;
         h=from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=fm3; bh=ezx1dBwX4qkRqCt5xMgfdYmD1L
        /ZKBRrOf1Hb1/h2pI=; b=giJSzXRqpM0Z3Ze5omgb9hcIugNNe7ZNVYg+Lkbc8j
        9i80RssPUJwoZFviu3iptA9eGRbcb4O/cMXtJXwkJEz774dJ79v5jAHdQqkS630P
        Ho7WVFxVftgNSsmael7VcNMGsjJk7i08r5d7k6PkKc44eia0VaFExwYefQnwbROW
        KjWGwNjm0wZ/LJFA3IDYr6fMUkH2uo0q+rr+nIv9FV8xqyzozS5Ex+iTBwtHmrLW
        7MPGe13DmMr1KPdws0gDNJl9T0IHselWL3bHj8oQV0ieWUHP2v+E9rlOPpyCy/ao
        VUo5peNSplv2XgIqECVM+oOHPF0zE7n6l97NkDHxvGaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ezx1dBwX4qkRqCt5x
        MgfdYmD1L/ZKBRrOf1Hb1/h2pI=; b=qI0bcL2k8UCWD5vYP/VVajuuVDMMLZbwg
        PkY3vc4JFx2fuSu/BLy1XTeq7I4MX9lqpbPVCvZLg6Vmnl6F5yKiQDIaoH8byXvg
        RUgxWg4jg0Il7MgJPkWSBUQjbBbYX7uvENIArW6UtrOT21fWEb8wXzVO/HzkWuhX
        817BbB6rSDrimGJv75J/yzS4Xw9YfHE/QWgvj23W5sggaHU/Qb3nSOFUmgnHIKmo
        kvw+N+tLEPYyuMafD9FPsNRLyejTtZyYutp5Mhf+zzWbbl6Vtk9BvMJSN0V5Ol2F
        tcmPtedasQyCnRaMX6O27Uru1U8+vFdg7YBbj0UatoiDUIrwgN34g==
X-ME-Sender: <xms:UxFKYN92WVm-9k9F1BZSsDZEQbOccTjF1zonpywBMd_7DqCEechWOA>
    <xme:UxFKYCfG7cl5_t5zCeYwZDFdbhIv3SuHDSQuRjj2amlYZ4qxUiVEdzorR2y8lppat
    xEj6tBlpFlTmGEcIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddvtddggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
    dttdenucfhrhhomhepgfhlihgrshcutfhuuggsvghrghcuoehmrghilhesvghlihgrshhr
    uhgusggvrhhgrdhsvgeqnecuggftrfgrthhtvghrnhepvdejffevveettefhhfehgeelff
    fhkedvueejvdfftdffgeevveetffdvueeiudejnecukfhppedvuddvrddutddtrddutdeh
    rdeltdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghilhesvghlihgrshhruhgusggvrhhgrdhsvg
X-ME-Proxy: <xmx:UxFKYHKHaKcJNJE0hhxs83hCoD81eezm5eBpKHtdUKMredCukMIvTg>
    <xmx:UxFKYCiOUviDDz9O9yWZcXl-EhhKxKLV7mo4ka8pj-bGUvwN57ocxg>
    <xmx:UxFKYFR7jKIJCsYZPG19dvLzjbeUttSw1obYVt89M8iBN1Om5roOvQ>
    <xmx:VBFKYKQkzPeS7sGW9-02EmhISzCTQ1ZGS6jEBosJnoGuU6GqMXFLdA>
Received: from elias-Lenovo-ideapad-720S-14IKB.lan (customer-212-100-105-90.stosn.net [212.100.105.90])
        by mail.messagingengine.com (Postfix) with ESMTPA id A417A1080057;
        Thu, 11 Mar 2021 07:47:14 -0500 (EST)
From:   Elias Rudberg <mail@eliasrudberg.se>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Elias Rudberg <mail@eliasrudberg.se>
Subject: [PATCH] usb: typec: Remove vdo[3] part of tps6598x_rx_identity_reg struct
Date:   Thu, 11 Mar 2021 13:47:10 +0100
Message-Id: <20210311124710.6563-1-mail@eliasrudberg.se>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove the unused "u32 vdo[3]" part in the tps6598x_rx_identity_reg
struct. This helps avoid "failed to register partner" errors which
happen when tps6598x_read_partner_identity() fails because the
amount of data read is 12 bytes smaller than the struct size.
Note that vdo[3] is already in usb_pd_identity and hence
shouldn't be added to tps6598x_rx_identity_reg as well.

Fixes: f6c56ca91b92 ("usb: typec: Add the Product Type VDOs to struct usb_pd_identity")

Signed-off-by: Elias Rudberg <mail@eliasrudberg.se>
---
 drivers/usb/typec/tps6598x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 6e6ef6317523..29bd1c5a283c 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -64,7 +64,6 @@ enum {
 struct tps6598x_rx_identity_reg {
 	u8 status;
 	struct usb_pd_identity identity;
-	u32 vdo[3];
 } __packed;
 
 /* Standard Task return codes */
-- 
2.25.1

