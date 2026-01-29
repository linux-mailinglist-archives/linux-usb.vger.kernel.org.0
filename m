Return-Path: <linux-usb+bounces-32902-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EwMElcFe2maAgIAu9opvQ
	(envelope-from <linux-usb+bounces-32902-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 07:59:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6631AC5FA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 07:59:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B15EF301C110
	for <lists+linux-usb@lfdr.de>; Thu, 29 Jan 2026 06:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E61A3793DD;
	Thu, 29 Jan 2026 06:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="naanNcCM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F283793B2
	for <linux-usb@vger.kernel.org>; Thu, 29 Jan 2026 06:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769669972; cv=none; b=Z8BgpVdprCsbXdjaJRX0dHWflMUr2xvw88H7q1PKEL/yoheDKSg1SecxEjsvQv4WK9wIobaD+jkfSBoC04ea8y067b/M5bsO/zRU2EGJB+gZb/b7FmQ0tiwwiWH/vRBkBdD/4i6Gwx2pe7tFLsYZcsOTDPASfu4/7gCRWI3LIto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769669972; c=relaxed/simple;
	bh=gLEPIN3ZxJ1dsRf66dbZLgFDHqnBT87yg74ODOFhpMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Q0V7s8ULczNhzGQrizKCbvvq3GwDXBp++BaC47Sj5gFhLh6ER3unVdE01mL1NKaGNnnRC4MSSS3LQ7Upuc/Qg2lJsTZTs8n8+Ws4O2TN8Rn6l5xZQExemuK6/wf5CQ8ga43lZma8QaMA1DXRt2ghNlwX3LT0BigjBkXE0JHOZik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=naanNcCM; arc=none smtp.client-ip=209.85.221.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43591b55727so533267f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 28 Jan 2026 22:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769669970; x=1770274770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NHNJ1TQ1JR50Y6PheB8gKOVpv/Y5hdmXfj+3AJIB5y4=;
        b=naanNcCMRDetE9JtKhS85GpWkH+XTIrucuZxchScKcgtR9YSyQ0Y5+PPK5UdS9WPle
         ZBzpvhMd3SmZM1aLXILynzkqxZTMLxdY9IYXd4P5LB6l4Pa1kXY2BwPs/BZw5khr3QyM
         F4UGv9udalXYjP0yGJrt0qX4jFwzBebRm5PPo1y098vzKvSPeu3FBy8rDD8hshXQ/371
         gxDOuVsUHt4NqirQ4pkMagAivpU7sWh6C+fvNmjFx13pd5Lf6kRAipp1UFclr36nHG8c
         2ZAXM5n/LbEKIlC5w+lu9Gc62CdscM3yW9dfCL0DKobFYb+MEWgMi7fC9KUZJHEK+17b
         Z7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769669970; x=1770274770;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NHNJ1TQ1JR50Y6PheB8gKOVpv/Y5hdmXfj+3AJIB5y4=;
        b=t8ZY8j6jG9BHDujefn9lbx5Q8Bw2ageobvsoILnzlnSmiBzlr8JkP5h+UEQUDKQeVg
         zjZFvK3h+t6O6aeW1tjzsuVrTCC+CvZDJ8YVAi45K9Ro9UA8w12LT4FNpv7wCuyc6aQW
         1E4bq6eubmdeg50bzJtX5C2g1UnwmBc2NtI8OaaGarGTBQ/qskj1LU8YR8VYW/ymiicB
         qTK4Eyu4z++jHMoaPQPB4HJ1pGomoOeHf4oNTLasgkPl8GlRTWF5ygHsuyiy8BWIIjwf
         bZOG2lpab6vBUYT45insJKqlX4kq1WbNHyYenaSYmwTX7JuGr4aN4aSbxp8cZ+mvSosf
         6deQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDYdxA2wCUydUp+HeluJMPfoH5bSNwf+6AHC3ps6YRIUfbJppgVvKbADmKPHx95JS/HurQu/92Md8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1BJA3hNDZ9+nQY5Pfhq9I2YIci7NwHRHC7fmGYkO6hg1HOg/w
	BOqUqaxmSoxi0NGcxr8vlEew1Myp+t/hpKaF4R+F2cOx1kXAmGPB5MVbfIxk0kjx+jt3KagVnbp
	d6I50
X-Gm-Gg: AZuq6aJJxbR8Ddmxw9EW23tGw4qUvDO64qM6dciDbA7pg43socydj+mdpr5SDw21xJH
	K3SRgzpHQH9bRvtDStG/QWgFH35liNxsjgdYuKCzTOA2HRm79Nka2bWm3/gD9lWcaXqq2c4Vu2d
	tg6UYxwGPF66nxpqw848UWZCnDdHDP2T+wrobrCc8RwFtxdNp8RlQ7MyovebCHRTH95dVX/xCYb
	J1AuPo5BjIWD+zvDbzJidLFeYqHmsLuEN94rM5o5BoxqBWURV3GoV/7IzAbGhAAZZFOYcTIA/7n
	pFXpK+9YX7VR9z9rndJawZMb+cPFd6GEkgyachsK6bBh7LxdMfPO79gFBsYeKwucdUxwByZNxVi
	C3QDJzXZEHjJOPihp62pc0uOzhuwz5abCKnKBPbcPFikdl+5++MYv41vXkgu9y5atQqNMeTpOjC
	eCwpdHOofI6fgLY3KI
X-Received: by 2002:a05:6000:2312:b0:430:ff81:2961 with SMTP id ffacd0b85a97d-435dd1c8f14mr10282615f8f.51.1769669969615;
        Wed, 28 Jan 2026 22:59:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm12482179f8f.4.2026.01.28.22.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:59:29 -0800 (PST)
Date: Thu, 29 Jan 2026 09:59:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Niklas Neronin <niklas.neronin@linux.intel.com>,
	mathias.nyman@linux.intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	raoxu@uniontech.com,
	Niklas Neronin <niklas.neronin@linux.intel.com>
Subject: Re: [PATCH 2/2] usb: xhci: add interrupter type
Message-ID: <202601290847.Cb6aLduh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128131504.124322-3-niklas.neronin@linux.intel.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-32902-lists,linux-usb=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,linaro.org:dkim,git-scm.com:url]
X-Rspamd-Queue-Id: B6631AC5FA
X-Rspamd-Action: no action

Hi Niklas,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Niklas-Neronin/usb-xhci-move-Primary-Interrupter-IMODI-setup/20260128-211728
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20260128131504.124322-3-niklas.neronin%40linux.intel.com
patch subject: [PATCH 2/2] usb: xhci: add interrupter type
config: x86_64-randconfig-161-20260129 (https://download.01.org/0day-ci/archive/20260129/202601290847.Cb6aLduh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601290847.Cb6aLduh-lkp@intel.com/

smatch warnings:
drivers/usb/host/xhci.c:320 xhci_enable_interrupter() warn: variable dereferenced before check 'ir' (see line 317)
drivers/usb/host/xhci.c:340 xhci_disable_interrupter() warn: variable dereferenced before check 'ir' (see line 337)

vim +/ir +320 drivers/usb/host/xhci.c

bea5892d0ed274 Mathias Nyman  2025-04-10  313  int xhci_enable_interrupter(struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  314  {
52dd0483e822d0 Mathias Nyman  2023-02-02  315  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  316  
486b278520fd70 Niklas Neronin 2026-01-28 @317  	if (ir->type == INTR_NOOP)
                                                    ^^^^^^^^
Dereferenced.

486b278520fd70 Niklas Neronin 2026-01-28  318  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  319  
52dd0483e822d0 Mathias Nyman  2023-02-02 @320  	if (!ir || !ir->ir_set)
                                                    ^^^
Checked too late.

52dd0483e822d0 Mathias Nyman  2023-02-02  321  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  322  
bf9cce90da311a Niklas Neronin 2025-05-15  323  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  324  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  325  	iman |= IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  326  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  327  
f5bce30ad25e74 Niklas Neronin 2025-05-15  328  	/* Read operation to guarantee the write has been flushed from posted buffers */
bf9cce90da311a Niklas Neronin 2025-05-15  329  	readl(&ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  330  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  331  }
52dd0483e822d0 Mathias Nyman  2023-02-02  332  
e1db856bd28891 Niklas Neronin 2025-05-15  333  int xhci_disable_interrupter(struct xhci_hcd *xhci, struct xhci_interrupter *ir)
52dd0483e822d0 Mathias Nyman  2023-02-02  334  {
52dd0483e822d0 Mathias Nyman  2023-02-02  335  	u32 iman;
52dd0483e822d0 Mathias Nyman  2023-02-02  336  
486b278520fd70 Niklas Neronin 2026-01-28 @337  	if (ir->type == INTR_NOOP)
                                                    ^^^^^^^^

486b278520fd70 Niklas Neronin 2026-01-28  338  		return 0;
486b278520fd70 Niklas Neronin 2026-01-28  339  
52dd0483e822d0 Mathias Nyman  2023-02-02 @340  	if (!ir || !ir->ir_set)
                                                    ^^^
Same.

52dd0483e822d0 Mathias Nyman  2023-02-02  341  		return -EINVAL;
52dd0483e822d0 Mathias Nyman  2023-02-02  342  
bf9cce90da311a Niklas Neronin 2025-05-15  343  	iman = readl(&ir->ir_set->iman);
ff9a09b3e09c7b Niklas Neronin 2025-08-19  344  	iman &= ~IMAN_IP;
9f7f74735ac295 Niklas Neronin 2025-05-15  345  	iman &= ~IMAN_IE;
bf9cce90da311a Niklas Neronin 2025-05-15  346  	writel(iman, &ir->ir_set->iman);
52dd0483e822d0 Mathias Nyman  2023-02-02  347  
bf9cce90da311a Niklas Neronin 2025-05-15  348  	iman = readl(&ir->ir_set->iman);
e1db856bd28891 Niklas Neronin 2025-05-15  349  	if (iman & IMAN_IP)
e1db856bd28891 Niklas Neronin 2025-05-15  350  		xhci_dbg(xhci, "%s: Interrupt pending\n", __func__);
e1db856bd28891 Niklas Neronin 2025-05-15  351  
52dd0483e822d0 Mathias Nyman  2023-02-02  352  	return 0;
52dd0483e822d0 Mathias Nyman  2023-02-02  353  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


