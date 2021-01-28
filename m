Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1396F307106
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 09:17:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231905AbhA1IPH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 03:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbhA1INs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 03:13:48 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EBFC061574
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:13:07 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j18so3531000wmi.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 00:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IderQjfiO6V/Wg9yn58IE4HHRIwtdS46qwDvh8Z7kSc=;
        b=Vat9g/j60qo947IUGTnUkmUDZ93B3Dj9ZTEpxhuKzR/rb24MVFygwty070ejqy0oIe
         vyBfpNgLopyKr2GT/8fHIEgVasnA62iOfA6o/c79xl9DaeO1xaz/esCdnlkaksnfDY/O
         bYmi7LJY9i+Ss2ihDNIIL3sa6Nu33rVdvJji9Bb2C2dys2k8uZCF78rimoSsqhgeCcfP
         KM80CRxtvaB8P7pzdGgU8Uzlt9Ex4GeRGCx65PYkzuHKZm0UHl9JuyYig+rSWtjM1pnp
         OZIqhuBAVtVKmvkXp1sLN27QiNrX3KTsap9Cx6a6TAgvRXotQQnqvq3IOz5u0MTxORJe
         wDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IderQjfiO6V/Wg9yn58IE4HHRIwtdS46qwDvh8Z7kSc=;
        b=THgS5G/cdj9YS368kxZIL5DaB0XtVA9oZ5z8TUpP7mjmjlSy5kvBlfl0SOMeGoFbcH
         UMyj6Evk7+24x9eDsMnZ4SphrYokdKoFuhTDU/h0b8i8rd0sISsgAV0CKB/+i2x+tAvl
         inaYq4FKNQhDd8elC1g/j5ctxMEhbBGC/1lLZezwohWXVbQ97sDBBWOIzdtHGXcR7Ws6
         6/HKo7WIp7XufgFb6bigz6SgsFcyHptEOgkRlcFP8ZIdGM3urfUcsN7N3vCEH/xzSebc
         qlQMxd+Wo+Tj1Yt1ZnBAcs6IqKsz65bfVZbjLFv+kq3/hhO0hcs4jHvhDk7iLPvw+H+i
         EEmQ==
X-Gm-Message-State: AOAM532ntnRREWdsbOG3nK1+f15MWpC7n1yLqVFK0tbNwvV5HVbg/EdG
        1Yj6yiPVQgfr/zUq6QvYZf4=
X-Google-Smtp-Source: ABdhPJzAqJdgy9zbKnu9iaa/ZXEqBs/hjNxY7uIbYjW8SF1YHtOKbPd/0D3wiw43O5g2PPQTNS9Fzg==
X-Received: by 2002:a7b:cb8e:: with SMTP id m14mr7645550wmi.116.1611821586762;
        Thu, 28 Jan 2021 00:13:06 -0800 (PST)
Received: from sylvain-MS-7994.lan ([51.154.65.74])
        by smtp.gmail.com with ESMTPSA id b7sm6393926wrs.50.2021.01.28.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 00:13:06 -0800 (PST)
From:   Sylvain Pelissier <sylvain.pelissier@gmail.com>
Cc:     laurent.pinchart@skynet.be, kopiga.rasiah@epfl.ch,
        linux-usb@vger.kernel.org,
        Sylvain Pelissier <sylvain.pelissier@gmail.com>
Subject: [PATCH] usb: video: fix descriptor structures macros
Date:   Thu, 28 Jan 2021 09:12:59 +0100
Message-Id: <20210128081259.20940-1-sylvain.pelissier@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The macros defining structures for descriptors use token
pasting incorrectly. For example, the macro 
UVC_EXTENSION_UNIT_DESCRIPTOR(1, 2) defines a structure named 
uvc_extension_unit_descriptor_p_2 which should be
uvc_extension_unit_descriptor_1_2 instead.

Signed-off-by: Sylvain Pelissier <sylvain.pelissier@gmail.com>
---
 include/uapi/linux/usb/video.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/usb/video.h b/include/uapi/linux/usb/video.h
index d854cb19c42c..1eb982df87a0 100644
--- a/include/uapi/linux/usb/video.h
+++ b/include/uapi/linux/usb/video.h
@@ -324,7 +324,7 @@ struct uvc_extension_unit_descriptor {
 #define UVC_DT_EXTENSION_UNIT_SIZE(p, n)		(24+(p)+(n))
 
 #define UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) \
-	uvc_extension_unit_descriptor_##p_##n
+	uvc_extension_unit_descriptor_##p##_##n
 
 #define DECLARE_UVC_EXTENSION_UNIT_DESCRIPTOR(p, n)	\
 struct UVC_EXTENSION_UNIT_DESCRIPTOR(p, n) {		\
@@ -371,7 +371,7 @@ struct uvc_input_header_descriptor {
 #define UVC_DT_INPUT_HEADER_SIZE(n, p)			(13+(n*p))
 
 #define UVC_INPUT_HEADER_DESCRIPTOR(n, p) \
-	uvc_input_header_descriptor_##n_##p
+	uvc_input_header_descriptor_##n##_##p
 
 #define DECLARE_UVC_INPUT_HEADER_DESCRIPTOR(n, p)	\
 struct UVC_INPUT_HEADER_DESCRIPTOR(n, p) {		\
@@ -406,7 +406,7 @@ struct uvc_output_header_descriptor {
 #define UVC_DT_OUTPUT_HEADER_SIZE(n, p)			(9+(n*p))
 
 #define UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) \
-	uvc_output_header_descriptor_##n_##p
+	uvc_output_header_descriptor_##n##_##p
 
 #define DECLARE_UVC_OUTPUT_HEADER_DESCRIPTOR(n, p)	\
 struct UVC_OUTPUT_HEADER_DESCRIPTOR(n, p) {		\
-- 
2.25.1

