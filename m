Return-Path: <linux-usb+bounces-15225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2841697C55D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D4FB1C21AA7
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 07:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0526719753F;
	Thu, 19 Sep 2024 07:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZgjVtwI0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89E4196C6C
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 07:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726732314; cv=none; b=VfSYU2jc/7VjU1k9EcDHH6JcYN6Tl6j/o7VhwhfduazwfQRAq8CrWtn4tKf2M6esMfMXnqNF/xIBxd/1ijHvhnRgYnjeUHU/sqTRH+UkF1QWpKbLibqISuyWZpGzL0r/JAdZhhc6mBfVRWy+uR7OYUoghZkZuaS5mNIKA1SIlDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726732314; c=relaxed/simple;
	bh=zZnseITWVWZj2AGJkDJn90KqZ2Yp82OoU2mAKYn4grY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P9dyZNcegXCsuK5W1Vd2of/47Y0UYe3ycsaBGMze1De86xRBi7alTIRMwg/vAhw4TxngTtBu3SRfi+OaEoXwAR44VmTZvfMovVKNgCxM9UaAmGFKuWJbEvVBAL620qfeE2SOLR/3B3aJUPJLJDHwNBBgfTxaGYBC+9fdRh28r3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZgjVtwI0; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e202bc54767so299079276.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 00:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726732312; x=1727337112; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xVjjERkvMrFJJbsLLMi62ReVgaN5cy3KLYRgp90y8Y=;
        b=ZgjVtwI0EY8ug6ZChGh0XLoPB32O2lT/hQU0cF7QJ8qmiftGU9Z6vP/v/B6H2v+ReT
         Hhlp6hKx2nCIDCnv9xeuKSrNzuY08MgDxSkEfcCV3qf/DALbCf4APbDWj2sg9e3VWtcI
         x2No37fgIef8oKbjcNTrJtr2YXKUTa/GddVe2L8i//w3o5WXT4OBeKCksj8scA14q1fw
         htvGmcA9HTv3bUT1PKkrRF06EeJ+SKkY2wVN2HjBuH6KNojLCU3sBiDHDG3fz0bhX6ZV
         OolkUL+fO7C4X4q6CCCvusdSyi3a4SeN7fhNfsF7W9t6CUuJRe7oPz+j/BNAZ9Nrm2FF
         MmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726732312; x=1727337112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xVjjERkvMrFJJbsLLMi62ReVgaN5cy3KLYRgp90y8Y=;
        b=iZslAwyWj0dm8JdEeaY2kUkuFsbc9FdmVJvg1KTsupMfiEPAoC11tN3O1wNKoUXYpg
         I3crZhkkc5TdJVJuHCdY0l371Dxxk8MyOSUfI3gLENP8L6dlleWJW+hpgM1nF5iElsTh
         ls/jUBuse+dVZvsvOJ9+CZtrGJeanrB3oqwjidY24prdRBjba9nevM5kRLXpeE91MG9A
         Zzr4ouQ/sfEXDcSsoXnGTp0Qq5aEczSc6/SFiE2CRcreLSr0ameBi1YbCaIpvNWmbOp7
         j7Kc54CE6uyk9CaXfqNHupRI5AmHPgxPEflEwMRN3nqMxvQSWBmv/PEVlobLjPkUO6z6
         fdhw==
X-Forwarded-Encrypted: i=1; AJvYcCXDTlz3YgX9EqcegHi7VSlL4lu0qFTW54lQyT4IkM4/e+E+CW14T3otJ+yeJ4G50e3t/T4XhX9Bx5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHpsiiSkU3xN06hJv08XxooCi0uVPYdo15rm4KXaabSjbzIW+D
	HF/63OTb42l9pqzUAeHWkfzv/pcgUimCs58ZPGpRlIScJH/HLOjwS1RdNRgjqKCI1z2rVWAVA9u
	6oA==
X-Google-Smtp-Source: AGHT+IGtkVUkfKsnL4jMkEz9zcuTeZE6Z2PZjQaP0YIqrH0doOWs08x0ygkJI/pVex3ZiVLgLSq++5r+V3o=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:7a04:0:b0:e0e:89e6:aad4 with SMTP id
 3f1490d57ef6-e1d9dabc469mr58339276.0.1726732311959; Thu, 19 Sep 2024 00:51:51
 -0700 (PDT)
Date: Thu, 19 Sep 2024 00:51:13 -0700
In-Reply-To: <20240919075120.328469-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240919075120.328469-1-amitsd@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240919075120.328469-2-amitsd@google.com>
Subject: [RFC v2 1/2] dt-bindings: connector: Add properties to define time values
From: Amit Sunil Dhamne <amitsd@google.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, dmitry.baryshkov@linaro.org, 
	heikki.krogerus@linux.intel.com
Cc: badhri@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

This commit adds the following properties:
  * sink-wait-cap-time-ms
  * ps-source-off-time-ms
  * cc-debounce-time-ms

This is to enable setting of platform/board specific timer values as
these timers have a range of acceptable values.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
---
 .../bindings/connector/usb-connector.yaml     | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index fb216ce68bb3..5efa4ea3c41c 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -253,6 +253,33 @@ properties:
 
     additionalProperties: false
 
+  sink-wait-cap-time-ms:
+    description: Represents the max time in ms that USB Type-C port (in sink
+      role) should wait for the port partner (source role) to send source caps.
+      SinkWaitCap timer starts when port in sink role attaches to the source.
+      This timer will stop when sink receives PD source cap advertisement before
+      timeout in which case it'll move to capability negotiation stage. A
+      timeout leads to a hard reset message by the port. If no value is set for
+      this property then the driver assumes a default value of PD_T_SINK_WAIT_CAP
+      (defined in include/linux/usb/pd.h).
+
+  ps-source-off-time-ms:
+    description: Represents the max time in ms that a DRP in source role should
+      take to turn off power after the PsSourceOff timer starts. PsSourceOff
+      timer starts when a sink's PHY layer receives EOP of the GoodCRC message
+      (corresponding to an Accept message sent in response to a PR_Swap or a
+      FR_Swap request). This timer stops when last bit of GoodCRC EOP
+      corresponding to the received PS_RDY message is transmitted by the PHY
+      layer. A timeout shall lead to error recovery in the type-c port. If no
+      value is set for this property then the driver assumes a default value of
+      PD_T_PS_SOURCE_OFF (defined in include/linux/usb/pd.h).
+
+  cc-debounce-time-ms:
+    description: Represents the max time in ms that a port shall wait to
+      determine if it's attached to a partner. If no value is set for this
+      property then the driver assumes a default value of PD_T_CC_DEBOUNCE
+      (defined in include/linux/usb/pd.h).
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -380,7 +407,7 @@ examples:
     };
 
   # USB-C connector attached to a typec port controller(ptn5110), which has
-  # power delivery support and enables drp.
+  # power delivery support, explicitly defines time properties and enables drp.
   - |
     #include <dt-bindings/usb/pd.h>
     typec: ptn5110 {
@@ -393,6 +420,9 @@ examples:
             sink-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)
                          PDO_VAR(5000, 12000, 2000)>;
             op-sink-microwatt = <10000000>;
+            sink-wait-cap-time-ms = <465>;
+            ps-source-off-time-ms = <835>;
+            cc-debounce-time-ms = <101>;
         };
     };
 
-- 
2.46.0.792.g87dc391469-goog


