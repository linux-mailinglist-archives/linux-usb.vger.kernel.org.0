Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBED319D1C
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 12:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhBLLM0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 06:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbhBLLMZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Feb 2021 06:12:25 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A61C061756
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:11:45 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id q10so1218780edt.7
        for <linux-usb@vger.kernel.org>; Fri, 12 Feb 2021 03:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3g83koB90a/eZCEEcw8/cawnqZ2lHJ1WPX/hje0LORA=;
        b=rXKl4ocpG1ZyRuQ78SgL1NxRpjKGPGgtyAQgWEu3VWqWE7Z+HVGn4vU14gvKWrOa9f
         /Qcra3F1cJM3ZCZnVpChy0Lt4XpuiW5QXvuTeAGkivPpFJickebYQceIo5lBI9Xy14i0
         ptiU78INX2wpfqpBJ73fXgHyAH1jrcdso8Z7m//SCSVboMvAf79T0r23J8ItmYW2Wfuk
         zbOCiMoE7Pp1OtN6DbPKykzg4/ZTSdwuL7ped5+WCNLewOGUJgAsYUtgYIEmhfEmPz17
         /WqY0xqDPw2rqK88HqvpJAtginuU+MnOaD7RS6+ZyegYrc9ejAuGYu1Nz6neNBhZwj1o
         LxsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3g83koB90a/eZCEEcw8/cawnqZ2lHJ1WPX/hje0LORA=;
        b=ra8V78bD7uuJw9FQ8Bj254jLoeDzuS79s6c8zsuZeF9aY9/c+LumnUUa8SSEzKunHa
         7W6PlfDVfohXLwyRLSTC5hSnPgF4+o4ePr0MnkOPvrEzIbaBnclQO8N6suj72NCRfPq2
         UGmgKl0RenH3G9RELR9CtZfuC++P5h3DFoK7nO4vLat77fhEZaF3gUsWSBdXpMvf9nZf
         kdTmPwRyX/C5xjH582fvxERH7ao4r4qlMX13P2rZpllHxHwzFpe8JGx/nZEMv3Vs8voN
         YTMU3rmmKCgiVSSTtmdx7V+wZufRcZrtvSKIPnPtT/BphUeJaB/6GrRffIuhs/qP3ibU
         FA6Q==
X-Gm-Message-State: AOAM531rCZPQbjkmIYz47rciTujhsDo+QU0dWonbOJh7FeEnV6eUGCI2
        SX571k+nlWN+X03VM4Mehr7wcKXn72B5HQ==
X-Google-Smtp-Source: ABdhPJwJK3Jdk6GPigWrDVM2QBQuB47X5Ml67xxrUid4YFSuiuJ/Q7R5YDUsr8TTo1Ga++g+7njKtA==
X-Received: by 2002:a05:6402:22f6:: with SMTP id dn22mr2648652edb.277.1613128303557;
        Fri, 12 Feb 2021 03:11:43 -0800 (PST)
Received: from dell-xps159570.domain_not_set.invalid (129-228-158-163.dynamic.caiway.nl. [163.158.228.129])
        by smtp.gmail.com with ESMTPSA id g10sm727331ejk.88.2021.02.12.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Feb 2021 03:11:43 -0800 (PST)
From:   Yorick de Wid <ydewid@gmail.com>
To:     linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>
Cc:     Yorick de Wid <ydewid@gmail.com>
Subject: [PATCH v3] Goodix Fingerprint device is not a modem
Date:   Fri, 12 Feb 2021 12:10:48 +0100
Message-Id: <20210212111046.170342-1-ydewid@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210212110738.169808-1-ydewid@gmail.com>
References: <20210212110738.169808-1-ydewid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The CDC ACM driver is false matching the Goodix Fingerprint device against
the USB_CDC_ACM_PROTO_AT_V25TER.

Keep the entries sorted on in VID/PID.

Signed-off-by: Yorick de Wid <ydewid@gmail.com>
---
 drivers/usb/class/cdc-acm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index 78190574581..2f4e5174e78 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1929,6 +1929,11 @@ static const struct usb_device_id acm_ids[] = {
 	.driver_info = SEND_ZERO_PACKET,
 	},
 
+	/* Exclude Goodix Fingerprint Reader */
+	{ USB_DEVICE(0x27c6, 0x5395),
+	.driver_info = IGNORE_DEVICE,
+	},
+
 	/* control interfaces without any protocol set */
 	{ USB_INTERFACE_INFO(USB_CLASS_COMM, USB_CDC_SUBCLASS_ACM,
 		USB_CDC_PROTO_NONE) },
-- 
2.30.0

