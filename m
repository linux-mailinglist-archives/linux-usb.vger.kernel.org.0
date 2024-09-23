Return-Path: <linux-usb+bounces-15335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EDF983A58
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 01:17:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95E69B22014
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 22:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C87E129E9C;
	Mon, 23 Sep 2024 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2WVRiLxD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B7128369
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 22:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727131269; cv=none; b=JcdJfZcJMQ8iCk8eraog+PE9ClH/1aKkOtDvfLFeTN0B9nIIrzJoWnpnC4Y9GlDB+VgcaEjbJ7D+PJtvktmlgKXX8fnozo5+3eHjhbcJ4D5Qh/IG9RON6Y0l/kOsgCgAx4gGvcA1AaZWEJfwsZeZFQa4ZfNkcgAM587jzeFY+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727131269; c=relaxed/simple;
	bh=PS4BLuuHTqRfAsc6UJdp59YR5Wc8DDeE0Qb1w74bDi0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Eh5Zt/qSMmy6Hy7UHvY3lSUsMn2AjEfF9n+NygC9RNmdb4v55Dh3TDplzgg3HzLZoZFH0EbUHyPys0BmNzM6khAjfcSOwh/VpRfKFmSeIxoxLHC4eMN2vC5yQkRcmFxA4BQvK8Zb1jMODMX6Rq/KqG53wRYPCa0TuZMltI5686g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2WVRiLxD; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e20937a68bso7664467b3.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 15:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727131267; x=1727736067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=h0CyW1JtJfwLGoAAX+BVVApeoMCB4q+lbs8zs4x8alI=;
        b=2WVRiLxDW2ERc+ddNqTsBvG2XSMSCOp5TlN4/UJSKY6zKgUTnkvhocH136rj/4Fkzg
         XRp59ODCK1kv1T/HiAatc4SG5Sp/cEd5hiIjom/NCSV/a+reUOdQEOg+ck3DYL7EGsYV
         Mu3wzyX5/9WY1aaSzkBmerkZ3z1q9/lzIdEStK/0BZYKLkzafLPn9WLzmqMkHpgPNKcm
         iZCnE1/gf7B3uI6Zyasxd5pcm3WmUe6XEKWM29mnYEH9gUTcmKJUICrDFrB/V949+emt
         iXPDIkVANU5C3QJ9FZyGa9/HtxxAIir9g9N5rfp+uJWPAivdlSOyFBcxL0EwV/jrH62r
         E1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727131267; x=1727736067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h0CyW1JtJfwLGoAAX+BVVApeoMCB4q+lbs8zs4x8alI=;
        b=nJBMkpTICUdhtCqyJ5Cnq7ZJNvvY8gkfaVdyvokoukt9Z1bv6F3agfvAOAv53/kd+6
         aZFK2wYBi5XWX+HCgaDoxDP5zqhp3G04cdK3nwrKTOzP6zqmTr3aEyOjyCtKtcYp/KrJ
         DNrGkQrD7ptcDKYvVUhIago8OTEtcMen1E/sfSUZAUIMXrmD5dGX4coaVfsaI9iagxrE
         VsXQ4TeHEEZ8QPzv1LsHG+9wyPnKQ+gI2X3zSDc3i/YsK3pSZ+Rf+Fd6exEfjMSsAxFV
         bF/VCdCyIw1kkKW7S5TRHOKlHJAGpps+E3kJoina5PHHDneHNob4Q8YzujG0AN1Yyekj
         Q4Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXi0avZnSItlyYaACtT9x7EhEp+w4LEpouspp1MusRQXOjbBi3RTyzX9alF9Htw3UGBCCzpOFX8XeY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxltN33wViLkcPGKYuJgDPqt8a2Ha3nSNf4408WnpmQvn7q3sEz
	uB6WwWT35SU0y96BxRukx+s3LEAHRxymaQFwZdReKs+1lnHiqpdNMKbn8gGVMshPZImVgvuIopT
	dDg==
X-Google-Smtp-Source: AGHT+IGSjLQWmP851y1eVS2/hu9bUHsBbO9LVlRM6GryOZeP6D1cgOZJreq/N+ptQftupMuqBX9oaKMKBFo=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:690c:6d01:b0:6dd:dcf5:28ad with SMTP id
 00721157ae682-6dfeea08a59mr2106147b3.0.1727131267372; Mon, 23 Sep 2024
 15:41:07 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:40:50 -0700
In-Reply-To: <20240923224059.3674414-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240923224059.3674414-1-amitsd@google.com>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240923224059.3674414-2-amitsd@google.com>
Subject: [RFC v3 1/2] dt-bindings: connector: Add properties to define time values
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
 .../bindings/connector/usb-connector.yaml     | 35 ++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index fb216ce68bb3..21a0c58c65cd 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -253,6 +253,36 @@ properties:
 
     additionalProperties: false
 
+  sink-wait-cap-time-ms:
+    description: Represents the max time in ms that USB Type-C port (in sink
+      role) should wait for the port partner (source role) to send source caps.
+      SinkWaitCap timer starts when port in sink role attaches to the source.
+      This timer will stop when sink receives PD source cap advertisement before
+      timeout in which case it'll move to capability negotiation stage. A
+      timeout leads to a hard reset message by the port.
+    minimum: 310
+    maximum: 620
+    default: 310
+
+  ps-source-off-time-ms:
+    description: Represents the max time in ms that a DRP in source role should
+      take to turn off power after the PsSourceOff timer starts. PsSourceOff
+      timer starts when a sink's PHY layer receives EOP of the GoodCRC message
+      (corresponding to an Accept message sent in response to a PR_Swap or a
+      FR_Swap request). This timer stops when last bit of GoodCRC EOP
+      corresponding to the received PS_RDY message is transmitted by the PHY
+      layer. A timeout shall lead to error recovery in the type-c port.
+    minimum: 750
+    maximum: 920
+    default: 920
+
+  cc-debounce-time-ms:
+    description: Represents the max time in ms that a port shall wait to
+      determine if it's attached to a partner.
+    minimum: 100
+    maximum: 200
+    default: 200
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
@@ -380,7 +410,7 @@ examples:
     };
 
   # USB-C connector attached to a typec port controller(ptn5110), which has
-  # power delivery support and enables drp.
+  # power delivery support, explicitly defines time properties and enables drp.
   - |
     #include <dt-bindings/usb/pd.h>
     typec: ptn5110 {
@@ -393,6 +423,9 @@ examples:
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


