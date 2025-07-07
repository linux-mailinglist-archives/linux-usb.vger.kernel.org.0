Return-Path: <linux-usb+bounces-25536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE594AFB1A6
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 12:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F16793AD7D4
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jul 2025 10:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B442980B2;
	Mon,  7 Jul 2025 10:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JB6+v/LW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F621CA1D
	for <linux-usb@vger.kernel.org>; Mon,  7 Jul 2025 10:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885434; cv=none; b=AwZtubx+3aS1rgm9a75IaXQv5tuAzHe4TPAsfjxH5br6Fguq4pmchP/5mf1K9wv3NrHLiMEqK+KYfUPyYBEORBid/uxWd6sbxhYdidDRu1JHqBggmeKX8UR7s+dAtJFwvQwu423r2sa6ylO1NH1aXLD5Foi3L9rKKHiZ7f3VBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885434; c=relaxed/simple;
	bh=qNErsklCCNUv2dSOgz3eL4jlB/8RA/GANClN4lYfUBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qdd6qeej4g1wDwGxPKvMJPysLVzFXt1S8/QXukeMQPBLxYBlReajdr39kHstxQvp1HZxry+31uD4kTLwqPRA5TOcE0CijEZeyA30uSoiKSEmqb/MyDd4ALmwPVVOE1Jx9+g/0ILQZTgczfSiHbvXlnjGvHpzPF1DizLaGaJ8Fyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JB6+v/LW; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60bf5a08729so5487220a12.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Jul 2025 03:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751885430; x=1752490230; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4U2n2Xmf/VrCvsvS+nWVm8TQWu7/up6x5/MxPrcAISM=;
        b=JB6+v/LWlmlk91AVXhCMsDKsdAK06Kv0K59PSl3Mv/PcOmceo7wqZ+RL9x4krmHND6
         glFanVySdAwySYwSWd7TBbwInGgpRxvu28oiNaDsc862nLzcOgVt8+q15i0e9iKKWRxZ
         tItCfVQoL4oPnPTMuJjA5r1uPErnaY0L6TVOcfpizHL8J+2w11C/OfMbiGWHEhF9KWGt
         7W6fTrWiwIxgpVS+mMckf2WgGZvV3GOQkcP7n+wrWDFhXLs+WEv3/E8/MOzXP3OkfsL8
         SdFWUxeE2TCfVQzm2+CRHeKs2BoySaTkgHgP0HnOOblQlsFFbzMUXLJhyFEUt8+2B2tr
         g12w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751885430; x=1752490230;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4U2n2Xmf/VrCvsvS+nWVm8TQWu7/up6x5/MxPrcAISM=;
        b=bhssqeqAPIW9QSRRkCbj01cGrJPNFN1yLTQbGIVcqzqSPVCkH2Q8ywsikGjh/5kNTY
         KJ/+/GueqfWNK2Wd6bMg+nTqsCFPe3tHKYEg69uHROtpJmjXchMafYpj3pGq+HHqKbw+
         YL9mrPvJLLLH7qKa4pjWWMl3BcxcCH91G+pb8ys7vifyASOz+HfmRq9koZccdzv6Ufwr
         m7KtVQAqcNLD6UYW2bYiJjDEtf8NpZ2l4qAYPbTR7hPOP+S3Mlhi11PJsSUBfVFUZtwM
         m6cajDXKPWlpp7GXdu592HSS2SldY8hHSobl6kawqMs+arAOe1oUpp1ixjNb9Wtclybq
         NDyg==
X-Forwarded-Encrypted: i=1; AJvYcCU57hHtoymwSg+Ixq/Vnsct30u11UOJx6hldXnMyRWYD0+Ooa/ioh85FtpDu2x74fLb4vLj9WYdWT8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3oPlQo4ap1CH4etBo8k8z1CSK61iOj1w9kx+8uAyzaV/A9Yc3
	TDD2GQ4Z6V6WVDp67ZA9yQL/cyFXy+KqS19B3Tz9DjaReCaZoH0jUm6Bc2FnV/djC54=
X-Gm-Gg: ASbGncv0zsR9D912jFi1iVckq9najjXwf+Gzmz2iOQCNcIrBrDQzyes1IIQ2fZRzA9R
	2mz65qU7J4NmkWIBEKq+Av7BZ+HVwin58sZGF90Es6gPsUZMzdNJiv+N1/MP4MD0hpoyZ1zaXZg
	/t4AHm7Wu1cR9zVqTZv3ZI0TFApyyTr8Xl3a/vo6i9+1j0t+jhOpTN1Aa2QAcvZH2yOyPvyCFYk
	FKp5crrgP0FK+/E3xas8CEhd7MnSGPCUiv89m/8h7tqqM8xbzzvP0Ht8wuN9Xc2sWXftMyY908H
	GgDzjj44RJ0l6bB1D1F0CGafBtUk+wQudgIv3Yfj6luZ1AroUznzzvlhQdGMUnwf9HoqN84Zmgh
	nXPevHToWS/KYC1U4o/P5z40+c10qV+HOOmYrxBcbvUeQAQ==
X-Google-Smtp-Source: AGHT+IGExgirFuVuqNhA46rpNTwHtjU9MFrk7GA0mFCZSZJ/o6/0kUUc2TzmGgHsyN2ONS0oSwy3uw==
X-Received: by 2002:a17:907:c28:b0:ae3:7058:7b48 with SMTP id a640c23a62f3a-ae3fe61ddf5mr1232391866b.25.1751885429793;
        Mon, 07 Jul 2025 03:50:29 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d9263sm685589566b.32.2025.07.07.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:50:28 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] usb: typec: tcpm/tcpci_maxim: irq wake and other
 updates
Date: Mon, 07 Jul 2025 11:50:26 +0100
Message-Id: <20250707-max77759-irq-wake-v1-0-d367f633e4bc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHKma2gC/x3MTQqAIBBA4avErBvQQqa6SrSQGmuI/hRKCO+et
 PwW770Q2AsH6IoXPN8S5NgzdFnAuNh9ZpQpGypVGUWKcLORiEyL4i987MqonZtsU5MejYPcnZ6
 dxP/ZDyl9KfnkyWMAAAA=
X-Change-ID: 20250707-max77759-irq-wake-1ffda8371c5f
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Badhri Jagan Sridharan <badhri@google.com>, 
 Amit Sunil Dhamne <amitsd@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

These patches fix a few small issues with the Maxim TCPCi driver.

Most importantly, the driver never calls disable_irq_wake(), and while
looking into that, I noticed a few other possible cleanups.

Please see the individual patches, they're self-explanatory, I believe.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      usb: typec: tcpm/tcpci_maxim: fix irq wake usage
      usb: typec: tcpm/tcpci_maxim: drop CONFIG_OF
      usb: typec: tcpm/tcpci_maxim: enable PROBE_PREFER_ASYNCHRONOUS

 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 51 +++++++++++++++++++------------
 1 file changed, 32 insertions(+), 19 deletions(-)
---
base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
change-id: 20250707-max77759-irq-wake-1ffda8371c5f

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


