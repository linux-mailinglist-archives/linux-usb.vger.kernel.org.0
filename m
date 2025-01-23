Return-Path: <linux-usb+bounces-19676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D64F4A1A6CE
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64B4F3ACF8D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637E8212B36;
	Thu, 23 Jan 2025 15:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUc2vaJD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4331CA8D;
	Thu, 23 Jan 2025 15:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645223; cv=none; b=BiGlhgzn6PXd+cSeN2gwRKUwTrW53Sd9YHHcl6VyIvvoOdrXD04qJJACPk4oyy/KxvO931JXtHTsEUyMhGxIRIPl2z8OO7QK0OZy3xXHyylYwkYjYEWLlKnbYcUq7nnungl2RGiHj8W1CZF92lgmoA2PHJc1VYj7JcVFTP/koZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645223; c=relaxed/simple;
	bh=h4+xaooxaxjRqSciOtadqssYvHCct2D694sR51OqvuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOzJ+9B1jfI2g/mgBa9zNutxKRRoDxdAaV0frfDtatELtMaZZmktb4F9X6DHXKjDY2uRuM+Vo10MDulh3j7gPWj9JkS5Y6V9JANQddsimx9hUAG74o1HrZIDTdYJi6or4IK4Gmeu50aq+LqspwIAz7k+DTpmcstbvA0crPmmFJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUc2vaJD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso1650029a91.1;
        Thu, 23 Jan 2025 07:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737645221; x=1738250021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nu4we65NmOndciVnU+FPkkmO2E7Vpo7sdpXL4vq0qLs=;
        b=OUc2vaJDCGvyt827f/cqmK5fW/1MzI5yJDnSqTw+viesaZWw8GuSy7KxX+EhSzlpUE
         mRQIZHKG8mbn4cQQCLWH1rGkA9VfTgyBCnp7g2OBOYOappNlgH+X43nzQJjQOGOe0ljp
         Qfmadm28g5N157NQuHUj+1tpbjk9JdJ4oYPtJSFG4GP4j468627MuNTOqFEvupitdgUH
         eD8uRRezz0L2PKkRGpEYgDLZUhU7t4GL4nuDKHAJG/WnbZ/+DMl2fivgRPDi/L2Q4DVu
         Y01df/088ZO9yOndPCakwuBPg3UwYakgiP6NUkPOitVdyTG2MCL5ngcRjLdNXUP+9OC9
         KUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737645221; x=1738250021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nu4we65NmOndciVnU+FPkkmO2E7Vpo7sdpXL4vq0qLs=;
        b=nXOzcpBK0mn9wY93deqXTmPopQr+7Du3z/ZQ+lpa+Y28uBQuasmfvgmvxMZwhZgE9O
         GqOiJ3awK60qxhTMK1grCQXOII+tpbkqysF9FEtVu01oa8y9QuV9vY7VwjijFIJ+wwlb
         FW1Vcx/tWOebP0FrW1TMzQIo+6kzIlEXKS3qeXDzMv3DIlcvee29q5ryS4Ds8h71ivMa
         Mn8O6FebEJt8HbaM8/sFTKT9MYvfpvNPdgDBBVWAD2hN+TpNt1ny2Y3yGjYL/bIyPhcT
         OMEqZm4AB9/MfUPZ0aQzZbFfGTn/IxDk+mwJoUpr54zQ7XJXFx2KBm4sptK3jKTLgi3L
         QwPA==
X-Forwarded-Encrypted: i=1; AJvYcCVGdA2FkqDoIzvdOs3aZdAbWAgt22+PDtYL5Eb7QVr2xaCmqrA3hUQyyQ1/6e6j/QNkf2aZ9RwVc56Rj90=@vger.kernel.org, AJvYcCVrdTQqrgJV+bfeWAJ7v92MJFbIXQw/byf59Z0tRSU16dwKqDlL5etiIBW5E4Oc+WxaoZc27lGRlxqe@vger.kernel.org
X-Gm-Message-State: AOJu0YwkhZXVsm1+tzhlBm8aGHC6A+odregjYvo5ukS7rSVcYrUvKh3P
	L2RhwKYlroxH+eMYxq56j08zg3FTQ+0IVwU9PMhbwlCZ+J2UWOuNu3OFeDf1
X-Gm-Gg: ASbGnctlEiXKwkI+C8BGL0QrCEZOxvsCrCcWl6nE7SlVTdFbBQWp+kKPNzsJM+wxKzH
	27HI0UJVfkx5Mm1XOo/+Naj6TdIzCbKp0CTSMu8FLlM3IrR7sx2+Wp/IYp8ihJj6VhWXeCqjfKn
	3ks0g4nYE/333kZ2+jl5bkxyzqrHnJE5Raa6139smUyCJrlWXKnZ8VPtbO0ZpPhDSvIsfRCi+Ry
	xqcb/mAA02VsnMBUnLMsdQWBEZR80lE2P7rp+DFyaxInnrNvqodf88UPd1Oa/zxrGF4cXRJzzHL
	4VVxxYeJcjXIIDA48SipcjW0FXS3dQ==
X-Google-Smtp-Source: AGHT+IE4GVf/2X6V8T65QGGxS5GQOsdp3mNIyLBGdx7ouENl+vk+CColvi79OPblupyDfNNjNR+gZA==
X-Received: by 2002:a17:90b:2ec6:b0:2f7:b54d:76cf with SMTP id 98e67ed59e1d1-2f7b54d786emr34441981a91.0.1737645220594;
        Thu, 23 Jan 2025 07:13:40 -0800 (PST)
Received: from archlinux.plaksha.edu.in ([182.75.25.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7fe973814sm157a91.41.2025.01.23.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 07:13:40 -0800 (PST)
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH v2] usb: dwc3: Fix documentation warning for sg member
Date: Thu, 23 Jan 2025 20:43:35 +0530
Message-ID: <20250123151335.15878-1-usmanakinyemi202@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
References: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'sg' member in struct dwc3_request was undocumented, causing a
documentation warning when building the kernel docs.

This patch adds a description for the 'sg' field, resolving the warning.

Fixes: 61440628a4ff ("usb: dwc3: gadget: Cleanup SG handling")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Usman Akinyemi <usmanakinyemi202@gmail.com>
---
 drivers/usb/dwc3/core.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index ee73789326bc..0c417a12e6f4 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -941,6 +941,7 @@ struct dwc3_hwparams {
  * @request: struct usb_request to be transferred
  * @list: a list_head used for request queueing
  * @dep: struct dwc3_ep owning this request
+ * @sg: pointer to a scatterlist for DMA operations
  * @start_sg: pointer to the sg which should be queued next
  * @num_pending_sgs: counter to pending sgs
  * @remaining: amount of data remaining
-- 
2.48.0


