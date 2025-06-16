Return-Path: <linux-usb+bounces-24786-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18356ADB21D
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 15:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B033A1889C00
	for <lists+linux-usb@lfdr.de>; Mon, 16 Jun 2025 13:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4001B2E06E0;
	Mon, 16 Jun 2025 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VGrkzcjH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06762E06C7
	for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080805; cv=none; b=qAHjHs07I8t8QKVHCxKui0/YYfuJY7b9KMxAk67a+eATkF+A+FJ1GbvfuGOrcF2HlkTx1yjInW6Sh7OWd14VRKPeLDb1eC69ABUl8KeAqoVJr6KkY/G2+9eP8JdhBCBifEpy3EC7OJoOMi2QBl6PWN5yqZA04BcPp9Gg32cPrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080805; c=relaxed/simple;
	bh=0PHI8c4cGupy6mr00/69MtbHFn0M40BQMFD2F7JuKUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DZ6eU9YayZitKq8I4jmGJNOtcop+OHSx45TT2C+8OAGyQgzzzW2d6duD+LTK/9GRIAL50HfBMWWMiUkA2k9nqfY/Fkz4jYvjGIpTpBCLbM1sqh2e65NDGsRr9RG9/zkppQoOwHJ3V3JN5xBJMmSRtldiUhYCvjJ2a2uzJetBFTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VGrkzcjH; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so9387910a12.3
        for <linux-usb@vger.kernel.org>; Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080801; x=1750685601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=VGrkzcjHJcxoKsVJO/hC0a5HRDzdSXGHs+xUtbV+PUKcnazteRKOU0/azSgJN7RpfK
         pp6D8TdJ/tYgGBJibvmMEIYYnBUAlU9lI7b2llWcotjEk1LeUS40amFJBWGGZQWdCYQm
         CgziL5y2yVh33bW8QCckwfwZKuQMruphZJlsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080801; x=1750685601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=uJc/FLK/sqWqzG8LMLlXOkJlaLL/ij99+aJZkFSdhnaJFm3AVmFSQu9AT5DdCw6Vdl
         IVqVxuXHx5YKS5EQ4kayb2z7EWkwdbs4IccmdlrHe3CsXJm9As8RCOp/7plh0DvlkElZ
         jNU+KXhf28mDGYMKSQDpghgNsnbHfy+lhmGshneygHqSqoKQvzXlm9SUK08/Mrt8y7DO
         mONJpnmtUUcE2AV+bnBeu7x/2JH1Sj84Yn7tVa6tj8B52SmV4MrIc1D+euFBdBnT3MUg
         gWbyyACjt6CWiaevunBxK/XrJh/r0fqwn8fE1dK+6QhY0JjFFEHzoBssasIGRHNmCh9S
         WFIA==
X-Forwarded-Encrypted: i=1; AJvYcCWeodlD/+uMG5zg1McTb31JQlJd9dp4mj49/zxHiiHDvquZ9Jxr1/BDMvmbPU+3Fq1c7gfJHtzLGvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm5JVSGh2yLVECEUfh6MCG73z6oMsCW1BHbVLczQhbD6GSeZbw
	jDIvZTLnPOhiJFtQkph10JwSq3pkAGuCZjtoPOC1YHCSfUjnNwAiHbnd2l2gL9Vi6g==
X-Gm-Gg: ASbGncvwBXMduTFKDmztwxwQ0z9uEz3AeA01xIiMZoHHOQFNfut7E8LqqUqBJHSBeQt
	d8/8Ly4VIMjwgLTrdOLb18CFkI8QQ70RNJrKAakrmCjR1+yYKNVoLMLbi99txS0nsQOf8Ui5Tbq
	F837Ux5k/FAIcf/3zhtnaka55D23G+gL8adnnFOQrB9Op1/STQ5y8GDaWcrgB1Ge2yT68IvSEFA
	hD41X/ep/PBLxydZZIQRHoTfQv7v/tk810JAGkFGwzSGxaqJL/L5kGREZjxh3JBABOTmaBrlBbk
	i8cB04ZkEuIufTBbS8LfpU0FzjZ+UtaHiQnWZqPSmTkrBdj8FzWQxr6k57CAOgObeUX4/QlH8yQ
	IHTcYzhZNVoYRbz96Ff6/3mR0Ik517BLyfb6fK3tLH7Tsvr75kjekqi0mZJL3aPAIvy5Y
X-Google-Smtp-Source: AGHT+IHfbJubtALYX705aMPJAZLadxG+o3H7c51K1HROrB1vOE0jaYQjb3BtZP2Tk8Y8fXZXY/12hQ==
X-Received: by 2002:a05:6402:13d4:b0:606:e754:62bb with SMTP id 4fb4d7f45d1cf-608d09e3938mr8395397a12.28.1750080800769;
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 07/10] usb: typec: Report altmode entry status via callback
Date: Mon, 16 Jun 2025 13:31:44 +0000
Message-ID: <20250616133147.1835939-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of an
alternate mode entry attempt.
Call the `typec_mode_selection_altmode_complete()` callback to provide
this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  6 ++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ac84a6d64c2f..946f61b57fa0 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -274,16 +274,20 @@ static void dp_altmode_work(struct work_struct *work)
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
 				ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE_PRIME:
 		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
@@ -397,6 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
 			break;
+		case DP_CMD_STATUS_UPDATE:
+			ret = *(int *)vdo;
+			break;
 		default:
 			break;
 		}
@@ -407,6 +414,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 	if (dp->state != DP_STATE_IDLE)
 		schedule_work(&dp->work);
+	else if (ret || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, ret);
 
 err_unlock:
 	mutex_unlock(&dp->lock);
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..697ab6060652 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -242,6 +242,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 			else if (tbt->plug[TYPEC_PLUG_SOP_P])
 				tbt->state = TBT_STATE_SOP_P_EXIT;
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, 0);
+			break;
 		}
 		break;
 	case CMDT_RSP_NAK:
@@ -249,6 +252,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, *(int *)vdo);
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 55dcea12082c..57cbda5292bb 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -24,6 +24,9 @@ struct typec_thunderbolt_data {
 	u32 enter_vdo;
 };
 
+/* TBT3 alt mode specific commands */
+#define TBT_CMD_STATUS_UPDATE		VDO_CMD_VENDOR(0)
+
 /* TBT3 Device Discover Mode VDO bits */
 #define TBT_MODE			BIT(0)
 #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
-- 
2.50.0.rc1.591.g9c95f17f64-goog


