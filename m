Return-Path: <linux-usb+bounces-7722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B26876157
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 10:54:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF8D1F227A3
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 09:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C534C5477C;
	Fri,  8 Mar 2024 09:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CPrkyOPK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C8B54663
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709891671; cv=none; b=c9yfMuJbCqdfjFYi2Y2hVcBKbbtHkO6szXZ1a55s09ptclHmfPoD3Y0Govc4qUm/R98qDGW12M2Q75y1ALndrFGbzePQM/IE9AXNtoAeR0r6QvmRRYK4nvsaWvVTIy3eieJt4mLiIlJD6z9XuAe9gq6WShbr8TslL4FuXIRl7FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709891671; c=relaxed/simple;
	bh=2J7Nzqccs+PocVsE1rrOfFtZ8ba354puPJU+yD5FDSI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bX6f8PEVTMGNp4vtjzoZfXoeckR671QD0zpH0o8rtzqZ5LaD4+kGNfLEKCFfOOcByXPvpjk93ev4aecN6sYSCCvlYdYIJVXgfje/r3mSxl6BvvybqMJD6kbsMMiTdzlZARhfZoGvSUW2rPBw1/w4/r84qr4NmV0SWdV94aDNekM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CPrkyOPK; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--howardyen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a03635590so10033177b3.0
        for <linux-usb@vger.kernel.org>; Fri, 08 Mar 2024 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709891669; x=1710496469; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCte3zDfFDpzFxFJ3x2DLLBJKe5cc/Nrxxv7q0fm6Fk=;
        b=CPrkyOPKXcMGU/wQ2xTOk2h/isecBNXKy0lsvNRf2Crl6lsU/4ME4S5o3ti9EAUhGA
         jXkSnr1AKerY6VRw1M0/mZyTsX/QBNJqD2qn5tYF+CowBNar5kSV36FUmi6u0z+da7b2
         KsDm5m6erH6ffeU7yjqp2rxv/G8gy5vx8Nm+3fVvZwGzADcflwHJw6bReFM0/o1R3lls
         t4HntlZCIoh8U4nLz2RnPRCq56bh0KM+rYBsZ3X8lHiS7+NNtEvU23K45+e9CY632ETL
         TJEBEt3zV1nY3gfCXlzanzHY4Y05hQncPT85DPYe3M6oRi8hRNiBjq8aYiHnn+EQEAc5
         IbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709891669; x=1710496469;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DCte3zDfFDpzFxFJ3x2DLLBJKe5cc/Nrxxv7q0fm6Fk=;
        b=XxjBQTnXzBSW7KOpKstXzzHx9vC+RFP0LZHNhu9iuBE9NFHsauhtJ5CHbYbaBRWh9W
         WaZ406IgdkIhFlhfLkl14zROd+GncJ8B/BQfYNOuz3w3pu4v+VB7qJgv0+XXeQd6vNsX
         vY295wMalMKkhKXpfcNeiyDzaUfyZ83n8+a5L/B87lWzuO146Cn+iRjVKlbZ/AAqLPCk
         Qhqr/BV5KBQLB9sMHoyLOreQpaMDg/4t0DSlq+NYL2e/iDBBR31f7NYzKMstaduIsx6L
         36dNM9rSLKoAEweljBwJBHxaS/w3NXy1etULz7RilKZ50Hzn2/dOYgYMgeMkafC9thra
         vGZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRZgBcuO/b9n8y/4DOaWdEqxEq605oKK/nKkXnrowLD97r8lhabsM8iiXtOIi+vSDjqG3+cY9lcL+xNoAb4sCZyHk8fwGzUPUS
X-Gm-Message-State: AOJu0Yw06PdFGczN1gqQlQe5FytiNQc1nzh/TsW+wQ8T0k+HAyaWLGQb
	haR7Kjp5pzDBLgHfwVOnY9Dzj3guRjE6UULGouFqe4gAhDchAV7N2JqD4ytlZ36/iPTfxzIMdVo
	hutpGbaMbXel/Bg==
X-Google-Smtp-Source: AGHT+IHvpLjAs9VWFhYi5i6yfYYbG4bZhXBRHRVlH/JfJzYRNMcsMntGozCSfEkyWoEyyvObEjmG4PLuMEM4p2U=
X-Received: from howardyen2.c.googlers.com ([fda3:e722:ac3:cc00:3:22c1:c0a8:16f7])
 (user=howardyen job=sendgmr) by 2002:a05:6902:722:b0:dcd:875:4c40 with SMTP
 id l2-20020a056902072200b00dcd08754c40mr5533087ybt.10.1709891669006; Fri, 08
 Mar 2024 01:54:29 -0800 (PST)
Date: Fri,  8 Mar 2024 09:53:20 +0000
In-Reply-To: <20240308095320.1961469-1-howardyen@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240308095320.1961469-1-howardyen@google.com>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240308095320.1961469-3-howardyen@google.com>
Subject: [PATCH v4 2/2] usb: host: xhci-plat: add support for multi memory regions
From: Howard Yen <howardyen@google.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, mathias.nyman@intel.com, 
	hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	andriy.shevchenko@linux.intel.com, petr.tesarik.ext@huawei.com, 
	broonie@kernel.org, james@equiv.tech, james.clark@arm.com, 
	masahiroy@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	iommu@lists.linux.dev, Howard Yen <howardyen@google.com>
Content-Type: text/plain; charset="UTF-8"

The reason why it needs multiple regions is that in my system there is
an always-on subsystem which includes a small size memory, and several
functions need to run and occupy the memory from the small memory if
they need to run on the always-on subsystem. These functions must
allocate the memory from the small memory region, so that they can get
benefit from the always-on subsystem. So the small memory is split for
multiple functions which are satisfied with their generic use cases.
But in specific use cases, like USB3 devices which support the stream
trasnsfer or multiple devices connect to the host, they required more
memory than their pre-allocated memory region, so I tried to propose
this patch to give it the ability to get the memory from the other
larger memory to solve the issue.

Signed-off-by: Howard Yen <howardyen@google.com>
---
 drivers/usb/host/xhci-plat.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 3d071b875308..79e743aab62e 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -149,7 +149,7 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 	struct xhci_hcd		*xhci;
 	struct resource         *res;
 	struct usb_hcd		*hcd, *usb3_hcd;
-	int			ret;
+	int			i, count, ret;
 	int			irq;
 	struct xhci_plat_priv	*priv = NULL;
 	bool			of_match;
@@ -194,6 +194,20 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 
 	xhci->allow_single_roothub = 1;
 
+	count = of_property_count_elems_of_size(sysdev->of_node, "memory-region",
+						sizeof(u32));
+
+	for (i = 0; i < count; i++) {
+		ret = of_reserved_mem_device_init_by_idx(sysdev, sysdev->of_node, i);
+		if (ret) {
+			dev_err(sysdev, "Could not get reserved memory\n");
+			if (i > 0)
+				of_reserved_mem_device_release(sysdev);
+
+			return ret;
+		}
+	}
+
 	/*
 	 * Not all platforms have clks so it is not an error if the
 	 * clock do not exist.
@@ -431,6 +445,9 @@ void xhci_plat_remove(struct platform_device *dev)
 	clk_disable_unprepare(clk);
 	clk_disable_unprepare(reg_clk);
 	reset_control_assert(xhci->reset);
+
+	of_reserved_mem_device_release(hcd->self.sysdev);
+
 	usb_put_hcd(hcd);
 
 	pm_runtime_disable(&dev->dev);
-- 
2.44.0.278.ge034bb2e1d-goog


