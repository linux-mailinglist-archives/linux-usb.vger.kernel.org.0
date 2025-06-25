Return-Path: <linux-usb+bounces-25088-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 350ECAE7C61
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 769F04A4BFF
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 09:21:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C7829E106;
	Wed, 25 Jun 2025 09:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Ga0dbPT6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED62BCF5B
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842885; cv=none; b=k9qY7FMLLi3jlzxrd/chU+xUmgHRWI/fn5y24w+/s1iFH9uuvhnUajyMbm/S1XS/ib/0YyMSBDynMYkINA29Ee2pTUXjVCdtjH4S5Tzaq3FAj0Mzjy6hIuXYh+umcoaCQW+sxJo7GIuCRMw5u2UEi/vo0ayxSQ/CWaEO9jbRYUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842885; c=relaxed/simple;
	bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVIegN4BCQPCAdLKLENqk6FheMGq5RfX0zVM6s0DfCGh9vrVS8CnTBBC28G3btWXy9Y/QfWEpgAXbjy9nUFRgsfu0xiO0vyJ9QnvbWDVQmAbp1yh2pv3bEP0JBNg4Y5VLJ2C23tMAY8W1Z5Gkv/7C81YpOBuXwhwnOihbliClLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Ga0dbPT6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad8a8da2376so1039327966b.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842882; x=1751447682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=Ga0dbPT62LBudAjS5KAF3Dl+1ywJMm1T+/EgYrcfqWPrcdqR1Ray6LpynM/gIoIXzc
         hxhlZ/AALcxfOnn74LeXbsB72ONBB9/b24etS5nkIIUUOqqYS55N4LXaCZKTN1gNPlXX
         93kQ5EnIoJPP14Hh5Pvbyrd2rvSfbJayry5CunpfnCAVd8HdASMF3gYLByN4ZxEyDCeb
         6wcF16CIncHTqa70b8Z20OudTju+0J+gbZtgBIEi54DLAvgCzXZ2m3JLZiYzcOxurP/f
         hoarw8jhyKIOLwBjlphRm1v2Kkz8mgOmxFE65o3DASPpksY+3DjxPYaDFMEdR37Gt01l
         5LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842882; x=1751447682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAc6RebJyqWkfWaiafshoyDeXJgwWVip4sEPQbkZWzY=;
        b=TTq+vffGofH361rgFNGsgsLD3y+632JNFI0xFsH2udHdd9mKoTEKq0kYEQh4pZIejr
         ALeq/QQMlzMNPx00MS0nUvA24ZH0W0Fyl1rwP1aQ0btP6aHZVlOPd/7kiXfKdD0URtGi
         Flbav4Nxa0qLFJ9yWLQNT6byXU60KKpsifoRF7EhbTSG7bVv5gLXNxq4lsjDGNw+LwdM
         AjRRLdy5tiXFvQ9yET91Bb+bDv+Y570dPknZtFH8ecIhNPKztoPCbezc5zjDT7Ex8PE9
         qGa+l5z64dxU6pqCq5i1zPlfTSFwaPKZywMV4iA5VRS5Xhrz+OZqPd/GbjIlTgB9Wuh6
         czgw==
X-Forwarded-Encrypted: i=1; AJvYcCVM2oTdxQ9Ojw6Y0t2+81VD6UqFAf3pEI9cwCeUBh9pYey7U1dBqqYpuSk1qifXB2cXbEIJSrRZMFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHtpDyd4pCArL9yOtoDbGI9XEWC2uTKnfQXIIIa9FdqlBFBDV
	EbIs+GDBB5KDNbmtiLoQvX4Dcc7PCpv3UnZcxDwH4WfjjDY552a216JpiDIxkIWKkVA=
X-Gm-Gg: ASbGnctTAsPfLas1ovwptwrsFZTfog0S4x+69jNvm7+u1WrjvHNUfIx9+tFC8qYu/uX
	xCqs1+SfUleYhuYqXcXXlp8i2jxwWZjjUFNUpfH6K+uoId095gijOa/08eFlMSM+bcSis9IfWM1
	8O3K63fNYQ1mirvLIDDYoCZ8dv2rMkcEjysTuwOai1QV0RS713RE0QpiaRLgpkDvX6epzoGLJ4/
	lz7wPQ4eoolHfYrvjThl3/c3SxSI8qIRjvzT/yE5UtqCywlb1FAIoPhgWtFpdLZNfNyKQUAAKrP
	ru46XF9pl0gCVMfbylNu0fjZz3JwbBdDUJdXqrtT6ubdacHtMkxPu9bkUfiEQ7iwyRnPyaC6Iqa
	XoDcwG4udVOBYVqNak3JLbO0j8iKy4bl2
X-Google-Smtp-Source: AGHT+IG0l8SlxqzbJy5yTWk4X5Wj8Qtynwz8Lsq7ZGJOC1TtSj2YLID6Gs1lC0BpZmycf4LOOW/++Q==
X-Received: by 2002:a17:907:e2d0:b0:ad8:a41a:3cbf with SMTP id a640c23a62f3a-ae0becb6e06mr214652366b.13.1750842882078;
        Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:41 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:31 +0200
Subject: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write from
 init sequence
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=984;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=6jOwOjfHBLUytEzmwKQuMf9peA0A54DjyUpxSjnkgtk=;
 b=knC8BOEkeNO8OiE+NnKYB5/k14fP2simRn0FEiUH1MxKyG5zzAMDRqRJ4zNqyeyJsLSuAzNFP
 7cMvV9XCTULBI8qv+2u1CuI8W0OhIAvgqX7c6mnUvgVxb6/pH1mdEUa
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
'latest' HPG revision (as of November 2023).

[0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index b73a1d7e57b32cfdfbe314ab938ec54746ed53be..e232b8b4d29100b8fee9e913e2124788af09f2aa 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -437,6 +437,9 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
 				    USB2_SUSPEND_N_SEL, 0);
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, 0);
+
 	return 0;
 }
 

-- 
2.50.0


