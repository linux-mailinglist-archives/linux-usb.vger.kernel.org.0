Return-Path: <linux-usb+bounces-16977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1879BA3D1
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 04:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06E3D1F2172D
	for <lists+linux-usb@lfdr.de>; Sun,  3 Nov 2024 03:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE9D13CA81;
	Sun,  3 Nov 2024 03:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Fys2VPE6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2510F126F1E
	for <linux-usb@vger.kernel.org>; Sun,  3 Nov 2024 03:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730605608; cv=none; b=OVdXXthjEqpqKguVSKPc38A52d9nMpe4JElqL4x7nJMYnyGP68vWuY0t8eoXUvHhAhQUkLPDH9PDYxmO8zg9iYzFCQe22JS2DgUNSVQlfBJ9whPTLvbMLuT7ETxHi5zYQUhZGBakx+M7/asFdJnEHGsuhtTztGBNF9GEGxu+wR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730605608; c=relaxed/simple;
	bh=nodndSIWpNnYMRyxXjDdCYJsYRoIq1lmpYJn50Ochxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sOmsR22ziXJ6k2WOfMxxdyl7btcjKP0WTwqpzO3IQvv2LSavrhV6/N6y1ODS7JDiZmSf9MfoRS/8Qs7qbLNpc1hXSDDvqLAnEMmJjb8z8P6hTYTqEmSeCdYI+i1gJdz/VyQ7fx1Vthh8MI5kOdcws+InuIOF7w30GiDZZ9JKZQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Fys2VPE6; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--amitsd.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6ea8794f354so9462787b3.2
        for <linux-usb@vger.kernel.org>; Sat, 02 Nov 2024 20:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730605605; x=1731210405; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cz24K1evmI78I2+NJg1IxStwGuEObzk+Xurvv5EPuVo=;
        b=Fys2VPE6Qab9wzngasVwMLk09jChIOT2UO/L6vgTl4RKyJZRXTt8eoxlZ/34hx3ynC
         kXebfkVIS5pUR14qDhVLerPqjfZDyNJQpODwDFxnETM1bEBgiYzCHtuMO/wxl3vZ5YEP
         DxmMiEBH1gpioFksFuUDfZ3FTf3/+B8yOznMDZd0s8mmjvqPPq0MJr/PjsnxdacQOti3
         5l7O53YZMxCoxa5xPbvQEDcuuqzWWTXU/1z3RTzDR26NAkEUaNVUK+/fkxY9pE/+8+IK
         ELoMh2nMSQKtSjpHdEUDNoXUlvy+Z1D7+SVp576xHsJwuf9nOI3pvcFWYWAo7RxPrPu0
         cLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730605605; x=1731210405;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cz24K1evmI78I2+NJg1IxStwGuEObzk+Xurvv5EPuVo=;
        b=FIPZvIR8dOvvys0+y9QEU+f9yX8aqj6K2inDn/TUV2TV61llrjnido1TjQ6vc4ptF5
         1j6oAMnFLr76uDOtn2wGoiAengyiOWuD2kDAlpuru5O0UGf6XdPoSQpkLNz1PQaAJtQ0
         SHmA0QbPdw03FuZD7FPRI98gwqwT88IuBts16dnxvKy84Ct00G2R+P1pdqCtvwznmRI+
         rJImiHbXpKzfibvMZ4heGRSwgxzEoad2jMRYt3aR5/AAgo/HAYVTvRlpWJRx1nYQRPk9
         oTyt39/im1C4XDJ8nEhgerh+Vg2iqD78Uk+41va0BLF5hUkwLRhCy2eGTPM9EXtq+V7H
         kTOA==
X-Forwarded-Encrypted: i=1; AJvYcCUNxv3QJHWMdAc7lIhIbhfq59TvxEUSDgGW1mNozBELbIEHWG3WEEHxQsmze7IA3fSaqElFFF6JdD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZuFc/NHQ5/mHAjBT3/JjdQ8oJ/3IAEXOs1tGJWYzhpfCGz+q
	pvIKcTCR6m2DU5/0hwECe/UPk8t7eX7dR0B3StCQZh0VZfeOOMrrliMC1ceWhG5sOtjtYQf2Vy0
	jMg==
X-Google-Smtp-Source: AGHT+IE0WVlEdrG2GsvwLl5rNgi0hg5nY6f8ceJOB9AAUS82QrY7EXjnMk1ez03Plg1ISqeq7HIQNBHaDb8=
X-Received: from amitsd-gti.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:827])
 (user=amitsd job=sendgmr) by 2002:a05:690c:6f12:b0:6ea:8754:628a with SMTP id
 00721157ae682-6ea875466e4mr485267b3.5.1730605605204; Sat, 02 Nov 2024
 20:46:45 -0700 (PDT)
Date: Sat,  2 Nov 2024 20:43:29 -0700
In-Reply-To: <20241103034402.2460252-1-amitsd@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241103034402.2460252-1-amitsd@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Message-ID: <20241103034402.2460252-3-amitsd@google.com>
Subject: [PATCH v2 2/3] dt-bindings: usb: maxim,max33359: add usage of sink
 bc12 time property
From: Amit Sunil Dhamne <amitsd@google.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, heikki.krogerus@linux.intel.com
Cc: dmitry.baryshkov@linaro.org, kyletso@google.com, rdbabiera@google.com, 
	badhri@google.com, linux@roeck-us.net, xu.yang_2@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Add usage of "sink-bc12-completion-time-ms"  connector property to
max33359 controller for delaying PD negotiation till BC1.2 detection
completes. This overcomes the occasional delays observed while
receiving PD messages where BC1.2 detection runs in parallel.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


