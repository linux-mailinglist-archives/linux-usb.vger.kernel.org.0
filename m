Return-Path: <linux-usb+bounces-21999-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7AA6BD4C
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 15:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7ADF21701AF
	for <lists+linux-usb@lfdr.de>; Fri, 21 Mar 2025 14:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23041D63F7;
	Fri, 21 Mar 2025 14:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IbNbmAJ5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D49A1D6DC8
	for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 14:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567917; cv=none; b=KZl3AlzV9gpHyhPUOlK9nAnh4ssw5cl3O+X4sqUo6PkUan1YKXeXg6p7Cw7+PiuJFAFhxDuKYhnHS0ZgMTVdoY+dtRlu8LvRV0qNr5ux6741/Gw0OSY1l9jcUCRQlV8eVwQdzwo3g3nzKRybSKIMIN7yFu5ApIbfWELljfKJQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567917; c=relaxed/simple;
	bh=somCsdwAZwSYpVOFZ7+NaJb7TDarJS/nC+HR7pvWjx0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLpU7mRwt2sBHgDoljA7cAyl56WosYpoXoP2FoyjXf3w3pImFg3nOenMk9A6CFwwEqqVLKF+AWBB8l8pyLXyXl6Rt3ajUCgvdDVZNhZs3Crey6XvPZlEayNxofiVQmGxKxZic10PYOfHur0UOnIV74sK54r4B7BwtwpRoEBtkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=IbNbmAJ5; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac29fd22163so370024166b.3
        for <linux-usb@vger.kernel.org>; Fri, 21 Mar 2025 07:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1742567914; x=1743172714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpYeREYD441841zmxzfOu57tf5+TRBtE3JtUo8WB5k8=;
        b=IbNbmAJ5ndgMTdBDPQ9/jYKcCSeQM3Ag+E8/WYkzwNjF9eIuUp6dWPZaxaTIss7Dry
         HcKqx3rc9bGYXEgt76+9PchNyD/BJV5paYUxDZQsjvGlcUoD6wgy0AXcMr2fNHqAtmZU
         0AajppGLYkfmmIrTttZ6c11pfOIl+YnjDroTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567914; x=1743172714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpYeREYD441841zmxzfOu57tf5+TRBtE3JtUo8WB5k8=;
        b=LUOZKB37OIegVYl2sitZqS1GqRezQ1C36rr84G/Vmw6MSO+i76HTqtwkDIFVBLh5Wo
         vBIQHEczlcVHKSmCB/IOOPpr3pZg9TfxYwj2MiHbJPuBYgqjy3HrXJNFMmgTxoWyzLxF
         0He6usWWc27nholZRO2iRFcTVF/fFuwcfkoyq5jK7grIO65GcT1y1KxhVz+vRWkoxGyH
         C+aIlSbWgLEq32J/JB7UQDeoukZCBuYCn35KnEJg6aiUh59dg4G9ShbM+FBO7z84ea0f
         WtTHIRJm1pb0W+3FJiQdglqGCmxDfQEoyR8MmCeLh/1RIeeMFjLATRPtKeF6hCEfYgd4
         h7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUhe9YkPIwUP92ItovRuXewToZq/emjsucTxl96kz02keW63ZerZiW+AAiXEqjyvI6oxt3iyR/udiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/9PyLL76i/pLxW96fbZdtOfY9vQMFrJSEbfBiJMB1d89o3Qg
	djwFdDcltbeh5ap44fHBJc0H1A+/JGzGHgi5lJBFaot+hQQHJZm1LaVfVURing==
X-Gm-Gg: ASbGncvdLLaHq05JAbINcJQ1f9nE9OtJZEC1YQ5fwE+oYhiuzTYq1sVrvHL6PiGyBWH
	Ys/MSE8C0z9u5Y3eO6Bn8Zt6Fy+wRuwVV1JyjWaw3wEkEBVUu9EgVn57biLpLtJ4gG8n00XwyzB
	C8GeTsB/oScToQQ6m2RTAo2BaFCoYQkFOcbJNDAGkmYWrFmnnEVyUosKoOOPyOeg5A3mknzfF3X
	2YwtOqwvkro5SXiPg7r7H4JuMkrC6C6mK6IUdGEoYD9iddZa6FJBvWUNSsZ6DVXIJLpzabd1KUP
	AYp3gWO9Sw3nPSP3NetxyREK88kwkxRItVMBrsDTHyKb27fCw+/U0+Q1bS+nW+Xaxdk+uUrCV6H
	L45lSMB3WTDeykiiTCEVn9r9cMRjM6jyf22M=
X-Google-Smtp-Source: AGHT+IFx6Z5++sXoujB2L8zFX/kIAOeEopfZFF9EvYWaukAV92ezO0xWR/S1jldFyiEhLEo4ae0bLg==
X-Received: by 2002:a17:907:3fa3:b0:ac3:bf36:80e2 with SMTP id a640c23a62f3a-ac3f211183amr353993066b.20.1742567913806;
        Fri, 21 Mar 2025 07:38:33 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef8d3d43sm165303566b.51.2025.03.21.07.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:38:33 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] usb: typec: class: Invalidate USB device pointers on partner unregistration
Date: Fri, 21 Mar 2025 14:37:27 +0000
Message-ID: <20250321143728.4092417-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250321143728.4092417-1-akuchynski@chromium.org>
References: <20250321143728.4092417-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid using invalid USB device pointers after a Type-C partner
disconnects, this patch clears the pointers upon partner unregistration.
This ensures a clean state for future connections.

Cc: stable@vger.kernel.org
Fixes: 59de2a56d127 ("usb: typec: Link enumerated USB devices with Type-C partner")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/class.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index eadb150223f8..3df3e3736916 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1086,10 +1086,14 @@ void typec_unregister_partner(struct typec_partner *partner)
 	port = to_typec_port(partner->dev.parent);
 
 	mutex_lock(&port->partner_link_lock);
-	if (port->usb2_dev)
+	if (port->usb2_dev) {
 		typec_partner_unlink_device(partner, port->usb2_dev);
-	if (port->usb3_dev)
+		port->usb2_dev = NULL;
+	}
+	if (port->usb3_dev) {
 		typec_partner_unlink_device(partner, port->usb3_dev);
+		port->usb3_dev = NULL;
+	}
 
 	device_unregister(&partner->dev);
 	mutex_unlock(&port->partner_link_lock);
-- 
2.49.0.395.g12beb8f557-goog


