Return-Path: <linux-usb+bounces-26318-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F23B183CC
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 16:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF8401716BA
	for <lists+linux-usb@lfdr.de>; Fri,  1 Aug 2025 14:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F24263899;
	Fri,  1 Aug 2025 14:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtQCZsEM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F117C2472BC
	for <linux-usb@vger.kernel.org>; Fri,  1 Aug 2025 14:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754058709; cv=none; b=DCbS6InwQThX0xPE9HPqMxFWTLZj7yM2zXbVrU1t/fbLxaxa9vqJe4S4oYn1aj0PF33R8Pe3b2QdHg/C7i5QeW7c+qV5rE/HGqN6gnD8gC/NFtOiCysGWvmxr124Ku3iiWe5siXdt2lEQpalcqo1mqSQjsFk/KlkRgI1RDwmH1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754058709; c=relaxed/simple;
	bh=FK0vyelFnv1mUU8CyGh29LkgK4hFNqWbgWNw58bAiUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ndOQwlQeBcX3mnPN7w8KcUt5rghVGomNpc26RStdMCwFg8c3u9XYRIs9zG8IybOa8H+hOT7d+sZ+mKv//OfjhMlaGK8hOxwfCRW5PvMvNx+v7EbKg/pkxMFFQmwgxnrNY5zaq0QUxDoRv1Q7qpYWCr9JJmU9PmnaVypA9ZvCjZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtQCZsEM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45610582d07so15332525e9.0
        for <linux-usb@vger.kernel.org>; Fri, 01 Aug 2025 07:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754058705; x=1754663505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AieFr6QqT2maFLAJIA2s1XsjLSFuKHyndgzoToJrS2E=;
        b=dtQCZsEMuhRlkjx5T9VOTvCh4h0SUE4kxod9zZaf0kCaO3n7WWWOg6w4NSX5xR4SQa
         Uy5UpSeCACfrnAAR7zm5ayvDHe5ilKqp21RFvTBG3pyHX9W57nPtEEN72iEwd6+gEvUY
         IrL0ummdluyq+9DJ+UubhB9lNmpsyoiZK7Vvf0VTGc05+8FD7+zBw6xsB1UInGIggNiU
         sGXN4BWZ2QPJ7ZEUH3ZECuOirLYL7SWXb/6Jv2bDDIRyLv+xUbWB7Cb5C2WMfvOTUFx/
         lx6XXzUACOSWj8yvZWjm+dVA1vQEklb1mz5tWQudrY31JRb6j+7+2bVLdpru8qO/ytD+
         LJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754058705; x=1754663505;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AieFr6QqT2maFLAJIA2s1XsjLSFuKHyndgzoToJrS2E=;
        b=S16dJhup51QWKYufWtJDMxSFSpx0j0WqRDGEJXRwkuF675yecjCUXc4MdNk67ew5Pa
         rG1DSenH+eVEmeOaJuijFn1O6+rIzETpOxMXRfe0XJ2yIElk0X2i1Ed3dbdwuflgTfIh
         JfgQy29tG7ZldX3+gHMa5eNIXAiAr2d42DWUHe0uEkWRlbZlqWPNrv+zxkmWYoZRFGHo
         cElmAlp1fYr8RrO2/DMniGL6BkYa/VKPA/DHNuqWNcxvoaB7FRkwK2Xiw8cXELLDLW7k
         EJHIfuy7P5B1ClxnvPF7c+b6lvEsRNRHNVVQIBQ0XLso1QMUv+nydryiGaqHkRkZfPzh
         aFQg==
X-Forwarded-Encrypted: i=1; AJvYcCWI5RWqpyOxnCJ6wwBZkT5hXOz/mhNn0zwFE87scsLXPi9ZHOB1bguBmuwhC8fNnnsHr3GxHZ7Oark=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf0hceyrArT9idsyE3P1LPusREFQfGvP/URXuGjMOpfhL6UeN5
	DPCVbUNTPTje+XTEr+jznJm2S7CDgzRiLZibQzyrgvCBvi1lVfl7laOw3JC3ODCuubc=
X-Gm-Gg: ASbGncsrW85CDrJz5ItXOpTOxm8vu1vMH+duHxdexqc/+X1Qg+tZlKmEfhofr6kBm18
	ZbCKakNALR2oO3tvSjTrvaeY/GcFSTA8c2ymjC+JwtdKScNSVMrg22i/J6v+NtpMN5gE6AmxVHb
	aF+VOpfGmHeD62uMJ3HqZPIioyVCXNrqLOTu8uw3SvWu/xbO0hs5qIPUXnCM7evfSQZ33suheUb
	L8zNwlABC9NTp8f1n/HpYJhUd3PauI0fStyv695XeWnNVzFqRXa2x2/qDpqJ3ycfi16hUHyj0tC
	9pbRbAd5jJFy9iHWtvaQzH/xst9O+Oj+t44ioKnq7xJ7LFQG2VhldomAU6VLAVdZotLUQ/z3gQ0
	blVU7lCb6oTDjCgZJOj84rjL1vHmN7jABv2D4xA==
X-Google-Smtp-Source: AGHT+IFsFT3WFtGw9qAky7zYLbRwPgM0Lo6AQ8+E1AcAZECTEtITCALi3O2SmSLsaNNNGaGdYR0uiQ==
X-Received: by 2002:adf:e047:0:b0:3b7:9c28:f856 with SMTP id ffacd0b85a97d-3b79c28f954mr4079994f8f.48.1754058705140;
        Fri, 01 Aug 2025 07:31:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48a05bsm6129217f8f.69.2025.08.01.07.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 07:31:44 -0700 (PDT)
Date: Fri, 1 Aug 2025 17:31:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Weitao Wang <WeitaoWang-oc@zhaoxin.com>,
	gregkh@linuxfoundation.org, mathias.nyman@intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, WeitaoWang@zhaoxin.com,
	wwt8723@163.com, CobeChen@zhaoxin.com, stable@vger.kernel.org
Subject: Re: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
Message-ID: <b5ab0f46-0fde-420e-97a2-136d3074b59c@suswa.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730152715.8368-1-WeitaoWang-oc@zhaoxin.com>

Hi Weitao,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weitao-Wang/usb-xhci-Fix-slot_id-resource-race-conflict/20250730-183802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20250730152715.8368-1-WeitaoWang-oc%40zhaoxin.com
patch subject: [PATCH v3] usb:xhci:Fix slot_id resource race conflict
config: x86_64-randconfig-161-20250801 (https://download.01.org/0day-ci/archive/20250801/202508010850.Bqd6wf47-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508010850.Bqd6wf47-lkp@intel.com/

New smatch warnings:
drivers/usb/host/xhci-mem.c:913 xhci_free_virt_device() warn: variable dereferenced before check 'dev->out_ctx' (see line 878)

vim +913 drivers/usb/host/xhci-mem.c

0b5ed80150eb59 Weitao Wang    2025-07-30  868  void xhci_free_virt_device(struct xhci_hcd *xhci, struct xhci_virt_device *dev,
0b5ed80150eb59 Weitao Wang    2025-07-30  869  		int slot_id)
3ffbba9511b414 Sarah Sharp    2009-04-27  870  {
3ffbba9511b414 Sarah Sharp    2009-04-27  871  	int i;
2e27980e6eb781 Sarah Sharp    2011-09-02  872  	int old_active_eps = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  873  
3ffbba9511b414 Sarah Sharp    2009-04-27  874  	/* Slot ID 0 is reserved */
0b5ed80150eb59 Weitao Wang    2025-07-30  875  	if (slot_id == 0 || !dev)
3ffbba9511b414 Sarah Sharp    2009-04-27  876  		return;
3ffbba9511b414 Sarah Sharp    2009-04-27  877  
0b5ed80150eb59 Weitao Wang    2025-07-30 @878  	if (xhci->dcbaa->dev_context_ptrs[slot_id] == cpu_to_le64(dev->out_ctx->dma))
                                                                                                          ^^^^^^^^^^^^
dev->out_ctx dereferenced without checking for NULL

8e595a5d30a5ee Sarah Sharp    2009-07-27  879  		xhci->dcbaa->dev_context_ptrs[slot_id] = 0;
3ffbba9511b414 Sarah Sharp    2009-04-27  880  
d850c1658328e7 Zhengjun Xing  2018-06-21  881  	trace_xhci_free_virt_device(dev);
d850c1658328e7 Zhengjun Xing  2018-06-21  882  
2e27980e6eb781 Sarah Sharp    2011-09-02  883  	if (dev->tt_info)
2e27980e6eb781 Sarah Sharp    2011-09-02  884  		old_active_eps = dev->tt_info->active_eps;
2e27980e6eb781 Sarah Sharp    2011-09-02  885  
98871e9470a50c Felipe Balbi   2017-01-23  886  	for (i = 0; i < 31; i++) {
63a0d9abd18cdc Sarah Sharp    2009-09-04  887  		if (dev->eps[i].ring)
63a0d9abd18cdc Sarah Sharp    2009-09-04  888  			xhci_ring_free(xhci, dev->eps[i].ring);
8df75f42f8e67e Sarah Sharp    2010-04-02  889  		if (dev->eps[i].stream_info)
8df75f42f8e67e Sarah Sharp    2010-04-02  890  			xhci_free_stream_info(xhci,
8df75f42f8e67e Sarah Sharp    2010-04-02  891  					dev->eps[i].stream_info);
5aed5b7c2430ce Mathias Nyman  2022-10-24  892  		/*
5aed5b7c2430ce Mathias Nyman  2022-10-24  893  		 * Endpoints are normally deleted from the bandwidth list when
5aed5b7c2430ce Mathias Nyman  2022-10-24  894  		 * endpoints are dropped, before device is freed.
5aed5b7c2430ce Mathias Nyman  2022-10-24  895  		 * If host is dying or being removed then endpoints aren't
5aed5b7c2430ce Mathias Nyman  2022-10-24  896  		 * dropped cleanly, so delete the endpoint from list here.
5aed5b7c2430ce Mathias Nyman  2022-10-24  897  		 * Only applicable for hosts with software bandwidth checking.
2e27980e6eb781 Sarah Sharp    2011-09-02  898  		 */
5aed5b7c2430ce Mathias Nyman  2022-10-24  899  
5aed5b7c2430ce Mathias Nyman  2022-10-24  900  		if (!list_empty(&dev->eps[i].bw_endpoint_list)) {
5aed5b7c2430ce Mathias Nyman  2022-10-24  901  			list_del_init(&dev->eps[i].bw_endpoint_list);
5aed5b7c2430ce Mathias Nyman  2022-10-24  902  			xhci_dbg(xhci, "Slot %u endpoint %u not removed from BW list!\n",
2e27980e6eb781 Sarah Sharp    2011-09-02  903  				 slot_id, i);
8df75f42f8e67e Sarah Sharp    2010-04-02  904  		}
5aed5b7c2430ce Mathias Nyman  2022-10-24  905  	}
839c817ce67178 Sarah Sharp    2011-09-02  906  	/* If this is a hub, free the TT(s) from the TT list */
839c817ce67178 Sarah Sharp    2011-09-02  907  	xhci_free_tt_info(xhci, dev, slot_id);
2e27980e6eb781 Sarah Sharp    2011-09-02  908  	/* If necessary, update the number of active TTs on this root port */
2e27980e6eb781 Sarah Sharp    2011-09-02  909  	xhci_update_tt_active_eps(xhci, dev, old_active_eps);
3ffbba9511b414 Sarah Sharp    2009-04-27  910  
3ffbba9511b414 Sarah Sharp    2009-04-27  911  	if (dev->in_ctx)
d115b04818e57b John Youn      2009-07-27  912  		xhci_free_container_ctx(xhci, dev->in_ctx);
3ffbba9511b414 Sarah Sharp    2009-04-27 @913  	if (dev->out_ctx)
                                                    ^^^^^^^^^^^^
Can dev->out_ctx be NULL?

d115b04818e57b John Youn      2009-07-27  914  		xhci_free_container_ctx(xhci, dev->out_ctx);
d115b04818e57b John Youn      2009-07-27  915  
a400efe455f7b6 Mathias Nyman  2018-03-16  916  	if (dev->udev && dev->udev->slot_id)
a400efe455f7b6 Mathias Nyman  2018-03-16  917  		dev->udev->slot_id = 0;
74151b5349266b Niklas Neronin 2024-02-29  918  	if (dev->rhub_port && dev->rhub_port->slot_id == slot_id)
74151b5349266b Niklas Neronin 2024-02-29  919  		dev->rhub_port->slot_id = 0;
0b5ed80150eb59 Weitao Wang    2025-07-30  920  	if (xhci->devs[slot_id] == dev)
326b4810cc9952 Randy Dunlap   2010-04-19  921  		xhci->devs[slot_id] = NULL;
0b5ed80150eb59 Weitao Wang    2025-07-30  922  	kfree(dev);
3ffbba9511b414 Sarah Sharp    2009-04-27  923  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


