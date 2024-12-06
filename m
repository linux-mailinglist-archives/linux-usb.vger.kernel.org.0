Return-Path: <linux-usb+bounces-18215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA249E7CB4
	for <lists+linux-usb@lfdr.de>; Sat,  7 Dec 2024 00:39:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6B46284C5F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED89B212FB9;
	Fri,  6 Dec 2024 23:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k5onkOd+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB5214811
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 23:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733528330; cv=none; b=KjfX76XSe/Q0KJiqHVtUMoZeRHYna+hp2NRSmuWiBsVn3+eRNdEYuJPsM+eNf13PDy2IsW/Yf53dedaduiaBAz+U4MowzIrwS3Mk9CE1RB+zA/4B/CoXQ81RJMMzAPUpl9SCAWCGJnxnrEVTGFmUGo56n1Bjkr3D9YNBnTkjNQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733528330; c=relaxed/simple;
	bh=Jlz35Axmxas20UXZdMUAEnU/Zcdy+VnrtwvvujZhzjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dnxtx8bnxKD92V/aSyg88klRilv4zQlP0so9N4sYn0UDzFcO6wKavOy6KuH1FFdffvcGFy+HLzEBjV+SyoPX15lT0o+ujIEA5TsidadkyMkg7VuqH4PXsyipB/pKAwoSgI975w/IEo+sdnQcM1ygT4n3xPPiiw7VVvC5vw0AGsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k5onkOd+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215b0582aaeso20645265ad.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 15:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733528328; x=1734133128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qEsFgZZBOjZItw/w6Re8IWK1gazviV9TFZpIsGLgdzk=;
        b=k5onkOd+HLH6NzluXQuidMKvZdOf6eBpLocBkdHjOKw2qGL2wsmupbrSb7oCPSnEE2
         yFFXcY72Me+Cwni12FjPmEQ6rHApRC6UefZJKhgiQZzBBhgxVLvden6s+Lx2Wkd7yT/o
         V6t48z2hXSi53XkWWj4xPBqtljEPekTnv2SAQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733528328; x=1734133128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEsFgZZBOjZItw/w6Re8IWK1gazviV9TFZpIsGLgdzk=;
        b=nvtmXpy2cnRyYB+Ncog2ZgOwVRAa668X9sFGBIF8OMWhiRZT8lU+uwBpNRDaysijb+
         z7Hh+A8EWNQsrrs+or9uVf4bUNxIGOlrgILWIkTPe35XOzBNQIwJPpk16Q6vBrqktk0c
         0gQ6lNe9VhfsaxMX5P8WsUHNSE9NqHT4LmL/PHFSP4mauZ2joHH+sGbopY+xkcxVP39A
         oP8b9TmTicHKvqHfBrsoliDRvDHhiCQbGCuZwtY8cqP08VqhT1iFjHNdZC9d+qnxO8d6
         RkpLnhwajp0KJ6smRNuq6Z1VCiY3jSLEAfwz1gXk2FgbT+OEC0/SY1JcL8PWoBtILigM
         iSxg==
X-Forwarded-Encrypted: i=1; AJvYcCXCSdb+DrPFUEV2a6I1RdFKM5iKvepTzHVOgXgN02njoRmL2h5ur4LJ7aUo2jGvvzIN7NfvlKi+9q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzP5KkeRtLHYFJiBbvepso+Kq/dGQf/IrRI42+Bob3Ji4PU4rf
	t4snW2HAb8YTuCExPSssXx+NIgjMQ9y6jF33Rxghhh1pd4Rov70GtlZ12Tt+Dg==
X-Gm-Gg: ASbGncu8vNvy6h74Nly0BIymus7MEGHXRueinwDyRxR3qHE5E6wqZmurIyGC4Hq83m5
	fHpAmCM8axmDWkIIJMSiHC+Q3R3L2kvoLjAtegw4Xu1DPPm2z291I66lfPPFLDyBmqL6dxs/6H4
	sLK6VaZriJUshdjcJqaqgRw453RdV0oA7KZdmIOUtm62Pr0s6VTUzanhyeNxWBEJ1g3yCERGx96
	/cbLiYx0neSubD1PUP37VtNm3EjZeljWyneByV5Nm0r6Be600BHRMEjQr9V0UZ7GEOv1pTUloRX
	3yh4U+Rc6c8o/bSNod7swHaP
X-Google-Smtp-Source: AGHT+IE2s40s6YYwYc1sTeIXRAHidUXahuDrUL8yJczv/cBkFhoKl7A5wKj7RNqs4UHrL++1LK1l/Q==
X-Received: by 2002:a17:902:e5cd:b0:215:9642:4d6d with SMTP id d9443c01a7336-21614d3ac8amr54953465ad.17.1733528328424;
        Fri, 06 Dec 2024 15:38:48 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-215f8efcc70sm33915095ad.167.2024.12.06.15.38.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 15:38:47 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	pmalani@chromium.org,
	jthies@google.com,
	dmitry.baryshkov@linaro.org,
	badhri@google.com,
	rdbabiera@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] usb: typec: Print err when displayport fails to enter
Date: Fri,  6 Dec 2024 15:38:14 -0800
Message-ID: <20241206153813.v4.3.I6cff9d767b0f8ab6458d8940941e42c920902d49@changeid>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241206233830.2401638-1-abhishekpandit@chromium.org>
References: <20241206233830.2401638-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Print the error reason for typec_altmode_enter so users can understand
why displayport failed to enter.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/usb/typec/altmodes/displayport.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 3245e03d59e6..e292780ec309 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -252,7 +252,8 @@ static void dp_altmode_work(struct work_struct *work)
 	case DP_STATE_ENTER:
 		ret = typec_altmode_enter(dp->alt, NULL);
 		if (ret && ret != -EBUSY)
-			dev_err(&dp->alt->dev, "failed to enter mode\n");
+			dev_err(&dp->alt->dev, "failed to enter mode: %d\n",
+				ret);
 		break;
 	case DP_STATE_ENTER_PRIME:
 		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
-- 
2.47.0.338.g60cca15819-goog


