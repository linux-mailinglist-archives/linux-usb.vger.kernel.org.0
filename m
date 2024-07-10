Return-Path: <linux-usb+bounces-12096-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2398992CF66
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 12:39:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7CD1C2193B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 10:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C9D19069B;
	Wed, 10 Jul 2024 10:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwXIKgjh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC118FA32
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720607788; cv=none; b=NBGWJbZpl3AwC0or5KIduQFUChmG0HD6dbhazRc31OM6Qt9/+u1wbHgBx7KjAqF93Gdf+wSgQ+Vx1pmErEqeG1CTEunMw+HQ91BF/jIoGSBXO3r1lDNvN7SVr10Da7Gg7yVWoFn0Ga3012M/UBzAmNw1KzqkORsv08BdEmeqn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720607788; c=relaxed/simple;
	bh=9GJRHNLrHyHetG9QLvl+hM3eRSeIWSgSwKE96DTJrig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H+RqquNdXur75/kkc5GpJi92Jznz5doyL8NemnuVeVVvJnmWKY/K0GUpT2NpPkG5RudfC89PHJDlK8lARfvPCSBLQ3hQqRFdTqVquj7JDCQGkaLgZIJ5+e0oHyW07ldknBa/OniQbdkFRtWJMXR4CVdfioPXd7D/iKajHzxXz8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwXIKgjh; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a77baa87743so665833266b.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720607783; x=1721212583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0AjlT5eFQ6h9gEvtReCv6ZkrzRkpXg8KUXrIWg1LtUo=;
        b=QwXIKgjhD6bDJw8VKDx1Lszk9zYCPpfUWHEGgpo7W+U4JwSNMRw7bo+Xk/dIFXuAKU
         XEpVLV3F5oTq69QgBk0kQtmKoecsQY4gfEWsbEKsHkMlrC7U1TVMbIjpK7BgFCFhheQS
         qmyvlxjvB2C1uoyxw/Rp38V3aWYFdgRvqZO7a5nrd+v5MJ03DgT/GQd/w7aapp0Iu2Ik
         9hs2OudEZa66R3cS1dIxa9o7tpUOE/xbI5bZ7gIPX3y4hmIbsF3A1qeMG4FQcrlnLqwb
         g/sWUTxNlJsOXQeCOZKI50V19idl15Mayy6ail9/0tB9YJEbXWxygDy/79e1xl+FPPSj
         9NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720607783; x=1721212583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0AjlT5eFQ6h9gEvtReCv6ZkrzRkpXg8KUXrIWg1LtUo=;
        b=LrgY+q55SNw3kbrxjBqdiUyAkqyoWQ2+OdLE+4woyPpVHe1y5s7SB5IiUzFmxC1UOD
         Hy0ktQnhzU04lv5yEQLHkx3JXVtBQnhUozIIcm07Y3DaVDYKQv8acOZwScXBFXnabceW
         muMv5G0FUOyeEEVDpkOVgaeQKQsvksboDrm4G1TxsaB3CoTxnqOa7XihNGCS6v/Id9D1
         XGNVhc6Px8tk5ViKuCW4PpOPmhDzmQFaFoYj6YxeT8qOUtp9f7xLIqA3idpI7RX6UPf8
         deLMe8j/aIPENK0NFS4xWK3Ra2BoGzw2ILmr9XGCr7dgt5QeOccTKvdFTS9Iz4MWmyXQ
         lqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX6Tm2ihJc57+FoGlLHBXCPgqc2l1rSpYWtDlhowEmPVPoRqw/7kOq+S3jQkUqb5kjyIOvCO2+aa8HMemFvUyrQ7dXuPUTCp5V
X-Gm-Message-State: AOJu0Yxe91OxSOC5ji5BYrxCBEV3vFcH+rD08pGarsPAHicsYXfHJOL1
	AkabxyzOoFG9DRKHCWegTFCQ8WhTeGAqzJjccrjGgYzfXGIfRQY9vMTHMhtZ91M=
X-Google-Smtp-Source: AGHT+IEBYPb6oMofA153AVchD/c6t8lwHvb5LurkHVdmpGrU7RToq5FYqM5J4DT8aQ52uq/60Vf3SA==
X-Received: by 2002:a17:907:9711:b0:a77:b0a4:7d88 with SMTP id a640c23a62f3a-a780b689270mr567665866b.10.1720607783633;
        Wed, 10 Jul 2024 03:36:23 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6dc77dsm146576966b.52.2024.07.10.03.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 03:36:23 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 10 Jul 2024 11:36:08 +0100
Subject: [PATCH 01/15] usb: typec: tcpci: fix a comment typo
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240710-tcpc-cleanup-v1-1-0ec1f41f4263@linaro.org>
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

autonously -> autonomously

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 include/linux/usb/tcpci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/usb/tcpci.h b/include/linux/usb/tcpci.h
index 0ab39b6ea205..d27fe0c22a8b 100644
--- a/include/linux/usb/tcpci.h
+++ b/include/linux/usb/tcpci.h
@@ -190,7 +190,7 @@ struct tcpci;
  *		Optional; Callback to perform chip specific operations when FRS
  *		is sourcing vbus.
  * @auto_discharge_disconnect:
- *		Optional; Enables TCPC to autonously discharge vbus on disconnect.
+ *		Optional; Enables TCPC to autonomously discharge vbus on disconnect.
  * @vbus_vsafe0v:
  *		optional; Set when TCPC can detect whether vbus is at VSAFE0V.
  * @set_partner_usb_comm_capable:

-- 
2.45.2.803.g4e1b14247a-goog


