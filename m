Return-Path: <linux-usb+bounces-3818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC208083D6
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD56A1C21F1C
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9342033CD8;
	Thu,  7 Dec 2023 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R1k2KInW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E84DD10CB
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:08:13 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-db402e6f61dso925746276.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940093; x=1702544893; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcBBD4Ve+EnK0sA+7Oy5D//EjO8x9y3uJFnX5ru4dqg=;
        b=R1k2KInWwMKp3FaZeicuPuxjpIC4omF+lvWnZW9xb+o4TPOC4cXMSm3JoOPI7ehZho
         4dgwpFwpuTCCcEmQQSHk2Glin72Z5peq152L29i6Mt69wJaGrCxj6i9A5Xa9L0Skd5Wr
         4neiygWZXaQ5OGo//MS4YXkBRFzSxNK5PoumRff9Mf3QIZaaIF4TYyUeS3SEONe0j5xu
         5szVzDv7jOAUMllrGRVvx/4TnrkkwYnGGUL5e4A2MIktGyvoNWQg9Cn+DtI4fqQSOaq4
         wYijLzP8G18+HbLj33Du/XQPV5MURAyl40cRpYpfPuEBCQZDSd2wBR9h1+QkByFFNIoR
         sOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940093; x=1702544893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HcBBD4Ve+EnK0sA+7Oy5D//EjO8x9y3uJFnX5ru4dqg=;
        b=Qr2KPJrVwIK02Y6J+xwv+0HgikyGTjJyEUWiZI1Y4nsLVJ514H5MUzbTznVnZuUGAb
         ybSIEhRfSt9QcrZt+e5DN//P50zaq2RFYN/VuR90tIbQVcBCvQNVz8JVv37sgrBqODPg
         Wte9xo1dBhWDNKjMTfxlLPPaZSlG1BWiFHvUlZIOTz3MVjNtUrOC0LmyGE5vpenhGpT5
         Ea/QW3O/LrjLKXJWn/A119vdowSKHTQGQ9FrFnXqEKQ0KPNOVbrqrREy5uY0dEJSjdhj
         0isSg46NHL2HnV20CUIU0b8nBGaNqAnSnVxg/R1Bv2/9D8TIMAim/JdeHCsQx4vGOqeo
         tRRg==
X-Gm-Message-State: AOJu0YxkIeNdlRyyRGJXqOmiDJSHAiutgjCG+lvCmGDzH1twsEAaz6Rd
	LCujQ20HZZI1EjM8Bzo0QBg1Yo0fE8gkbdg=
X-Google-Smtp-Source: AGHT+IEqB/j07MaxmdfrGiH6cpjewMzzjxAe0aX1PjsLmlRZovJi+MS6ODabqF7RJKBqphBvuoBj2o30uU2WZ9g=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a25:ca92:0:b0:db5:47c1:e82d with SMTP id
 a140-20020a25ca92000000b00db547c1e82dmr25759ybg.6.1701940093019; Thu, 07 Dec
 2023 01:08:13 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:40 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=rdbabiera@google.com;
 h=from:subject; bh=Go8QEr2NQzBwcUwozRZWWtLanmmY65Hze1InDnkaM4E=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3XGTak3qtp3775Bx7lDlfW9pvog9Gps3eD66ctWcI
 UTu/wyLjlIWBjEOBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACaSbc3I8D56Tv+fy5e8F1y8
 UHys9lNUUx1X6rJnZ1dtesd5oCVKKJPhn62M8nfGR7/9De/2LjC8UpU5w/h/+G3xeLMbPhP/rL8 XyAUA
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-21-rdbabiera@google.com>
Subject: [PATCH v1 09/10] usb: typec: altmodes: add typec_altmode_get_cable_svdm_version
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add typec_altmode_get_cable_svdm_version to return the cable's negotiated
svdm_version.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 include/linux/usb/typec_altmode.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 4d527d92457d..1ad581c5a930 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -156,6 +156,16 @@ typec_altmode_get_svdm_version(struct typec_altmode *altmode)
 	return typec_get_negotiated_svdm_version(typec_altmode2port(altmode));
 }
 
+/**
+ * typec_altmode_get__cable_svdm_version - Get negotiated SVDM version for cable plug
+ * @altmode: Handle to the alternate mode
+ */
+static inline int
+typec_altmode_get_cable_svdm_version(struct typec_altmode *altmode)
+{
+	return typec_get_cable_svdm_version(typec_altmode2port(altmode));
+}
+
 /**
  * struct typec_altmode_driver - USB Type-C alternate mode device driver
  * @id_table: Null terminated array of SVIDs
-- 
2.43.0.rc2.451.g8631bc7472-goog


