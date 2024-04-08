Return-Path: <linux-usb+bounces-9012-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E8089B508
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 03:04:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A36A1F2148C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Apr 2024 01:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2191A4A3D;
	Mon,  8 Apr 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vx7aln5a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6478864C
	for <linux-usb@vger.kernel.org>; Mon,  8 Apr 2024 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712538263; cv=none; b=Lp3gGr4LPBgpBEkIgzl59ioxw+9IMxjLhZxYVhlvhrV4X/Z8Yr71glaUqrLUmxKbu1uq9P98PHPVSdmjn4MGPehOPLusgoOuYKe2rgcUFoovAQDDKsqd2VTBVFeDoMg8roogFjkScdkfXlpfovUKc4T9H7XupUp3F8pAIZRMYwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712538263; c=relaxed/simple;
	bh=Q9EaREj0DOMVe3+66xhbQSHhWfQTkjOgkWHUBDSng7o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OvGqYIEhXv5lL/afD8+BiVGNUr030dUM4d+39nr09AF0yMsYcCo5N1NqYedjdDw+CFWjGTaGQ+wTDrWHBay2ywqbMczjI6TmRXmZWKhVRdeTG9B1bpwjWECvVNzYcJGgG0RrG72Cobpp1RrSUCdQaLDqpfYIf7N7OxnSvCW7gsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vx7aln5a; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d6a1af9c07so44319341fa.3
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 18:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712538258; x=1713143058; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nd7IuXfTq3omy3bcTN0HTdof1DpJerBaI8M9m/vGL1c=;
        b=vx7aln5a6ozEzb7PnvgnzvHE0Ge97/j9IKsmAsykQ/hqkTjf2YXiWu9lsXbn7Fe6Kc
         RXfT1mdI2cIkKD1Z7IanrQth6lX1/WeJzHz5hRD5odTTSziBfbR1BOWyl+z8VOjL+GHM
         GNqfI5Mg/ISKJfZ81srGLnQZO7ARixyM7u9zs8mGP9yFi8ue7ydlA+iO9/lgctF+oLrq
         cpy4vxrmdmiUMn38tunstbBivFicMQ2v7C9tYsYlvrtZmZTNq0dOhX518gzVNzF6FXTG
         kEEBLkvyHh9s5MstKJPJuFOfomb/jVdWjl+tpLnpTWXKTCaCPITxwSqP9TmOWtDI/ffp
         oyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712538258; x=1713143058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nd7IuXfTq3omy3bcTN0HTdof1DpJerBaI8M9m/vGL1c=;
        b=cHsYE+Y4AosKEXAIMaJbnU1R9GJt27WBLdKzI/lV/GvujhcddAC8rfTSnr8VXdVNz5
         rq3SVTmEDPYwD29TxMxsVwYfrC8D4Og6QG27ZkKvlJr9MsszJls5Ii2rXU3pVohgchgz
         ASSAEuvIvrIURemSGnY0X/fNvhh5t3wbbm27GdWKlbdjZT2Da35+mZ1HIYFpd066jWdA
         YJ+LbmSzsDmCTU+xyth0sWu9KqxFotI+9a0EwkDBzjKxiDc9WvH2xnvdUvS3NPxSGZQQ
         GIr6xUXPkxo6Rycf6JAmljSxCGn6meUT8bwSCDbP8R9i3qyITdh+kvtoEUQ9slDq9dzi
         UZww==
X-Forwarded-Encrypted: i=1; AJvYcCVC0rpnxcxLeqId/x1C3+PBEvAUGvUFnDlTiHzx8H+ipqUL8zXwh3s+PHowDXmgkA8HBxPkxv2PU731yF/0AyDJGcVeBIH9HEz3
X-Gm-Message-State: AOJu0Yx8GMNNUbOSiuy2vD77ha5EuarPUg10wHhzIhLMSAhFeL6qBp4o
	FpEhwCJkjRYSX7zKo/uOqFZjcuGzxPVpd6YdLB03MPnwvVjWKXnDFgOqwN5a6JY=
X-Google-Smtp-Source: AGHT+IEqypaPMJ0B/WBOm7nWcyZ71TLD/v8TIzEbi6ptXv+Y9tDUz+ZXCpoQWv9IbGp+AlmVhVTN6A==
X-Received: by 2002:a05:6512:3b90:b0:513:27a1:24cb with SMTP id g16-20020a0565123b9000b0051327a124cbmr5901069lfv.51.1712538258511;
        Sun, 07 Apr 2024 18:04:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m29-20020a19435d000000b00516dc765e00sm674034lfj.7.2024.04.07.18.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 18:04:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/3] usb: typec: ucsi: additional fixes for Qualcomm
 platforms
Date: Mon, 08 Apr 2024 04:04:14 +0300
Message-Id: <20240408-qcom-ucsi-fixes-bis-v1-0-716c145ca4b1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5CE2YC/x3LTQ5AMBBA4avIrE1SVT9xFbHQGsyC0gmRNO6us
 fzy8iIIBSaBLosQ6GZhvycUeQZuHfeFkKdk0EobZVSLp/MbXk4YZ35I0LJgbcvCNLVxlSVI5xH
 oj2nsh/f9ABBfePNlAAAA
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=677;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q9EaREj0DOMVe3+66xhbQSHhWfQTkjOgkWHUBDSng7o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmE0KRm3m1f38D6APNZOrOmArcoZQGXr+7re1I6
 GUJ3yJ9MFmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhNCkQAKCRCLPIo+Aiko
 1WUGCACeEPZHjpvdQURvSdQNKzKAw/GXJhVzNdDi4aG3Tt8Pc9rFj5DIsgd6lZXuczAKOoxpAKA
 B5biOIQQhIf5XMzf35FgmyMIdrrylRTICgYnMl4jQ9tR7TMK/lGCTm1ZBzBfH2DK+lqrmW+LrU8
 1SpHIT4FKug9AtEoE7qgc3zaiPkiyQ+YKiUuwCU2Sn2LADNugiX5GFOCGoSrGjdKwne7QuVkuMd
 +0ejWyJDinHcFbVyqcMiClPBUA+URFa/7N65aU5YEqJUKI52QrceTIPMmsTdNkicOmG6zgx13Eb
 FRJvNcIsB7yM5ZNf7irjutpK/iGx9fHV28DuarD5aGfL7134
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Fix small issues in the Qualcomm PMIC-GLINK UCSI implementation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (3):
      usb: typec: ucsi_glink: enable the UCSI_DELAY_DEVICE_PDOS quirk on qcm6490
      usb: typec: ucsi_glink: drop NO_PARTNER_PDOS quirk for sm8550 / sm8650
      usb: typec: ucsi_glink: drop special handling for CCI_BUSY

 drivers/usb/typec/ucsi/ucsi_glink.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
---
base-commit: 25e918cf1bb906bd9aca19ae0270feb7f6d68783
change-id: 20240408-qcom-ucsi-fixes-bis-6b314764c5be

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


