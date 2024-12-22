Return-Path: <linux-usb+bounces-18723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCC9FA550
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 11:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D822165AA0
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 10:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB77118A93C;
	Sun, 22 Dec 2024 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9II3Ugt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970A2F5A;
	Sun, 22 Dec 2024 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734864766; cv=none; b=R12kZSSSSy6a91c5K+LLucftoUqduzRH6L58s5aWKyfgnQPVO42U8Zdgy8OO2H0ixFg224MWQCeRB8qS5CZ10UYpwSaZYm6zgkeU5aBfKQQaFmfjX21ogbBoAj21ZJOXBOtpuCxsyo2XGzxXwnfSAi+IcwUQa4xWg5YqAvL6y1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734864766; c=relaxed/simple;
	bh=QZRx4v/jpx8vo0DMYA795CZV0upHfVydtVP/cyYIjXE=;
	h=From:To:Cc:Subject:Date:Message-Id; b=Nr5BJTHZI5U3yGoKBFbMVRLYvbqqqlGkq8ud+B2g/GGB6QcJJaGi8NRiJrJhyAc4GQLi/msaVOnMPmZMY+/1npiNsKQfLIEGqgHBeeFMcqaL4K859bEL0c6vSgD/ts5fpZafKkKe9ADF2w1AvggGBz7OOgyilYw559p0g6rDYTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9II3Ugt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21649a7bcdcso30395095ad.1;
        Sun, 22 Dec 2024 02:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734864764; x=1735469564; darn=vger.kernel.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vthXgYP4WwQA3x6xAS4WISKiv0WRm3MHf8XMiDkavAk=;
        b=m9II3UgtnkX6pFBBfGjfgkl5E68KcGsfpDwBWqATpk5VUn9P0+5eRgFMc5swi28W/s
         hStNvBtUhr7+Us8DQgiSskgilcivzQtJ0ikvHBDGyD7tbjbIoIoKd3+BIGPN59RG1arf
         LMIsoTT7VEKI6q1klb/lPcgx/qSAW8VGfwdoMYw3Lxo/hNRHaRNHs0kAAZ2k9n8OkUBl
         fZzmMN0KlbnBE4TsC241yI/nB7LFC2d7OTy4VL/bM/aeXtN8so9zJcfY4S8pNtl8ORb5
         EAG/KMq1/ByP/JU4IpiSAM/a9sokenbPGycltfCOZ0BqT/8VkLz18LboBKeOAAjPsvXr
         WU1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734864764; x=1735469564;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vthXgYP4WwQA3x6xAS4WISKiv0WRm3MHf8XMiDkavAk=;
        b=wvp7Mbm6Z/Vl4k9zZqzZYJ+8AUTUshGgIC/5+sXuBlX7+CJYUoOsAwECxBRUA18xWL
         sQA6iI+dv7dEkE5ydg4zh+Rv4UUVaSzF4ColU2kYaoRznANbWx12cRbwsMncHopfjYlo
         VTFcQo0eFzfCxlas6fUQKgd3Bg9kbBLtcAZHovTkMaciz42KC6R5zCUdIAcHvvNckc5C
         1unbpFUJP5diwXVN/bYU5dOLJb1+xtOhI1HeQN5I4iZyKYjkSvdDh/PN2vPQwPR/Qs4M
         PvF6r91I6MHX00TQqUyzm47D7QZDSyYz7p05Q7OjBn+gj9GqtAKcwc9CN4+ktzVdh7YQ
         hYkw==
X-Forwarded-Encrypted: i=1; AJvYcCUQNuE0/lZXsp2JAozWiCVS9QsRQ3n7Xg5nyhGyCgZJKNathTGolDZaSUg22YaGuijqb4cLPBr7ylyb@vger.kernel.org, AJvYcCVLhWbT8ODUCG565ht6ccFqkSLb2Mp+1xvZcaYiuIg6Vw1OPhsDTO26ES50hPSLGY7Gmj5Ped+Br+Hh@vger.kernel.org, AJvYcCWs8cIiEhJXGOSK06TZ4hw1arwaSwkfI7qDKTfFNaJ+w4OkZ2r2Tk97UEad5CGQbn4q0W8BcSowgaZqg7m2@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ5MxXfB2rH24CimOAAxcYSlWcEHeB+5t7USNjOBblASqTZRaL
	cj4Qk6c8wDUyTkBL3fxTjC3ltN+k+qJwJk/mfbY9NPuRCXz83I7x
X-Gm-Gg: ASbGncvEnsfpMtiXRG5WqJbKP7nX7zHxPARcs2+WlVVVXkh5ss5TQGBisC9EGjCAx+f
	RfGFwARdHJFWBgcdsxB0ZULGcZNwd7dD1R+zzRaxpbarpVjER+34MJZZHwRPLc+yJsmACIwyWc7
	HtWT1nGc7uAC+fjR083rQOHcwWLCNOz3EKNYeaSL5jqAs4EgB1Tio52lPPRqN2dbA6xBzgcIUiC
	zpmKvATi7A9uIoajMr1RQoxU0XM/SYw2N67YTUFzOFhPTlSHrZ8V5XSCgdS9JdB
X-Google-Smtp-Source: AGHT+IGetBkB9lqtfB+rvkpDktCBPtGEOstBzXi6g4XZj/3cVQ6wNgBsNwHyFn/+RZA6onBukM/KPA==
X-Received: by 2002:a17:902:d488:b0:216:2426:767b with SMTP id d9443c01a7336-219e6e89ba9mr102242995ad.10.1734864763962;
        Sun, 22 Dec 2024 02:52:43 -0800 (PST)
Received: from localhost ([36.40.178.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d9468sm54276805ad.120.2024.12.22.02.52.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Dec 2024 02:52:43 -0800 (PST)
From: joswang <joswang1221@gmail.com>
To: heikki.krogerus@linux.intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	rdbabiera@google.com,
	Jos Wang <joswang@lenovo.com>
Subject: [PATCH v2, 1/2] dt-bindings: connector: Add time property for sender response
Date: Sun, 22 Dec 2024 18:52:38 +0800
Message-Id: <20241222105239.2618-1-joswang1221@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Jos Wang <joswang@lenovo.com>

Add "pd2-sender-response-time-ms" and "pd3-sender-response-time-ms"
DT attributes to better solve the following test items in the usb
pd compliance test:
  TEST.PD.PROT.SRC3.2 SenderResponseTimer Timeout
  TEST.PD.PROT.SNK.6 SenderResponseTimer Timeout

This is to enable setting of platform/board specific timer values as
these timers have a range of acceptable values.

[1] https://usb.org/document-library/
    usb-power-delivery-compliance-test-specification-0/USB_PD3_CTS_Q4_2024_OR.zip

Signed-off-by: Jos Wang <joswang@lenovo.com>
---
v1 -> v2:
- modify the commit message
- patch 1/2 and patch 2/2 are placed in the same thread

 .../bindings/connector/usb-connector.yaml     | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
index 67700440e23b..83be66f6d406 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
@@ -293,6 +293,26 @@ properties:
       PD negotiation till BC1.2 detection completes.
     default: 0
 
+  pd2-sender-response-time-ms:
+    description: Represents the PD20 max time in ms that port started from
+      the time the last bit of the GoodCRC Message EOP has been received by
+      the Physical Layer, it shall be stopped when the last bit of the expected
+      response Message EOP has been received by the Physical Layer. A timeout
+      leads to a hard reset message by the port.
+    minimum: 24
+    maximum: 30
+    default: 27
+
+  pd3-sender-response-time-ms:
+    description: Represents the PD30 max time in ms that port started from
+      the time the last bit of the GoodCRC Message EOP has been received by
+      the Physical Layer, it shall be stopped when the last bit of the expected
+      response Message EOP has been received by the Physical Layer. A timeout
+      leads to a hard reset message by the port.
+    minimum: 27
+    maximum: 33
+    default: 30
+
 dependencies:
   sink-vdos-v1: [ sink-vdos ]
   sink-vdos: [ sink-vdos-v1 ]
-- 
2.17.1


