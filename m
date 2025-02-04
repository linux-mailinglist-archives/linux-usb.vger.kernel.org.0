Return-Path: <linux-usb+bounces-20110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C94A273FF
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC2323AA6FD
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57AA92144AF;
	Tue,  4 Feb 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="boH7aWQ7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED521DFEF
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677532; cv=none; b=jzQApoW0+naZDD54Su/fLSSMXLE/AWiCdM+Zf15ObrMnMslq+jm9qXIhNwaih3ptZ8jtD7le3HaHpOdUC0UZFPFVWPs3Itf9weReFQfFx9X1KivbY8/q+gaD8cIK5Qlw+4BwEY0HKlQo/FIlgYbjlcoPds/H5NoWZueGedCbHiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677532; c=relaxed/simple;
	bh=qwNusalsxqdNQhdpk2S5586/XFRiEANFBgaPdBV5M0o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BJl0v5xuEUeKCDs5WMV7KsKZmtn7vQfwI6Dq65/Z/jipAhmMxLFyFq4ZuBiscaDGcPmBCKlc7tdO5D66bzG8DHdN1jVrSFjJbbgWLartJm1TkFLrza+1AplIBSL9C6Kdvi6snRcrIJOZ/fHnQ451K2KZzOx6x9u7ddtlu4wVngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=boH7aWQ7; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38db104d35eso261222f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 05:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738677528; x=1739282328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b9Mhzic04g3H6M95YhZzI57+VboqPOZ3dYOfhKdSDJs=;
        b=boH7aWQ7bQMZim1wXmX7I6vCO+ngAxKeBp1qUp9j2z+oarLpSz40LOVbq1YaIbK6U6
         rNPvPQ4waGaSfzqNN5zVpnxy/NOH5EvUFds/jEwauOhRHxaRzkCHemAF6GTpOwsexX9I
         jV6hydVbsKG9sC7Jj7sHUNgswTbckRYMVpLBRkSytJ9mxU5J3hyIOxZipEHKiNwVOy3H
         6acbXMUIuUZg0RX+7GvPvUf8KhN1VRKuC3gtCBhPmHYkmb1wQ4d0qMa/PupLQRGzN4ru
         OSrcEcE2NHGxBHl7tJMWfBdTZBz5qhgnpnqvsNUQFb96CTAkytANiIrez0krj3tpkbJQ
         /oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677528; x=1739282328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b9Mhzic04g3H6M95YhZzI57+VboqPOZ3dYOfhKdSDJs=;
        b=qnvQO/qjbjaHEvSTY6yIuogx6zl7ZF5h8JoHZ3qzaKz9q/u9tp/Xh6y/YoweyTdcQi
         0pYSlAySKQRh+aD5/tayS+jFtg1crLyVpAigxHBRwZHQ8FAM070l9xMNl8vVfocfVB7a
         ak/hHUoTD+31/RjG39R8KfhwH46v3qRx2qwGUIyacprdNJusmRJw2PxuFLxcL2zJjkp3
         vcf1B4zVOc7yX1LbClJwrt09R+gVXKM/+hJooH6O3iU/FLJMZQq1mIVSZGjLog9bBpXE
         8MBqufUGo5SxitqbBUrV7oxNcTgJ5MBjRXglwwvIOiqiFBt6wbJj6tebDhkIl+c4H2In
         1JtA==
X-Forwarded-Encrypted: i=1; AJvYcCX6Rgdfq553PQN500AeuRV3FJHRUMiFmUi8PtzU4bCTHtKKVl0gwMMFIOXDUAg4rIvSUJPVWKr4b+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgcirN9SVKnsmSikegmZhLDHgSgVWX1BVoNf3qY9YeCHvNf184
	8GvHY9fa1MUDJQwiL13tiR8ul1BvlfbWc4HobSoYHxdP7r90sjvulb2ERLv0qn4=
X-Gm-Gg: ASbGncv9+v0ZI27iZtevNh8Yv+q0dkEsSrb6jjCWiH3Yl8L7qlryUlgpeAFoL1OLKj5
	fA8RPLyDCQk7BaGTxjWcR7JMzZaJt9991mv/wgrVEh9rC76I9MmUdSISfL3PJz8oA3Osaoyp1Ac
	schswI417S7R8uxAvELFZAIfgpdOMxQ+VW2sLbctc8FCb1OGYnSwT2u3OMZRcqoaGMIpi2EaSwz
	QSVRw74Ap7ZK5j1uVZSahgrg2JUYk3mdgJvMEzCtDIKWI86HtDhd1rFqqyQUFUTXueLUiU/g/Ph
	yGNddfCBZNeIqxE4KpXhiUUE5uLRTDPdn/4eNhYrL9BYlPppeg==
X-Google-Smtp-Source: AGHT+IG6HYRgSllCm56nuMoAeKWHbxfz6C7lnkj3eQ0dmAHEhCsGlZxEcR573rWapsj44lPvD0/Tgw==
X-Received: by 2002:a5d:6c65:0:b0:38c:5cd0:ecf3 with SMTP id ffacd0b85a97d-38c5cd0efe3mr19037648f8f.11.1738677528507;
        Tue, 04 Feb 2025 05:58:48 -0800 (PST)
Received: from arnold.baylibre (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc13146sm224328065e9.4.2025.02.04.05.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:58:48 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	david@ixit.cz,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 2/2] usb: serial: add Martin and myself as maintainers of CH348
Date: Tue,  4 Feb 2025 13:58:42 +0000
Message-Id: <20250204135842.3703751-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250204135842.3703751-1-clabbe@baylibre.com>
References: <20250204135842.3703751-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Martin and I did the driver and have hardware to test, set ourselves as
maintainer of it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 481b2dac1716..42558a70dcb0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24530,6 +24530,12 @@ F:	Documentation/usb/usb-serial.rst
 F:	drivers/usb/serial/
 F:	include/linux/usb/serial.h
 
+USB SERIAL DRIVER FOR CH348
+M:	Corentin Labbe <clabbe@baylibre.com>
+M:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
+S:	Maintained
+F:	drivers/usb/serial/ch348.c
+
 USB SMSC75XX ETHERNET DRIVER
 M:	Steve Glendinning <steve.glendinning@shawell.net>
 L:	netdev@vger.kernel.org
-- 
2.45.2


