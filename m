Return-Path: <linux-usb+bounces-28944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ADDBBFD20
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 02:01:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F33EF3C5626
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 00:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB432367C3;
	Tue,  7 Oct 2025 00:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aBHPjJGx"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF2B229B0F
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 00:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795235; cv=none; b=IaKvIzIHOPtLejzRRe+7zfl5S2q5WpoMCSdGjwSM9T0FYKfkKt+WX5MTsgdlfmpxPQhhmF1WAAxwMcAUckBUaw3VT87OFB1HEvP76otIrlesLW5KmyF7A/vCalHfvi8bo8tYdIkf7iMcw3ot9LhykbOolXitJfZ0ojoQJoAwe5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795235; c=relaxed/simple;
	bh=3SrGK00c6kBpKdfA0G1voXW98D3SN4/08oAWZGvB06s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l3djnkT9ZHzIDOZciiLJfb1F4ebV3iXO5tkGLGFmtG0/VMB+HerhRL3x3XICNQOTIl7i2kUpo2FILREPjgOpBTal3otgmRGlwlnR6b2pwlZWxuDopSDwhyxjIwCd00fWhKbr3H+VH14/BIO88kcZ0l1P9hrYbNMUvmu/ZTslZHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aBHPjJGx; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-32eaa47c7c8so4998248a91.3
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 17:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795233; x=1760400033; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNxgxN8i4WKNF9gjsgYvNaV1dKsUpnqQpccRNq6XLzk=;
        b=aBHPjJGxffZAo8gagTuh1Mkcbw6ke0uy17r0vs+k3Y9Cg79uPIyw+MNa2iZe/s1ZKC
         Xt9e0M5WWf+xdDuqktM7xH6KHrxOhT5ucIQCHNYAENlmejhA3jNsQdjzRILt7y13Kdjf
         bu7SeWxzKdLOGRluoRRmy3g3TFSlgEKsaQhIN8w83ysB2e8FRDD5PbAdOj703wiLR7XH
         xNH54IRQL/I7jJLUNedthCgtPD0F8Z0xHzrZpuc6LJxGXQ/Ia7fSVLWq2x7bZdmlllar
         0/HBsbW5Xddg9BhWOLjiAunsb4tRRAfvHlJ5W/6oD9cRMCCP6XLQumZzNQvChO+z3THI
         Ad+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795233; x=1760400033;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNxgxN8i4WKNF9gjsgYvNaV1dKsUpnqQpccRNq6XLzk=;
        b=qU/qwG/0zBpgqJxEsLgeHLzPn/K9v6pULCZVknXTMq/exOhl17oIkEhkdfIKFBHqym
         jxHeEHRH+tiV+iHO9N2F0jh/ZEGtZCLU6EZMn9a3Tqa9j1BhYutlez5ap1cBWT9HwiF5
         vVJBsk/C2BtWab8zHDXY804BqjcYhMc0eoXZ80EjtcNzvjzsVVvE3UsBv68d2vR1huzD
         CpBYY1xGGLhCQ1Ci5LZJTlR+ft6CNCs65ptUoDplnG2D8+VZb7wkdkDRQCA+P6Fg4BB5
         /waOp8kJuimLG6sCgGiAo37hzPX7yr3PqGrtygTtyzpQtlW63hTbZMdP+xdxYt3orh0f
         wx/A==
X-Forwarded-Encrypted: i=1; AJvYcCUb3KC7LAgt3bxjbuDYiqfF5ySey4FgsKzgbZMG8m/+tmMJYoZWPbXgysI7SuumEbQqkNVm0eGCwvE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN2vaFpK/ImFCe336yYXY2dDzbkB6XRuqnDeioEklGZMA1Vie7
	NzZ9IDR36M2GbpylIHJYrG50iHQZyX/H+yZsRg6xIVk4hKvmf5xUJmFoeP9xze7f4kKbaSMRSOr
	a4Oa3aA==
X-Google-Smtp-Source: AGHT+IHFgZJ+HkrSiYXPJMMiNLQI1F1cnVHsmDy7sKcZjdwP5IwvuIVt3bnCbD90DcU72hET3y58ZFjpk3E=
X-Received: from pjbbx13.prod.google.com ([2002:a17:90a:f48d:b0:330:72b8:fcc0])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b0e:b0:330:6d5e:f17e
 with SMTP id 98e67ed59e1d1-339c278eb63mr16986089a91.24.1759795233450; Mon, 06
 Oct 2025 17:00:33 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:00:06 +0000
In-Reply-To: <20251007000007.3724229-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007000007.3724229-6-jthies@google.com>
Subject: [PATCH 5/6] usb: typec: ucsi: psy: Set max current to zero when disconnected
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: jthies@google.com, dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ucsi_psy_get_current_max function defaults to 0.1A when it is not
clear how much current the partner device can support. But this does
not check the port is connected, and will report 0.1A max current when
nothing is connected. Update ucsi_psy_get_current_max to report 0A when
there is no connection.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/psy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 985a90d3f898..3a209de55c14 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -169,6 +169,11 @@ static int ucsi_psy_get_current_max(struct ucsi_connector *con,
 {
 	u32 pdo;
 
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		val->intval = 0;
+		return 0;
+	}
+
 	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
 	case UCSI_CONSTAT_PWR_OPMODE_PD:
 		if (con->num_pdos > 0) {
-- 
2.51.0.618.g983fd99d29-goog


