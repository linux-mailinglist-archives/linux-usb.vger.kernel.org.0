Return-Path: <linux-usb+bounces-8327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6199988B292
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 22:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DC462E425C
	for <lists+linux-usb@lfdr.de>; Mon, 25 Mar 2024 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 949D06D1A3;
	Mon, 25 Mar 2024 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KsJmHKED"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD95071733
	for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 21:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711401591; cv=none; b=OfcGUahm04DSkM6MdmpdEOIsutE8u4CY7KOSwYgvHwWh2+lGgXoDUBmG9g70fkOjmwg7Y/zdbuLAxmOooT0aLE05SZfUBAlO8o28aIx/SzUAw5edlysJNqr8ujzHin1XfSg3Flu8i11/sfD5eSN1e4zU+63iH0UO3FRa9HgTYzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711401591; c=relaxed/simple;
	bh=ppMvWVev0cLIJM7WJ4IVef/LN8AiezVVGMMPIfD8CQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DGfxKfCWWr9jRiY8pgkv1Cq9XK1pBZhgJJrB12sR9zLxYlmJdKf8SAL//RxvbyubYuvQPbbgscbsPl442rzoF02rQzJQhKEDmo5muFLf81IEtr8KJPkwyuHkaz5BlhEPmEsgTx1OQX/MByJI2/pXV1vg9pjxPn+KGTUm9isZgdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KsJmHKED; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e73e8bdea2so3948732b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 25 Mar 2024 14:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711401589; x=1712006389; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IWkKtqlB2IYpNkVz6EWQgOv/DTm4sZRBKwumKBADUJY=;
        b=KsJmHKEDmlarbQ4DTOv3j9DNvkgyDGMBh0ZuauXXw3XHR8PdtZ+QID1uwIj3DhWzbD
         AeKMb2bptOdrqE1eWLR7sfiP32BxYOjQcJkODyQ5CSq403Kvgl2Td3UHIrVuXXRguGUm
         sbrzrbANJsikyJPwQnTpYuAqjx6oQu4JopLmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711401589; x=1712006389;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWkKtqlB2IYpNkVz6EWQgOv/DTm4sZRBKwumKBADUJY=;
        b=lEfXIUsM2/COJKXH6Bb7IUiPv7U0Z49f9XT4zGkkOZwLzTLF065IaxGzNVdZO+xbUV
         V3YDojdWR8xY1fkB4hr9fEyKAmuNhiDJSBJCpNRfwN8dJFsy4yWlOhi4AD0JX2QHiXm/
         sfFycx5DuDvBzQvOJNHwIR+RSLYFqiLBchlzdGx67gKUCsIT0IJIjpdCU7pFTjO96eBZ
         /5OiENgxyqtnHAeIf0gmODrPUZgzpzPL1t6nRKNKiLRJxnqFuDU97ix+g1FB3vlsoQnb
         hsa+l7VzUgpwa9u4Rg2Rye5yatEKKmWvuZwzEoWN/BVaaeL50RifNUC9mwzkLanO+XIX
         wU6A==
X-Gm-Message-State: AOJu0YxPAwuO44NJ4UTo1zIo0VLTPQCweICLvpD1pCJ7Tm/8c7BA5yiP
	s+2Hpz1s9kMaKDCJ9hrh7C1qUy0LV8ROpdHU4vSKxg2YXePlAYSZWX24sNzLDg==
X-Google-Smtp-Source: AGHT+IGa9QHBomnxFI9sI+UI1mcpYHhl4i65j4DlNlm8nhqgmv3Q7Naz5j9Z2uKmzsd6N0Gv8/Rkag==
X-Received: by 2002:a05:6a20:9585:b0:1a3:bc78:fd1 with SMTP id iu5-20020a056a20958500b001a3bc780fd1mr9199760pzb.59.1711401589029;
        Mon, 25 Mar 2024 14:19:49 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id r17-20020aa79ed1000000b006eaada3860dsm1851656pfq.200.2024.03.25.14.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 14:19:48 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Mon, 25 Mar 2024 21:19:43 +0000
Subject: [PATCH] usb: typec: ucsi: Wait 20ms before retrying reset
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240325-ucsi-reset-delay-v1-1-d9e183e0f1e6@chromium.org>
X-B4-Tracking: v=1; b=H4sIAG7qAWYC/x3MQQ5AMBBA0avIrE1SpSSuIhalUyYRpIOQxt01l
 m/xfwShwCTQZhECXSy8rQlFnsE423UiZJcMWulKldrgOQpjIKEDHS32wcH5uil0ZYx3kLI9kOf
 7X3b9+37ptv4VYgAAAA==
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

The PPM might take time to process reset. Allow 20ms for the reset to
complete before issuing another reset.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
There is a 20ms delay for a reset retry to complete. However, the first
reset attempt is expected to complete immediately after an async write
of the reset command. This patch adds 20ms between the async write and
the CCI read that expects the reset to be complete. The additional delay
also allows the PPM to settle after the first reset, which seems to be
the intention behind the original 20ms delay ( kernel v4.14 has a comment
regarding the same )
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d285..6b642c4c58b7 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1280,6 +1280,9 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 			goto out;
 		}
 
+		/* Give the PPM time to reset and stabilize */
+		msleep(20);
+
 		ret = ucsi->ops->read(ucsi, UCSI_CCI, &cci, sizeof(cci));
 		if (ret)
 			goto out;
@@ -1293,7 +1296,6 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 				goto out;
 		}
 
-		msleep(20);
 	} while (!(cci & UCSI_CCI_RESET_COMPLETE));
 
 out:

---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240325-ucsi-reset-delay-bdf6712455fd

Best regards,
-- 
Pavan Holla <pholla@chromium.org>


