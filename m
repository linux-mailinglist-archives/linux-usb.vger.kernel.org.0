Return-Path: <linux-usb+bounces-4917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9BF829B09
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 14:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD4501C2630B
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jan 2024 13:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA32A487A0;
	Wed, 10 Jan 2024 13:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sq56kbh0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB5348CC0
	for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 13:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e4d64a3d8so26205465e9.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jan 2024 05:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704892512; x=1705497312; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jTWNC40Y31yvT18BXFbiY6c1QGemF/0L1dosNKf/HjA=;
        b=sq56kbh0iP7/iKGJRELts6Lq+GH7y5Vh/Udo1XoU7l7p9CazPD2wzMyoBkDeiwWjyE
         A5GI6k8f+hbftFZI5y/PJLS4KPbmIz7WAJlNJXIsH9KLT1QmWDJQflIPK+YhNvWZTnYj
         V+ti91CSJHg6Zvv6Y9RFQI8XzO5YCmaZsUuKzeri7pq8nIOXj5cUauPkrB/ubDfONbqr
         yENPUmQWglOmYLvtmcQLEEQSQVQwOZby4hxMe+KCtfFoXLLNG/WpHhedOeM3tff92WUK
         u77CIa5UEkkA9zPwpbF1e57tXzhNbtHNEODgFngkX46dc+ugGDjP1eLWqI0soJOzCQuR
         a8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704892512; x=1705497312;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jTWNC40Y31yvT18BXFbiY6c1QGemF/0L1dosNKf/HjA=;
        b=Kp7WbbwSXCPPHuCKSnu84MbWsQgqD9KLWhYY+uPSfrLW1Pmmy7ueE5sx7qsUdEfdki
         es5zAFeeRC1YUbXaHXYqiqGYvTgmMUE9zGsnCUuOrTh1Sdq+aWJbSRFRa2DUobUl6in0
         jND6o64BYRAZ8rWqy9alzBxR2E01PDvJPM+WCYQFk6rg4/Y69AvN+jHbHMTndnCWPuQB
         5drpyUh955+DZHw+vDHaCvzv2iGhYbDVPDev2S8Zxs92Fq/GpM2Hy4Pii/ZXH1ggUBHW
         P+c3k5epuQzleit12FLBY8IvJk2uhfcoOKmZvtJFKN703e9y3hB7skLBzrSsWeWubbTK
         FS9Q==
X-Gm-Message-State: AOJu0YwqMGb6wM7xbAzwibh/hztFdfcO/bRTS+P24L9gLTAGeBHisch8
	cL2XtoDHZ25P50PLhNRT5sfRRU+xUoe7uQ==
X-Google-Smtp-Source: AGHT+IGa9nim5AXEumjMFpRCAoUUSRuPER0PPQS9Ghe3PCLuZxHmGa+/El5TemxVE7unxkB8peh3cA==
X-Received: by 2002:a05:600c:1d88:b0:40d:8a53:5a66 with SMTP id p8-20020a05600c1d8800b0040d8a535a66mr555530wms.68.1704892512496;
        Wed, 10 Jan 2024 05:15:12 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b0040e48abec33sm2176218wmq.45.2024.01.10.05.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 05:15:11 -0800 (PST)
Date: Wed, 10 Jan 2024 16:15:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: [bug report] xhci: add support to allocate several interrupters
Message-ID: <e9771296-586d-456a-ac24-a82de79bb2e6@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Mathias Nyman,

The patch c99b38c41234: "xhci: add support to allocate several
interrupters" from Jan 2, 2024 (linux-next), leads to the following
Smatch static checker warning:

	drivers/usb/host/xhci-mem.c:2331 xhci_add_interrupter()
	warn: array off by one? 'xhci->interrupters[intr_num]'

drivers/usb/host/xhci-mem.c
    2318 static int
    2319 xhci_add_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir,
    2320                      unsigned int intr_num)
    2321 {
    2322         u64 erst_base;
    2323         u32 erst_size;
    2324 
    2325         if (intr_num > xhci->max_interrupters) {
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This check predates your commit.


    2326                 xhci_warn(xhci, "Can't add interrupter %d, max interrupters %d\n",
    2327                           intr_num, xhci->max_interrupters);
    2328                 return -EINVAL;
    2329         }
    2330 
--> 2331         if (xhci->interrupters[intr_num]) {
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
But, yeah, it's an off by one.  This is allocated in xhci_mem_init().


    2332                 xhci_warn(xhci, "Interrupter %d\n already set up", intr_num);
    2333                 return -EINVAL;
    2334         }
    2335 
    2336         xhci->interrupters[intr_num] = ir;
    2337         ir->intr_num = intr_num;
    2338         ir->ir_set = &xhci->run_regs->ir_set[intr_num];

However, potentially there was already a bug here?  Normally "max" type
names are inclusive and "number" or "count" type names are the count.
So maybe > xhci->max_interrupters was correct and we should allocated 1
more element.  But the code is kind of mixed with regards to whether
it's a max or a count and I can't be sure one way or the other.

    2339 
    2340         /* set ERST count with the number of entries in the segment table */
    2341         erst_size = readl(&ir->ir_set->erst_size);
    2342         erst_size &= ERST_SIZE_MASK;
    2343         erst_size |= ir->event_ring->num_segs;
    2344         writel(erst_size, &ir->ir_set->erst_size);
    2345 
    2346         erst_base = xhci_read_64(xhci, &ir->ir_set->erst_base);
    2347         erst_base &= ERST_BASE_RSVDP;
    2348         erst_base |= ir->erst.erst_dma_addr & ~ERST_BASE_RSVDP;
    2349         xhci_write_64(xhci, erst_base, &ir->ir_set->erst_base);
    2350 
    2351         /* Set the event ring dequeue address of this interrupter */
    2352         xhci_set_hc_event_deq(xhci, ir);
    2353 
    2354         return 0;
    2355 }

regards,
dan carpenter

