Return-Path: <linux-usb+bounces-29797-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDBDC15968
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 16:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9B3C8501A92
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 15:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584381DE8BF;
	Tue, 28 Oct 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oEiQB725"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88174343D9E
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761666191; cv=none; b=PJCWyaTqX9VtpH8U8dDBGkz9QRP3XxgHNEsP75z7pHub+RlSRL3EZEOUK19Y9p4chO4rNveU7UL0wPnuWFxdXM5Qk7p1Naj3gnu47re6Y2OYFISjWQHKWDxE94vsPdYNDHbUkzVRVxLpKWm55SL12CDUb18EOb2wyalGQzGgkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761666191; c=relaxed/simple;
	bh=yZAouXEgeBn+HPlnEp+e1nrDFlGoOkzrrAmmBWF3gDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JQFQ5atZGI3Kv9Iuqt73ObNTKec9xCVxQIX13CDz3KBY9B2KlhgaojtebkdQu2LkxLtpyJOcsFa2LYPm717mPp6nOFQYebKW4tbNZPTUfbn1IdSSeYABt/4ZSfqiME7AvcqzAK2VcdvC5sLCArh9VxvuyQT62RKo/XeZ8PewPck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oEiQB725; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ee12807d97so5669570f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761666187; x=1762270987; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLENo1D2vGjvqUj48+wQ7IiD227BanSgpj1tG6vbGqw=;
        b=oEiQB725Q/YI/2eKESf+SnBcegRIFqIzfBAmR/Bml3D/5WgSE0SYJENp69JCHpUjGz
         gXQg9JTJqqhG3XUyn7iULHDAFJXhnmg3B9uOg3zC3CNvEbPOuptidFwXqFl8DIa3zhDh
         6PJhV0LxHXU/o3i3EZuxI0Kq/7E3Z4jSxERNeFHn0H69U4GHiAsn5plD8ZZH8uM2CNOA
         qszpv8KO8wKj4sdDd/I950LSl9JtKhCXRZm2K3ZGQY9kkEK/4RrMYH5xIJq28N7i2PW9
         /SkFVIZSh5PnLiC16wHkmWGZmcK3tdGTw/O/xO7kLwOVnVKB6uJKoQcTE00X7d+10KAO
         IvtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761666187; x=1762270987;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLENo1D2vGjvqUj48+wQ7IiD227BanSgpj1tG6vbGqw=;
        b=huSAmV4pzLD5BiKl6bHc2xtlR7XwLgYii1tJ+1xfQ711+jInOzrFOt4CvKtlmMxxS+
         pzJ2yIy24EpjU+hN5JQufrRPM/UgDz8gnu45THeF3HlzTfxBhpNYJBJaS7IFozkABI5a
         S7dnJJ71Mm9LgjO8ufF2goTsAByZ29sRFdkqhRgvvNN+XGZZvdPfDT7KMWbdzrP0/CX6
         O1u3La9IZcVXRS3jVYwNC1UWYnE6G8OLZhMQKMgm/IKCz3lq2Q1ME6td5OAEnpLKnAuI
         QwEW68uSYqjdSCJNHNHcbBjX9DQ95OyXf69l0rSw5NubU6QryI6QlKm7oHsAlnjZrj2n
         cc7A==
X-Forwarded-Encrypted: i=1; AJvYcCVa8zWvyitG3LuhCP1p8WlScqvdWiXzg+bBsPDcx50RYJyv5uVbFuhOcX3V4kiLYZUlI4R2VyevBy4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+w8Htfrt2KhElQokcvKXhgDbukG1AveMWOwtvB5F7eIbZCiNZ
	d8dv+5V5lrrT5o4nWXEsd8pGLtjiryoD+G4DKlI9IB98jnZYvjkA9PoL1NWwZgcp6BU=
X-Gm-Gg: ASbGncuBmkpTgiGrYMPdz0zDODaX6yccFazEFOPWupSFZjnYS6H59RX5nDG3V/a3B0t
	OfVkIsFV+WgjGs7GbsXDcWw5uBt5kHyMNu5ZSEeeQ6XdOVeTzBI5qX5KLAKQASypIb/kDugSmTk
	cuLHQfreBem4fhqQi2FjvD0DvBwJrqoVmv0K32QG+jXzRaDwSrl7IV7AZZtbIsRCAEwfkIY65+p
	/9fOSxT9kAB0RhIWJS/4Nl881RD2AksyftofY2Rsai2UkKYfopQ3E7yipLGgEjLNwKHhmOZYdXJ
	z+53POdHNQVYHT9JNI0Cyo5T5Wa/C5jXDMejPdxG6UTfHLOEOvEcN4tvavx8Dp+8WRnH/U0KqpR
	BC5lSRMt0hobWRUkYpc04ggxbSrhcvdOSD0C1mD+95c8pYH3MGqWy3K32q0mVo+25+pAUkr/Cnj
	8USI0zhjGw
X-Google-Smtp-Source: AGHT+IHFZzNqXo4DPDPEq2vl9ZtR/eDDPJqyNRiKM4rOaHvpEudFLMaZUvOTcQDmn3/DYHAyk2W3vQ==
X-Received: by 2002:a05:6000:288b:b0:428:55d3:ece1 with SMTP id ffacd0b85a97d-429a7e96c28mr3561680f8f.58.1761666186630;
        Tue, 28 Oct 2025 08:43:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm21009631f8f.17.2025.10.28.08.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 08:43:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 17:43:03 +0200
Subject: [PATCH] usb: typec: ucsi: Set orientation_aware if UCSI version is
 2.x and above
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-v1-1-d3425f5679af@linaro.org>
X-B4-Tracking: v=1; b=H4sIAIbkAGkC/x2NSw7CMAwFr1J5jaXUSsvnKoiF0xjwJkFJGpCq3
 h3D7s1i5m1QpahUuAwbFOlaNSeD8TDA8uT0ENRoDORoGh2dMHhcl6pYpWE2NTVu5iC/uQja6FJ
 +ESTkFJFD7oLheCY/RR/cPIOlX0Xu+vnfXm/7/gVvXEEXhgAAAA==
X-Change-ID: 20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-b79245d4b066
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=yZAouXEgeBn+HPlnEp+e1nrDFlGoOkzrrAmmBWF3gDI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpAOSIxZC3gYnsoFZxhyJEbOup3CTDele0k3jhC
 X4EHxOLIlyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQDkiAAKCRAbX0TJAJUV
 Vp6SEACScWZvd9xNNj0DobSCH2XhHad7U8MbsIxxXTboQRIufEiDY0fh88RJxtG++zUv+5XzOo2
 an2yRlcXKEbTSci4Us4rFMt443QqEbBt5wlTWxO2DCJP/3NSEFGDEmckYM/aIT4V8L8lV3hXIVm
 KGLKyJJE2WEtYuXfEFdOLL8BK/KawlifdXPZFaxk0lOALxHbRsjzpnQd5XG4XljX+L2Kl3CvOSV
 e5Cmx9YJ6vFVOaK0K2hmN43IQT2YCm5bkFECgh+FFxs3dXwsSnAB2ezTIq8vhRufdeARkJsSzFw
 nLsi59i2aLoeLCf1R6U0AcMOipZndxZtTUhFUBB3FRx03eWiET9uwAHIAQms88HH3St1pmfWgxw
 t9rrX4eDdWGTc1lvPKhrUTvzVM3beskuN2502V6Q8ErpO1d2VOpogUpQnqzhZdheb2qiQ5jlT6D
 Ztvxbjo3vlt+iUOuT7HDNWs9yr3lup31IRGVf6VLK7OHuOT/ueD6IPYGzIeyDQhYXVvBsyzk+Rt
 vz8jQamX6hmKyJI6fFybeWNh701FatrssSUxObD6FDYQHb+YKqqic/WS/xGuOmP/HOE0rUT9jEk
 sdvBu1+UUyz5+8iSJl+itwXVgfc9gLfmvw5QoK0m1Oc8vZnxZe17QvFeJkkoVTKR1pSMAVIEJqf
 PJnx04m2CMheNmQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

For UCSI 2.0 and above, since the orientation is part of the paylad,
set the orientation_aware by default and let the implementation specific
update_connector op override if necessary.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ed23edab776354f08452c539d75d27132b8c44dd..84afa9bfc65b6e6ad0a8c1856252299c16562baf 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1637,6 +1637,9 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	cap->driver_data = con;
 	cap->ops = &ucsi_ops;
 
+	if (ucsi->version >= UCSI_VERSION_2_0)
+		con->typec_cap.orientation_aware = true;
+
 	if (ucsi->ops->update_connector)
 		ucsi->ops->update_connector(con);
 

---
base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
change-id: 20251028-b4-ucsi-set-orientation-aware-on-version-2-and-above-b79245d4b066

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


