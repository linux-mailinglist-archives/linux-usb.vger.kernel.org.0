Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED393C348C
	for <lists+linux-usb@lfdr.de>; Sat, 10 Jul 2021 15:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbhGJNFV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 10 Jul 2021 09:05:21 -0400
Received: from cable.insite.cz ([84.242.75.189]:40456 "EHLO cable.insite.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231250AbhGJNFV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 10 Jul 2021 09:05:21 -0400
Received: from localhost (localhost [127.0.0.1])
        by cable.insite.cz (Postfix) with ESMTP id 19566A1A3D403;
        Sat, 10 Jul 2021 14:53:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625921606; bh=KjHoBvLhVWdxrjewdaisIE8Ih6+D9tSFc9FxzrzimxM=;
        h=Subject:From:To:Cc:Date:From;
        b=eZ/Az9UIN6YtpFsXs/pvZlbrC0GUFNz4IP5Utl+/BPGaafG70nBIFxbzQFkAAcfIw
         6oFElVSUDfxutMnBhUZ9H8PXh38HryakbzxainbpZ4chx8rK4nfxY95fTRW9Rdsb3h
         xxeyopJx5Yrb0cyWa8PWdKR0qNWUeiDrRWnNejTU=
Received: from cable.insite.cz ([84.242.75.189])
        by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y6xShs1pHPek; Sat, 10 Jul 2021 14:53:21 +0200 (CEST)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
        (Authenticated sender: pavel)
        by cable.insite.cz (Postfix) with ESMTPSA id D8523A1A3D401;
        Sat, 10 Jul 2021 14:53:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
        t=1625921601; bh=KjHoBvLhVWdxrjewdaisIE8Ih6+D9tSFc9FxzrzimxM=;
        h=Subject:From:To:Cc:Date:From;
        b=OG/i7Bdg4S5GCk9Db71MybCWdJO0cw5EzuffnuuLnpbMDtakNLJu6amt5ASKfVSGX
         So27cu4E1R9XIaBuAMvhPmJDyJSd+1ZCRr+EWbZG/CAH9zSRWgQwNnnJOL5S2wmwsl
         7KdGSOzVGCnVSAePcr8j3m3x0X/eGQO2Oi766LlU=
Subject: [PATCH 1/4] usb: audio-v2: add ability to define feature unit
 descriptor
From:   Pavel Hofman <pavel.hofman@ivitera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc:     Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Felipe Balbi <balbi@kernel.org>
X-Forwarded-Message-Id: 
Message-ID: <bab16136-a57c-e7ed-0261-c44e76923c82@ivitera.com>
Date:   Sat, 10 Jul 2021 14:53:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Similar to UAC1 spec, UAC2 feature unit descriptor
has variable size.

Current audio-v2 feature unit descriptor structure
is used for parsing descriptors, but can't be used
to define your own descriptor.

Add a new macro similar to what audio v1 already has.

Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
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

