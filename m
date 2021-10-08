Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DC34271EE
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 22:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241919AbhJHUSG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 16:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbhJHUSF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 16:18:05 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18133C061570
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 13:16:10 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g8so40643553edt.7
        for <linux-usb@vger.kernel.org>; Fri, 08 Oct 2021 13:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDzzu4XHpDxsX7ZgfqK1Q92moqlgBHfhssYD+3IjEEg=;
        b=Xkf9wUBSfoF4klEQg46g3xXPftJRRO4ZcHRUQIBXvYGEgcVkuHR/bqPV9CEMg/9Gcq
         PNcge6apx7Dbht5/da+Rqo3SZgAsz6HG/TV651Iiif8Vbwp2TsjxUng43HtWADPWuRgh
         2Hkf7Se6gBf0tiedxyZVrKlGqWzk9oDAVaFwpI8opFTG6sJcLPI5IdhnNeWy4Xs1acCe
         7C187DpyAjJIiUfcPplVP/PjUC23RHn8nUJpcpkdG01JsmbT/J+AdzlzYddQ5SJiOH6t
         BR6Rkaxil1a5d4uKJcyI8s47EoCYEynE3MRZA5GnlWFTexmOKAjXUEB8JYz1LWPN2uuv
         +fnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qDzzu4XHpDxsX7ZgfqK1Q92moqlgBHfhssYD+3IjEEg=;
        b=PGUeXMtVOmmrCMB3ufUynDlg41wilQIIvr71dtZxAur65tRKbdQdmVlMmr4FZuZPyD
         n9M2lOWvZHR90fAT9SsD1bbg0Y1m30zLAtdT7z+t1YPUmyoL5te8QVvEC1Fv3INT5qU8
         PZOoKcGw8YXoaPUPBV2DaKlBqAgeygaOxuyOJu3DfITHq9vJ3JSFdsl3RwJwAKeS3c1s
         LESavl3sklw1VzGXSD7XYAKoHVtxLVusq6/29Wfi610qhavyQNzOhMqSwtVx/3D91tuD
         S40E8re85Uo2Ofel2jxnm0h1xYyjHfohcT7kync6o8waFJ7Sa7DaO+BOi5z3QBFzI/1+
         H7tw==
X-Gm-Message-State: AOAM532YQOZtQ2fVmbOPryR39oXwiDQZn67uwFfGJLgyOs4nSUfmLUce
        HaQdJu4aXkroZaLEoYYdfaI=
X-Google-Smtp-Source: ABdhPJwpcJCeRuVmvgrkIPeSu63h2UqmzLfDW3XxhOlJNp39VmX6Pb3E1DmsDpp3a6WskXCsdXoiQw==
X-Received: by 2002:a17:907:984d:: with SMTP id jj13mr7202884ejc.211.1633724168646;
        Fri, 08 Oct 2021 13:16:08 -0700 (PDT)
Received: from localhost.localdomain ([78.134.31.99])
        by smtp.googlemail.com with ESMTPSA id dj8sm141925edb.53.2021.10.08.13.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:16:08 -0700 (PDT)
From:   Gianni Pisetta <gianni.pisetta@gmail.com>
To:     gianni.pisetta@gmail.com, linux-usb@vger.kernel.org
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, stable@vger.kernel.com
Subject: [PATCH] usb: typec: tcpm: ignore data role mismatch with a GoodCRC Message
Date:   Fri,  8 Oct 2021 22:14:55 +0200
Message-Id: <20211008201455.8739-1-gianni.pisetta@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The data role check in tcpm.c cause the port manager to enter a loop with a
hard reset on some chargers.
By the spec in a GoodCRC Message the other end does not need to comply with
the data role, so ignore a data role mismatch in a request when the message
type is GoodCRC.
From the USB PD spec:
"If a USB Type-C Port receive a Message with the Port Data Role field set 
to the same Data Role, except for the GoodCRC Message, USB Type-C error 
recovery..."

Below are the log of a Pinebook Pro attached to a PinePower Desktop Supply
before the patch:

[226057.970532] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
[226057.975891] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @ 310 ms [rev3 NONE_AMS]
[226058.134384] PD RX, header: 0x53a1 [1]
[226058.134389] Data role mismatch, initiating error recovery
[226058.134392] state change SNK_WAIT_CAPABILITIES -> ERROR_RECOVERY [rev3 NONE_AMS]
[226058.134404] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]

Fixes: f0690a25a140b
cc: <stable@vger.kernel.com>
Signed-off-by: Gianni Pisetta <gianni.pisetta@gmail.com>

---
 drivers/usb/typec/tcpm/tcpm.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 5d05de666597..02ebf7e03c41 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2887,11 +2887,11 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
 
 		/*
 		 * If both ends believe to be DFP/host, we have a data role
-		 * mismatch.
+		 * mismatch. Must perform error recovery actions, except for
+		 * a GoodCRC Message(USB PD standard, 6.2.1.6).
 		 */
-		if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
-		    (port->data_role == TYPEC_HOST)) {
+		if (!!((le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
+		       (port->data_role == TYPEC_HOST) && type != PD_CTRL_GOOD_CRC)) {
 			tcpm_log(port,
 				 "Data role mismatch, initiating error recovery");
 			tcpm_set_state(port, ERROR_RECOVERY, 0);
-- 
2.20.1

