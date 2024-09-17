Return-Path: <linux-usb+bounces-15193-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EB597B42D
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 20:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 909171F253B9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 18:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29395188A0A;
	Tue, 17 Sep 2024 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckecjPLL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BD52F88
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726598877; cv=none; b=YOAEE+7CTY1li7ZD9pY70TKjWvSS4JaZHryhl9QHhOG47qgyl6yCmdIJumgVTT9bUo6r+rBCy5U4MkyXstNKupyPh4yPsxk+Kp602Mx9e62kjAti6aPIiZdVLFDCxMrMVDKj3NZwFEoNupY/xFpGeqq5OEXiSO/x50VBNFljx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726598877; c=relaxed/simple;
	bh=QOzOOjPJeD54AuUBs7CS6+qKMdbmaBKL5CTDWWYX3BE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=dA8T8rrEKcGdC5eS4ovb94Ui79sjq4Xgd4E9VTdcWE9fNo+C2AgLy9iWGV/K0PAJYMVFnUVjjDT4mpDsOMnhDlv/x7JvIAjHtsTkZ9eIl/kZs87/W0Ei7ag7I043Ka18oNuL9G+jKXgvkeQuJmTwmqdvSAAHl5cxmjwXHludMI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckecjPLL; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5012813249cso1480520e0c.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 11:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726598875; x=1727203675; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xRkMsXiXIGwTJfV0j3Q1AzA3zOB0u22ZXrZIPSmvQlc=;
        b=ckecjPLLdtfWPNd8ZcJOZczJR8uiWxpf44CjG07RT97Tg5AZ8iGmt688skvVrDnrFy
         47AY/+VVn9nS6LakA58Wr/cjZ0n7V6uGwJnWSfiWDNg+0V3Qf2Y7PnPiCpRTelycemmV
         VvHAkl8os/AwNXU0vgfcZtvATH1XZRHtXaAPHFujqiT3skUpB/GL7NDy1T1xoBb38Saf
         M9mbWQQHzL0MQOlFxKXS1OQdjnqCCrk6yg8T3R4o4DXns+9YFCw1w3V/U4DnPXYBrR2m
         HHfe49CGKtDoQ3HDLE4jKDJHOCoumWE1O065F4CazF6Y4ElstIBHDViHk3c2vcnF58w4
         Q+2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726598875; x=1727203675;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xRkMsXiXIGwTJfV0j3Q1AzA3zOB0u22ZXrZIPSmvQlc=;
        b=po8JxcP/fGyEJiedeJ8HZNzrEu7gP3ddYF3c2dqM0F5R8J91c4Q/IXVgLzWuQkZ3z0
         a2TNJqKnOGut451IKv+JA0/dQ+Ql7u7GbTi0ZQ4llQhj0K12D7OlQU5R7iCeEcp5xGq3
         lIbi0DNXpjQtXJLFXUW/SUgFSdsZeN3qS8RnJzM4dlHvyh3ErI9tEepeYXrKfCpbU3VY
         BiAvm3rJyxGS2txAML3By39+nltzv3mzhvFRd3xCCnsHicg+Kz2vP5oYpz6Gm1GwvPg1
         9YsccFTsDI4nGQN3uDRC00jzwBpXlqwfSnc924RidPIIzE4PdyX1cO5ubGLTXS1moxP1
         IizQ==
X-Gm-Message-State: AOJu0YyYA+ewUs284Uyyct2Lf/zp19JgJ4I/mddcw4K/aLFufPbylmCb
	P2Y31H4t6qELJU2oBLOXq1dZV2YLKhrT5PnXlTULd3ZgWWKAQhNNcJRxEi0UCVhrxBaE8vBuL23
	Bak+KMs5SmNLCnQU5fCXiOkAhF7m7ajRU
X-Google-Smtp-Source: AGHT+IGCZaaXIjsDpckTwgf/30VXmwFU57mHtsqD0uyiavh7ce798QDBqtAwOxLQ4aVIAdiFe3GYq1W1wjmBJMKrETE=
X-Received: by 2002:a05:6122:1d92:b0:4f6:a697:d380 with SMTP id
 71dfb90a1353d-5032d4bba77mr15097112e0c.10.1726598874986; Tue, 17 Sep 2024
 11:47:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
Date: Tue, 17 Sep 2024 20:47:43 +0200
Message-ID: <CAKHHu8rQTrTQM4Bsst-6wdUPxkuNP1bCc9Gq4WsLnwP5j4wkYg@mail.gmail.com>
Subject: PATCH: Fix problem with xhci resume from suspend
To: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"

I have a ASUS PN51 S mini pc that has two xhci devices. One from AMD,
and other from ASMEDIA. The one from ASMEDIA have problems when resume
from suspend, and keep broken until unplug the  power cord. I use this
kernel parameter: xhci-hcd.quirks=128 and then it works ok. I make a
path to reset only the ASMEDIA xhci.


Signed-off-by: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>

diff -ur linux-6.10.8/drivers/usb/host/xhci-pci.c
linux-6.10.8.new/drivers/usb/host/xhci-pci.c
--- linux-6.10.8/drivers/usb/host/xhci-pci.c 2024-09-04 13:30:16.000000000 +0200
+++ linux-6.10.8.new/drivers/usb/host/xhci-pci.c 2024-09-12
19:37:14.378870385 +0200
@@ -76,6 +76,7 @@
 #define PCI_DEVICE_ID_ASMEDIA_1042A_XHCI 0x1142
 #define PCI_DEVICE_ID_ASMEDIA_1142_XHCI 0x1242
 #define PCI_DEVICE_ID_ASMEDIA_2142_XHCI 0x2142
+#define PCI_DEVICE_ID_ASMEDIA_3042_XHCI 0x3042
 #define PCI_DEVICE_ID_ASMEDIA_3242_XHCI 0x3242

 static const char hcd_name[] = "xhci_hcd";
@@ -447,6 +448,10 @@
  pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
  xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;

+ if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
+ pdev->device == PCI_DEVICE_ID_ASMEDIA_3042_XHCI)
+ xhci->quirks |= XHCI_RESET_ON_RESUME;
+
  if (pdev->vendor == PCI_VENDOR_ID_TI && pdev->device == 0x8241)
  xhci->quirks |= XHCI_LIMIT_ENDPOINT_INTERVAL_7;

