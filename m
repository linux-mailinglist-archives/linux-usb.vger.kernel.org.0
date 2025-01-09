Return-Path: <linux-usb+bounces-19175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBFA0828F
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 23:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2014188B1A0
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2025 22:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF8E204F66;
	Thu,  9 Jan 2025 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QIpiqrZ+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556D2187849
	for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2025 22:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736460419; cv=none; b=nWkGeuqPawD/syiVph9ogK3pcg+yY66djy+2B8cpzbrKOPeAFBHfYWLTspVJnsPD1mkQqwuJX2tLGNIAY94VzRgOYSK9BKPTGxMMcuw6m+zEQF9kI5qY/vbF8qOIKR7hCXhGaQ6tVzrtshP2kKH/vQB/fKPVvlDxyhM6yzCcD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736460419; c=relaxed/simple;
	bh=6z84NXznKiE1NpRqFZDZSeRqLTK2pAiyrFfu5gZG7/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uCyTYewHbb3WaiX4Rj4ALvTgw0qrMP1ta/urexsHrGYsUQJ57LxM6UULgV+p+6r4k+Ubs+mxiNwebtUloXAul6dhk9YskCGXWQhDIkoPNqfbvckbqcVlkxHhGn2L74GyDm1VNpPeNPEIm0DMIdmLwQswr2ZQnpWfRea/v+0oeWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QIpiqrZ+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2164b1f05caso24039835ad.3
        for <linux-usb@vger.kernel.org>; Thu, 09 Jan 2025 14:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736460418; x=1737065218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8tXgQ4cb0sIkfCID//2h8RdPOUcbcJV/Yvr7tKk7nQ8=;
        b=QIpiqrZ+myZnT18AXDGCO1fUA0DAe1iLbm81aBz7k6HA3pnrkMj+WdTB6Z6gZJvQT7
         AZQso29/cBoxJn853ZWSlQQnqhStomjkjbb77sdNlpFllg3cf5UGDJMgqclv3j/zaK0Y
         OdjrhOB4S/7bPXFphvYDAN+opsMyitg5aHhQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736460418; x=1737065218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tXgQ4cb0sIkfCID//2h8RdPOUcbcJV/Yvr7tKk7nQ8=;
        b=AGHmVYCIpRn00GdXnfcC9a/9IT9BFFIthCPOZJRsaRsu2SZrMulOBpRWszPg0blash
         OMzbi1CNAE3oUY85ln69rqWnZkJF3cU7fsySk0rHD1WluiXmV0VOHa19cYhzD7ECrRfo
         1QLh/t8NuoKq7cHGo0t43jBN5f8PDoKpJI2mnvEkBNiRHWcQSnCSJtRYeNU43SzfzouW
         dgUr7VPHfZ2Fx7hqozt/l4oBiyWBBIlDBvK4IHfBn6AsE7rj+WvF3QT6wyUx8xxBViKB
         piuc9PJAf1OmRHZ3Rms7k3jBM2Ge59XHeMvf2cTZ7LwRG1Bjsj9kG84oReIqhlUbJJbP
         4shg==
X-Forwarded-Encrypted: i=1; AJvYcCVTwLp0lfHvWP4jrUmxrU21rV9GLV/aaxyoCyMXOV751hhuJdril0kS3XgKh0xIz7OU/pVB7BvYGjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYpeT3OmGgN+c1kjLedy18uf9DtT1TPGB4uAgxIac28zhcSTQ
	jGbqBgmBCQz6SaLodq0tGmLFCphvXASiGF56idrqDOrL+VrAqIjo1s95c39BCg==
X-Gm-Gg: ASbGncvnPwGmsMEz54TSOKU8DnO6hi4FEJv1t7T++Ut9xPe+NLhu14WkNv+uD2fdVsj
	gObz6ZOL0gw/2kmSOeRb4py3Ce7SDHWaELvq70suj5RUYOrfdlIQiq1rRGOKdoZY5FcKYfFsJoX
	ofhORYCorQRFal1BLYTcVMX29TgU7d4Vcqe/FEawabYFnMUPpeJONdq4Np5KxJ/JETSsK8guxYq
	0w+nEdJTCBjyo+7blpdBQBiFHJnVifH7ow21R21dNV0O8wH1i0REk7tW2Haa31rfBzLYMNkwnBs
	Zj1LR5EMfO/yegD6jvl8
X-Google-Smtp-Source: AGHT+IFbGsLInk2MTDokl6bXci0oi0ScYGAl8eACwvZ0JgMc+OuCQNESJJhMTrboOSbjH+j4yrWz/w==
X-Received: by 2002:a05:6a21:329d:b0:1e3:cf57:5f5f with SMTP id adf61e73a8af0-1e88d043d3amr12319701637.27.1736460417708;
        Thu, 09 Jan 2025 14:06:57 -0800 (PST)
Received: from localhost (129.135.125.34.bc.googleusercontent.com. [34.125.135.129])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72d4067e5d8sm277650b3a.122.2025.01.09.14.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 14:06:57 -0800 (PST)
From: Stephen Boyd <swboyd@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Pavan Holla <pholla@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>
Subject: [PATCH 0/2] usb: typec: cros-ec-ucsi: A couple small cleanups
Date: Thu,  9 Jan 2025 14:06:51 -0800
Message-ID: <20250109220655.1677506-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A couple small cleanups to the cros-ec-ucsi driver that was recently
introduced. Patches on top of next-20250109.

Stephen Boyd (2):
  usb: typec: cros-ec-ucsi: Add newlines to printk messages
  usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const

 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 30 ++++++++++++---------------
 1 file changed, 13 insertions(+), 17 deletions(-)


base-commit: 6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
-- 
https://chromeos.dev


