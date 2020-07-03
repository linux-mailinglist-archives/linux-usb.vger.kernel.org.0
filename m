Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E512213EAC
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 19:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbgGCRmG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 13:42:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726594AbgGCRmF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Jul 2020 13:42:05 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C7E1C08C5DD
        for <linux-usb@vger.kernel.org>; Fri,  3 Jul 2020 10:42:05 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id g75so32747639wme.5
        for <linux-usb@vger.kernel.org>; Fri, 03 Jul 2020 10:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t4Am4nB0l6cP03MwwNkPBQsYcEgNEnrA8UeKSYDKdUU=;
        b=NdK2n2DpMxDOF3DrquKU3xkbiaC9YSoi1d1FCLkUoMBOFz7LyhxtRa5hIwjvHXSg47
         2hj1oK9S3I/+Kng2StiX0zC9Y7zR3jPg2QVPIq1X/apTA4LJyWyJ9mGwV29FHN15HANq
         cDVZuk8e3w8uyDN5GGNWw1IiLARZwflj49XLSPMJZjCMHJxDaJ+vFt5dUwOtgqtt6W89
         WGjG4NBHIfTm888o4wKdLUL9aXBmw15h/qP9v4mBFll4tKxsht+vg9gkHkkhFiZxonrs
         OMROdPKaEZbbjfgXsdQOoSuSYKsCv8nd++hNVUHEIKIrlpJHzhDT1c2H3BtGlDU2X3x1
         xkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t4Am4nB0l6cP03MwwNkPBQsYcEgNEnrA8UeKSYDKdUU=;
        b=ZtgTgSrWgRX+YG1vf56MzjB0irEj6IHHZrKyAxm5juZQTeGXB9jS3kCMu1ngwtOHt4
         j++dqc7o43eC0ZhpbB4NabAkzVPd6O6WyFTEXs54JAqUy+5ek84wzqxrGxYGacpBid/y
         PBxsAifeuEfIgi17NGOOn2yvJIoStRDbQ2wzwAiwWpzEda6Dne5uaw/AE5c1+cBXmJK/
         1D9CG8wb9EXDEIfTwbd0xMbkSdm6z5Jv358EXxBAkegWvUe98Dn5eOX1WuTNuYL2VbuI
         WhSwObSHWMCijIrf9C1jU8OhAzkdGgwso3O/lFd28HzKf9CzaYZ3UBVHKacNlznNS9Y6
         zJHw==
X-Gm-Message-State: AOAM533upQXCpexqRkFfkU0PusVCL5nRpoxRbhwFsyisGNkrCPAuJ+vA
        pn4nGD5X+F5F28y4c/jeTfv67rRfz0c=
X-Google-Smtp-Source: ABdhPJwWNtPJkU57QkS7FkAUeMOZ01OWI1HHJuuDPjgWzvxvHzyMhCp3R2bITuvinyJ3dvhktbgg+g==
X-Received: by 2002:a1c:7d54:: with SMTP id y81mr38985778wmc.110.1593798123829;
        Fri, 03 Jul 2020 10:42:03 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id x11sm13625799wmc.26.2020.07.03.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 10:42:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Winischhofer <thomas@winischhofer.net>
Subject: [PATCH 04/30] usb: misc: sisusbvga: sisusb_init: Mark all 'static const' arrays as __maybe_unused
Date:   Fri,  3 Jul 2020 18:41:22 +0100
Message-Id: <20200703174148.2749969-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200703174148.2749969-1-lee.jones@linaro.org>
References: <20200703174148.2749969-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

drivers/usb/misc/sisusbvga/sisusb_init.h is included by a few
source files.  Most of which do not use the majority of the
shared static const arrays which have been declared.  This
causes the build system to spew 100's of warnings.

Fixes the following W=1 kernel build warning(s) - and a whole lot more:

 In file included from drivers/usb/misc/sisusbvga/sisusb.c:54:
 drivers/usb/misc/sisusbvga/sisusb_init.h:695:34: warning: ‘SiSUSB_VCLKData’ defined but not used [-Wunused-const-variable=]
 695 | static const struct SiS_VCLKData SiSUSB_VCLKData[] = {
 | ^~~~~~~~~~~~~~~
[10's of lines snipped]
 drivers/usb/misc/sisusbvga/sisusb_init.h:206:28: warning: ‘SiS_VGA_DAC’ defined but not used [-Wunused-const-variable=]
 206 | static const unsigned char SiS_VGA_DAC[] = {
 | ^~~~~~~~~~~
[10's of lines snipped]
 drivers/usb/misc/sisusbvga/sisusb_init.h:171:29: warning: ‘ModeIndex_1280x1024’ defined but not used [-Wunused-const-variable=]
 171 | static const unsigned short ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
 | ^~~~~~~~~~~~~~~~~~~
[10's of lines snipped]

Cc: Thomas Winischhofer <thomas@winischhofer.net>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/usb/misc/sisusbvga/sisusb_init.h | 66 ++++++++++++------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb_init.h b/drivers/usb/misc/sisusbvga/sisusb_init.h
index aa33bc81ee526..927956d33e4d1 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_init.h
+++ b/drivers/usb/misc/sisusbvga/sisusb_init.h
@@ -148,29 +148,29 @@
 #define SIS_CRT2_PORT_04	0x04 - 0x30
 
 /* Mode numbers */
-static const unsigned short ModeIndex_320x200[] = { 0x59, 0x41, 0x00, 0x4f };
-static const unsigned short ModeIndex_320x240[] = { 0x50, 0x56, 0x00, 0x53 };
-static const unsigned short ModeIndex_400x300[] = { 0x51, 0x57, 0x00, 0x54 };
-static const unsigned short ModeIndex_512x384[] = { 0x52, 0x58, 0x00, 0x5c };
-static const unsigned short ModeIndex_640x400[] = { 0x2f, 0x5d, 0x00, 0x5e };
-static const unsigned short ModeIndex_640x480[] = { 0x2e, 0x44, 0x00, 0x62 };
-static const unsigned short ModeIndex_720x480[] = { 0x31, 0x33, 0x00, 0x35 };
-static const unsigned short ModeIndex_720x576[] = { 0x32, 0x34, 0x00, 0x36 };
-static const unsigned short ModeIndex_768x576[] = { 0x5f, 0x60, 0x00, 0x61 };
-static const unsigned short ModeIndex_800x480[] = { 0x70, 0x7a, 0x00, 0x76 };
-static const unsigned short ModeIndex_800x600[] = { 0x30, 0x47, 0x00, 0x63 };
-static const unsigned short ModeIndex_848x480[] = { 0x39, 0x3b, 0x00, 0x3e };
-static const unsigned short ModeIndex_856x480[] = { 0x3f, 0x42, 0x00, 0x45 };
-static const unsigned short ModeIndex_960x540[] = { 0x1d, 0x1e, 0x00, 0x1f };
-static const unsigned short ModeIndex_960x600[] = { 0x20, 0x21, 0x00, 0x22 };
-static const unsigned short ModeIndex_1024x768[] = { 0x38, 0x4a, 0x00, 0x64 };
-static const unsigned short ModeIndex_1024x576[] = { 0x71, 0x74, 0x00, 0x77 };
-static const unsigned short ModeIndex_1152x864[] = { 0x29, 0x2a, 0x00, 0x2b };
-static const unsigned short ModeIndex_1280x720[] = { 0x79, 0x75, 0x00, 0x78 };
-static const unsigned short ModeIndex_1280x768[] = { 0x23, 0x24, 0x00, 0x25 };
-static const unsigned short ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
+static const unsigned short __maybe_unused ModeIndex_320x200[] = { 0x59, 0x41, 0x00, 0x4f };
+static const unsigned short __maybe_unused ModeIndex_320x240[] = { 0x50, 0x56, 0x00, 0x53 };
+static const unsigned short __maybe_unused ModeIndex_400x300[] = { 0x51, 0x57, 0x00, 0x54 };
+static const unsigned short __maybe_unused ModeIndex_512x384[] = { 0x52, 0x58, 0x00, 0x5c };
+static const unsigned short __maybe_unused ModeIndex_640x400[] = { 0x2f, 0x5d, 0x00, 0x5e };
+static const unsigned short __maybe_unused ModeIndex_640x480[] = { 0x2e, 0x44, 0x00, 0x62 };
+static const unsigned short __maybe_unused ModeIndex_720x480[] = { 0x31, 0x33, 0x00, 0x35 };
+static const unsigned short __maybe_unused ModeIndex_720x576[] = { 0x32, 0x34, 0x00, 0x36 };
+static const unsigned short __maybe_unused ModeIndex_768x576[] = { 0x5f, 0x60, 0x00, 0x61 };
+static const unsigned short __maybe_unused ModeIndex_800x480[] = { 0x70, 0x7a, 0x00, 0x76 };
+static const unsigned short __maybe_unused ModeIndex_800x600[] = { 0x30, 0x47, 0x00, 0x63 };
+static const unsigned short __maybe_unused ModeIndex_848x480[] = { 0x39, 0x3b, 0x00, 0x3e };
+static const unsigned short __maybe_unused ModeIndex_856x480[] = { 0x3f, 0x42, 0x00, 0x45 };
+static const unsigned short __maybe_unused ModeIndex_960x540[] = { 0x1d, 0x1e, 0x00, 0x1f };
+static const unsigned short __maybe_unused ModeIndex_960x600[] = { 0x20, 0x21, 0x00, 0x22 };
+static const unsigned short __maybe_unused ModeIndex_1024x768[] = { 0x38, 0x4a, 0x00, 0x64 };
+static const unsigned short __maybe_unused ModeIndex_1024x576[] = { 0x71, 0x74, 0x00, 0x77 };
+static const unsigned short __maybe_unused ModeIndex_1152x864[] = { 0x29, 0x2a, 0x00, 0x2b };
+static const unsigned short __maybe_unused ModeIndex_1280x720[] = { 0x79, 0x75, 0x00, 0x78 };
+static const unsigned short __maybe_unused ModeIndex_1280x768[] = { 0x23, 0x24, 0x00, 0x25 };
+static const unsigned short __maybe_unused ModeIndex_1280x1024[] = { 0x3a, 0x4d, 0x00, 0x65 };
 
-static const unsigned char SiS_MDA_DAC[] = {
+static const unsigned char __maybe_unused SiS_MDA_DAC[] = {
 	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
 	0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
 	0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15, 0x15,
@@ -181,7 +181,7 @@ static const unsigned char SiS_MDA_DAC[] = {
 	0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F, 0x3F
 };
 
-static const unsigned char SiS_CGA_DAC[] = {
+static const unsigned char __maybe_unused SiS_CGA_DAC[] = {
 	0x00, 0x10, 0x04, 0x14, 0x01, 0x11, 0x09, 0x15,
 	0x00, 0x10, 0x04, 0x14, 0x01, 0x11, 0x09, 0x15,
 	0x2A, 0x3A, 0x2E, 0x3E, 0x2B, 0x3B, 0x2F, 0x3F,
@@ -192,7 +192,7 @@ static const unsigned char SiS_CGA_DAC[] = {
 	0x2A, 0x3A, 0x2E, 0x3E, 0x2B, 0x3B, 0x2F, 0x3F
 };
 
-static const unsigned char SiS_EGA_DAC[] = {
+static const unsigned char __maybe_unused SiS_EGA_DAC[] = {
 	0x00, 0x10, 0x04, 0x14, 0x01, 0x11, 0x05, 0x15,
 	0x20, 0x30, 0x24, 0x34, 0x21, 0x31, 0x25, 0x35,
 	0x08, 0x18, 0x0C, 0x1C, 0x09, 0x19, 0x0D, 0x1D,
@@ -203,7 +203,7 @@ static const unsigned char SiS_EGA_DAC[] = {
 	0x2A, 0x3A, 0x2E, 0x3E, 0x2B, 0x3B, 0x2F, 0x3F
 };
 
-static const unsigned char SiS_VGA_DAC[] = {
+static const unsigned char __maybe_unused SiS_VGA_DAC[] = {
 	0x00, 0x10, 0x04, 0x14, 0x01, 0x11, 0x09, 0x15,
 	0x2A, 0x3A, 0x2E, 0x3E, 0x2B, 0x3B, 0x2F, 0x3F,
 	0x00, 0x05, 0x08, 0x0B, 0x0E, 0x11, 0x14, 0x18,
@@ -216,12 +216,12 @@ static const unsigned char SiS_VGA_DAC[] = {
 	0x0B, 0x0C, 0x0D, 0x0F, 0x10
 };
 
-static const struct SiS_St SiSUSB_SModeIDTable[] = {
+static const struct SiS_St __maybe_unused SiSUSB_SModeIDTable[] = {
 	{0x03, 0x0010, 0x18, 0x02, 0x02, 0x00, 0x01, 0x03, 0x40},
 	{0xff, 0x0000, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
 };
 
-static const struct SiS_StResInfo_S SiSUSB_StResInfo[] = {
+static const struct SiS_StResInfo_S __maybe_unused SiSUSB_StResInfo[] = {
 	{640, 400},
 	{640, 350},
 	{720, 400},
@@ -229,7 +229,7 @@ static const struct SiS_StResInfo_S SiSUSB_StResInfo[] = {
 	{640, 480}
 };
 
-static const struct SiS_ModeResInfo SiSUSB_ModeResInfo[] = {
+static const struct SiS_ModeResInfo __maybe_unused SiSUSB_ModeResInfo[] = {
 	{320, 200, 8, 8},	/* 0x00 */
 	{320, 240, 8, 8},	/* 0x01 */
 	{320, 400, 8, 8},	/* 0x02 */
@@ -266,7 +266,7 @@ static const struct SiS_ModeResInfo SiSUSB_ModeResInfo[] = {
 	{960, 600, 8, 16}	/* 0x21 */
 };
 
-static const struct SiS_StandTable SiSUSB_StandTable[] = {
+static const struct SiS_StandTable __maybe_unused SiSUSB_StandTable[] = {
 	/* MD_3_400 - mode 0x03 - 400 */
 	{
 	 0x50, 0x18, 0x10, 0x1000,
@@ -297,7 +297,7 @@ static const struct SiS_StandTable SiSUSB_StandTable[] = {
 	 }
 };
 
-static const struct SiS_Ext SiSUSB_EModeIDTable[] = {
+static const struct SiS_Ext __maybe_unused SiSUSB_EModeIDTable[] = {
 	{0x2e, 0x0a1b, 0x0101, SIS_RI_640x480, 0x00, 0x00, 0x05, 0x05, 0x08, 2},	/* 640x480x8 */
 	{0x2f, 0x0a1b, 0x0100, SIS_RI_640x400, 0x00, 0x00, 0x05, 0x05, 0x10, 0},	/* 640x400x8 */
 	{0x30, 0x2a1b, 0x0103, SIS_RI_800x600, 0x00, 0x00, 0x07, 0x06, 0x00, 3},	/* 800x600x8 */
@@ -376,7 +376,7 @@ static const struct SiS_Ext SiSUSB_EModeIDTable[] = {
 	{0xff, 0x0000, 0x0000, 0, 0x00, 0x00, 0x00, 0x00, 0x00, -1}
 };
 
-static const struct SiS_Ext2 SiSUSB_RefIndex[] = {
+static const struct SiS_Ext2 __maybe_unused SiSUSB_RefIndex[] = {
 	{0x085f, 0x0d, 0x03, 0x05, 0x05, 0x30, 800, 600, 0x40, 0x00, 0x00},	/* 0x0 */
 	{0x0067, 0x0e, 0x04, 0x05, 0x05, 0x30, 800, 600, 0x40, 0x00, 0x00},	/* 0x1 */
 	{0x0067, 0x0f, 0x08, 0x48, 0x05, 0x30, 800, 600, 0x40, 0x00, 0x00},	/* 0x2 */
@@ -434,7 +434,7 @@ static const struct SiS_Ext2 SiSUSB_RefIndex[] = {
 	{0xffff, 0x00, 0x00, 0x00, 0x00, 0x00, 0, 0, 0, 0x00, 0x00}
 };
 
-static const struct SiS_CRT1Table SiSUSB_CRT1Table[] = {
+static const struct SiS_CRT1Table __maybe_unused SiSUSB_CRT1Table[] = {
 	{{0x2d, 0x27, 0x28, 0x90, 0x2c, 0x80, 0xbf, 0x1f,
 	  0x9c, 0x8e, 0x8f, 0x96, 0xb9, 0x30, 0x00, 0x00,
 	  0x00}},		/* 0x0 */
@@ -692,7 +692,7 @@ static const struct SiS_CRT1Table SiSUSB_CRT1Table[] = {
 	  0x41}}		/* 0x54 */
 };
 
-static const struct SiS_VCLKData SiSUSB_VCLKData[] = {
+static const struct SiS_VCLKData __maybe_unused SiSUSB_VCLKData[] = {
 	{0x1b, 0xe1, 25},	/* 0x00 */
 	{0x4e, 0xe4, 28},	/* 0x01 */
 	{0x57, 0xe4, 31},	/* 0x02 */
-- 
2.25.1

