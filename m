Return-Path: <linux-usb+bounces-21491-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AEA561FA
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 08:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839321759A6
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 07:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C25521AA1EC;
	Fri,  7 Mar 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g0JScyGF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1B21A83FB
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 07:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741333425; cv=none; b=V1dhuvCqwsg9JbOlG9/oOG5FJ9+nG3cjVyKdnWXfJAQvJcQacyCHezqnOmcssv3vOLqsIcvXlEBvneYsVP1CcIqqk5ywqhSH3GczmP9WV583wcDAKg4HihVFa30FRona9Dg4TOfzt5kJZmDj6KsuH03wR0+bhfLICVf8ksj2I6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741333425; c=relaxed/simple;
	bh=q9EjPrsiTkSrrCSkftDQ0XVhghk2mMj/z1pgIRJ8EFs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=IML1NJ+NI3C775TR5o0cMMuuqia4V5Tgfl7vS95fWd/9INihm1lBgBIb9cDDbLbBEnvvFwwQQoeDG16bqyTrsoxVBmmN5QHPG9N1ggcATdBLPV+zAMl4GPuw4wQ93JnCmVo1h8jJaaT7P/9eeNA9QD2h3itx+1kF8mhCE62nsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g0JScyGF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bc38bb6baso8881125e9.3
        for <linux-usb@vger.kernel.org>; Thu, 06 Mar 2025 23:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741333421; x=1741938221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FAiX7ZoQFnaQDtZJKG3FPxlAfD7LyYqjF8yJgV4SPk0=;
        b=g0JScyGF9mMil1ppIe/JeBw8imJ/Ed0YLcAaY4pRPPKUMkBsKRLiPldb9cNhlGHqu6
         oiwlHR07riEFSnxIcQS6Gw+NMthFczQCob1cbDKkYPx60wL0YeSa8kyx0/Yr/U11LnW+
         Ti4ZMTnSN3ahKW91ml4+XRtOIDdMK2CV9E5DvMhoQVeMbmSmy56N68DM4YN/tz9DfUEX
         3IxWCL39drwPshP/D5tOV+MA0m63otp1ART6Itx7YHa2hkitJmDi7hftSnc+Sk1GvssM
         lTz2YbLAd6r6cYV8aowoX4Zuzu4V34FTrX2zlCFhcvmspxWVnjdWozxqB0a3N3nvMJf4
         O7rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741333421; x=1741938221;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAiX7ZoQFnaQDtZJKG3FPxlAfD7LyYqjF8yJgV4SPk0=;
        b=OHxvJTEEH5TiwD9niOH0NwpcHZedbJ9YEy4JNh+zkfgj8xgBnyQKYkNt4e+ei6SJze
         EnwwoTDWAzSFyqx2Y6iNme+3slhpC6PaTRry/qslSijp+QA3v670VSBD+nnel1V71yw/
         ZO5XybSord8LXDwT5IKkI23Qbub9CGm6k+0JaOLANa2UcjDn7iAkAYkgi1bEpvii7E2L
         2hx0qKCoO54x0yhajLJYEjC8/T/6LLx/K2TTxTna/A4D/yvUEZ3OgVrfHb/PZcVdajTF
         VctFNesbP8W78TBwJb2edw44Jvi1tzSGhRV1tH9a6To8AWbrmMjKawfbw2QhDVYJW1/o
         BCDg==
X-Forwarded-Encrypted: i=1; AJvYcCVDzVDvrQD9lKT/VvjM0WRUIb9wsmeag9FReKJhFmIGG7afWr7NxS084ISox0CRMaiAbb+21stmXh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIeiOJp9YWfHz9U5+M94F3sR5e+lXH/XV3sCRTIGdUAN4DgBCE
	s3LrXX49C/Su47+uGAL5l6SObVwt4ZBDUkBE1GJY4CiGuQUwHSOFF2cvja+vjYA=
X-Gm-Gg: ASbGncsVv0fIdrIzc7fJu35zlG37suScPEmbqhwfLpqRkaUukmFI5jRTGA4oflwmIWA
	XMJc9qj6R5W5sI3/sFzcMMjkHysfE9jIoS2lvV9RDXtzd7cRie7SZTe12gpezhL7IjjnYY1hC/N
	a+kkpdCbvdIuZ7BZsvv6xMUeHJYZX6Q0hQSU+3c/vzxqfP8lXp0Acy8OeuUQXg9Bc/OT7ojqbGg
	5tNCn+rutWLXeNDlUFkn0iV0jV0WpADnGfkfxu6TZAgxiJ/cJqTkfnf+5gdyBzabuwRo2tSTKkW
	Bt0xE6X8gcMakI95v6SjFuCuGjNoCb2Y5NbFfZL+tOQ2u+g+aA==
X-Google-Smtp-Source: AGHT+IFk6A8C/ZntqwxTrlUz2PFzjZZpFVU9KCl3S1emNKm9UtBgGjkFq3dnBk02LPS/zX7/WThaAQ==
X-Received: by 2002:a05:6000:381:b0:391:4ca:490 with SMTP id ffacd0b85a97d-39132d76e70mr1285143f8f.29.1741333420618;
        Thu, 06 Mar 2025 23:43:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43bd4352fa3sm72716925e9.30.2025.03.06.23.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 23:43:40 -0800 (PST)
Date: Fri, 7 Mar 2025 10:43:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, raoxu <raoxu@uniontech.com>,
	mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangyuli@uniontech.com,
	zhanjun@uniontech.com, Xu Rao <raoxu@uniontech.com>
Subject: Re: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb:
 xhci: Add debugfs support for xHCI port bandwidth
Message-ID: <8318dbc1-1c15-4a11-abba-23f917e8b176@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303095837.16332-1-raoxu@uniontech.com>

Hi raoxu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/raoxu/From-Xu-Rao-raoxu-uniontech-com-Subject-PATCH-usb-xhci-Add-debugfs-support-for-xHCI-port-bandwidth/20250303-180107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250303095837.16332-1-raoxu%40uniontech.com
patch subject: [PATCH] From: Xu Rao <raoxu@uniontech.com> Subject: [PATCH] usb: xhci: Add debugfs support for xHCI port bandwidth
config: riscv-randconfig-r072-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071516.tj5UBRqT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503071516.tj5UBRqT-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci.c:3120 xhci_get_port_bandwidth() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/riscv/include/asm/atomic.h:218 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/flags +3120 drivers/usb/host/xhci.c

01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3094  int xhci_get_port_bandwidth(struct xhci_hcd *xhci, u8 *bw_table)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3095  {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3096  	unsigned int		num_ports;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3097  	unsigned int		i;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3098  	struct xhci_command	*cmd;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3099  	dma_addr_t		dma_handle;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3100  	void			*dma_buf;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3101  	int			ret;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3102  	unsigned long		flags;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3103  	struct device		*dev  = xhci_to_hcd(xhci)->self.sysdev;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3104  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3105  	num_ports = HCS_MAX_PORTS(xhci->hcs_params1);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3106  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3107  	cmd = xhci_alloc_command(xhci, true, GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3108  	if (!cmd)
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3109  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3110  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3111  	dma_buf = dma_alloc_coherent(dev, xhci->page_size, &dma_handle,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3112  					GFP_KERNEL);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3113  	if (!dma_buf) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3114  		xhci_free_command(xhci, cmd);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3115  		return -ENOMEM;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3116  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3117  
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3118  	/* get xhci hub usb3 port bandwidth */
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3119  	/* refer to xhci rev1_2 protocol 4.6.15*/
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03 @3120  	spin_unlock_irqrestore(&xhci->lock, flags);

This was supposed to be spin_lock_save().

01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3121  	ret = xhci_queue_get_rh_port_bw(xhci, cmd, dma_handle, USB_SPEED_SUPER,
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3122  					0, false);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3123  	if (ret < 0) {
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3124  		spin_unlock_irqrestore(&xhci->lock, flags);
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3125  		goto out;
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3126  	}
01a36d597b1902 drivers/usb/host/xhci.c     Xu Rao      2025-03-03  3127  	xhci_ring_cmd_db(xhci);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


