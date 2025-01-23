Return-Path: <linux-usb+bounces-19652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3878A19F7F
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 09:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59B63AF351
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 08:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAFB20B210;
	Thu, 23 Jan 2025 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcOasCt1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3D412CDAE;
	Thu, 23 Jan 2025 08:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619269; cv=none; b=fcRCDqpZJhM/TkuSH9onjNZDDKV8cw1BQ19A0h/1jNPb7Oyq7q2DbitGG8141qc18HIMABQULZIvDMNEsLelLccJOsZArovLMjgltOYjKNTfHKa8bu8tUtiZarcnXd2/GhLmH1AJECZ4xlJE1YatBQhh4rkmwbBAgkW5GThd2Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619269; c=relaxed/simple;
	bh=dzXR6sHZfT6D58dHtCWjftkwAOuwZMXbb4rOzw7pLYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rso+B1fwgBPNxT50C6Tirf5VtNhd7PHtFdx717yS7dRotPe4Mz1zBiq0eieb0u9YMIqaYD+4r9AzkKG5qQmxusvg+kFE2Ii/ZtjcCsNU6fn5mqGUDyZdxBJj9/iwpVW8lsgoHze5GqtslkefwXXK/Q+STKCnQaoObpxxYyMrowg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcOasCt1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2166f1e589cso13717455ad.3;
        Thu, 23 Jan 2025 00:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737619268; x=1738224068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2i4xeAuV4/GQ5Fvf9EPTeiT/S+01JsInLwTJogo5J40=;
        b=TcOasCt1LoFwQFtMEOo5ZGw9TPOA+vvnWrmDnZH9QLEJSkUjEjeUVIw3JhsfJiAzlR
         iXKrBRq+7Gph9/aPC/Or2ck1wTo2AxicblfpsdsmXCJnKwU05PSLFBXbDJ6dmP1+j4TO
         9/LBlqSUBdTvfAGSoHDc+Aefj+sgoQuU2KlQStQwWn54SWdCTpjhzHvv2C3IWhInGs2W
         UThLlpprlqEzG8ty1CnC96ozYFzoSis/EGlmJOnFVZb806C+EOtmuRjJyJt8MjfSaHEl
         QNFcAwfXu2iCwCYxmhN49IeSvhf7Fy4yzVWeMPEFztHygXGOzZuAiw91ZXrVxUBpwbD1
         iCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737619268; x=1738224068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i4xeAuV4/GQ5Fvf9EPTeiT/S+01JsInLwTJogo5J40=;
        b=JNO6p6T6oJkM7rvd+CFTVPU4vXieAaweUoidmgw5niiMICfrZI3XZ0iVJer/84cY4i
         LsA+hwKo7B4OKUQ8yYF+yHof4zeDSQ/BcbG70BVfDtzeQh/yP5BKF585DPy7ZwFJJ/gY
         q/MVn/7RVqLc0R7bd0e9e2dFvIiXdKL1LYdxbE6N+b09lCE0syz+aRCX7VGC42R4+3jh
         gxmUnlNmWfBeyvdecENuvjTgg2PXcnuwHme1ABPzS1BhlNGz9BTZemUu9MdXLCPu9uLp
         gOrMbE4lPJhawD3DiU4ngtO4gSxLlWN/uUCiULy/2F9X3+p4l9zOzltZw7zyp49VG38j
         FXgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGMctFb6vP6bLt/fSO/+03xvdiNCgMVfffRLgJHG+pWGLKeR2AbpLmjUViuV2WNeAmbii7c1SZyYHQ+fs=@vger.kernel.org, AJvYcCVTtnhhYTFcELtPxE47hhJxlxECcfXTamPOTNyizosih8HUrJoSGhOOfNEfPuxJleyltPM8e+Alzu4k@vger.kernel.org
X-Gm-Message-State: AOJu0YxkuS3Euf8+XryFyswOguLgi3SkIEkihDtOHchhIukkp4bvqWsQ
	sujUIggL3D35R6Gqn81Mly8wJqOXzkxgitD8MVg/JtIASEWyoxCPdsIVkZQ/
X-Gm-Gg: ASbGncv3fRmq7+V7QhuPA/Bg1u5B8FRc3uvMPmpjeMUTy51fJXrgXDtW04HsGV86hMh
	hnZbWAyDXoglF7atvZzr+si1AY1a4E5GtE4NmeA5D0LHQom0kYXVcRaE/chYVXOZTxDCVtLQnlT
	m602kE+/KPDZ/JoVNnBUbcDrFUzy/laywDqYNyPqHdRAw0NMSIXi4pbpTE1s/XK4uaF9XLDnrNF
	rwPff4LC2j8XB0/qPupC+dX7ZSccjn0+p983E25vmpC1UJUOV0nnLfUPz9zilGGIgPxcHlv5Bo4
	kKIlnFK+sikAPvd9BUU1opg+6yeyyg==
X-Google-Smtp-Source: AGHT+IGLADfp4nxH9fNXg4OVe+eas4HyLTJtnd56Zm0PB09UDmwPXueViKkO+E4L9+LYkwiZ0KgJSg==
X-Received: by 2002:a05:6a20:e615:b0:1eb:3623:59fd with SMTP id adf61e73a8af0-1eb36235ae1mr30207573637.4.1737619267732;
        Thu, 23 Jan 2025 00:01:07 -0800 (PST)
Received: from archlinux.plaksha.edu.in ([182.75.25.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcc32027dsm11999372a12.21.2025.01.23.00.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:01:07 -0800 (PST)
From: Usman Akinyemi <usmanakinyemi202@gmail.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: dwc3: Fix documentation warning for sg member
Date: Thu, 23 Jan 2025 13:31:02 +0530
Message-ID: <20250123080102.1632517-1-usmanakinyemi202@gmail.com>
X-Mailer: git-send-email 2.48.0
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


