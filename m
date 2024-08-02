Return-Path: <linux-usb+bounces-12890-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81412945F15
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 16:04:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C59028142F
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 14:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75A31E3CDF;
	Fri,  2 Aug 2024 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KlWdSE3Z"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ACD14D701
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722607475; cv=none; b=ixiJnYSXCvX1kPq2FSeYNXYWqsifJQVL6jQW6qfzri0H7Hwk8W36fiHa5WCIsGDqu/7cxCPzP5YyBBiCY0Y1/vJviyyPYGgMcKQGDnktOYJtVy0g75aKaQg6T5uCnT2RoPJf8xwpUJlN2MxYKlmjFOKj9gqsdxMFb+DM/Tn7y9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722607475; c=relaxed/simple;
	bh=vJLu6oq+1pT04NmnJdyE+jlvgan1iF3vVhXj9Ca0mfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SIgFXyv96Zq5Aorfr9NwYoZPJKQ42cR9C5SHfqBxt5exfbn2XXs/ZiMuFkoFCcUjB1TgFwlGHog/go8GoRT7APOBkzkKfzjAQq6qz2mqev4zVugFZSCCMW+cO+PbGpFvnnI+/LWJH4bO4wufhCVwGehgZ/ZFE26940LnSRPOWOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KlWdSE3Z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4280c55e488so19686645e9.0
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2024 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722607472; x=1723212272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GELJE7nQv7ekgdarVIaR5+IvJvhwEDxUWUtprd+UKWA=;
        b=KlWdSE3ZU8DCMot84IZGl41jjxAyNjM9J06vTfH25/T/T3Xme2be2ejRx+UUgkrSNE
         gYUNg7+ggzroNF8ynjn412Kmx22HWcGxFu0uDoJVQe9QV7kWfrddkAh/t957Ef/VOwNu
         19pQ+rJ2CbC/jAf6Z9Wa4zHIFhJMLR9tcDqwddNW+9uZrSoBQqtmFtJZrsQtn2yIzeDb
         ksurOYkwPXi/ctIuewpYwIXYIBOupa9opjcwVcBlbgC/ApXyy6IAI7XCjik6oL6G1wgZ
         2TZO1oceRqydPW7eJKBj+4yiIBBe7y5y2M1Aks2J+MqlKYx1tWawUjCmTc8s22Rf/dit
         DofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722607472; x=1723212272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GELJE7nQv7ekgdarVIaR5+IvJvhwEDxUWUtprd+UKWA=;
        b=kAQ3kpUGR7zu7K/82AfJlTtWmTVMRylru4yyQeFFNSzNFRoaatVo62ZQnvzBBc6482
         LLjsDVahWRJy5xorr+x7ac3OQV8o/The6zxbgJuDxZE/QZd8pRm6mXdmnD7ErV7XhDeK
         bAVp1pKuRSVkyS2u08dG/rDTmun8sL9/EvpVolE7pQ8KR5EJ92gWiiTeRcU2t0NfBUCz
         QgoHy+7E1JomVY/DVEEtBSPQxylvGCb+k9yczcYF7KQNczi2RM9g9/EdlQEWmC6zzRyt
         8X27F04pOAQy0taB5/mkA3yu9nRset6A6MKAQ3bO6Mtv0j8zVHfWjG3MIqqTvg7ZO2QZ
         ceCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfH7J6yqg5UAseGqndjV6sxwl/gfWkX3ZHwrKVhglR2vwBwKmCDomtHdNEGOTqrmRlbOtAZO9c/29z7YFyGrAbLipJYpW/9h3f
X-Gm-Message-State: AOJu0YwFlQ6Oz7Ilbu+oF9SGUXjquIu2FJntayFrcz3WdNWokolwZLDi
	M8NyjvND/6lStCn0AwPn5qSQnj+hYcIjMHuDcAI9DCpBzMx31gXrsMa9IU8Zj6w=
X-Google-Smtp-Source: AGHT+IHjeAUbwKoMujhIuiKsaXvTJXWs+3v9YRa+G50K8248IF0I+wHIS7yMKSYnrz6NJ5onAPlhpQ==
X-Received: by 2002:a7b:c5c7:0:b0:427:ee01:ebf0 with SMTP id 5b1f17b1804b1-428e4714cfemr46021525e9.8.1722607471704;
        Fri, 02 Aug 2024 07:04:31 -0700 (PDT)
Received: from ta2.c.googlers.com.com (185.83.140.34.bc.googleusercontent.com. [34.140.83.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428e8d6555fsm29041605e9.26.2024.08.02.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 07:04:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	hgajjar@de.adit-jv.com,
	willmcvicker@google.com
Cc: paul@crapouillou.net,
	brauner@kernel.org,
	christian.koenig@amd.com,
	jlayton@kernel.org,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/2] usb: gadget: f_fs: restore ffs_func_disable() functionality
Date: Fri,  2 Aug 2024 14:04:26 +0000
Message-ID: <20240802140428.2000312-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ffs_func_disable() always returned -EINVAL and made pixel6 crash on USB
disconnect. Restore ffs_func_disable() functionality.

Tudor Ambarus (2):
  usb: gadget: f_fs: restore ffs_func_disable() functionality
  usb: gadget: f_fs: pull out f->disable() from ffs_func_set_alt()

 drivers/usb/gadget/function/f_fs.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

-- 
2.46.0.rc2.264.g509ed76dc8-goog


