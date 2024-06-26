Return-Path: <linux-usb+bounces-11697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C2A91834A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 15:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65EA62893B5
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 13:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17EBB18F2DC;
	Wed, 26 Jun 2024 13:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="dBiV9eWC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D76E1836F7
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719409651; cv=none; b=ianym4gxQlnmuHpyrP41WEb3gcoP067si3RTTDaKF2NCdpTV3u9QOWxy124uyqpq3oszQtv1/5lEt6gf8B7+OJpujrv65r7I9PlPHiFP4ZOaCxe2rek25bu2kMtZeX3dnSAlsmmq98okkLjCeY3EWDQB9aNjdITGGuHH71UrK7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719409651; c=relaxed/simple;
	bh=/jEClEHDxEl+djPgKLOGRJWMVDG+RYF17xauYwyh5qE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ed5H+SzEJPsjeBukmnULeK5wGLssg2EJ/lJZrj0c2UfxB4+tt+hmYdM6rYFREXnivZ9UOjogdSyCViJw4pUIFO2w7qwKSw61bZ5fkXYgTQjuJbdnfrpzYDlsz7GfxT9GtIo74lSXnNJJ3PpW/A7VgWpSwbMVEdBGUf4J8ZpQVDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=dBiV9eWC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4248ea53493so25980445e9.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1719409647; x=1720014447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RHiBgnfP/0rnnPCnPMDBOWshAUvOWKD1FEoaKWD/1kE=;
        b=dBiV9eWCrfWN0NfagsXskNqpQO1bN72mc/aYMIsNuWgCM7smDauPkOv9mc/aJEMLiS
         60PRKToVI+B6PBYuk/wjbSQ0DmvWcGAyhtOFFiqLjkpBRcxDnj6jTECqyAA355Ox7AaN
         dGbVgNcd577qoSkz7uMK4ScAcmM5KOkVlMNii/2OVqVgJ7idoAiMLX+7yE/oUA6d2jeR
         SLRALhL5UnYSsU/UcaC1vH45/avc3Njnorpz/7tIeCCr1PolRYDQqzUYOOOe66xYVXYF
         jcJI9isTTKtn3zv3RBv0rvrH4OY8FvSLcz9VL9gCzNNJlvYKJeD8W5tXljXzZDDrHbPc
         9bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719409647; x=1720014447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RHiBgnfP/0rnnPCnPMDBOWshAUvOWKD1FEoaKWD/1kE=;
        b=DEpEH6aNz0bYTp3pm1SNdXIifAlQQVooRmVfuYC6t5PjdGdezBR8OR9bEuncL+LFRk
         cblmpY+/h1m7q+g8qNqJr97UnRqmaX1a07OgmRA23S1wCiksaDEU64G2nXM8qA7WkNIe
         3JIV60MmvQImAoFooVwSNjTdWh1J3twIbK7zocSCXTTGtx3QNdS1T3ok4/zkWhdIf+tj
         x5xDfTrAm4x/QBPssruDUNP6haJgTvEQwJgmgPviBG0W7CBQxejpu+EytI0bUilcmrFP
         PoOmmILIlltKzAVBYVRZ/15BC7odGVmHVfgqpUxchCfZcxuJQHkTOkQkwS5/6N0u5c/A
         K0KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG7x8NRcXoaH+BwdyrG3RVQxp0mF+Bu2CnOSS7ItFJRA8QHB/f67au5kPOAMSjuguugroIJLPp3VkT4XXMS9qWxAy2Y8QatEpH
X-Gm-Message-State: AOJu0YxR9o3UEMavXUIHYGPMWe0naG2ydHe7rm7hzZZcWEhqzuk6Qixi
	TTUp3XW/aam3/NDdVJlblr+6oK+C9ngQ0S5KTnneY2nr6kSdgpPiXjaNXj8methurpoMeSf6zVz
	7
X-Google-Smtp-Source: AGHT+IEmS2OWbS79dMTwL4fhRrin/KFAoeZqHlZtaieH7je5p3m5/smsvb2C9xkGG3a3QPu3VxqGvA==
X-Received: by 2002:a05:600c:3503:b0:422:218e:b8d7 with SMTP id 5b1f17b1804b1-4248cc66a78mr89547365e9.38.1719409646730;
        Wed, 26 Jun 2024 06:47:26 -0700 (PDT)
Received: from T14s.n1ce.space ([185.254.75.30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424c8475aacsm26611625e9.47.2024.06.26.06.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 06:47:26 -0700 (PDT)
From: Marcello Sylvester Bauer <marcello.bauer@9elements.com>
To: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matthias Stoeckl <matthias.stoeckl@secunet.com>,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: [PATCH v1 0/1] usb: gadget: dummy_hcd: Fix regression due to hrtimer migration
Date: Wed, 26 Jun 2024 15:47:19 +0200
Message-ID: <cover.1719405791.git.marcello.bauer@9elements.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel CI bots such as syzbot and intel kernel bot reported a
regression due to the migration of the transfare scheduler from timer
list to hrtimer. The current assumption is that this is because timer
list uses soft interrupt context. I have not been able to reproduce the
regression consistently. So I'm submitting this patch in the hope that
it solves the issue.

Do not apply the patch if any bot still reports the problem.

Marcello Sylvester Bauer (1):
  usb: gadget: dummy_hcd: make hrtimer expire in soft irq context

 drivers/usb/gadget/udc/dummy_hcd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

-- 
2.45.2


