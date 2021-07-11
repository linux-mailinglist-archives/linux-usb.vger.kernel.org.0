Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737033C3B59
	for <lists+linux-usb@lfdr.de>; Sun, 11 Jul 2021 11:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231987AbhGKJ4v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 11 Jul 2021 05:56:51 -0400
Received: from cable.insite.cz ([84.242.75.189]:47211 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229688AbhGKJ4t (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 11 Jul 2021 05:56:49 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id AF8DAA1A3D407;
        Sun, 11 Jul 2021 11:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625997241; bh=vJlus4ofuCFwPzbuWq2f1FcNK+j5C7YAGdAZi7zMfgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GCmJcJI1ozXfUNdIuF4yRW1+2TU2n7NtzcYl1xxnpaqTzrF1tSLavu2y9QA5WDXaP
         GnDcEiBKMzkP47FCzIhQqDbpPFuZtdPtc4IDLatZgKuMYE6jiTHSfK784oX5++kq/z
         WddkKNw0liLnSFa9ikQt3lNuqAC3eZctdHY4U8Fc=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id FMjKKHqZyw7C; Sun, 11 Jul 2021 11:53:56 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id 70247A1A3D403;
        Sun, 11 Jul 2021 11:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625997236; bh=vJlus4ofuCFwPzbuWq2f1FcNK+j5C7YAGdAZi7zMfgE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=N1WjCi3V+kpotew//UH8LVyhnTAIi/JHUhDZvPRBaD4XcifBTV5xB26OWrzJEn/c7
         h6xQauBSZa9xpL5Mmb+2qX9rp7ZZJJ2mMtg/luejsCjutk56rvfA8eDRLNs46hZiHY
         5vw9T1JjDoyA8iS93azi7P1HANPND0aPGjyt64kU=
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     linux-usb@vger.kernel.org
Cc:     Pavel Hofman <pavel.hofman@ivitera.com>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 1/4] usb: audio-v2: add ability to define feature unit descriptor
Date:   Sun, 11 Jul 2021 11:53:48 +0200
Message-Id: <20210711095351.16877-2-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210711095351.16877-1-pavel.hofman@ivitera.com>
References: <20210711095351.16877-1-pavel.hofman@ivitera.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Ruslan Bilovol <ruslan.bilovol@gmail.com>

Similar to UAC1 spec, UAC2 feature unit descriptor
has variable size.

Current audio-v2 feature unit descriptor structure
is used for parsing descriptors, but can't be used
to define your own descriptor.

Add a new macro similar to what audio v1 already has.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 include/linux/usb/audio-v2.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/usb/audio-v2.h b/include/linux/usb/audio-v2.h
index ead8c9a47c6a..8fc2abd7aecb 100644
--- a/include/linux/usb/audio-v2.h
+++ b/include/linux/usb/audio-v2.h
@@ -156,6 +156,20 @@ struct uac2_feature_unit_descriptor {
 	__u8 bmaControls[]; /* variable length */
 } __attribute__((packed));
 
+#define UAC2_DT_FEATURE_UNIT_SIZE(ch)		(6 + ((ch) + 1) * 4)
+
+/* As above, but more useful for defining your own descriptors: */
+#define DECLARE_UAC2_FEATURE_UNIT_DESCRIPTOR(ch)		\
+struct uac2_feature_unit_descriptor_##ch {			\
+	__u8  bLength;						\
+	__u8  bDescriptorType;					\
+	__u8  bDescriptorSubtype;				\
+	__u8  bUnitID;						\
+	__u8  bSourceID;					\
+	__le32 bmaControls[ch + 1];				\
+	__u8  iFeature;						\
+} __packed
+
 /* 4.7.2.10 Effect Unit Descriptor */
 
 struct uac2_effect_unit_descriptor {
-- 
2.25.1

