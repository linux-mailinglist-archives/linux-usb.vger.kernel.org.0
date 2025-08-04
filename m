Return-Path: <linux-usb+bounces-26465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DDB19E46
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 11:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B691655D7
	for <lists+linux-usb@lfdr.de>; Mon,  4 Aug 2025 09:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A82C2459D7;
	Mon,  4 Aug 2025 09:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xg4tAtW7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13282254AF0
	for <linux-usb@vger.kernel.org>; Mon,  4 Aug 2025 09:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754298290; cv=none; b=HDneaPSgHuj7SAeET/r5ocAHvxh02LGPg+jU8JEJIsm9br6/sxX+MIqyK0fsqTEIpz0Ts/SKLek9PCEmEIAAkweQc3Y7+HG495MDFz9RJ7AvTnDQDukBiF2MdSZUAax5wfHLpyuDKwexrEiLD1Zl8QIEwifDy7Yc19lbNXa6oV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754298290; c=relaxed/simple;
	bh=3x19bC4TEkjCbZhfuYqU5c/VjurC/2Z6kwyVqMzBqdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j9AGYdyFchSrlokLdYMCLsp4hMf4o+864D3Vm2kWKkASr78rTq5sd+4oSmQrhfYbcrhw+8SyRlxDdXujTrZ5qGnFsKBmQjhW/mAInw+8tuuTxggUoXzc0e1oQVRx7fJp87/Am73w5PUKr1jm1P9sVxhOrjmFKPz0XGnX3hzJRwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xg4tAtW7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so5055236a12.1
        for <linux-usb@vger.kernel.org>; Mon, 04 Aug 2025 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754298287; x=1754903087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vnQpTwABThBxdUskT3LdV6JNdqJ4VQSfDvVtzabNNUU=;
        b=Xg4tAtW7xI5NriBCXr/EdjYAbEtUfVMZ2+Qf9K+XZt8Iin1MVlmenKAaFiPkbbczgg
         5nMpBLjUSxSvkgJF1tWRiwhQ4yIWmVG4sb5wU7nCWcRNeffEH8NQL4AK3RhVg73PdOXD
         AZO778+w8MLZJ4+3SPDV2uLLWECf3YYeVOLK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754298287; x=1754903087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnQpTwABThBxdUskT3LdV6JNdqJ4VQSfDvVtzabNNUU=;
        b=lh+/Iu4J1eY4nMadM6zdDx+Gqmyn6B1JoVl9CFrUyRdtPQAwPrSviMw8+a5w/oZsnC
         2PXGjLiuzUMhXoD6KqUZpDUT1UhVf3CM9zlD/J+yooe25BhryVbyKuOT+KpkLsWCc4BI
         E1HzbXINLmcsZZs2mUSN7Gz9eoJO49aPNQVbpdvUfm10W00Vd413t+CfmpdXPHZZbqNn
         nww3FatbbGjnvjW6eUuSrjCUfr9s4oVgFe8YKIPltAVr8dvjrCli4y+RzJJqOozjnE52
         Vhxq/sf4bJ/PdS/lV2BMgx0HhFoCWr6CBLGhuIDHL2hhoUFUnSQ5QJHc28COaF/f9CMv
         u/LQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoHY0FJDpL1FE36wx/dDXbsDuSA2kEGeZbAJDnm1Aurreydy9nYvu1OH/kQcruE/ahDUq45/uSKVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuZLquLnsXcX5by1pie7ZNrZmiQCA/VzBoFbWkxGhI+bzUJLok
	JDepac6zAkr6w8O7x8T9YNf8bwL6Cdx4k4Y0q+UGi9csVkmlY5yzgTWLUUsm1dj1uw==
X-Gm-Gg: ASbGncsop3XKroNih0nsXFUYIr7cmwjxS+vW9CwBFZ09GQ8Fqy0f2a0niTzQim0mlf3
	hzz+LH8CectCrImkPoh8lxZJWsDRVqOISfWy1YB7MZZIADf75etCJ4lGgo94MTRJZHqbIR2dqcF
	XXQeLXxUgMO1OJAy8hgcYw7+rd6BjfHRoaFea+Wdnr3FbgpxRpip9Uc5Xa2Pog0PiheVYINNdjb
	acoN9vreyKOOrkv8roBk6zokeZFB7dbXM1mM61O2oB3Fo2D/kTUUYpqQjDK+vfPnhc7nN3v4F5N
	z0Erwy7dVvp20OIdpyptkQO7wuPn8WdWCg6MW0Wf6raMd3mjTT4y0T9cm7dr3+Tk3n8mVNLZzfQ
	PmPRPBXgpzq+UWhzvjUVvY0zO20ae6uzv9+pBlAVSz9Evtg6N63yvnUk2yf2Yo4Gl68qTMXU7Vz
	BOsDUgDm/PGQyoX0ST/yGofmDVDQ==
X-Google-Smtp-Source: AGHT+IHrHxXdeaPG9B8IlHKEHEVk1KBLXqnoXcB8NheI8LMoc58AFyO+W+Fv2Eq44g8cl/NgunqeAg==
X-Received: by 2002:a05:6402:3788:b0:615:38e6:b739 with SMTP id 4fb4d7f45d1cf-615e6ed456fmr7575534a12.10.1754298287331;
        Mon, 04 Aug 2025 02:04:47 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (150.230.32.34.bc.googleusercontent.com. [34.32.230.150])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8fe7995sm6412790a12.36.2025.08.04.02.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 02:04:46 -0700 (PDT)
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v3 10/10] platform/chrome: cros_ec_typec: Add default_usb_mode_set support
Date: Mon,  4 Aug 2025 09:03:39 +0000
Message-ID: <20250804090340.3062182-11-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250804090340.3062182-1-akuchynski@chromium.org>
References: <20250804090340.3062182-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `cros_ec_typec` driver currently doesn't directly consume a default
USB mode value. This commit adds the `default_usb_mode_set` function,
enabling the `usb_capability` sysfs attribute to be writable.
This functionality allows users to dynamically activate or deactivate
USB4 mode on a given port.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 5a3d393c26ee..9bfe78e315fc 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -44,6 +44,11 @@ static void cros_typec_role_switch_quirk(struct fwnode_handle *fwnode)
 #endif
 }
 
+static int cros_typec_default_usb_mode_set(struct typec_port *port, enum usb_mode mode)
+{
+	return 0;
+}
+
 static int cros_typec_enter_usb_mode(struct typec_port *tc_port, enum usb_mode mode)
 {
 	struct cros_typec_port *port = typec_get_drvdata(tc_port);
@@ -140,6 +145,7 @@ static int cros_typec_pr_swap(struct typec_port *port, enum typec_role role)
 }
 
 static const struct typec_operations cros_typec_usb_mode_ops = {
+	.default_usb_mode_set = cros_typec_default_usb_mode_set,
 	.enter_usb_mode = cros_typec_enter_usb_mode,
 	.dr_set = cros_typec_dr_swap,
 	.pr_set = cros_typec_pr_swap,
-- 
2.50.1.565.gc32cd1483b-goog


