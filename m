Return-Path: <linux-usb+bounces-23396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 182D5A9A6AE
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 10:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53A3192679A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 08:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E972922A81F;
	Thu, 24 Apr 2025 08:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fiXBQ5fJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A38F9228CA5
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 08:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484285; cv=none; b=YrXM2o7l8Mh3dTFT0tbfcbt8L4MHF9zfu1tpjhc2lMy/ZsyvajzLzKw3hut3xLDO9KZyCaHAvTmlOdJVqLiGN8OmqduMABKeSC7Acs0+8qTi8n3Pdk8MDkN43G6OJJKT/6AJJuWi7pFfCrcqs9vmZcTkKdEyMswZS3o4jvEZr20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484285; c=relaxed/simple;
	bh=CGJ4lb9gLXqwy9cpqFnBRdCu4buMezQ/KMwBM556iLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VInRzD03swGJT1UACJiAR2y4N4IQNR3tuEzLE6ncAMqDBDSzwabgDHjrF3N5XZkDO1z7LLs54VYead0zk0Ks8QpDEAmIWUWsiO9AQ3+kND/vgFR6EhzX5GpIi9cUyocyPPPuw5HqtOwZwhqbmTm5JQHWuazI0M5MpyRcSHW2sKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fiXBQ5fJ; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac289147833so137688566b.2
        for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 01:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745484282; x=1746089082; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EOV7HKDdI7XaLmmxtuottKdbNPwVla7Cb6o0YW5q+p8=;
        b=fiXBQ5fJ+bx+VX92/PpxRjo+Zab2gLaqPm8JQ4YVEb/xCbKX05IMX0UDf/H0VOKpPT
         gGZ52S4WhtDdOzVnLSH/KK7oZnQR2FI0EWG6TACPAWjdIHrwwbv/k3G6zDZfLrAG+QGm
         shqvvoYEouzfZX67zer2Pa9JM26APdgh/eEI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484282; x=1746089082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOV7HKDdI7XaLmmxtuottKdbNPwVla7Cb6o0YW5q+p8=;
        b=ikhorMxqgGsTGS1f+DmSM7CgHlhiy5eMuuiQ+6kNepyntnHyL67uNeK9gOWT0mpE/4
         RNk76A1gZiDXNZPiGSIi9caEV/SM3HRrAITlqrU2FuX3f6z0D+hLxWUwYKTf68lzZbh5
         afoSBILS4ZHA2LLxC/HUToarCBFhBPfQyadkJbJXrYEXhpZNBqmCUQcFJsEaAjRVRaFg
         WsBYI32l4ZQ7WOIFAC0kOyskTWIi2RHzU57R+vCLCnqKBhBESuj7KNGlf1Ty2UM7n3F4
         5wfrdbulNTRtZnG1KD3XJDDybCwOYbOAKKNulPgaCZyxaGGrpQy3riL8bpK4XTX5paIf
         gBCA==
X-Gm-Message-State: AOJu0YxZvUP0hSV14QqLR2wx5DYHh6ZHLRZwIfNimuWYJHd722hkBL0F
	7jgMNQrHiOZVtlGgPVjwtjfwUfs+VApRxMFNSNsR3U2pAzM/erMmkgb9iTiTDA==
X-Gm-Gg: ASbGncucUXMCUN9+xf1F84pawy3I3QL5CfpZZkR9DKBj6mGJWhy2u9ZyIoj6IS5bb05
	RNIaSyKXcWlQGA3tEYAfuR53amd31rrAbaC9f1DA1RIcXjGpkqZ8qJpd+8oXBwTEQ84b2qoJfFG
	LSQ+13BVa3Yk/E/tqgPUlZWq/5G+rrI0HqKn22pf5I2VRg1+e7leG3ZnL2JFns2pcbvlhVPwr7I
	J3N2m9tHvJSuzmd1iuaeUPq1HCuVg8Dbd0+rSbUnEHA+1qmnW74/o+HYo7HELBFvfoHYEwZyIOe
	oc2wYZdtF+uH7AyvElkZ1GSxnE3vOP/WTyiADvVG3pA6R+wc63RaG2wmJ+BCuodkGuIohDN5EVf
	zYxQIWKOHMfEA7v1l8XSJ0QQj8y7/lxm4ww==
X-Google-Smtp-Source: AGHT+IGDweb2ftW6YAhGNzGas4oXbYMlgUSzms8AcDFioP7Y4uwQhnokaPl/3DGk+MA365cjpfU/uw==
X-Received: by 2002:a17:906:794e:b0:ace:4fcf:702b with SMTP id a640c23a62f3a-ace5728a3ecmr178033166b.28.1745484281876;
        Thu, 24 Apr 2025 01:44:41 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (100.246.90.34.bc.googleusercontent.com. [34.90.246.100])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c5eaf0sm69377466b.181.2025.04.24.01.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:44:41 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 2/2] usb: typec: ucsi: displayport: Fix NULL pointer access
Date: Thu, 24 Apr 2025 08:44:29 +0000
Message-ID: <20250424084429.3220757-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
In-Reply-To: <20250424084429.3220757-1-akuchynski@chromium.org>
References: <20250424084429.3220757-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ensures that the UCSI driver waits for all pending tasks in the
ucsi_displayport_work workqueue to finish executing before proceeding with
the partner removal.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/displayport.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index acd053d4e38c..8aae80b457d7 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -299,6 +299,8 @@ void ucsi_displayport_remove_partner(struct typec_altmode *alt)
 	if (!dp)
 		return;
 
+	cancel_work_sync(&dp->work);
+
 	dp->data.conf = 0;
 	dp->data.status = 0;
 	dp->initialized = false;
-- 
2.49.0.805.g082f7c87e0-goog


