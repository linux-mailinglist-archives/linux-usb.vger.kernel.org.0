Return-Path: <linux-usb+bounces-32260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37634D1904A
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 14:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7C2A30652AC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 13:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10C43904C9;
	Tue, 13 Jan 2026 13:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="De2kmwwX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7228A16DEB0
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 13:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768309551; cv=none; b=kLGUHAgQKqT2PgfPIucqviVAadySF0Dndeq2n9NPhy5vseIXECh52NMQLfpEwsVvoUL7bXZl6vfSDRAVOPaVHg7Q4++Htvbrzmx+lB+bcVZfXODJxbApXGOTLwAs1GUPH3x/rT4SGjlh/6pfS5lXwRAFVqfohPD1ymIJra4/2mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768309551; c=relaxed/simple;
	bh=aP2YFO92lDva0e1jN3T5U5hBf2PD7EyvHXkgrzxR9eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSc4re9ii3JH/dPIeXnkaEMOY5dti3UNFlXX4yNcEOQd2ROV7kLnnLIFVZaPoChtU5Ftg6gBAkovrgHEYJuIRHYN0eLynxtwDlvRi08IuhCbyvICZbM/7VRXZA+jZebDL7kqDGTgkWwY7MSdbYJD0FBoU94ccIbFGA0lu+zqlcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=De2kmwwX; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8710c9cddbso351438866b.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 05:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768309547; x=1768914347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=De2kmwwXdl9FURki92S72lqBibreJyUKP3L5vtje2JEdMrijy7EmsPu7xKbbQ3vs4i
         lJn3lKXf8+WK8O/pVb4T3NthHD82RIp4bXx4eHU1a7VXcMWh9lvvh0UehkahlzhzbOqV
         pd8ys9jDo1bQ9DJbT3QJAUSFhFhPBedYu+x9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768309547; x=1768914347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KHMLWRy5Z3mpMYGMUoVXUolvpCNuwJWbgQEgoyJgmAk=;
        b=eWwPzkN0dzf5OYh+eCWfsYNPoOPXrrdXI8FnwOdmw7XZk61P2Ll7C/AvgFytiwNcok
         vIFCIy+KNTKkTOIXswbhsVi0bCKtzzAN0YzPwOtbd/96JA05lk5a1xsVNjY96t/sWWy5
         1NtwC0YAEslCKEkzkvbv6gemRvF6bfCourcRS2n6zrCapooJZH/uc48OZzBSMZ4W5dZi
         GT5fLeekjbZj1AjFAE4VjtTohwrWC3hHuM7ny6keE1m4hESYl+gx5YH9QQoHlZ5B22Si
         6QKZfJP0a4Czf+DnhxwroFBpR7hrqsJwJBY3qvjQWdQ0ye+j+kYbOB0HHJZG7a4d6zLU
         dXgg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjKr9lUtXhH5EGpunRYVEwkYVCH+m7PUGmuvKmFW2t6dSY8uYMujGVkx+tKKZd05vWL9ETmBT8a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLvQRZ1ydHgrCRUDsQECxZLk3MRwRGhaopXyltegacjDKNw5ha
	6MgMuhUXmvJOfh5HDq5eUGNlu9uiSjWUQzhQIzqBkgM1SIa36G1/cy1Ai/tekPijXA==
X-Gm-Gg: AY/fxX4eEm8Ld/0ZE0Rki8otkk1IoaeiaBzcb/0ow752Isniha+5HVBYRX3AwZfjQ8f
	AZy7myOWM5Yy3nTbcQav6fxpEgoUI9IUsVh8V8goTKGrT+U4zEZs5zwaeXlq6UJ4f2SLxfsxnrW
	nGLlzb6+eb1wJo3NYbxf7w5Z1KkDMHvG2yR74z8OiE8J6klHALWUcRZ5dczNMFPAXUbV0CkOWYn
	yfZPuNgmFIunJm4ZcwL0vgI0sXdmJieleGXChLypHc1YhKIPfXOaeuCbGkRJQ4VuN/1SEsIlEee
	9fbtlVcgkjcUs2X+a3j6DxwjMA2rhbNVNqd302Tjnsl5e1rA+E7SqvvCt5VMqPCZRjdsF6QJ0gH
	WAdGjR9ODawksO/BPzg+iAK3BgXUKLc5at2q7f0OENwOV1T/dR9hODRYr0+8Q4ZyIhaXzDc6kdO
	AIc7Ip9J4U0wM+4hmA+LqbyEQj1yG+JmXpRQbG2Rng0QLIAhm05VwcyF3fu6XRg6CTh/IWQxq3j
	7P/9XQO
X-Google-Smtp-Source: AGHT+IGYDiJcte/TlGQ/Kqo75hJm6ijsCffQe6+xWAOzGZVEzXJ6AGMRNDBXwFdbt04+YpVYAKbzhg==
X-Received: by 2002:a17:907:3c94:b0:b77:1233:6f32 with SMTP id a640c23a62f3a-b844539fbf5mr2233587966b.48.1768309546845;
        Tue, 13 Jan 2026 05:05:46 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b871b5e60dasm586217266b.63.2026.01.13.05.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 05:05:46 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Johan Hovold <johan@kernel.org>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v4 2/8] platform/chrome: cros_ec_typec: Set no_mode_control flag
Date: Tue, 13 Jan 2026 13:05:30 +0000
Message-ID: <20260113130536.3068311-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
In-Reply-To: <20260113130536.3068311-1-akuchynski@chromium.org>
References: <20260113130536.3068311-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Benson Leung <bleung@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb26..c0806c562bb93 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->no_mode_control = !typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.52.0.457.g6b5491de43-goog


