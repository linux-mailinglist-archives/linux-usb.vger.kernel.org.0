Return-Path: <linux-usb+bounces-8874-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75546897783
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 19:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FAB128CF9B
	for <lists+linux-usb@lfdr.de>; Wed,  3 Apr 2024 17:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55C90155A35;
	Wed,  3 Apr 2024 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AKUDUQv2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AF1534F1
	for <linux-usb@vger.kernel.org>; Wed,  3 Apr 2024 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712166896; cv=none; b=Qr7WehQTdUs73IM8dYO2xrHQAm/k3d4qz5wGfewbwF76iNIuOpqJe7a33D1JceTo2HWzZxluxNHGF62jro0flBwiwcK6KDwajOXng+1NxHNN8ZdaRr8bSbEUrm1juaT04HBgm4PtOxvFQWuHeavkygG5WvUHxPkR6NwDNX7knbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712166896; c=relaxed/simple;
	bh=/0XZpuV90cVbdOdKNn9mw9B3D5Yw88DCt0+hoxD1w8c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RYcNNcn0X6IVff+IemJ6f4CW3+csQhV1868mNkzuMzc0pRnEEa7OmMRc6qdWvXlRCTqWFkc4yBiTnVRoYldac6uBXOUm4qap6fz/iF1hdzYixEmJ7GJJ3uFKBKC9NDCe0sMCeKQLLkOQ5jZNsU5NApaTTQ6JpouvKWxcIbmBRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AKUDUQv2; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5a56a5f597dso85051eaf.2
        for <linux-usb@vger.kernel.org>; Wed, 03 Apr 2024 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712166893; x=1712771693; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xznWw54FxaWloYVwfy+4qqRxy8SOPUqZEYo49dH5RKo=;
        b=AKUDUQv2DEOSQIOLriVgSDwFKf0jsor5tQ//ylMHF6LDTWX2CIwYOvCOFGfgtDUa7i
         D+NJ8wASjGDR25jGsd6+nYHPBvzXTS0dLTL55a+sGsNMhipymEGqXiGljltYLKsqfIdP
         jr/khxZAYxnTjU3hi44FaxyXoKpDn9QYT6ivQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712166893; x=1712771693;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xznWw54FxaWloYVwfy+4qqRxy8SOPUqZEYo49dH5RKo=;
        b=niGQwCYfIlD17ec17TD50vUFpIHAOaM1619nyqwmc5jt06L9x31KDLEXDweOqHfhqA
         hHH1GRmEpuRFKh2wDPGhaHZdmVXZkP80UD03VAJ1N9r0uf8DN47/C/FnBbEVqxfKYrAN
         MFDM8bb2F8wmIafaPfP6d8IKjnQjIqBygWdju0Kqa+hVySEuLVeeo/8y8wdOJOagEN/g
         E9Fu1zSyv6oE8TZN7GPvraw2hPO+3LzJZqrwmYajxIKm3gNkl8cdGUaAavq5fHwi8cD/
         p0oKSVvt3uJUCJTqeENKf26aXPwqrUwjLqZfQ0DMuCFS43TgHRf7+jD4bcz78mdBJADx
         YoCw==
X-Gm-Message-State: AOJu0YwxbhnPJ3ASBl6QtW4h8RUVUXe89ELeR5qrB8SClG4wwvMODQa6
	JpiGmv4m0jm1jf9wuPfiFQGDL7KVdaC66PAiOl55qigHx/F9PF53zrVTvy9oyd5oTg+HQqdqS3Y
	=
X-Google-Smtp-Source: AGHT+IEkOvzpB3sS1GOMdYoTNTPrcUJQAqysOJCExlqcM5uAzvObmKgFti8V3JJ6lg7+vtgEa+c+AQ==
X-Received: by 2002:a05:6359:4c15:b0:183:8bc6:82b with SMTP id kj21-20020a0563594c1500b001838bc6082bmr3498716rwc.28.1712166893093;
        Wed, 03 Apr 2024 10:54:53 -0700 (PDT)
Received: from pholla1.c.googlers.com (210.73.125.34.bc.googleusercontent.com. [34.125.73.210])
        by smtp.gmail.com with ESMTPSA id o13-20020a65520d000000b005d7994a08dcsm10509577pgp.36.2024.04.03.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 10:54:52 -0700 (PDT)
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 03 Apr 2024 17:54:51 +0000
Subject: [PATCH v2] usb: typec: ucsi: Wait 20ms before reading CCI after a
 reset
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-ucsi-reset-delay-v2-1-244c175825a4@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOqXDWYC/32NSw6DMAwFr4K8rqskfPpZ9R4VC0ocYqkQ5AAqQ
 ty9KQfockZ68zaIJEwR7tkGQgtHDkMCc8qg9c3QEbJNDEaZQuWmxLmNjEKRJrT0blZ8WVddtCn
 K0llIs1HI8edIPuvEnuMUZD0eFv2zf2KLRo32Rvqak3KaqkfrJfQ89+cgHdT7vn8Bm2r+m7MAA
 AA=
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
 Pavan Holla <pholla@chromium.org>
X-Mailer: b4 0.12.4

The PPM might take time to process a reset. Allow 20ms for the reset to
be processed before reading the CCI.

Signed-off-by: Pavan Holla <pholla@chromium.org>
---
The PPM might take time to process a reset and set the CCI. Give the PPM
20ms to update it's CCI.

Based on the discussion in v1, this should not slow down existing
implementations because they would not set any bits in the CCI after a reset,
and would take a 20ms delay to read the CCI anyway. This change just makes the
delay explicit, and reduces a CCI read. Based on the spec, the PPM has
10ms to set busy, so, 20ms seems like a reasonable delay before we read
the CCI.
---
Changes in v2:
- Commit message updated.
- Link to v1: https://lore.kernel.org/r/20240325-ucsi-reset-delay-v1-1-d9e183e0f1e6@chromium.org
---
 drivers/usb/typec/ucsi/ucsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d285..c0706c40fa64 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1280,6 +1280,9 @@ static int ucsi_reset_ppm(struct ucsi *ucsi)
 			goto out;
 		}
 
+		/* Give the PPM time to process a reset before reading CCI */
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


