Return-Path: <linux-usb+bounces-3578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3209B8012C9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 19:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61D4D1C21051
	for <lists+linux-usb@lfdr.de>; Fri,  1 Dec 2023 18:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 930B14E63F;
	Fri,  1 Dec 2023 18:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bqnAI4pb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04654131
	for <linux-usb@vger.kernel.org>; Fri,  1 Dec 2023 10:31:32 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6cdce15f0a3so2726070b3a.1
        for <linux-usb@vger.kernel.org>; Fri, 01 Dec 2023 10:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701455490; x=1702060290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5Q+AM+DhOXR89Ju18vzTGC3wrGXus7g2e66yEQ6u/o=;
        b=bqnAI4pbt/2JXEGzsxEb82qCt80IXSahvoeovzNLUMK3RKJ0eZpYZpeeMkPrTFuYHw
         wkzmYMAFMBigaGHIToD8H1Mzq0zB/CkB/TVRC16pPdJv/mCV8h9Q5OlsfYWx5L71pKKL
         4yBrFGesWjwRfQAOW6UCMTq29cHFFT1JMtw7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701455490; x=1702060290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5Q+AM+DhOXR89Ju18vzTGC3wrGXus7g2e66yEQ6u/o=;
        b=S5RiUqMnbcaGcJ6DX8Zc8uFx05bwejwq0jY1ELlAQKjr/EquTDlnk2LHTekyXqygTn
         lBZAbeLhLZnJGY68BD7Q3nhQLS7f0kUOC0HEewJdAFsl7ySBM/6lCdyFjnJuC/Jm5NLM
         gCXYX7xidR4WphXSGNDYYRWtg/WxUZE9rv4lC/Kjg1M/3Fqci4Vqm4WdPONUKX4wvFwc
         +NkMoswBvSjE6vpSOqEVpHczmLKjVwrGU/IIgTxUFR6zesd3NsI0WCoHXAgJu1nwshZI
         HXuywAn+ACW/A8zKWhNPahE6noGjCbpiEDg9ix1ICvJo4JDV2GM3R+uRnaryxR4RMz9T
         bqPA==
X-Gm-Message-State: AOJu0YxL1figLma56du1UvViENyiOqI2FqDTrq38gJRqW124j+Dxry6P
	L1Mb+HboaS2oWDceRoVRKg8rLMrMu6T1Xx4phlZza4D6
X-Google-Smtp-Source: AGHT+IHAuOQjIDX2waOHWW3Fi2purVTSJ192L6IErkIR7DpoPp8Bdvp+y5ic6UoUqwLOExUhrlIMsA==
X-Received: by 2002:a05:6a00:23c4:b0:6cb:cd66:2102 with SMTP id g4-20020a056a0023c400b006cbcd662102mr35720154pfc.4.1701455490601;
        Fri, 01 Dec 2023 10:31:30 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:11eb:92ac:94e:c791])
        by smtp.gmail.com with ESMTPSA id g11-20020a056a00078b00b006cdda10bdafsm3306926pfu.183.2023.12.01.10.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 10:31:30 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Grant Grundler <grundler@chromium.org>,
	Hayes Wang <hayeswang@realtek.com>,
	Simon Horman <horms@kernel.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	netdev@vger.kernel.org,
	Brian Geffon <bgeffon@google.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Douglas Anderson <dianders@chromium.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] usb: core: Don't force USB generic_subclass drivers to define probe()
Date: Fri,  1 Dec 2023 10:29:50 -0800
Message-ID: <20231201102946.v2.1.I7ea0dd55ee2acdb48b0e6d28c1a704ab2c29206f@changeid>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201183113.343256-1-dianders@chromium.org>
References: <20231201183113.343256-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no real reason that subclassed USB drivers _need_ to define
probe() since they might want to subclass for some other reason. Make
it optional to define probe() if we're a generic_subclass.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- ("Don't force USB generic_subclass drivers to define ...") new for v2.

 drivers/usb/core/driver.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index f58a0299fb3b..1dc0c0413043 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -290,7 +290,10 @@ static int usb_probe_device(struct device *dev)
 	 * specialised device drivers prior to setting the
 	 * use_generic_driver bit.
 	 */
-	error = udriver->probe(udev);
+	if (udriver->probe)
+		error = udriver->probe(udev);
+	else if (!udriver->generic_subclass)
+		error = -EINVAL;
 	if (error == -ENODEV && udriver != &usb_generic_driver &&
 	    (udriver->id_table || udriver->match)) {
 		udev->use_generic_driver = 1;
-- 
2.43.0.rc2.451.g8631bc7472-goog


