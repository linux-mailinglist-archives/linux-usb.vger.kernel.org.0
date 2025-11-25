Return-Path: <linux-usb+bounces-30912-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AFC85C07
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 16:24:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 53B7A4EBA76
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 15:23:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87611225416;
	Tue, 25 Nov 2025 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yq+ZRzbU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E72F1C84BD
	for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764084184; cv=none; b=q+mjiG+BXW+YBTZaUs0XjrSh5VjY/2NpJ1xR44Ee/eRkZW4dTAf+Rgv7C3eP6XPoW1wK7Zvlzq3ntR9AJMXnrF1YLp3/MkeHBmBCZ/VT2OJvxG3xR72a16CcwL9OEpxkHguwehYJIfKHPlqPRs9SFB/norpyxV3FZDuWqrMsupM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764084184; c=relaxed/simple;
	bh=5EmE9MWB0sFizN4AE9LES1yM/kMAiE4wmWZMVaCzmXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lr2eWVwBjUHK/pAS87ZgRPTyxI4ZYwqWhhhJ+6/k8LZ0jRDU3bt7UiVTe74CRQwR417Qgw+9+Sda/tg8xuRwpq174Dzg9IJCtq3bSqA7jXyeQAe6nQmZi6zu7oW0OKrNDZsrNJmcWHVpNG+5oqKN666H7LCXPm1N3tNOIBRI+8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yq+ZRzbU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b2dc17965so5338480f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 25 Nov 2025 07:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764084181; x=1764688981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WH8MM9QAl8jXSUvcPcQw06UWI6OEhYmNV1K+83EutF4=;
        b=Yq+ZRzbUg++VoALXwYbNNz7D9UHN34g8w+6lFm7alJOBwzDACabSmt8iuWnNds+jq0
         VzVOBWXjCePx3TrE/dNQYZUZzyzXa6nf5Br5BGaOmdbkAuIAOpf34ha3dddbTrdQrrhj
         gN1tAfmN1cuYeUQ/qW6ykDopIROSXae3RI+4pGeO3JgBdop8iicBheFNTKuF0FBzfX6e
         abvFLqD3t+Xo3PcsTb6hQz4ZQNll8rUIZLtrfnNC9rW8fFhfx1CUWxgdkr4luyzb4Zpg
         5Im2vQLqF3kwqGhS/chphwl7l0bRwmn2qUA9iNJfvC4Io3c/wt+Ovah9N9qiLVYIjCor
         vrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764084181; x=1764688981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WH8MM9QAl8jXSUvcPcQw06UWI6OEhYmNV1K+83EutF4=;
        b=MxQVdeDEJbVE9MJaX8D2N7Jddm0eTvAMIvxwZ33j2SLDFhA/sQ5+JXCC+lAWDmFxaD
         OKUuudZp791ztto3Fh4mEtuK+7ikBWZCPfQBJ9Q2B/WZv1whXT9PWTKmWAEs+WY6EBeB
         jBQ0tk6SgY8a6jplq1L7rbCmc5Scej2Xp+zoqHbcQwWxTMjAqHaZ1dSZdcotWG4qqOoq
         4lfmugStks91V7+52dvNznuvoupJcLsIw+5ryQnaWLE3WEpixa63i5AkAnwsSUEdGADv
         Wtip2nc4KR/huEjCpHCfqRp3ycKPxRl+2GlW+Dr8yJ9Gqn16P9Qv1fgCiP0HHaeHiccc
         vUGg==
X-Forwarded-Encrypted: i=1; AJvYcCVuuroXDaeo5z9weP+V+oPQun2EUjxVBRQ5N8yNYyuRFNrNDJymlKPQriqFOJtHOhwoLvNYR9qMPBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHbH4yiw8HpuHqgcFJLvnBNxqUAeRLXYiDevk5Od9CaF0PEN1p
	AvzEWcXdWKF+RVjvSJkmeyJ3HL7NEhrbScBK5PNYPPJSddUkC7/T6Aal
X-Gm-Gg: ASbGnctRA8MR+tO1WuX+7SHPVfwLw/0hvJkxQ/HyM0AF6oL41gexRj83SOyUMj3GI0G
	oJOL9Kht6/Xjeli6R9GO8vlvXCAGr1pQkp61WGMY0LcKI6oPJgqwchzzGFiFH8zbBRkD+NTwWl3
	8mxSt8N+wh+GqCfoMHNekmRpRjfOS8YyBQHJhsEs4RbzXUdpOE/kkTvUbeXypIRzaoJsPiWoTTa
	iVu9Eu641pyN8b91xwrgzmtRmmND9i9tSVCjlmMO5qZwDBUuvAq6S6KjqbHJ/g8lHUuEdvK36bN
	U+XLAVOs18tPioAErsYDAQa3tdCBft8b1mwakwvENV4x8PUQFbRUKj2xpBwXh7jQh5th1pRUqV6
	8aGslAZoMPn3nRXZmMZDrVH+g8RQlU2c4NoNe0chD4zLx4uKSATI9UQ/Ugf8NfxLqRK40Rvjmf5
	pXlBXnLEGWeYlbpcXMtqyf6EWB1+FSPSPS9YExxrGWe7a+VDzCjgYI0FYMMPWRsryb9vSH9WGFC
	mNvCFVIVrR5A8NH
X-Google-Smtp-Source: AGHT+IGUwpS8tWnmU6Y7RejVfugNwKXnHvC8B4aRvMexnXUcU6OcJ6dFUoEGBZ8ra1u1mTCnJGO5tg==
X-Received: by 2002:a05:6000:40da:b0:42b:47da:c316 with SMTP id ffacd0b85a97d-42cc1cc30c2mr17554864f8f.26.1764084181331;
        Tue, 25 Nov 2025 07:23:01 -0800 (PST)
Received: from labdl-itc-sw06.tmt.telital.com ([2a01:7d0:4800:a:8eec:4bff:febd:98b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd8d97sm34397911f8f.42.2025.11.25.07.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:23:00 -0800 (PST)
From: Fabio Porcedda <fabio.porcedda@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Daniele Palmas <dnlplm@gmail.com>,
	Fabio Porcedda <fabio.porcedda@gmail.com>
Subject: [PATCH 0/2] USB: serial: option: add Telit Cinterion FE910C04 new compositions
Date: Tue, 25 Nov 2025 16:22:35 +0100
Message-ID: <cover.1764083851.git.fabio.porcedda@gmail.com>
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

Fabio Porcedda (2):
  USB: serial: option: add Telit Cinterion FE910C04 new compositions
  USB: serial: option: move Telit 0x10c7 composition in the right place

 drivers/usb/serial/option.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

-- 
2.52.0


