Return-Path: <linux-usb+bounces-15459-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2159864BE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 18:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6F391F2519C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Sep 2024 16:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95CA8537F5;
	Wed, 25 Sep 2024 16:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hET3XnAM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9211BC2A
	for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 16:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281519; cv=none; b=WvSrQeHii4Erkjp4wa/2Em6r0rQmfLhfHouGz215e28Ye4CLz/9EcDeGrXRPWeB6sp1igzGYBSDfz7cdUi1hPJpA5QfBMjY5n5MfRx+xEKvrlq9eGoR+6F9dkuFOD2uGY59m6R/2ngM/4+vdVDvrS7CxHdxurlopYd4w99Q/G9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281519; c=relaxed/simple;
	bh=+2FSnKyNki+fw/fhnexvjl1DNdJwIpxfKSde39h02Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b99QxA6TfVrVNPzfIn3z0qd+EhOocWX2svxcpFCk92PSUhi7m9A6S92ov2+KEnb+X0b0NQkJIBvUBKogiRzTPjiHANAHhYL76UKkQWT1iE9stJrdJevbpABIMTeDlx1w+hBd2nVKmLOCX68ZNTRewCounuy7HmeeNshyhxdsZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hET3XnAM; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2e08085596eso66645a91.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Sep 2024 09:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727281517; x=1727886317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+mQegUT00US8bGAhFrzBaDDODW/YQTCJrsGeC6HyUig=;
        b=hET3XnAMejBpTEn7kA7S66NEHupBV8vQRoNFZgUNsve5JoLvTRyb/XNf+CsjuNTHvI
         5j3Lu83rgRbPo0vuviKn3otCHyE0cK2N6MRQGscPsOj2aTlTnB4dts9YHyirG6hddJD/
         3WiuRlQxoveqmfCPVARDq4eUzcFJd5l4P7rS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727281517; x=1727886317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mQegUT00US8bGAhFrzBaDDODW/YQTCJrsGeC6HyUig=;
        b=LeKNoc73BZzmlf9XLBiNaLYV5EsVagbT/BXoUHBur+TNQjALlsLw7s+G71vxCW1sWm
         3/I8PPZKE6CZMgBTJZFp+00HR7Dvyk1mS9v8UCXjMuw67tyBP8rKpUTTDMQ2gMs7LKPv
         C2CFUNp7S/IBvLqFOjq0eumhwhOTlK0CXQDvGY113lF581Y4VeiZxK9ekCdUiz5NmnuX
         20sYRfOkc5fIhLzxjgJQCI9l+L+EZPqtV/Mv3IEXLTI58oIL1pfsE/AOacn49lUcpmeo
         H9NaRsWk17WiShhenJQ4XNLq6MEUPAMmo1uOEDZJs+StEGCVA0hr2KQpfRcCVlBupgBu
         4LWw==
X-Forwarded-Encrypted: i=1; AJvYcCX4BdX8VTOBZA9xm/kzD2NTCKaprV4RoBvJjmAfCbv0ad885qEjyg41kkP2jJnR5rO4ykEcbOU29Nc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1FAHQ5CAIZ1LXhSYwEWX+kohNbkHojNZMDXylEcfHbksY7/e
	l/PGKp7ALiBgrouDa1hFv+JHIdGlkhFEHnABNbw7hFwSY1qXhSpesOrYHUujHeT/+gJNsNlARZk
	=
X-Google-Smtp-Source: AGHT+IGPeP9YvzCBtyDelDQm+zN1EEUMTA4n09WeOUuCb+QBT8Nn/5HPs5f7loDRRi7Ku1Gj6nZnTQ==
X-Received: by 2002:a17:90b:17c6:b0:2cf:fe5d:ea12 with SMTP id 98e67ed59e1d1-2e06ae7b726mr4165481a91.24.1727281517224;
        Wed, 25 Sep 2024 09:25:17 -0700 (PDT)
Received: from localhost (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2e06e31477fsm1705449a91.54.2024.09.25.09.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Sep 2024 09:25:16 -0700 (PDT)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org
Cc: jthies@google.com,
	pmalani@chromium.org,
	akuchynski@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 2/8] usb: typec: altmode_match should handle TYPEC_ANY_MODE
Date: Wed, 25 Sep 2024 09:25:03 -0700
Message-ID: <20240925092505.2.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240925162513.435177-1-abhishekpandit@chromium.org>
References: <20240925162513.435177-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

altmode_match is used when searching for the first port altmode that
matches the partner or plug altmode. If the port registered with mode
set to TYPEC_ANY_MODE, it should always match if the SVID matches.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

 drivers/usb/typec/class.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9262fcd4144f..179856503d5d 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -230,7 +230,8 @@ static int altmode_match(struct device *dev, void *data)
 	if (!is_typec_altmode(dev))
 		return 0;
 
-	return ((adev->svid == id->svid) && (adev->mode == id->mode));
+	return ((adev->svid == id->svid) &&
+		(adev->mode == id->mode || adev->mode == TYPEC_ANY_MODE));
 }
 
 static void typec_altmode_set_partner(struct altmode *altmode)
-- 
2.46.0.792.g87dc391469-goog


