Return-Path: <linux-usb+bounces-27799-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48124B4FAE5
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 14:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 99DDD5E1C96
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D9033CEB2;
	Tue,  9 Sep 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cjHZZsc0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ECF33CEA1
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757421054; cv=none; b=AC/gFjDl5d2Slxv0SU8WP0xI69RFdiVdWqIC1pBaIOLsVpXNpXO+SdXeT8F9N14EAKUSruJucTW5ZJXuSMPvjHNZzgwso6oMM5FutQ8raMBxPqqZg6uIuyVom/kKhL1PwCdiwgUJylUAm+KBS2pCJZmsMORTMLKZlhFff4h3Gtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757421054; c=relaxed/simple;
	bh=wo2Nci5KTZIZbP8CX9Xb4me0P/T5bVmP7HGaZVx1QBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUcThuCD0P9gu4dqxKJKNmCCmaMHtYruSAU8Z6KADDO5im5T3T9l5Rrd64zVbwClo/URphpNmqYVhvS4IAmRfo3Ymt+LJoEDX3+R4YZGGmmPe/42BbjcyVNhX22AcUwQEr1xL8wRt2gNZQEpQNQAOoa86eq66MLw/LVxWvOEXK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cjHZZsc0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a16441so830012366b.2
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757421051; x=1758025851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeRnafoqGXMQLsLwS7RKCqhJvzceHCqSnadqMFnp/Eo=;
        b=cjHZZsc0aiXrbjIPGEpyS1c6lM7q+OZbd1XR0FWseu0TzNa11rQLPKVwfoVMXfvbiO
         Fe4CkuxYLV/vlJHERotzpYub+dNEnn+qwXXhZAkoOgij84piiGky2w9p53487RyRKZSX
         47EzIugYwM39NUOsjKKlW1TavwTzMTkeT9TEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757421051; x=1758025851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeRnafoqGXMQLsLwS7RKCqhJvzceHCqSnadqMFnp/Eo=;
        b=JNP4ZkD2bTmOSZQjEXgpdR5XEXVxOHSDOkPE6frMd7iJQDdAmuFRRvGJLL5Qd1y82M
         LjsLkoeChapgenN5j1Ze6AERZuVBX+PwYDP8V29fU2tOy/3pqhoiY/rMeifilZmT5eMo
         WEt3144OcTR2cexIADG2cDdGA8QOtrbq22wITsjxi/cwj35pKLVnb4N7WmUp4bjXkCLN
         ZDTgxZJ681HahINYKsYWoAI1Qe0dH2iancb8WFczs9PX3PCSp2l1ckQhGtMC60XPL7hM
         v90Giv2SRdZBwksUr+nL8nXLGv6nZrfDm+Zj3jLR+WMRm12CFW9uz3DpS93iAvklKzOk
         2j1A==
X-Forwarded-Encrypted: i=1; AJvYcCWpJHGgBhXkodhAFca2tNyEdydesaQi5JLtVUUqvGVkiqMwndSvbHpXUj9NzweE0lElQce89Xwx71U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVI9Nn4LOUYv8PepiAZUTs/wAXi9leHAo+dxy43miCtOj8ROXE
	AkgQn0T6DnvVnGz8JwaaJjFSiJE9kPwSfFApLmhMl8h2tiauskMzXxN+eBGx7YJsZZgwOVKxiJO
	YEZk=
X-Gm-Gg: ASbGncuRGb/5BRxJLAfBqArJ64gnoxPXgE2wU5fqc7nx6exae4G2NlRKAzNrq2czhkQ
	QqE0oPYhqhAtmN2sLvRdngSbn74fDhz+nZGyFnHrrJioYGxaQddwqtHE0umCz6hdZV03SMi+YIw
	dfhzeovqH+zFirc23YmNbgoCd1raAsFvXSwxggSikGHpmtCQfz+4ElKW5evR2w38XO2T7jA1zTi
	H8VSipd62WJXXNFOiuBL6k4PXcZ0EmpgAfEKvp2OIHkgs8hfMlR4pha6xvxZnF7oKkpijoq801Z
	PGrfV6ji/PA8CpGvJdtXhdFy62TtUsuELsFbYf+/vadPhyW+J48jKfPm1zBFkXqmyUx2ffUGRyH
	dFBeEwa+GR1DINi5fWH7X69SU4NTPUmebJ49N7YPGZ7EptUlKuHWT8pfS8Vp8jC2tTp5MJBXUSl
	7KoXo03F6TbIKHT1NjJkncuLGOEg==
X-Google-Smtp-Source: AGHT+IHum5WD472d7fS2rBLDEJ4/Qj+9NWbX7rnTe/jOnY7UY4cYm3PCK7sxMJpUkyS12VpRXD21hw==
X-Received: by 2002:a17:907:9410:b0:b04:f5a:8c13 with SMTP id a640c23a62f3a-b04b14b37c6mr1069077666b.15.1757421051199;
        Tue, 09 Sep 2025 05:30:51 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (240.225.32.34.bc.googleusercontent.com. [34.32.225.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b01902d0e99sm2409702166b.12.2025.09.09.05.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 05:30:50 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 4/5] usb: typec: ucsi: displayport: Propagate DP altmode entry result
Date: Tue,  9 Sep 2025 12:30:27 +0000
Message-ID: <20250909123028.2127449-5-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250909123028.2127449-1-akuchynski@chromium.org>
References: <20250909123028.2127449-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reporting the error code via VDM back to the Type-C mode selection logic
allows the detailed result to be propagated to user space.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 8aae80b457d7..47c28646cfa9 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -234,14 +234,18 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
-			if (ucsi_displayport_status_update(dp))
+			dp->data.error = ucsi_displayport_status_update(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
-			else
+			} else
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = *data;
-			if (ucsi_displayport_configure(dp)) {
+			dp->data.error = ucsi_displayport_configure(dp);
+			if (dp->data.error) {
+				dp->vdo_data = &dp->data.error;
 				dp->header |= VDO_CMDT(CMDT_RSP_NAK);
 			} else {
 				dp->header |= VDO_CMDT(CMDT_RSP_ACK);
-- 
2.51.0.384.g4c02a37b29-goog


