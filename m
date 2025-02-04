Return-Path: <linux-usb+bounces-20127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD66AA27B6E
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 20:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 363633A2409
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 19:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6502204F82;
	Tue,  4 Feb 2025 19:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lyBnaYD4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBFF204F6C
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738697989; cv=none; b=OPXNuIyBxCKw/3qbHZF0R/vnvDXXrYtbFm5Gn7s2NPy2+JwQohIqRJh6Ie3Rzbrt/bBqGvv4bMxiawCl4b8PZMdsjLOxDGChikc4iSoz8cVB28TB8D9Gom2KWW+MG15gJ2eHV4G6mZMisb9GyUMImkE02a3dXA7R5iBh3jR3asg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738697989; c=relaxed/simple;
	bh=ZJiDN+nOQE6F2sddgObQCdlw5v60QylJn/xoU10lzpg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrKDS16k1EXCjzmn+37zwuvDiL5Ihze4gvOSqsWT1o93N3A6iCDRUECGVFZaLMHJtbnvKgSXpa7ppktXvHYVn2FERswM1jcCzZ7KLowc9bt6Zmp7ojtDXsHO3r7O9cQHT9vYRCFaNg2zGV6ln6Vt1fxt3eh5guVC1xNsrux0l5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lyBnaYD4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso41931675e9.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 11:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738697985; x=1739302785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvA9+93eZBZ2k96uE5RBukuAK+CxojboLUTlBCqCsGA=;
        b=lyBnaYD4c+ftYkRAqQwESwfILdzTTIOT/NYJyzCEeG2mAHZLRRed5j5AN5sSGh+i2c
         vNkjQwvnKTXyMK8oTnl2Zgbbl1g4/eupCwsJCT5727mFF1rWcKj6O63K0vOxZbUf/GEL
         QkQPw6SJABJhjNiL9KoACmjNJB7uEfFI2RBCMJVN0vWbHxe+qdHFw5s6DxtDJHTsAegn
         ixP4ESib++A+GT5LVJauEFEefCr4V/HaQ6bGM9HL5X9cci+9xURYUReybVdBp+BpKseV
         QzmuPoYSxajLs2pfgep3RLNyEd8mWZSsC2Qmlze2eZ7Zlp/O43QAOV4OCWk2AWRDEyK3
         +8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738697985; x=1739302785;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvA9+93eZBZ2k96uE5RBukuAK+CxojboLUTlBCqCsGA=;
        b=Lo0/sN9Zn1v/o/YCETDS13AdzZRV0HdLNhY6z0IdXVPizzv0T3bvY/1fCFYko1aYoK
         06n9fBbaYDmFL0BXVgFYMMmDZvHifxxPYweo60KHuGVVqq2KzyB/ptJVUitZrYmsACA0
         Kijeg4AIFbve2ZwCZO+IyCZNSMB4GxOKozHki/rpwfwLXHIgEIQ1HGNjG76HSOYsyA+A
         eV8uCGnB4P8znrhsirT1K9E1LZyMxaUzGi4k27mfrqk1bwptWYZhyPqR7l9y6XWuVwhh
         la1zH1cu+KsCdSdT4pce0Ta6XuuVYpQOkYNfRSauBV3yN2kF3fIeXXjfs8sTiiz5W8CH
         jLUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl5ws9oGJS2bWBoMQi2MlIStHyG97YipqPv4ErvhBzjGljotY69YGMUWEiT44tH9eEAvCfyiBXVrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYgDRubnam4KsL50XMJDkcQusBAEVnR3n1zkQMCYkaVP1pSj/h
	gQbSmh2o9m5VRDfJzEf+s7aIH2tEA30keqdLx5N+fu4rOq9vO/yOU8wTFG+/ZEc=
X-Gm-Gg: ASbGnctg7J3OzLLNcHIKRhMgCWqPGQ5hXB5Y0iVDrKwvgxiS7Yl7RScPFH0MOsHr5V7
	TbcwwkBCYE9W/aj/yXitUsnVA9ta9oERkZOhPVTrNaAxerVSoR9hnJ6yPYZacywcbkT1A++kQmv
	/FseGeRymusOIFg60CTMXxOzaId1igYPVpI4V1k2q1cbJrtfOQSgKQfE0n8aRxVmodgsIlMFZ2O
	MxIzEs23VGWkWR0eb9MdNbpOYR+FoeVaXkP/1O9NsoEmiaB+wZmg98mb/bQcS+IW+Oc/dbRtiwK
	ckikiAqAw0dB6lMmrgVN
X-Google-Smtp-Source: AGHT+IFNWvD6NvvDhpB82LWN1FYRnfaMgfQURPzQMaeDvstK6yqFp+sb4byiALVIy8hf+6SrDlX8ow==
X-Received: by 2002:a05:600c:2313:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-438dc3be21fmr302287695e9.11.1738697985504;
        Tue, 04 Feb 2025 11:39:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc2f17dsm234958395e9.23.2025.02.04.11.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 11:39:45 -0800 (PST)
Date: Tue, 4 Feb 2025 22:39:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Subject: [usb:usb-next 5/12] drivers/usb/typec/ucsi/ucsi.c:88
 ucsi_sync_control_common() error: we previously assumed 'cci' could be null
 (see line 84)
Message-ID: <0052316a-72c2-4e36-9cb2-ba88e9c918b3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   9682c35ff6ecd76d9462d4749b8b413d3e8e605e
commit: 667ecac55861281c1f5e107c8550ae893b3984f6 [5/12] usb: typec: ucsi: return CCI and message from sync_control callback
config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250205/202502050227.tDYOqQsX-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502050227.tDYOqQsX-lkp@intel.com/

New smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:88 ucsi_sync_control_common() error: we previously assumed 'cci' could be null (see line 84)

Old smatch warnings:
drivers/usb/typec/ucsi/ucsi.c:746 ucsi_get_pd_caps() warn: passing zero to 'ERR_PTR'
drivers/usb/typec/ucsi/ucsi.c:1456 ucsi_dr_swap() warn: missing error code 'ret'

vim +/cci +88 drivers/usb/typec/ucsi/ucsi.c

667ecac55861281 Dmitry Baryshkov 2025-01-20  58  int ucsi_sync_control_common(struct ucsi *ucsi, u64 command, u32 *cci,
667ecac55861281 Dmitry Baryshkov 2025-01-20  59  			     void *data, size_t size)
584e8df58942338 Dmitry Baryshkov 2024-06-27  60  {
584e8df58942338 Dmitry Baryshkov 2024-06-27  61  	bool ack = UCSI_COMMAND(command) == UCSI_ACK_CC_CI;
584e8df58942338 Dmitry Baryshkov 2024-06-27  62  	int ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  63  
584e8df58942338 Dmitry Baryshkov 2024-06-27  64  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  65  		set_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  66  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  67  		set_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  68  
e37b383df91ba9b Łukasz Bartosik  2024-12-03  69  	reinit_completion(&ucsi->complete);
e37b383df91ba9b Łukasz Bartosik  2024-12-03  70  
584e8df58942338 Dmitry Baryshkov 2024-06-27  71  	ret = ucsi->ops->async_control(ucsi, command);
584e8df58942338 Dmitry Baryshkov 2024-06-27  72  	if (ret)
584e8df58942338 Dmitry Baryshkov 2024-06-27  73  		goto out_clear_bit;
584e8df58942338 Dmitry Baryshkov 2024-06-27  74  
584e8df58942338 Dmitry Baryshkov 2024-06-27  75  	if (!wait_for_completion_timeout(&ucsi->complete, 5 * HZ))
584e8df58942338 Dmitry Baryshkov 2024-06-27  76  		ret = -ETIMEDOUT;
584e8df58942338 Dmitry Baryshkov 2024-06-27  77  
584e8df58942338 Dmitry Baryshkov 2024-06-27  78  out_clear_bit:
584e8df58942338 Dmitry Baryshkov 2024-06-27  79  	if (ack)
584e8df58942338 Dmitry Baryshkov 2024-06-27  80  		clear_bit(ACK_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  81  	else
584e8df58942338 Dmitry Baryshkov 2024-06-27  82  		clear_bit(COMMAND_PENDING, &ucsi->flags);
584e8df58942338 Dmitry Baryshkov 2024-06-27  83  
667ecac55861281 Dmitry Baryshkov 2025-01-20 @84  	if (!ret && cci)
                                                                    ^^^
This code assumes cci can be NULL

667ecac55861281 Dmitry Baryshkov 2025-01-20  85  		ret = ucsi->ops->read_cci(ucsi, cci);
667ecac55861281 Dmitry Baryshkov 2025-01-20  86  
667ecac55861281 Dmitry Baryshkov 2025-01-20  87  	if (!ret && data &&
667ecac55861281 Dmitry Baryshkov 2025-01-20 @88  	    (*cci & UCSI_CCI_COMMAND_COMPLETE))
                                                             ^^^^
But here it's dereferenced without checking

667ecac55861281 Dmitry Baryshkov 2025-01-20  89  		ret = ucsi->ops->read_message_in(ucsi, data, size);
667ecac55861281 Dmitry Baryshkov 2025-01-20  90  
584e8df58942338 Dmitry Baryshkov 2024-06-27  91  	return ret;
584e8df58942338 Dmitry Baryshkov 2024-06-27  92  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


