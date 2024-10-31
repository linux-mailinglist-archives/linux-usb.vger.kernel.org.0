Return-Path: <linux-usb+bounces-16927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD409B876F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 01:00:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29FD31C214E4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 00:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4FA1E5733;
	Fri,  1 Nov 2024 00:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mC0UdA0R"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B21A2745C
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 00:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730419216; cv=none; b=HPYCw5cO5A8L8nTFUFH285MLNyqDsC+z4Q7ZQSO5rWTlXLQl6efb2WJTYwVt5PeI/QuFAsH7zkcyLMvxDRgw+YMc/wvIHOu7uonBDWYIpkw062pfSI7ZTcw5x2AzRtFdv+lPjsPfVwWLxrO/tiOcDdj7I35gXD5cWxiXHgm+Hvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730419216; c=relaxed/simple;
	bh=A4bq0N4uNagV3ukMVWP0KMHLucV+wRSRyhiufTLh9OY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d0+RWICjTaqQ0N1jLC1F0BX90hO3av1rQkgbXAuTub2UbZGn+c4sVFMTszMCM1VATijDG6O7X9FkIVMI4VUSF3Igbed3tIX0Zkqnl/R3AqiWUVm1374+HTUdoj2zNTt72SX2tsGh9l9MpkeQZ1VTVnRmK/xrMgXEu2yTHnETMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mC0UdA0R; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e30df8dbfd4so3332750276.0
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 17:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730419209; x=1731024009; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bngmyXciCTbSjbg+6G3G0oMv+8YkE4Dj8JEhavO/K3I=;
        b=mC0UdA0Rk59J4YogjBUE4PfLnqf398/JrkcNthFriXtuJt1ozINivHlt0oUKigTpnF
         /u9ieQ5/R80p6uHobgW1J9QaCdtdXDMDrT86OaWXzuxD9mbsrl/K8m9+gD0e65VfU2Cv
         WaJmKpTYbwCJ7HvR/WH8TDQacBUxxO9VuFjdy52+s7RrTqvane+U62rmbcsbuzhqVPVW
         FgpyDtBCvqk/q9KOk9A+reYn3bLuFV7k38DWfnEnSrLD8CS075GPyqs0sitGeqHSbz8/
         hSo62dtllCqO4/YM/YOESxJfCan5sDW2jeUW6GgjhHlD/7a703SQHlGROLMBXjGRvgez
         gsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730419209; x=1731024009;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bngmyXciCTbSjbg+6G3G0oMv+8YkE4Dj8JEhavO/K3I=;
        b=cS21uoajAD9xtEbNI63/pCWI0BJ0vDpdPw09sZ33xSvSpgJT7ooRXZbiK7DRUfmf25
         23NM9hA3gZEVQ6gHi/9C66Sfg9pm9zIVxVz+auKaAx2F6NL7jAlX2ETeSdE2ODJ/23h3
         fYSZf2/nYv8UoUacL95NQP52Xa7hJbgecIc93fhqhQi2h0xo8QUfVpL1LVJ/yJdDOpZc
         3pMDkzu5qSSWCyDTqQudJDqM9/ZpxQeT/67uFsdDPpAzmRq1AsokunoVkpRM/6Tkadjm
         UUGl/nDPYVbXu1H2sAw/xue7BGUFYaV73nEYzlilQhCtjd2CG38hyFyg0BooOD+5VvYZ
         ncaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX95yF/1y5sGDLZXRzU7Z4In/EsuHGD7btDtsobdw8A54VvHo5Ykke+N96Cycg61VGTVwroRtxo5+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsDX0o+1PCI0vTHpZt2fCG9Dq5E7HqV59e2fPW5qwIjLXb4uMo
	l4qbW0p3h7WUdCXn2PM/+pdJXWw2+a4cFnzWfy9Q5wzza7D42aT0JzeKpgg6/uGwYftdmAmFOqn
	/4Q==
X-Google-Smtp-Source: AGHT+IHQfGP03Xo4Z1kmpAjYxnkeLA3AW7J7tuHBqRtNeq1/nshG4E/KrtXeW5RUm6duPvVgst5xbFme0YY=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a25:b321:0:b0:e30:d518:30f1 with SMTP id
 3f1490d57ef6-e3302522da1mr1359276.1.1730419209485; Thu, 31 Oct 2024 17:00:09
 -0700 (PDT)
Date: Thu, 31 Oct 2024 16:59:53 -0700
In-Reply-To: <20241031235957.1261244-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241031235957.1261244-1-amitsd@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241031235957.1261244-3-amitsd@google.com>
Subject: [PATCH v1 2/3] dt-bindings: usb: maxim,max33359.yaml: add usage of
 sink bc12 time property
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: dmitry.baryshkov@linaro.org, kyletso@google.com, rdbabiera@google.com, 
	badhri@google.com, linux@roeck-us.net, xu.yang_2@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
Content-Type: text/plain; charset="UTF-8"

Add usage of "sink-bc12-completion-time-ms"  connector property to
max33359 controller for delaying PD negotiation till BC1.2 detection
completes. This overcomes the occasional delays observed while
receiving PD messages where BC1.2 detection runs in parallel.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 Documentation/devicetree/bindings/usb/maxim,max33359.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
index 276bf7554215..20b62228371b 100644
--- a/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
+++ b/Documentation/devicetree/bindings/usb/maxim,max33359.yaml
@@ -69,6 +69,7 @@ examples:
                                        PDO_FIXED_DATA_SWAP |
                                        PDO_FIXED_DUAL_ROLE)
                                        PDO_FIXED(9000, 2000, 0)>;
+                sink-bc12-completion-time-ms = <500>;
             };
         };
     };
-- 
2.47.0.199.ga7371fff76-goog


