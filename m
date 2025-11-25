Return-Path: <linux-usb+bounces-30915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D28C85C49
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:27:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id CC00434D1D9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CB6328258;
	Tue, 25 Nov 2025 15:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zrr+Et0l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550423D7F3
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 15:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084464; cv=none; b=UMQfxa874f87MfHvwxIojh9GHKMOtIzpFRNhWzHaln/Zu5Iq4VJbuTWGKI8DkX7VS4y5PtaSrzoL64FPK0F7+RuDqxmSdKK3N3msyHrcQlVRLEy6LRsqjScXdoKVTxLgisDCA7XJ65mBCv78n5XBI4YbqX53GTAP65Yhft+nUTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084464; c=relaxed/simple;
	bh=pnHxicX61QyObB84hF1WfdeK+yLkFcxher8UJbjCEQk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EtfeiWTdsd4GyuyeeMVI+nx/G21zDm2E20Lb4Fi/dCcrH6PDDImma/fC/j6C4rIPtVK5mWAAOlpBA5myeBIWTpna26UH/CuWRZohFYI/VORGdCi7/robPMqV5GVu5tb8oKVW2Sj+bwpuCGB1w9avItP3kqLHtYLdPom/Kps7jeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zrr+Et0l; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso34301805e9.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 07:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764084461; x=1764689261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SvqgV1NS/Xt+8RA7fnAha3HLQLbzSNHtDWup9FnpZJk=;
        b=Zrr+Et0l/Rsnk3Uq9z9e7EdO7+VbQUnr6H3cXlZiWlZYa6B8IohIX7SXlEoa1UBjcD
         Pb2HjWqCtKo83z4RYR0ICspf0eRM3aUIFzTlhhxgfzjRpwocx7YlHHOvT0KjeEg2OJqR
         TAb0700ipliv0WqTtREP3PVNr8vi02nM7NQtI35NFHLqi2hjQgLVvl2rRJGDG3aGxH5/
         7fX6PSPZck4UQ4/IhOAGkGDac3lzq8pyjw6slvA9t0r6lcxliuGVQJU4AYWqSsYxHEL/
         QDuzPxC/ue+y5/3wKTgTYPJR9Tnl0t+WiGNKM+gZtDu2l9zjIOmNx/F4BVr3j7CdW+nX
         I1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084461; x=1764689261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvqgV1NS/Xt+8RA7fnAha3HLQLbzSNHtDWup9FnpZJk=;
        b=aIOptgQQNb26i2pB5FMmz/IJ80DXuOVf8c9rwWm+dhd3I9VSvOMtnMToNR6tZtfgZn
         4itwgCTOhstgcAmsIyj9Fs1+HHvaYXHZ46QwrufWaNqQfODUVXqXZ6ND6Y01BsW3q8xY
         Pu4Bol4JwlqPCIq41lRPullpjSNWW7xMZEhmhL5Gh3KGXZfU7yKSZPfgVk0yS1VJM9vu
         waQ2IaL27t21YrQCLDSgCsgGPAlnshE4p0bKAC3A6bt3ljdMMF02sZXe9sMglEYYIKqf
         kyx5QfQACExbNtpwwojTkxzI7/XLDYgZT8RoT39iJP5MberrS6uiXQ2ZKZXdI01ZQ4fX
         s8zA==
X-Forwarded-Encrypted: i=1; AJvYcCW0qMKhtv/66qnzQQyiyKrYo+YShPGsGUQHC54njkKnWfgWx0fXCBYhUkynZT2LR/VB8pI2xsNj40c=@vger.kernel.org
X-Gm-Message-State: AOJu0YySHHrKfUVPQspsgAJeMkyvzmQdh91H6i5Vv18043Vc1bjXuQAG
	jV4ZcM0nhEN39mzZ4HxCLNiLR/YSyOmXUegGcDyum5lBFQeNd4tMJgOD
X-Gm-Gg: ASbGncsOkAZhzVTRtM4qjlG6WeYuE68CI+Wt3duRRWVi8dVdt1aPed1Z7hZY9bxj98u
	vS9/ewabh5IpHSh7F0zVDtJ8Di/yszfca6ZJGhiCDGibdPvztQHsAsnfgDh8+xPbBINiInu60CM
	q/anqdc60BDA51nvxkmA8eUvgy2IN1rPOAeZh5get3Ajzgg2FaEXmQhl23yiXVA9f+aj5p+qVZj
	6RMG3OLxvJVOFbl6H+vmDPw4lRUlxxhJ9/hOsGUz8kMh/FWjrJ48QJpDlFmqwlupXNfxpvrWue6
	BclVDmr2uXj4jNjIz2fEiUFxyhFirATHxRRJ1UXEYtLoyDQUZUeyYns/0EQrZCCp8n+IPpAim1E
	a8i8iRXhnHXEVXoNYzrcqbpAnSZLf9NFO+9HEBw3yDIq9SfSZ46Smf/J3wUtmvfxtFjfaqA4YrO
	N0/S9QQZMYUUVXxr/0ChTaYRciZhY5hpDEj05G2peyioG1QeH3gzBVG4fmEVoquQjc5evIGSs6G
	nlcJMsvBJ2gKhYOHtoF6F6LMTsuupeRFwMsH9TxxQ==
X-Google-Smtp-Source: AGHT+IHm90PYu189iWIhCrgRjYGOcmrjJppEFn2Pcp2hOfR/ABq7QfgpG70lc+dICpN/l8itYwknEQ==
X-Received: by 2002:a05:600c:4f82:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-477c11175a9mr186039675e9.16.1764084461159;
        Tue, 25 Nov 2025 07:27:41 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3602d1sm265128575e9.5.2025.11.25.07.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:27:40 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH v2 0/2] USB: serial: option: add Telit Cinterion FE910C04 new compositions
Date: Tue, 25 Nov 2025 16:27:32 +0100
Message-ID: <cover.1764084304.git.fabio.porcedda@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Telit Cinterion FE910C04 new compositions.
Also puts Telit Cinterion 0x10c7 composition in the correct order
inside the source file.

v2:
- Fix author's email of the firs patch

Fabio Porcedda (2):
  USB: serial: option: add Telit Cinterion FE910C04 new compositions
  USB: serial: option: move Telit 0x10c7 composition in the right place

 drivers/usb/serial/option.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.52.0


