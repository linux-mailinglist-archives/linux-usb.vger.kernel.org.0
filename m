Return-Path: <linux-usb+bounces-18460-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC369F1A29
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2024 00:36:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8562C188E0FA
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 23:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A181E0E0D;
	Fri, 13 Dec 2024 23:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fdfu34mm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1684118E054
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 23:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132957; cv=none; b=pB7UMjjCd8hw3TCxPTUPiMl0DKQNH8w9LA8551oL/g91I5mn/pP9DNDalrFkqlMBJyffAtihG5DFb38Da0m1LLuJXjbQRMAFVx+Da/eqM4uVrYMW5WHxSoyvg3zrSQfxy+hojXN0BDWjK1r+e7H0fA68k0rujHrDXAE5VuuLAJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132957; c=relaxed/simple;
	bh=KVAPKHKDIi6ZozifLwAVFGy3NJHCm9SP5tWGLFajcC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMWPU/afquy0YWRJ6Kt7Azvvqr7vdl4ghKaNshZ1RKYZwYY0X7CR3ko7Nfv0eUU2sTcPa58GO740dobtRkdvKfUzAHynb+TRtW9t2T83ZOorF7ucqNujyp0AU6cCq3AwDkgZP527zdmpH+eoXpZ1KHoBpBOpEr3CkI2tHrRKfpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fdfu34mm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2156e078563so18155385ad.2
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 15:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132955; x=1734737755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2joRXiX4ZDmMc5H+1DaNrFqQcCzYSVBFrBBIReWvLhM=;
        b=Fdfu34mmqoOVPo5nCP07/Aa4QjoNnHgW9mSoHDOE+O/w/pYQV9HR6r1KFvRe8OBK06
         czigsFX4vQk6QgjgrHqmhp3TSGabY6o3CEBMDjascaDLnojaXQOr2QHIT9k7pULJ3au+
         tQxsWRHYGTSHQeKJraJCq2j3ardfCI5l8Uoqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132955; x=1734737755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2joRXiX4ZDmMc5H+1DaNrFqQcCzYSVBFrBBIReWvLhM=;
        b=MYBkIxxxHWkZueza4evoOO566y63p+u2d9OAa9X6BYHjr1CYS+fJj0hpr+F53IQESR
         AN19TOTV4QzZRrtt95uwAYhx3zvyR25wp/IBNvPKp6fbZWajB0jF5Rz6e0AuxMH+62Wr
         w4q1d/3YotXC00BBSCwh7N2oMFH2lPzoAnwC39r/YlC7+yJDifDZLeDYndJ4wD6j0A2H
         HRWerav92vJHkLoJLLqqMI4ugMaZN4x2FWI1RL6f/H0EeVqNSX9f6x7f5cvytFJCKPFz
         eLa512tFGdcQfvSkzFZHbQuutnA6mSk+5PuRz36OwzeGf5VYVX4Vx8xPl9LxSL9hL6+a
         lSFA==
X-Forwarded-Encrypted: i=1; AJvYcCWImD3beqnUkxNchI0I44aCITpPus9729J44bEkBBYHGP+j1wa3WsC3lH7wUE9sRQoik7DDVnvaxs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJ0GWfwuXPVBsoIa8hlR2HgbmtwUi7zpLosJ//IBALCJnhI6B
	jBA9GANZwwhhj96/GOf2+dFi+VUQ79A9LdqHMfuB41ZDJQdfD00ufNKbM0Ow6w==
X-Gm-Gg: ASbGncv17DDmM4UFkp0NW+wwSemWICy76oqwNwOHHmlbQMkoYy9qA22/xlyNfHWcW92
	CHqpnBafCov2dv74nx4cfV0HShMo2BLaQZBU5K8CbJGojXXGeVREE+7xlVimPAIb7et45Fo64pj
	qBIqnmT/5jhKxsiNSUtalu1BxpyY3pUpc22EPgJm7eQsr83Urq8CzE7timhAv6H9TOsOaPMwA+W
	OA56WnCwseiV5t2iRmsNySqY1QmZ6ReD85oT6EsOEwWn0seLDmjzb9ZcgJ3UMjV/OWDyP0cZkgU
	RPhT5ljUnpn2I8EE7rBZu7TvJ3XHQGM=
X-Google-Smtp-Source: AGHT+IH8ZFuDs0emt0+PPLGZ5/ZYn4/Duplxh1Ipgr1sWzkwTO40N5VOvKe8sHcnYfrW2a/CsJ7WdA==
X-Received: by 2002:a17:903:41c5:b0:215:9a73:6c45 with SMTP id d9443c01a7336-218929d8326mr65691895ad.22.1734132955475;
        Fri, 13 Dec 2024 15:35:55 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e5404csm2923585ad.150.2024.12.13.15.35.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:55 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/8] usb: typec: Only use SVID for matching altmodes
Date: Fri, 13 Dec 2024 15:35:42 -0800
Message-ID: <20241213153543.v5.1.Ie0d37646f18461234777d88b4c3e21faed92ed4f@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mode in struct typec_altmode is used to indicate the index of the
altmode on a port, partner or plug. It is used in enter mode VDMs but
doesn't make much sense for matching against altmode drivers or for
matching partner to port altmodes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---

Changes in v5:
- Rebase with module_alias_printf

Changes in v3:
- Removed mode from altmode device ids
- Updated modalias for typecd bus to remove mode
- Re-ordered to start of series

Changes in v2:
- Update altmode_match to ignore mode entirely
- Also apply the same behavior to typec_match

 drivers/usb/typec/altmodes/displayport.c | 2 +-
 drivers/usb/typec/altmodes/nvidia.c      | 2 +-
 drivers/usb/typec/bus.c                  | 6 ++----
 drivers/usb/typec/class.c                | 4 ++--
 scripts/mod/devicetable-offsets.c        | 1 -
 scripts/mod/file2alias.c                 | 9 ++-------
 6 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 2f03190a9873..3245e03d59e6 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -791,7 +791,7 @@ void dp_altmode_remove(struct typec_altmode *alt)
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
 static const struct typec_device_id dp_typec_id[] = {
-	{ USB_TYPEC_DP_SID, USB_TYPEC_DP_MODE },
+	{ USB_TYPEC_DP_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, dp_typec_id);
diff --git a/drivers/usb/typec/altmodes/nvidia.c b/drivers/usb/typec/altmodes/nvidia.c
index fe70b36f078f..2b77d931e494 100644
--- a/drivers/usb/typec/altmodes/nvidia.c
+++ b/drivers/usb/typec/altmodes/nvidia.c
@@ -24,7 +24,7 @@ static void nvidia_altmode_remove(struct typec_altmode *alt)
 }
 
 static const struct typec_device_id nvidia_typec_id[] = {
-	{ USB_TYPEC_NVIDIA_VLINK_SID, TYPEC_ANY_MODE },
+	{ USB_TYPEC_NVIDIA_VLINK_SID },
 	{ },
 };
 MODULE_DEVICE_TABLE(typec, nvidia_typec_id);
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index aa879253d3b8..ae90688d23e4 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -454,8 +454,7 @@ static int typec_match(struct device *dev, const struct device_driver *driver)
 	const struct typec_device_id *id;
 
 	for (id = drv->id_table; id->svid; id++)
-		if (id->svid == altmode->svid &&
-		    (id->mode == TYPEC_ANY_MODE || id->mode == altmode->mode))
+		if (id->svid == altmode->svid)
 			return 1;
 	return 0;
 }
@@ -470,8 +469,7 @@ static int typec_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	if (add_uevent_var(env, "MODE=%u", altmode->mode))
 		return -ENOMEM;
 
-	return add_uevent_var(env, "MODALIAS=typec:id%04Xm%02X",
-			      altmode->svid, altmode->mode);
+	return add_uevent_var(env, "MODALIAS=typec:id%04X", altmode->svid);
 }
 
 static int typec_altmode_create_links(struct altmode *alt)
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 4b3047e055a3..febe453b96be 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -237,13 +237,13 @@ static int altmode_match(struct device *dev, void *data)
 	if (!is_typec_altmode(dev))
 		return 0;
 
-	return ((adev->svid == id->svid) && (adev->mode == id->mode));
+	return (adev->svid == id->svid);
 }
 
 static void typec_altmode_set_partner(struct altmode *altmode)
 {
 	struct typec_altmode *adev = &altmode->adev;
-	struct typec_device_id id = { adev->svid, adev->mode, };
+	struct typec_device_id id = { adev->svid };
 	struct typec_port *port = typec_altmode2port(adev);
 	struct altmode *partner;
 	struct device *dev;
diff --git a/scripts/mod/devicetable-offsets.c b/scripts/mod/devicetable-offsets.c
index 9c7b404defbd..d3d00e85edf7 100644
--- a/scripts/mod/devicetable-offsets.c
+++ b/scripts/mod/devicetable-offsets.c
@@ -237,7 +237,6 @@ int main(void)
 
 	DEVID(typec_device_id);
 	DEVID_FIELD(typec_device_id, svid);
-	DEVID_FIELD(typec_device_id, mode);
 
 	DEVID(tee_client_device_id);
 	DEVID_FIELD(tee_client_device_id, uuid);
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 5b5745f00eb3..7049c31062c6 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1221,17 +1221,12 @@ static void do_tbsvc_entry(struct module *mod, void *symval)
 	module_alias_printf(mod, true, "tbsvc:%s", alias);
 }
 
-/* Looks like: typec:idNmN */
+/* Looks like: typec:idN */
 static void do_typec_entry(struct module *mod, void *symval)
 {
-	char alias[256] = {};
-
 	DEF_FIELD(symval, typec_device_id, svid);
-	DEF_FIELD(symval, typec_device_id, mode);
-
-	ADD(alias, "m", mode != TYPEC_ANY_MODE, mode);
 
-	module_alias_printf(mod, false, "typec:id%04X%s", svid, alias);
+	module_alias_printf(mod, false, "typec:id%04X", svid);
 }
 
 /* Looks like: tee:uuid */
-- 
2.47.1.613.gc27f4b7a9f-goog


