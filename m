Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624A2347F70
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 18:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237233AbhCXRej (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 13:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237245AbhCXReS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 13:34:18 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87930C0613E2
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 10:34:17 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id bx7so28565049edb.12
        for <linux-usb@vger.kernel.org>; Wed, 24 Mar 2021 10:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7/N3FVykAR22YhzUhZ15csg3vPH/3PyPAZDl2mJTyE=;
        b=VxIkrCxesyL14UeRs78vWlRa0oQXxXoxEI3HDGKMmeRkyUyy62wrRUC0w+4rynV6NY
         Ll5Rif5st8hCJyM8cC5Uk2fs4HmA72rZFok6HzR70YSH2FDLHt+9VQ2xQh/Nys9MlSxC
         P+PkpKSImwmZzOg3gBSgTPm8tYQidd6bJoT35BpgZHxu1t89/h/jNmRuH8LGfqALRXNj
         GuXNxRk90IrloCGke9ercsKjjKupoV7R3RawwgaIqClYUTfdx3wdABc4Zi84J1zQ6ErP
         QsDWP1QchO8lm4ioxgoQdnPwCcYH+TXz+vrXYv8VDQtcFiTAUShLkUZ8cg1+EXS+5uj2
         Lhbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7/N3FVykAR22YhzUhZ15csg3vPH/3PyPAZDl2mJTyE=;
        b=DYsu9mbBzNMtbv+8rkgotwIL8S/csFf9sfl95Tt2YG7iEModu0mZRIgXasvYYixZZs
         MSUVIio+vEeREwsaa6mVbxP2zhXTjxNsg8Orx4/NaOb1+Horcj3SCwAb2/lLEp8rLG/j
         oUDL7rpN7bBvFihpRSstB9OLqiSgpMsI7oIqw8goOu5I6v1qGGeuWsfatzjwVFSWKGg7
         Vwl6MaaKoIZt1rb8k2R3x82GX3zVvRA+PxxvXpeJRpRYbr63zZ9CcIu9yXbBx4+/CcRM
         0i3pwD+h9qQmHDb5vktMs+sohYP3AI/0zcw6n6Xyaw0FlesfSh/Vl9qaTZM2W8SkbJfa
         Dpow==
X-Gm-Message-State: AOAM532HzSwGHofUfcDqSg19vcjog4OQSvnl4H9TatFPEfb7X8GWo0TY
        eJ0O7ZdccDBRWENvafvfZ+n2Ag==
X-Google-Smtp-Source: ABdhPJylv30JqRZMzBDUUnpDl1vh1UfuC6zxexY7SFcPJS3j7MrLyWiG3W7ZVfKXIThRWIH3JDu2mA==
X-Received: by 2002:a50:fc94:: with SMTP id f20mr4711938edq.370.1616607256236;
        Wed, 24 Mar 2021 10:34:16 -0700 (PDT)
Received: from dell.default ([91.110.221.180])
        by smtp.gmail.com with ESMTPSA id p19sm1466367edr.57.2021.03.24.10.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 10:34:15 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Anssi Hannula <anssi.hannula@gmail.com>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH 08/25] HID: usbhid: hid-pidff: Demote a couple kernel-doc abuses
Date:   Wed, 24 Mar 2021 17:33:47 +0000
Message-Id: <20210324173404.66340-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210324173404.66340-1-lee.jones@linaro.org>
References: <20210324173404.66340-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'dev' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'effect_id' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: Function parameter or member 'value' not described in 'pidff_playback'
 drivers/hid/usbhid/hid-pidff.c:512: warning: expecting prototype for value times(). Prototype was for pidff_playback() instead
 drivers/hid/usbhid/hid-pidff.c:1005: warning: Function parameter or member 'pidff' not described in 'pidff_find_effects'
 drivers/hid/usbhid/hid-pidff.c:1005: warning: Function parameter or member 'dev' not described in 'pidff_find_effects'
 drivers/hid/usbhid/hid-pidff.c:1005: warning: expecting prototype for Find the implemented effect types(). Prototype was for pidff_find_effects() instead

Cc: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Anssi Hannula <anssi.hannula@gmail.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-input@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hid/usbhid/hid-pidff.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index fddac7c72f645..ea126c50acc3b 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -505,7 +505,7 @@ static void pidff_playback_pid(struct pidff_device *pidff, int pid_id, int n)
 			HID_REQ_SET_REPORT);
 }
 
-/**
+/*
  * Play the effect with effect id @effect_id for @value times
  */
 static int pidff_playback(struct input_dev *dev, int effect_id, int value)
@@ -997,7 +997,7 @@ static int pidff_find_special_fields(struct pidff_device *pidff)
 	return 0;
 }
 
-/**
+/*
  * Find the implemented effect types
  */
 static int pidff_find_effects(struct pidff_device *pidff,
-- 
2.27.0

