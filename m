Return-Path: <linux-usb+bounces-24663-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50C3AD374B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 14:52:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4BA6D17A838
	for <lists+linux-usb@lfdr.de>; Tue, 10 Jun 2025 12:51:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0AF229DB6B;
	Tue, 10 Jun 2025 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYb1Mv8B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C246429616B
	for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 12:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559432; cv=none; b=GKcp0yD6PDGVRhGkaHxJahMeuHPuKuhb6GR0GEt3IoMPtTO1Z5NMNYXqs53mBLeFwcSEWsbMRi/W2yG+9fF+BOwYjPc87o/80R+5ph2W1mIONIuqavZ6y52v6c/cKuDCDgq+qETYi5Pxx5beadOA/gT8grumvSDPz+JM6rUOH6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559432; c=relaxed/simple;
	bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QJ+SFUZGq9KhO2QFsbuyW83BJP29W4oDaepcoDonAVpXxAGkmYbpih+Lfa9e2MOXkQfo+14gHcm276EMXZbAxYS2OJQu8YOY1AfDDt3PWfzy00OaYrsPT7l7MRSWr/xYN7xD5Z6ZFUUwZ9EnnOkJRzMOqeB0r9ipbGW8EcItAK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYb1Mv8B; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3232307f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 10 Jun 2025 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749559428; x=1750164228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=mYb1Mv8BaMkADn/0vDKNBtN9qmoBxhwhYgkMsJ+w/lEbQnOeXn+DJeCroihZ8Sh+zh
         vtrE2PqrDaSMvp1zp/D/qsBMakHMF/9F9QOPyCWVuDLmT1y9B4LjO0QdSmLQ03USft89
         zf71di4a7VLfRviqV4pOVlfyQEK+GoR3+YC0jfBLMzfkxUj63D4zVea0H+HTyLUme9FT
         Jo6hFeExQdbzg2LsWpETdhXC27XVGbQHc0yWKRIzR7kpn5wUXjmpH0H3nzR5IbHAwZn8
         0jNEaeiBH1Z47O/Cu9EbuAR9PPDjIZMyF62bXFeXpybLFka+TqPCH0k6NZUq/5Tx7/9D
         +qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559428; x=1750164228;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiVUFoTyYUZ3pxshEFcAd4bLKMF3ilGuB1tgOPOqVOw=;
        b=atdM1qA/UKWbzgGRfkqoRk0W4JfoxMrnqjzrakNZ5yTiFO0P9vMWh/Lroeduc0rzDn
         Xuoovqcex8EkNMGqx/72bwtjixE+To+OrdxEK2l3jfEXnzIR3H1/FWVgdro/yL8r9Lp3
         VpvPatX+riVl3aS0QyYgPQYFj2MLIvQHyK3ID6dmWrcaLs1xYCLIBD8cSsW75WFWGeIO
         QFetSNCmte9OBibxPVUwMMmm1Y89pzDgzg4W4OEk8v87KeHBl94rWoIzRO+DdySFRgWO
         CLlY4Dc68k4VsmB5f5NlKetxv7WC1ODOgacyTX+k+1bFs9rDXCyVQO1vzqP93HyLaGJw
         4P6w==
X-Gm-Message-State: AOJu0YwyZSMJui8EUZo2Vlj4bZszz6Q3gg3bcJ0p/PgbrP96PuSWgnDi
	XX+Gzh4D5kKAVqm5UiXy2nnXwAqZKVfOes7g3CYz46idH3+lvdExglu12z7VV3hZjR4=
X-Gm-Gg: ASbGncsXLXzZzKg35IYlJxgG94FROFKPnOq8ZboQQKxo3hOyuvg6IPKHhOvDB7k+7lh
	lUK13dVyw+zrj9LGtkm5cBzAbsmqqfBUuw8SO4uuc2bJ8Ff+xnSBmE8UVSt0PCT6KRFjZefbfrB
	HZQIvWt5SBSreXsyYS3fHZXHGq3ravxBkRP3hvBXK8OMqQMSFuY2/U189x+nk8V7Hm4pkYlL66s
	pQ+G2eUK1LQL/cKNsB8azIglTpMKrtL7UwZLkOdWcEe67yTeyf1iBrjeBTXLOxQZWzLvBD9cTAa
	blwVHjb9esVNVilEBUnaChVQ/EYxYi8rVuZHBvx1Vw/5jnChl6KD
X-Google-Smtp-Source: AGHT+IGuWTf1KowrUQILfyGWQyY4v7aI69gh0KH5E1zC2liy1/7pGOK7wxPBkvdzhBOsu44QykkkhA==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13137620f8f.7.1749559428029;
        Tue, 10 Jun 2025 05:43:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244d15asm12553064f8f.66.2025.06.10.05.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:43:47 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/2] USB: serial: use new GPIO line value setter callbacks
Date: Tue, 10 Jun 2025 14:43:45 +0200
Message-Id: <20250610-gpiochip-set-rv-usb-serial-v1-0-a9343ca109e8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIEoSGgC/x3MQQqAIBAAwK/Enlso00tfiQ6lqy5EiVsRRH/PO
 s5lbhDKTAJ9dUOmk4W3taCtK7BxWgMhu2JQjTKNUR2GxJuNnFBox3ziITN+x7Sg9tppa5Uz5KE
 EKZPn68+H8XlemZ0AvmwAAAA=
X-Change-ID: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef
To: Johan Hovold <johan@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=964;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4nODc2Mtbf2GfMKmdK4ugxvnIA0l8topfUGeUpqv/wQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCiC2/OS/m48r4jFb0FUB3WKLJ2SsbwxWE21D
 btTzSpt9eSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgoggAKCRARpy6gFHHX
 cgAsD/9BtP/VITx5daGbUAukC4x8UhNf2HjiPEIG4xe701hezEsLDBpKZ1c+IzEMeJJEdguVddy
 WqX29QVn52OSN87fNbeJShmUt4OUX+uHyP641t1BU/PwyboWBgRA8UL4yuXyn0iSvoJyVofhBPg
 HLAUwFbER6s608xNbJhB2RsZSQ0n/oUECRdIKQGAEzidujU3RvLR2KjJA17ptn2sFEuVnfbkjDl
 2OgWZgvSovKzapvtDWDGFE7F8m/pzGVsVjXMV9nlMQQpg3NZaEWAkkCxLO3KQw96RyUJbajTB6p
 CR3vnh6m3EASM7zVT5pH+F77o402ADtqfHrdxk0kvyjVnDDAsBApkBvMNwDP5+MfhRLL63bgALG
 DNFIweuZaY/giBznfUr2VGAC1Qa2NLu0IL/vAHrJfMIhmqGz6agzsDddV1E7RDnoSIiq5hbamQD
 f2Vda8CceiCl3bjovl85gqs5Q3GEmhidRO4nCpo2H4EFn6N9FqHiXzjkCLR4oV6jnCfKEMqjWZj
 3ZVTRvPBQPUMYAr5BZUeHfGDQuyIA5Y3JOPc6y/q+E1E6lZKHKiUPeR0oqND8LxoGmYuEmN2kP5
 TQFpQGLzr5EAU+RmQ4wxtWRCg9LtYA0ejx9NlpYNz0RdVnjuXqoWg1mHyKzYJTCg10d4jyw9L+2
 DxXu6P2U6w0DUDg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
values") added new line setter callbacks to struct gpio_chip. They allow
to indicate failures to callers. We're in the process of converting all
GPIO controllers to using them before removing the old ones. This series
converts all GPIO chips implemented under drivers/usb/serial/.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (2):
      USB: serial: ftdi_sio: use new GPIO line value setter callbacks
      USB: serial: cp210x: use new GPIO line value setter callbacks

 drivers/usb/serial/cp210x.c   | 18 +++++++-----------
 drivers/usb/serial/ftdi_sio.c | 18 ++++++++++++------
 2 files changed, 19 insertions(+), 17 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-gpiochip-set-rv-usb-serial-4f4d4cc2d5ef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


