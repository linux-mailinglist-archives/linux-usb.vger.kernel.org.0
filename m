Return-Path: <linux-usb+bounces-19949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF30DA24C90
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 04:51:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 742ED164486
	for <lists+linux-usb@lfdr.de>; Sun,  2 Feb 2025 03:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E7070832;
	Sun,  2 Feb 2025 03:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O0FJ9g41"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D2B4F21D
	for <linux-usb@vger.kernel.org>; Sun,  2 Feb 2025 03:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738468269; cv=none; b=XFSBXso9fR6/PHEXhE8RO6GxXK+UOmAS1M8dCpK9779OaufZuNLRtYUdzKL/CwnHyLD+Oltep/x4fDEaLOVNS9qLL8VOsje9zAhzRSf6TJlT4JkmNpNVzdZpty1EOn61Tr9XQavYcglXZN7GEETV2m43uzYyYuMXwRIY5iQRL84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738468269; c=relaxed/simple;
	bh=PbYtkom+gUHlGGx+5lwLVcI6JHpDbOhVcKFC5fhJ7Ko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JYMRjqj1PxYBRHjvqBcQd3/JGDqmEzzHxYkmYw9SLTLeTJBVUJ808KLHRyZIkQp9vAEjWI2cVlbLJGhhHVuJhxl5F9kx3Ec7oetjRXdogo+umY8MbrmIUFDOjB0c+BmdbbdZU220PtxbIa2f1lrcd0okhCLBOg3sVko0yqZwFJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O0FJ9g41; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2efa74481fdso6528917a91.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Feb 2025 19:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738468267; x=1739073067; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGPnG/KaEKlAC+3m4DMkOr6QTvoaVn2cl6V4SfgkOEE=;
        b=O0FJ9g41UMHT8oGEwe3X1wiiRoaRXaRsfF6OT1RHO0wPhprYSg4jQBMTv4oW3BG2JO
         T85CaMCzYONSAA3AmyciOQDtd16grx/jOCZ9caxKJSbxtnh82ek7G8cfctWChC2FmTkx
         whn3eXm06mZ58cLRbBkRAgeJgQz1huqG/PV0wc0EsDK7wGDCWUcciyY17ijGyqrzyVQ8
         5QFu6NA/KoikvZtu//Ssc4Plk1RBj7ge7aSwdhrnOBTHmfFsDn/tlVqi7b026/TfbjQL
         yhOlXo7APZEix83AGkpuzVgX4ijRLpZqThXlQdBZITO3n3smDS0zVXKPzDZIQXbw8mQz
         FuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738468267; x=1739073067;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGPnG/KaEKlAC+3m4DMkOr6QTvoaVn2cl6V4SfgkOEE=;
        b=B8wgBpfv8UmIjzVzAQu1qeVJCG045Jy5MaW7N4qC6bNTkfH7HnNeuduUihhlknZKEW
         9bKt+qAiGbMs/eRjTlUP7ho4HrYSmZJnAf6WJbYgikrey2L6psRVBn7iaBtpQRb5zdjV
         3RM5r8Wi9nnXTzwCxcagvdARuwgRPlvfE1opiqYTK3K77k/nOujevHbBR0Eo0oF4tCli
         iV9ex8F8uFUnvLIO8GNgwokVfd5FOyAn4xjd4+Lkm3l6YazQoP/Yu6/bnut+NnXNCClJ
         DvIwLwxK56j3sYidw+jOhdhyePKC6S2GWy0s8LOPmClHt1zEu7X8UAzKtubqI8C735kL
         CheQ==
X-Gm-Message-State: AOJu0YwE6aOx9e+paN6K6WqiJRK0me5iqNRiF0HCJikgqVX+59WERo41
	W1DLiZSGVZ5i5AzhHOYlGTmEj3PSqTC56m8G1GRcEA0hlQ/cLhvMDL2plwmqKsOM4TPuKo4wzKJ
	q6Q==
X-Google-Smtp-Source: AGHT+IEDIyLl95Xc6h9Y3VLVPAJilJvXKmnIGcbZt/ClsnL8T/o4SlEvGEsvbwbDOYzS8l6z1Htv/m+Mu+8=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:2ef:a732:f48d])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2802:b0:2f7:ef57:c7df
 with SMTP id 98e67ed59e1d1-2f83abaf38bmr27062123a91.7.1738468265303; Sat, 01
 Feb 2025 19:51:05 -0800 (PST)
Date: Sun,  2 Feb 2025 03:51:00 +0000
In-Reply-To: <20250202035100.31235-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250202035100.31235-1-badhri@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250202035100.31235-2-badhri@google.com>
Subject: [PATCH v1 2/2] usb: dwc3: core: Obtain imod_interval from device tree
From: Badhri Jagan Sridharan <badhri@google.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org, 
	felipe.balbi@linux.intel.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, johnyoun@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, jameswei@google.com, 
	Badhri Jagan Sridharan <badhri@google.com>, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"

Although commit cf40b86b6ef6 ("usb: dwc3: Implement interrupt
moderation") adds support for interrupt moderation in device
mode, it does not add an option to enable interrupt moderation
unless the version of the controller is 3.00a where the
interrupt moderation is automatically enabled. This patch
reads the interrupt moderation interval counter value from
device tree so that the interrupt moderation can be enabled
through the device tree.

The explicit initialization to 0 can be avoided as the dwc3
struct is kzalloc'ed.

Cc: stable@kernel.org
Fixes: cf40b86b6ef6 ("usb: dwc3: Implement interrupt moderation")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/dwc3/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index dfa1b5fe48dc..be0d302bbab7 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -1818,6 +1818,9 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->dis_split_quirk = device_property_read_bool(dev,
 				"snps,dis-split-quirk");
 
+	device_property_read_u16(dev, "snps,device-mode-intrpt-mod-interval",
+				 &dwc->imod_interval);
+
 	dwc->lpm_nyet_threshold = lpm_nyet_threshold;
 	dwc->tx_de_emphasis = tx_de_emphasis;
 
@@ -1835,8 +1838,6 @@ static void dwc3_get_properties(struct dwc3 *dwc)
 	dwc->tx_thr_num_pkt_prd = tx_thr_num_pkt_prd;
 	dwc->tx_max_burst_prd = tx_max_burst_prd;
 
-	dwc->imod_interval = 0;
-
 	dwc->tx_fifo_resize_max_num = tx_fifo_resize_max_num;
 }
 
-- 
2.48.1.362.g079036d154-goog


