Return-Path: <linux-usb+bounces-31289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBACCADF0C
	for <lists+linux-usb@lfdr.de>; Mon, 08 Dec 2025 18:53:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 490C2304FBAB
	for <lists+linux-usb@lfdr.de>; Mon,  8 Dec 2025 17:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16308253951;
	Mon,  8 Dec 2025 17:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IM80tFni"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5D8231A55
	for <linux-usb@vger.kernel.org>; Mon,  8 Dec 2025 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765216397; cv=none; b=KyjBx2DIHnOQk/Txt8cBpK8SkbyRYZS9+Z3d1Lvo+rGZm7qDiZSxfFMYC6xkHxrlEZM5x6TOCIjlmcfwfnG83cxRoP8arKdgqbFC8ccDeuqvwbB5Qv6mac+Q/3AljIXHMpiwdK0SN8HiZjMX92pfq7O29RMcUi10PIXbfSS4oNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765216397; c=relaxed/simple;
	bh=d9jsag3Rn6a+FbSKF8GnDyJWyvg+OenE7PGU39RjDsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fALbxWmwS8qrnoNGJdQHsVHp0LDHwtgffxqZ56gMDlyYy8joEyaArBoD7KpHseoySExj9JxQnF0Nw2APTYA9Hk9MOfzmOqVdGkZ2uzGLmG3S+RDMLBEqglP2kYi8fePu3JDofJ/iKiVqkNJIW/a3xxJFzWh76f4PxY/oXnLA+ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IM80tFni; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-297dc3e299bso40098645ad.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Dec 2025 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1765216395; x=1765821195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EK7bpTnFTfEOBYdcuahE1byS2oiNqVbkUPnn94qZ3gk=;
        b=IM80tFniNA+KSI2athvEdp3dUEp/iThf5S4jr4Q1bWtrSV0QAQgIxfzwymvoX/hXhP
         Qeki9DMlJ3a60ht9NkJcGOVPniTPBM0qXiZliFpHbBI+lrNpgylM6z1FXXMY52vZTNYr
         tCY2GAlxZSS2GNIIAnMhLLATjPmIUowqXBFaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765216395; x=1765821195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EK7bpTnFTfEOBYdcuahE1byS2oiNqVbkUPnn94qZ3gk=;
        b=NY1bXlDABOFkdPh0XjFQqcow1Lrby8cLNukjwjHMuGEO+oBuPvqFlXTS7cDtfI0zLf
         QUkJegOeIxuDafSkIWdWaFH4KsJ3CM0lrgOBRIjVsK9x6/Q5osN5XwtURUJkVQ1ZuRyC
         En4g1hob6b5JxMy1+8RFE4/SbWs1IG6P1/asIJP9pN/6PAW+wivd7oNWxLDf0ISxVgY6
         ufvc4enxw6afcHhgZNB+Pnf8JYxbO6BQPUpSuhAvFXHoZY/XC39dRHCPE+VCZENBd0bn
         XCCF+K4s/T8SK9Vm62+utxLUf1wogLCKr5XZK1XIDMdRQR+j0+aztfkyUebwUwW43bIB
         bVog==
X-Forwarded-Encrypted: i=1; AJvYcCXbmyZRKhfn7tV3mRnDnq7ftP8KV2ZzOSjb/0oozSwsXCbblNmKcLxyR7ySU8v8F6KV5xCuNMd7spg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcLWvG21wGQfaZ1mql6VSDNyMwmbjE3px2904qkXuUk+HrD82F
	vYeWl9n1illyYD1YZJQoJiNhPA5xDSM7Rqh75dd0WNCgt1+PD41oQ8qqWvZ/PdqdVQ==
X-Gm-Gg: ASbGncv3u+f0IBKHHKidQbF8Sl73whmoT5rSKww2p+K+deRa4cX9Bm9T8xs0PiNvmDQ
	kf3IJ3CU69VnB4T78MZLQ7gpu+Vr+9WDBxGJEDMAYQZaARHUTg4Tib55TWcEz62BuDuMjttg+Dh
	GmjPE6dSw+DD2nThw1sVH7txl84xI0K+sriHZjeE7jCbkklK2UfJ4rGzKcifceejrU4RU17uS0B
	ipeOayx/JLCdO63KU7a7fg7RY0Zl4s6zHXNYAtPI8uLiMB9BBoH59gwzg8G3YmHV878zjCJVsc4
	99btdevJ5NsU7farw+anKSEbXyahW2pR+8ygxAf/LthL2zFoVkU8wYTObfyMlSZXHD5GcYT7hCE
	NrL0KeZKO6EUokanT6iyECd7f0ojAf0sJX+eOsBFN2kboAFB6JJfbqedRynspoAzsHJh1aAjv42
	DYj3am455Q/CDS6SLLT3NvkebteLFja0Rs74U70xTlkZDNKvL451LV+3Hymai/U+7SQNf3A3loA
	Pcf
X-Google-Smtp-Source: AGHT+IEd1ami6bZ50kTum1FuC3tvmVlLp96Io8lWhqHrGHvaIZD58g1Dr5sjyspx+vDIiFxvQ2/gpg==
X-Received: by 2002:a17:903:1a03:b0:297:c048:fb60 with SMTP id d9443c01a7336-29df5abde27mr70699145ad.25.1765216395485;
        Mon, 08 Dec 2025 09:53:15 -0800 (PST)
Received: from decatoncale.c.googlers.com.com (167.178.83.34.bc.googleusercontent.com. [34.83.178.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaab9f1sm130375675ad.72.2025.12.08.09.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 09:53:14 -0800 (PST)
From: Benson Leung <bleung@chromium.org>
To: heikki.krogerus@linux.intel.com,
	sebastian.reichel@collabora.com,
	gregkh@linuxfoundation.org,
	jthies@google.com
Cc: bleung@google.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>
Subject: [Dry run PATCH 0/2] usb: typec: ucsi: psy: Fix non-PD and advanced PD sources
Date: Mon,  8 Dec 2025 17:48:46 +0000
Message-ID: <20251208174918.289394-1-bleung@chromium.org>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Addresses two USB-C power source related problems jthies@google.com and I
discovered in the ucsi/psy driver.

1. Non-USBPD USB-C chargers (USB Type-C 3A only, 1.5A only, or Legacy USB)
2. Advanced USB PD Chargers (Supporting PPS and SPR AVS).

Benson Leung (2):
  usb: typec: ucsi: psy: Fix ucsi_psy_get_current_now in non-PD cases
  usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs

 drivers/usb/typec/ucsi/psy.c | 54 +++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 13 deletions(-)

-- 
2.52.0.223.gf5cc29aaa4-goog


