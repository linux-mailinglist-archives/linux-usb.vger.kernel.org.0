Return-Path: <linux-usb+bounces-25720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C4B025B1
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 22:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76228A6015B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Jul 2025 20:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B55D1F4181;
	Fri, 11 Jul 2025 20:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a2H1odTE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D0019CC11
	for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 20:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752265241; cv=none; b=COHA3uRf6TOh3fXwA73gMu7b3gwJKRnD2G9yiMcRpyQ/StpapNkSHNLgf/BL2DI7NOkn9eF/QYoJ0gAOZG1zfOaBFGXR2DbuJi3LvPFMqm5fDmH2NiWqFk5L/JAcUYUzZrkGWuJbl23/cAhhZ8PUH7iSAi4q1O0Ro6ExjtLP8yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752265241; c=relaxed/simple;
	bh=E9M5LVZriBjPPfBospdk5yU2oDbUHaY85GbkjDHpjMI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=KTq7uvV5rP9vWAlHNQ/6xSaR7RhVVhvYsLDZbSjJG0pFWQTraxzwRJ4gSAXK9/gkiV0Rr/jc9t+YKGnHjrZ1gE3uvPZ+E/TM0ROhQUb60yqCbgTn/AX4NAYN1as0o+9dvKAYZaq61lt1voDVYUPlL8QOtBANg/Fovw91J7I/G1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a2H1odTE; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-748a4f5e735so2435807b3a.3
        for <linux-usb@vger.kernel.org>; Fri, 11 Jul 2025 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752265239; x=1752870039; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b7qTPqSZKgznYOOrcEeVLOwnEg+Rvzuj1rjCF+e4+H0=;
        b=a2H1odTEm3H7E4JOJ7SNLvOO6hUpbmL4Nq+6VZZUMu6LSUbG/fO4LTlGYqank6aV8n
         QO23KzOaFFH5sR681xYrZ/Aintb0zVMvlabewWcpLvCaSvIJIzgZfEi98fnSw94WMqB9
         TbZdFEtLABFA956dCpXos/MT20flo6YC3IMyOEafsiPMTwFH5RdT2+DLQ6XaYE11eCsn
         BvKkODpPUV89+0U+ND5Ewu3DaQznGBbH/iLcXr2fVSoxg53qX3X0v5LJXCBMctEyjr+d
         Y+g/eDZsFFEwlBga6yKBQODUvUQ7gqxEqMrkO6cc2RVivELwsMdNCc4Sl0UxzVGq1cwE
         D01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752265239; x=1752870039;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b7qTPqSZKgznYOOrcEeVLOwnEg+Rvzuj1rjCF+e4+H0=;
        b=n0OHoMw/dkKvt3Gw1Lu1GQsGwQvb2JjOTQrAGAHM2RMkrZeUeDvDDRSeIf8/xNO5gj
         POU9l9zrzAuoqQRKW+VP9woBZDbXbMjYoCD0oBu24JSjNxsLSXHrHGVrM5IzBfSQMYBX
         e2IQyxTAAvz7LA2Jv8KFZOBATAdaqfIlXD1h26RoyE9N96YGiI6phzOUm75dhGnSYeAb
         icR7c30EqLAlhbHBn/YYrM3q0Y3aUjR02dnvXIFBIzWxas3gRWO50KoHS4CRbwVx+lHQ
         k/ZaHZrFjADxfXaxKEZ5pw2cW7kcPZmM2BzsC4SIE9ki6pg7hyU3Np6Tm7lEahImyTaY
         DMYA==
X-Forwarded-Encrypted: i=1; AJvYcCWDFHK+35mBtWcwsO9Ea136gMU2GAuFQcz+VEQ/aV9rbZXsiE9VKlEcT3lZAEF7Ma83Ph68hSbObKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9YexGVLaMv38ti+mSqa0Ouc/tbjIw7IrI/UE5WY8fX7+M1r/
	cuwYiDxlm9zS3iK/18EYUnBsB3I4TGT8MS9UhRdTCckdkc3h2zWRRbhfFeBv9kPorNLHeVaMGOe
	rWdUarQ==
X-Google-Smtp-Source: AGHT+IFIqrP7jK/cjDCR7SM8TKcIRk17etqtWNnbv4GApH3TZfaWemB95AGSiBbYaq080RzIWmJYIBy0KGM=
X-Received: from pge19.prod.google.com ([2002:a05:6a02:2d13:b0:b2f:dfa3:cb81])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c6cd:b0:21f:ff2a:af83
 with SMTP id adf61e73a8af0-231351481b7mr7503449637.15.1752265239088; Fri, 11
 Jul 2025 13:20:39 -0700 (PDT)
Date: Fri, 11 Jul 2025 20:20:33 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250711202033.2201305-1-jthies@google.com>
Subject: [PATCH v1] usb: typec: ucsi: Add poll_cci operation to cros_ec_ucsi
From: Jameson Thies <jthies@google.com>
To: abhishekpandit@chromium.org, ukaszb@chromium.org, bleung@chromium.org, 
	heikki.krogerus@linux.intel.com
Cc: akuchynski@chromium.org, mattedavis@google.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

cros_ec_ucsi fails to allocate a UCSI instance in it's probe function
because it does not define all operations checked by ucsi_create.
Update cros_ec_ucsi operations to use the same function for read_cci
and poll_cci.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index 4ec1c6d22310..eed2a7d0ebc6 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -137,6 +137,7 @@ static int cros_ucsi_sync_control(struct ucsi *ucsi, u64 cmd, u32 *cci,
 static const struct ucsi_operations cros_ucsi_ops = {
 	.read_version = cros_ucsi_read_version,
 	.read_cci = cros_ucsi_read_cci,
+	.poll_cci = cros_ucsi_read_cci,
 	.read_message_in = cros_ucsi_read_message_in,
 	.async_control = cros_ucsi_async_control,
 	.sync_control = cros_ucsi_sync_control,

base-commit: b4b4dbfa96dea8e299a47ef877eb0cfe210a7291
-- 
2.50.0.727.gbf7dc18ff4-goog


