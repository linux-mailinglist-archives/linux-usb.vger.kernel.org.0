Return-Path: <linux-usb+bounces-20111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8CBA27401
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CCF23A50AE
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 14:04:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29E42144CB;
	Tue,  4 Feb 2025 13:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ghUlhyD2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC2F214229
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 13:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738677533; cv=none; b=CQavt7hm9jgEQvTmegIHZhUphJ3jhkLzCvPF1pkmA9VUi3df2l+owDqPnYi2pKxLVfldxJgoC1vTEXJKgBeCZhaZmhL8+MuMHKNiW9K2i0IHQZpT+f0NqDkaRFqz5D/AZl/JNlauIxLBNoBFNOwd9jXbl79l/uuVS80YMcbBaAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738677533; c=relaxed/simple;
	bh=vumFQcxg92i+S8IdoJ9P4/+0wJ7wlFWLM531RWtV67Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FjGzzuqq0JutZw5gH7kjdrHI2D+tLmrO+nB1u4esQ1juQFyj6RXJYUUnPZyiun4K+Ov98Wt0mpY1yBmC0ZbXmMwrp73u5MIL+Mz4ZIpmw2Hy88LV48mluQuQNHx6zw1VEEA3QRwTp6PpY61rgy06AL12HbLNyd3x7AqFNPfbuF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ghUlhyD2; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43621d27adeso38625735e9.2
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 05:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738677528; x=1739282328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lNAAemnFz11Ss/Yl6lsNy/jAPdpl9qzq8HEHAK9Eyo=;
        b=ghUlhyD2YDF+tOHKJfCk67aHpdV+kwhk3wXqOXDXW7CrUJcE+8WPjPym4m8/2eQgsH
         NHBphxtA1c/C3dEAvBObBpQH3TqpeqxTsTNbtP1tqRlcYRhz7VfYqDLrU15bqdafGepy
         Vsy9B+qQX7BWMBK89ovcyxqEmaBbVLg6eCRlKSHUNZt07Yql6R7hJIlXhSuNYbRTCU+/
         VWaudmhkZCqJkBk1w0u9u02n2U8A4ENDigfiv+LZU+07hMfsexTVnRohmWk+jUWEOlOo
         mxOpHIE40zdz7yXaosIGaSJ3siWrwWUqbgxFQ7zgnRirwRbL9HpxnzZvTuB7oNTB7kIo
         d9yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738677528; x=1739282328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lNAAemnFz11Ss/Yl6lsNy/jAPdpl9qzq8HEHAK9Eyo=;
        b=UuYxO76CfltW9hodGhdBhdMPDXk5JHY5nmkfCC8U4CwpSxWCt+ECxEwyC9A3Klq2E2
         uPsslWfPUhLzVSKyeOensR+7sAQuFFDC29WlCrsvt1spsH8vzutfyAnIeu5lDbx+Cj8F
         v6JYGWTCGSlBId3ctWEA1CXnXU3C3j0Cgwrc3opxJBOFIX5KJ/TokHMhydT180rhXvGG
         yvqeK9wsj4nVHBA+wknhsMRnhAUcvvM5ECDcWNGz9lay3BYG9C284mBOL0GeA6NfKOI/
         vmr7kkjUDLqyk4MKIFGER0PKeN6FeKwBS9B25eND/duQA3uAQXIL7qVueFU3u0X23+r8
         gXPw==
X-Forwarded-Encrypted: i=1; AJvYcCWgqRbBuORc8GM4t8wPkMpH47pW0sdeZxaqMqFIqrz5m0HRykH3M7RKp6t5v+g7OUnU2hz28r+pBiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDeOfyb5rPEJ61fT6IrqAql3VCaMwdy/8rzYmKpaeH0PP6fXwv
	ZkwxK5T7rJJWBllQKev58wpynZ8T4owcOGmR7Dl0VURASsu7wGqJtyiak8OYL2w=
X-Gm-Gg: ASbGncveVuZWLoq7GJm/SlzVI4A6pU7OrGQD8jh417zLyAvVDyUgtN2wrcgK5xeyeKU
	Fh543biDyAM2h6jNY+CMFzSGRa50wDyY5Ugt37heoWUcY8jQidxbhXb+NPrAMJj/D6tZdzzcueh
	uaBJUuy+hSRcstSeZzA8ilpkiaXg3t58kf6SbwUViP8GXHLFbbMo0Vu+uM2lilFQnvHMl5NUTpA
	eJnUkOcD0/ptXLGXtudF3LXxcxMUIng9fTtA0yaNxCQb8gbwj+2+3APyJs+0H42D2w4jaqmiEor
	FV2dChioOCG7farq4eeHihqfRopzAO8gKhkOHa1qX3n7rHKEtg==
X-Google-Smtp-Source: AGHT+IGXHHfAhPhRwCObP9XcfKu4Lm1SYHsqXusIjhZHZmXZlEcbCT86S+vSSVyTRag9ggQN10lP9A==
X-Received: by 2002:a05:600c:1d27:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-438dc429771mr235006065e9.29.1738677526370;
        Tue, 04 Feb 2025 05:58:46 -0800 (PST)
Received: from arnold.baylibre (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc13146sm224328065e9.4.2025.02.04.05.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 05:58:45 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	martin.blumenstingl@googlemail.com
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	david@ixit.cz,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v8 0/2] usb: serial: add support for CH348
Date: Tue,  4 Feb 2025 13:58:40 +0000
Message-Id: <20250204135842.3703751-1-clabbe@baylibre.com>
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
- Fixed all reported problem from
+https://lore.kernel.org/lkml/20230106135338.643951-1-clabbe@baylibre.com/T/#m044aab24dfb652ea34aa06f8ef704da9d6a2e036
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

changes since v7:
- Use standard configuration and interrupt status macros from
  <linux/serial_reg.h> as suggested by Johan Hovold (thank you)
- Update logging (avoiding %s to print the function name and
  rate-limiting logs from ch348_process_status_urb() which may be
  called a lot) as suggested by Johan Hovold
- Use usb-serial integration for parsing all endpoint descriptors for
  us. As result of this usb-serial and ch348_process_read_urb() are
  now managing the status/interrupt endpoint as well
- Move processing of the write buffer(s) to a workqueue. ch348 does
  not allow multiple parallel write URBs (with serial TX data).
  usb-serial core however tries to always make sure that the buffers
  are full and sending them back-to-back. This does not work for ch348
  as it leads to data corruption.
- Don't use bitfields in struct ch348_status_entry as it's part of an
  ABI. Thanks to Johan Hovold for pointing this out.
- Use #defines for magic values and spell out cases as Suggested by
  Johan Hovold
- Drop support for baud rates outside the range from the datasheet.
  Slower and faster baud rates were added with v7. Testing for this was
  done by connecting two ch348 ports together. However, when using
  another device these faster and slower baud rates are not applied as
  discovered and analyzed (with a scope) by Volker Richter (thank you!)
- Keep the package type around in struct ch348 as it's needed when
  modem controls and/or GPIOs are implemented.

Again, v8 is a work from Martin, I probably will never finish this work
without him.
Great thanks to him again

Corentin Labbe (2):
  usb: serial: add support for CH348
  usb: serial: add Martin and myself as maintainers of CH348

 MAINTAINERS                 |   6 +
 drivers/usb/serial/Kconfig  |   9 +
 drivers/usb/serial/Makefile |   1 +
 drivers/usb/serial/ch348.c  | 736 ++++++++++++++++++++++++++++++++++++
 4 files changed, 752 insertions(+)
 create mode 100644 drivers/usb/serial/ch348.c

-- 
2.45.2


