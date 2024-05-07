Return-Path: <linux-usb+bounces-10063-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A18BE348
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 15:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C1F3B284B4
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2024 13:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 401F615E207;
	Tue,  7 May 2024 13:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EoK5TtZO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA615DBB9
	for <linux-usb@vger.kernel.org>; Tue,  7 May 2024 13:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715087730; cv=none; b=VqhTOoGstJ5p9Q4kwK8hFPChyBvlYGbRnCiOiZ7aiCc0vtL4brTCa/nGdvcQgMippEHbizbL3heE/ymuAOqa0/+J766nL4dNYKgEPTL0ax7ApZyN5gZdTTn/N0Azd/ZviPsEyYtJS0r+eVbQs7bvAv/OWgGfFlxE54d01M8k3GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715087730; c=relaxed/simple;
	bh=jZxGP6shR2wef0DT3YtnzW2++LqK4oDUegkJE4HZQ/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F0ut9vPgSs/g+C5zIkmpNBdrAuQM9dzKXctS4XO+fjXUiTMdZAlFyikaTtRav9xFZVvtcA9zY8aLah0hzdyY/lgxRjhK+Et0kkBjs1WMqit/AJrmsT8Dal6boElDsgABrkd/FKuTe1EF7qXr4SMf9DdXP51fMgiTMOM15JyOm1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EoK5TtZO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-34e040ed031so2205808f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2024 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715087726; x=1715692526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cnZup5gSPBBIDg9DceCWgHDe4eLEHTcO16KO9rh+7N0=;
        b=EoK5TtZOd2b8t848qniHiCiKOG5u+eLETzkS3122Vcj0Ju0s8puZvszZSi/T4fXuqK
         K5KqIEiRy10hxXqg1cF191GuY5mShrCDegwYEUAy5DEZQsk62ejvxqcCw/yIqvkMmpLl
         RnhfgUN7lKfx+q8Qrz602ewZokfieiKYGxRw22KV3djVy5Jmx7VU9T4cvg4ZQLDuX2dM
         kLtHeDU2xgyW19kaH+j8tThb9gJH4jhuZwbG/Dd2mzvMx8O9yL5iHdVbuu5U2dU7Gt6L
         n/iK3UkhyqI7Pcrnbx7prRIs24d8hySDp7NYHT+oXJ9jaOwfpT4tAclV4OiOGE08qZPn
         RNDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715087726; x=1715692526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cnZup5gSPBBIDg9DceCWgHDe4eLEHTcO16KO9rh+7N0=;
        b=mVNfVfPYkvZGFXs5vlwQ0129W4DAChK6uel4loaXD/pS78IxKMjpqi7CS9LZVDI8fX
         73Gng8xy33E67qzGz2pmCgtmphwF2GuuJEDb7+UztO1njatW6juGPewv9TZlTMWS79gm
         yPmC9REybzSx7E2L9i/Rc5/MHKNi07Mwjht5/QUru5JIYT076lFNfcrPNApuBxeu+Td/
         KiXNkuodThTNfExAlrelxqhV7O/BrsRSVr0nehnN1mjJZq1eHbk5g1GzFf6tHNpRGDQv
         ZpyuIXpf8L9PlvHznf9/Sd0ubY/Kym+tbsrcB+pvH2ZsA7WDcPYmw+H/IjhNCZqk178V
         ntGA==
X-Forwarded-Encrypted: i=1; AJvYcCXILRzUPbeDMq3ifxCYM/DLvuxR8Hc8CKqJT/SS/XnjWOs04SORo6l/a/q4uz1ByD9CZV3nxRonFvLWsxutWLs28XLGv7pKH4WN
X-Gm-Message-State: AOJu0Yxkh8uzJIOK/V5dWzoAN9A9vGMMh8PMJMhxJHhhIw5XDpOLjAoG
	M4LX4VR4WlOND0MpdomSJ30drQYCrAn11ZfUDbNIgQKQaO761q8V9JXSgsV3waQ=
X-Google-Smtp-Source: AGHT+IF/+wOzbpM1GBvDtUABIIrxK6lyvNLJ4tyIki9sjrlnlhdztR43/jMn3qSsYMcIuYkT75URQA==
X-Received: by 2002:a05:6000:255:b0:34e:5551:49e6 with SMTP id m21-20020a056000025500b0034e555149e6mr8100379wrz.14.1715087726510;
        Tue, 07 May 2024 06:15:26 -0700 (PDT)
Received: from arnold.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o16-20020adfcf10000000b0034b1bd76d30sm12891416wrj.28.2024.05.07.06.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 06:15:26 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	martin.blumenstingl@googlemail.com,
	david@ixit.cz,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v7 0/1] usb: serial: add support for CH348
Date: Tue,  7 May 2024 13:15:21 +0000
Message-Id: <20240507131522.3546113-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello

The CH348 is an octo serial to USB adapter.
The following patch adds a driver for supporting it.
Since there is no public datasheet, unfortunatly it remains some magic values.

It was tested with a large range of baud from 1200 to 1500000 and used with
success in one of our kernel CI testlab.

Regards

Changes since v1:
- use a data structure for encoding/decoding messages.
- check if needed endpoints exists
- fix URB leak in ch348_allocate_status_read error case
- test for maximum baud rate as stated by datasheet

Changes since v2:
- specify ch348_rxbuf data length
- Use correct speed_t dwDTERate instead of __le32
- test for maximum baud rate supported according to datasheet
- Use a define for CH348_TX_HDRSIZE

Changes since v3
- Fixed all reported problem from https://lore.kernel.org/lkml/Y5NDwEakGJbmB6+b@Red/T/#mb6234d0427cfdabf412190565e215995a41482dd
  Mostly reworked the endpoint mux to be the same than mx_uport

Changes since v4:
- The V4 was sent against stable and next have ch348_set_termios ktermios
  parameter const that I forgot to change

Changes since v5:
- Fixed all reported problem from https://lore.kernel.org/lkml/20230106135338.643951-1-clabbe@baylibre.com/T/#m044aab24dfb652ea34aa06f8ef704da9d6a2e036
- Major change is dropping of all status handling which was unused.
  It will be probably necessary to bring it back when using GPIO.
  This will be done when I will finish my next devboard.

Changes since v6:
- read and print the device version during probe
- Only request one bulk out channel from usb-serial core
- Implement status report / interrupt handling
- Fix buffer->rate calculation / enable support for slow baud rates
- use a mutex to protect against concurrent writes
- split write buffers for slow baud rates

Important note, v7 is mostly done from work of Martin Blumenstingl,
so the changelog was built from https://github.com/xdarklight/ch348/commits/main/
Great thanks to him

Corentin Labbe (1):
  usb: serial: add support for CH348

 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 725 ++++++++++++++++++++++++++++++++++++
 3 files changed, 735 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.43.2


