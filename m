Return-Path: <linux-usb+bounces-12095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C592CF65
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3471E1F2253C
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA07190682;
	Wed, 10 Jul 2024 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tY5w+BVA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC70118FA06
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607787; cv=none; b=n5rmLcaUJRH3GNUCF8okHiFZusdJp6kc+ehOHJQBi5k31r4PSpzkXPhCHVZ2845+nknFvDCtjoVDEySRKn+p3bSdw7C0LvCJoQ4oumZ8YHcf94a9KNYNzGWoQFlakatyR/UYcPHrtzQrvzRRliM83OMCKjMKtVKXa8YOjh3Bw9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607787; c=relaxed/simple;
	bh=mil0Paw7dKSF+yYmtF7z93+PPTbySeNKiljnw4gmtA8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BrLXWDT9/2hbJ4rXy4+7g4rEmJNjdATAc7TDNYkgUqBAicYYUL8fsLhwduN1CvPg6hZUBJ95cbuEKtv6lH2PbDr01xuLdPrPBqjBysiWSbjmRpa3l4tLaA9f59MLIBRnbPgL93DlaXGv4Z37FcKcBNF33GVvLx2uWcpTlbTvINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tY5w+BVA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a77b60cafecso748181366b.1
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607784; x=1721212584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugko5125K/DlhjBE+oAKmwE1ZDstjFq/scQfmJhd89w=;
        b=tY5w+BVAKh/Jbp1CuBRSpHMzAMn4dc/KnCJZF9W/turj5AR40sYiT/FFH0DqHzzI7M
         ZfwHV3y/tosY3DwpHVdCHDEHi06LAxQvEGbGsOOd8h64iwhg2X1nhc1i25Emx6TevizU
         MJUr91lTl8ovxB+uTgAeOaEus34YoEMjdB2qIVPxKxh4DP6FEvXWezZ4SnDa8ldoZvTh
         EamkVQ9Z2Lu1c45Nrm4BxkuvVFzDDQO/prWV72lSn///mQmC7Ed6kLjU+q+XoBHTjf+B
         h1JJpF85qC7bwhh+Zsmz8qIe97Sz31sRcCOu3lw48V9cEJmrlVVOl7LdqCANOitrALVb
         T/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607784; x=1721212584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugko5125K/DlhjBE+oAKmwE1ZDstjFq/scQfmJhd89w=;
        b=OgzwJ2LuzI8yKnzlsPuXjHyqx3d0qUKGfg2SbxG4Rvny5Svxg0ZsZ1TDPu+DnTVa1V
         u0Wl26+NEPXP665LPXaz/jbGl1xAJsMIteTWB9n6vO7WRuq+UOUm+CQz2BETSRwzej3z
         I0r4SmBFkSbf0vdRmCIwxUJv0imZtbALOKHllCgyCC0/n31flWaImYGiWTZpHiyOFVzn
         agpzUC1FFuQoEiDO7i9WKm/VSn8hdglw4HGuYLkB7Ps2iUY+JME4dtA4/1U6U1Yr5d8D
         ZePd0SnltIsLfsjja6uQBYw14Yaxd8T2otm0PNG0/oD6Mb5vIPFx8sRYWVksB9LzNvzM
         sHgg==
X-Forwarded-Encrypted: i=1; AJvYcCU3T1sful+HZa1mwrAtf2t7qpkCFHfndfR2LRUzam5k++KLLKH4JXabjoB/ox+VAkAWVpj2pOmeooANA1wxwp2T1hyvhIJPyfgc
X-Gm-Message-State: AOJu0YwevDEAUCQk+XFpltkoeMKyiBGG9X3WvaKz62J0Itz7z8AvJFhx
	Y1XAbvZLhR+5yOc8h+ipU1JC+W+8iup/FfD+Nu2qQoyM8/aN0EqyWgquRwa7PoA=
X-Google-Smtp-Source: AGHT+IFn15u2cejyFoefO6hJ902KlcwxPbEv119zyj3cGShttSJFkxT2Jd9K7A4TdHzThGIHgNPh9Q==
X-Received: by 2002:a17:907:7717:b0:a77:daa9:402 with SMTP id a640c23a62f3a-a780b6fe400mr324241666b.35.1720607784079;
        Wed, 10 Jul 2024 03:36:24 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:09 +0100
Subject: [PATCH 02/15] usb: typec: tcpm/tcpci_maxim: clarify a comment
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-2-0ec1f41f4263@linaro.org>
References: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
In-Reply-To: <20240710-tcpc-cleanup-v1-0-0ec1f41f4263@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Badhri Jagan Sridharan <badhri@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

We loop while the status is != 0, so rephrase the comment slightly for
clarity.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index eec3bcec119c..87102b4d060d 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -397,7 +397,7 @@ static irqreturn_t max_tcpci_irq(int irq, void *dev_id)
 	}
 	while (status) {
 		irq_return = _max_tcpci_irq(chip, status);
-		/* Do not return if the ALERT is already set. */
+		/* Do not return if a (new) ALERT is set (again). */
 		ret = max_tcpci_read16(chip, TCPC_ALERT, &status);
 		if (ret < 0)
 			break;

-- 
2.45.2.803.g4e1b14247a-goog


