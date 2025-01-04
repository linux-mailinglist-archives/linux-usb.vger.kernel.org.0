Return-Path: <linux-usb+bounces-18966-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF7FA01308
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 08:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CC4C1884B88
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jan 2025 07:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E8D155312;
	Sat,  4 Jan 2025 07:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVxBTj+6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37061161328;
	Sat,  4 Jan 2025 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735976757; cv=none; b=TT4nFAqtozYA8HNfxolII8wlOdBfSwkyGGsrtdgRFg3+q8l9RYILujbDRDF1yHtYDj0trwXeub4y0QHwOBjh5jaqXMYaZn9DTHyNVeFxmoxrTz8Brx4WtLDnCnu+mozb7PKBl3Qs7xR+2GfPfmEx8VB1fSi9fqj2QYL4G94kIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735976757; c=relaxed/simple;
	bh=7J1nakfZUjmPIi/nDZD/Mu/WZ2OYanNl18J3MsOH3E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pzrxtWQ8UIw0aHnu8avkxkd7goYI1fh/+WtSA27Q7sJn3z63oqCeZyrp6HZogGKZpP8MyEUBHsjuZNRrJbljox5+nBXav379gKG+n6pBIZaxNfIjqu2W24VfrVatxKYBmrP9aRVDNJS7yJJJvLWehkPjn0q6DQ7R+fBfuhB6Nn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVxBTj+6; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2161eb95317so186602415ad.1;
        Fri, 03 Jan 2025 23:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735976754; x=1736581554; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xhn9xYieMOsUUU47I3y91/WiyKl9O+sYxEUZf3Ldqqo=;
        b=eVxBTj+6kNtCwWkoJ/ZKe3jBClXehyf3yyq+aW3a+mFSQ081qVslYlEB8XmgjaXlMs
         ZXta5ZBQttZIlZ6MClh7doxj5Wb4P6kc7pVoW52v/k4XXLTihjQ2Ivo1rS5nIbdu9/cJ
         crAGnGxE7Z3J3GfR1XEum72Ug015jjWqovJTYAZBtaOJpi21Uoh7aXQW8mV35qU+P31g
         b1zZ5HWvUpTkb7cuIQzXDTdaVfkmBiMeBWdUsTTIDZAeWhT90Awgs4VBJPKWRMDJ660x
         WTHkNeCjLQFkjrzLi67IuPANiF1oprEUTJZoqxk9KykqFClwBZpOUlauOsOLNaJIte5h
         WYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735976754; x=1736581554;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xhn9xYieMOsUUU47I3y91/WiyKl9O+sYxEUZf3Ldqqo=;
        b=tFJR6QSkPKpH+gVjYZUU+OJwZNKW0JmB5m7EUJPu48VG/KZQs0+4LEjtxyyAyPKQWA
         W4FGY/pM03yk02IQzRzb84vHcPar8LkeRetCsDRQhN6a+wcKaGL4S1gpBKH8k7jJ7zMj
         dMwimUD8dgpD+Q/ZSVg1eFGjp94INfyg+8pUJGG3vfXO27OLqOWMhP4HWp10nsxU4iDh
         AHQGU4m/+hxTihAdwAf3O+LaF0zGPbOM45uupyOp/6JWdkXmo0e+fgApOhVQPXUnoO8m
         YkOaPTr7qYQe+KluofjV+eV7acfXEh1vR/3pz5uChgZaFfuTY5NoPFWC7YVaFDKO3Bx+
         xB2A==
X-Forwarded-Encrypted: i=1; AJvYcCU76tpJazvggUc3Qo3xU3Hqyc3vh++Luq9Vs3cqgroHuyp0fZLPU6XqQqRaYwt7w0ndZOVKxJxyQgcuyVo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDKePFRtxnmqLpMK2lc2Mnf9/bkiYs5bKvISuUAfccZ0O8vvYd
	Ui2Hh8sWilpxK1ns2eT2YhIBI8j0s1QGS4ogbBN+HJ+9ct83NwrI
X-Gm-Gg: ASbGnctFC+IEr37SpKOtbcNHI6SGkJFs+5d3o0IpBb4gKgAFe5j1X+qgU1vyX4uvFBb
	vyQS6Iu3Mu8GxzyiWuobRpDchLMkqL4ZuksyrJeXHDyxktEZyQ8JH0YN0UfvZwoyObjjmc/zfxu
	/0ST7r8x7HfO/AG4su8h3q8PE2dch4HdN+Zce4RNYlb7hPRRX8j0FPmXxeFV/UJaSYbwVpXYQup
	PmWrwHVJcJRvQP4snRjtchvV7NxEhmtYWQULn8m8D9lXdeCqRQoYYMbrP5vow==
X-Google-Smtp-Source: AGHT+IEs+KG43EG4CAG8CgPNpLh0tyKgc3kgd3TG6HJCjyGW9UCGgHP/PPNuYBaah5h1YIN4Ac4EyQ==
X-Received: by 2002:a17:902:ec82:b0:215:827e:3a6 with SMTP id d9443c01a7336-219e6f1447fmr737183805ad.40.1735976754409;
        Fri, 03 Jan 2025 23:45:54 -0800 (PST)
Received: from [127.0.1.1] ([152.44.247.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f51c2sm254604105ad.190.2025.01.03.23.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 23:45:53 -0800 (PST)
From: Will Mortensen <willmo@gmail.com>
Date: Sat, 04 Jan 2025 07:45:29 +0000
Subject: [PATCH] usb: core: prefer only full UAC3 config, not BADD
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250104-usb-choose-config-full-uac3-v1-1-f8bf8760ae90@gmail.com>
X-B4-Tracking: v=1; b=H4sIABjneGcC/x3MwQqDMAwA0F+RnBdotRX0V8YOGtMakHY0VAbiv
 694fJd3gXIRVpi7CwqfopJTg311QPuSIqNszdCb3htrHFZdkfaclZFyChIx1OPAutCA5LfJ2SG
 sozfQhm/hIL9nf3/u+w8jwN5bbQAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Nikolay Yakimov <root@livid.pp.ru>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 AT <kernel@twinhelix.com>, Ruslan Bilovol <ruslan.bilovol@gmail.com>, 
 Takashi Iwai <tiwai@suse.com>, Tatsuyuki Ishi <ishitatsuyuki@gmail.com>, 
 Saranya Gopal <saranya.gopal@intel.com>, 
 Felipe Balbi <felipe.balbi@linux.intel.com>, 
 Will Mortensen <willmo@gmail.com>
X-Mailer: b4 0.14.1

Previously, usb_choose_configuration() chose the first config whose
first interface was UAC3 (if there was such a config), which could mean
choosing UAC3 BADD over full UAC3, potentially losing most of the
device's functionality. With this patch, we check the config's first IAD
and only prefer the config if it's full UAC3, not BADD.

Note that if the device complies with the UAC3 spec, then the device's
first config is UAC1/2. With this patch, if the device also has a UAC3
BADD config but no full UAC3 config (which is allowed by the spec),
then we'll select the first, UAC1/2 config, *not* the BADD config.

That might be undesirable (?), so we could instead try to implement a
priority scheme like: full UAC3 > UAC3 BADD > UAC1/2. But unless we also
enhance this function to look at more than one IAD and interface per
config, we could incorrectly select the BADD config over more fully-
featured UAC1/2/3 configs if the full UAC3 IAD is not first in its
config(s). I don't know enough about UAC3 devices to know what's
preferable, and I'm not sure how simple vs. correct the heuristics in
this function should be. :-) This patch errs on the side of simple.

For some history, the preference for the first UAC3 config (instead of
the first config, which should be UAC1/2) originated a bit before the
Fixes commit, in commit f13912d3f014 ("usbcore: Select UAC3
configuration for audio if present") and commit ff2a8c532c14 ("usbcore:
Select only first configuration for non-UAC3 compliant devices"). Also,
the Fixes commit's message is a bit wrong in one place since the UAC3
spec prohibits a device's first configuration from being UAC3.

I tested only with an Apple USB-C headphone adapter (as in the linked
bug), which has three configs in the following order: UAC2, UAC3 BADD,
full UAC3. Previously the UAC3 BADD config was selected; with this patch
the full UAC3 config is selected.

Reported-by: AT <kernel@twinhelix.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217501
Fixes: 25b016145036 ("USB: Fix configuration selection issues introduced in v4.20.0")
Cc: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Cc: Saranya Gopal <saranya.gopal@intel.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Nikolay Yakimov <root@livid.pp.ru>
Signed-off-by: Will Mortensen <willmo@gmail.com>
---
 drivers/usb/core/generic.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/core/generic.c b/drivers/usb/core/generic.c
index b134bff5c3fe..ce9c86967922 100644
--- a/drivers/usb/core/generic.c
+++ b/drivers/usb/core/generic.c
@@ -20,6 +20,7 @@
  */
 
 #include <linux/usb.h>
+#include <linux/usb/audio-v3.h>
 #include <linux/usb/hcd.h>
 #include <uapi/linux/usb/audio.h>
 #include "usb.h"
@@ -48,9 +49,11 @@ static bool is_audio(struct usb_interface_descriptor *desc)
 	return desc->bInterfaceClass == USB_CLASS_AUDIO;
 }
 
-static bool is_uac3_config(struct usb_interface_descriptor *desc)
+static bool is_full_uac3(struct usb_interface_assoc_descriptor *assoc)
 {
-	return desc->bInterfaceProtocol == UAC_VERSION_3;
+	return assoc->bFunctionClass == USB_CLASS_AUDIO
+		&& assoc->bFunctionSubClass == UAC3_FUNCTION_SUBCLASS_FULL_ADC_3_0
+		&& assoc->bFunctionProtocol == UAC_VERSION_3;
 }
 
 int usb_choose_configuration(struct usb_device *udev)
@@ -84,6 +87,8 @@ int usb_choose_configuration(struct usb_device *udev)
 	num_configs = udev->descriptor.bNumConfigurations;
 	for (i = 0; i < num_configs; (i++, c++)) {
 		struct usb_interface_descriptor	*desc = NULL;
+		/* first IAD if present, else NULL */
+		struct usb_interface_assoc_descriptor *assoc = c->intf_assoc[0];
 
 		/* It's possible that a config has no interfaces! */
 		if (c->desc.bNumInterfaces > 0)
@@ -137,17 +142,21 @@ int usb_choose_configuration(struct usb_device *udev)
 		/*
 		 * Select first configuration as default for audio so that
 		 * devices that don't comply with UAC3 protocol are supported.
-		 * But, still iterate through other configurations and
-		 * select UAC3 compliant config if present.
+		 * But, still iterate through other configurations and select
+		 * full UAC3 compliant config if present. (If the only UAC3
+		 * config is a BADD, we will instead select the first config,
+		 * which should be UAC1/2.)
 		 */
 		if (desc && is_audio(desc)) {
-			/* Always prefer the first found UAC3 config */
-			if (is_uac3_config(desc)) {
+			/* Always prefer the first found full UAC3 config */
+			if (assoc != NULL && is_full_uac3(assoc)) {
 				best = c;
 				break;
 			}
-
-			/* If there is no UAC3 config, prefer the first config */
+			/*
+			 * If there is no full UAC3 config, prefer the first
+			 * config.
+			 */
 			else if (i == 0)
 				best = c;
 

---
base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
change-id: 20250104-usb-choose-config-full-uac3-c5d9413fb650

Best regards,
-- 
Will Mortensen <willmo@gmail.com>


