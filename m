Return-Path: <linux-usb+bounces-10224-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A338C2BBB
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 23:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 75E96B2127B
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 21:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E177413BAFB;
	Fri, 10 May 2024 21:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iwn0xoFI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 192A113B5A0
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 21:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715376025; cv=none; b=PCVfF7P0axP/fz80Atz3nlvk5SiStjblOcENJwkMBQeCmw/J2DTduzvSYFrk9xht+BIlBcC1CKq3HqO/PLrDVdXW+l7narmpnoVXgxtj6Z+HkS9RAbGLIHuOLqtMrU2E9xaN1C3Opu3nf6zBPlP8yaCkKMjT1ZtsHwC5BBHHYzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715376025; c=relaxed/simple;
	bh=pz3w4cihh1CVJ907kmGe5qcs1/sHwxX9X7McsjgvhU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McgcfFUQR8scYsYJa5BB4I0qJFT/r9phOOpt6RVYNqaCqT55Uu1NzU4MNRYGPEgPXW8niE5mO9qbuL/3E3gMrw2BRQj98Opz2bRoSZiiMHfnKKlcxuTP8mvvu48Sc1MBztD9jCoU3bX2FAbLVxGUrxb+9Pw1+TjftCZ5Hm9NTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iwn0xoFI; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso45387751fa.0
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 14:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715376020; x=1715980820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZtgybpsOk8M3ZUpSNXMnflIY8sEwLdJ3KkGzqFWvdk=;
        b=Iwn0xoFIUQc7JhvE3UMCUruGTEcLyTNfwklPyMFn9bPUrH1vBg8FKwipyajQysFQpB
         I8SGTVla0s7NoY6D6aQT6aos9JfiDhQCL+77dN+ZDXwbal3bDpvdPfUpUvzF4ftmDowl
         QTNJ8MGMcTDqG8ADB1vNYPllzjwq6F6YL3GpF92FpxIJ02/2m88ulGzyKE4xxcoSNYNe
         0f1eK7/GoEhz30s1DjGPfukaVOffcQx3IIGakhsyyPHlOTG3xBJ9FzonEQzjDRiKQmyY
         fPfikBldzdk/3/jt/k/ip9pmnngp9RpgOM8yW//MltRCrHi25o+8snL6ewYwPeRbutOB
         yv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715376020; x=1715980820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZtgybpsOk8M3ZUpSNXMnflIY8sEwLdJ3KkGzqFWvdk=;
        b=aeaI0zd5GXMJS7XOhwc1/HZv4/vGRvz4z8p2LjwPb/XdpveDSdh+IHVmqu3ZODmh1B
         5ShcPzfdU+XH3ByT1MW6EwCMbIkGp0/roZFFhtHKXtT5N8EToQGvosJoiAUnBowCZVTV
         PqyP6XZRnhkMJIFWaA/x1EOZQ9Eo6vdyc3+DLDdXiJyntQLOD6rIuyovv18Mad565AC5
         agWR6kHEzq/NftUxh3GuxaMq9nip+0zTSrs6JEArNUJbyDDpMUh3of+jMLAyve5ZYWVv
         M4BLedErKWslLK1O6n3RtjwbjqhABnL3grrbxZIc49tcJLcxuXF2LYzcgRSPIWACNm/B
         m+FA==
X-Forwarded-Encrypted: i=1; AJvYcCVYOWUeKepSpjwZdKO4RMBhHMle9nyReBT82rLxVd8iTHgquZHZ7oRjlhaacAJyD1G+mJ7GpEq/3AvVNZs7/XepFnJbO6o0zOet
X-Gm-Message-State: AOJu0YwKSuxsYoqpnoH+lap9SnOCH6jkgwuRQYrBl8L+QvT8AsfmcR7J
	cWJl5QGqIngLM0zTPXffo5RC1PshaACgCbyfLg7Qaoz85UD8pjlWKBIOHjMGlT4=
X-Google-Smtp-Source: AGHT+IFWIeGQ1M67Zxdkna/4RhYmw4X63n/inheDEsHEKFz7MfBkLl1dffeen00Xy3ERykDugrHwuw==
X-Received: by 2002:ac2:504c:0:b0:51a:df97:cc8d with SMTP id 2adb3069b0e04-5220fd7cc70mr2452686e87.26.1715376020191;
        Fri, 10 May 2024 14:20:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d37f7sm830045e87.123.2024.05.10.14.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 May 2024 14:20:19 -0700 (PDT)
Date: Sat, 11 May 2024 00:20:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [usb:usb-testing 5/12]
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing
 argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type
Message-ID: <bq3naqyizwy24qg5zxd3mk3nlu56zm6jvothhc3c2uxllva777@k4aztvs6477x>
References: <202405110428.TMCfb1Ut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202405110428.TMCfb1Ut-lkp@intel.com>

On Sat, May 11, 2024 at 04:36:30AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> head:   344f74cf531d90245e1296b3ffbaa7df99dd18f6
> commit: 718b36a7b49acbba36546371db2d235271ceb06c [5/12] usb: typec: qcom-pmic-typec: split HPD bridge alloc and registration
> config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/config)
> compiler: sh4-linux-gcc (GCC) 13.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110428.TMCfb1Ut-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202405110428.TMCfb1Ut-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c: In function 'qcom_pmic_typec_probe':
> >> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:46: error: passing argument 1 of 'devm_drm_dp_hpd_bridge_add' from incompatible pointer type [-Werror=incompatible-pointer-types]
>      113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
>          |                                          ~~~~^~~~~
>          |                                              |
>          |                                              struct device *
>    In file included from drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:21:
>    include/drm/bridge/aux-bridge.h:36:71: note: expected 'struct auxiliary_device *' but argument is of type 'struct device *'
>       36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
>          |                                              ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
> >> drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c:113:15: error: too many arguments to function 'devm_drm_dp_hpd_bridge_add'
>      113 |         ret = devm_drm_dp_hpd_bridge_add(tcpm->dev, bridge_dev);
>          |               ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/drm/bridge/aux-bridge.h:36:19: note: declared here
>       36 | static inline int devm_drm_dp_hpd_bridge_add(struct auxiliary_device *adev)
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    cc1: some warnings being treated as errors

There is an error in include/drm/bridge/aux-bridge.h in the definition
of the stub. I'll send a patch.

-- 
With best wishes
Dmitry

