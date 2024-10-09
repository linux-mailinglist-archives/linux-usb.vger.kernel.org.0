Return-Path: <linux-usb+bounces-15934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 29187996E8F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 16:47:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 259D6B22304
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 14:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCECF19CC3E;
	Wed,  9 Oct 2024 14:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjfPll4r"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44433196455
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 14:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728485246; cv=none; b=CqlnvPA+Bc2Ehnz4nO4YqPcnN1j1f3c87QOzwv5/wEVDH70pG6ngGys1ZEwSNrXhW/aKCsvukUVRbzbVOUG06IhxgyujqufinANKxkXYbB84zVM+nKAvquegbIK/oxj1tjYybcunkg9sDqbOof0lSktbhDLsQ3oUZ3kXvGodLaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728485246; c=relaxed/simple;
	bh=VJTC2DOZnhmJ68sp/tmxqdeKde2Mhxf3GCsNUffgoW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LSEiwWdgyq+CE3redo+c3p5dl8/1/oVnTDpoXRH0/O2YA2CLBjVeGEnEUnu1TVvPP02uo+fXic3Fme++DYI12ir1O1wA/cO2TmQyAfClHwNIxYww8rsjMAfuBOIYdm+ikRVow5rSMIWmVUO3oBQWlm2uMbmkItNSu7VZfSCVEuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QjfPll4r; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43058268d91so11610395e9.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Oct 2024 07:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728485241; x=1729090041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d9rcGsQ0+uAasDNvLrvHwFyI9WspFhavO2dzQQO4dB0=;
        b=QjfPll4rzubUcdFRnvWzrj6sVbylWsWoFzmGFvj9ajs2n6wGSqNnUOrtkF4hUz08Mr
         M14DKyCMyZB57vLuY9Ut4Dmf3tTE/wkUHyCksFj2A2F4bexTr9VC6KYfEVUtK6wqOV7S
         MfK/VuSofJwhQ0rEb0W29SOIUDBC6C0bkdW75JLY2wQFT3DrChvUiyrodLyQdfRfv8Tj
         miKvxww4KC/+91/GS6z+nLih32zPwCt4JLeecy1ylUZ1CJV8no6yAVuIf69s17uYq5S1
         KCRfHMTDN7pBRhtVdemUAMN1L6t3wWzH6BN5Ps5gYS3r8qJSPnCjgtq/y1TilwC2s67Z
         5MTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485242; x=1729090042;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9rcGsQ0+uAasDNvLrvHwFyI9WspFhavO2dzQQO4dB0=;
        b=s4lkow6NKNr/3ePxeUvGpsqzgt/cWvgAhWeFyZklzLgxEw+zMtJX505LLOe9ki7CB6
         tIqIWzSnldEUO9K9tQtFL9cpWX0xkUai7lEGGcM0j/J/sCiUh+Brd3n7eQ9Y+iWL/tGk
         pskJyfdj/J3wT1e2w6qe7WVk8aPG3SWr10mDo0h2FL5dDZ+oKjeqJIcQPxu0ErSVYjyV
         Bw149i/EcsnXaGV3OdME2XwqER5PbWsm7SYQ6MLpezieVOxMCCgfeDmpqaU+eT5H7Pif
         1/BgY0VW7YKOp3WsyRdWoxnQ5lDfDrkEIiLGW5HbYdA6xHzhbHy0gvUxYGDcc3MMdb0f
         e+HA==
X-Forwarded-Encrypted: i=1; AJvYcCXSCP+A3ybDq5WQV8IldsC8fc3ma+diPSBkDjDKEDUHrcSGyhglefTq7QKZjfMuAG9CYEY2tNLJPvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGxNYPWsggcFmTdqpHAE7nV4xmo+cqL9RKz6sFJSzQDvesoCop
	6jm4S/kNObu3JOrBUG4YfW2BSAdKwHyawf4wTCpdfhzcYxpWk5eH0MuNtbdSldM=
X-Google-Smtp-Source: AGHT+IGZ5bNiOSMx5Q1Ih7x+axzAHoaTvA3GlxDEdqAHZC/EUOPneC6RziV3TtFWCRrpAlfq8o5CGg==
X-Received: by 2002:a05:600c:1c1f:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-430d7488700mr23141805e9.32.1728485241387;
        Wed, 09 Oct 2024 07:47:21 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430ccf31a7esm23151485e9.9.2024.10.09.07.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 07:47:20 -0700 (PDT)
Date: Wed, 9 Oct 2024 17:47:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Xu Yang <xu.yang_2@nxp.com>,
	peter.chen@kernel.org, gregkh@linuxfoundation.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem
 sglist entries if possible
Message-ID: <e8601166-8da4-4698-8855-4f58b36272b6@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912045150.915573-2-xu.yang_2@nxp.com>

Hi Xu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xu-Yang/usb-chipidea-udc-create-bounce-buffer-for-problem-sglist-entries-if-possible/20240912-125251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20240912045150.915573-2-xu.yang_2%40nxp.com
patch subject: [PATCH 2/2] usb: chipidea: udc: create bounce buffer for problem sglist entries if possible
config: i386-randconfig-141-20240914 (https://download.01.org/0day-ci/archive/20240914/202409141707.TOsGfePE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202409141707.TOsGfePE-lkp@intel.com/

New smatch warnings:
drivers/usb/chipidea/udc.c:704 _hardware_enqueue() error: uninitialized symbol 'bounced_size'.

vim +/bounced_size +704 drivers/usb/chipidea/udc.c

8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  671  static int _hardware_enqueue(struct ci_hw_ep *hwep, struct ci_hw_req *hwreq)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  672  {
8e22978c57087a drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-24  673  	struct ci_hdrc *ci = hwep->ci;
0e6ca1998e4c80 drivers/usb/gadget/ci13xxx_udc.c Pavankumar Kondeti 2011-02-18  674  	int ret = 0;
cc9e6c495b0a37 drivers/usb/chipidea/udc.c       Michael Grzeschik  2013-06-13  675  	struct td_node *firstnode, *lastnode;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  676  	unsigned int bounced_size;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  677  	struct scatterlist *sg;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  678  
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  679  	/* don't queue twice */
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  680  	if (hwreq->req.status == -EALREADY)
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  681  		return -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  682  
2dbc5c4c831418 drivers/usb/chipidea/udc.c       Alexander Shishkin 2013-06-13  683  	hwreq->req.status = -EALREADY;
aa69a8093ff985 drivers/usb/gadget/ci13xxx_udc.c David Lopo         2008-11-17  684  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  685  	if (hwreq->req.num_sgs && hwreq->req.length) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  686  		ret = sglist_get_invalid_entry(ci->dev->parent, hwep->dir,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  687  					&hwreq->req);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  688  		if (ret < hwreq->req.num_sgs) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  689  			ret = sglist_do_bounce(hwreq, ret, hwep->dir == TX,
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  690  					&bounced_size);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  691  			if (ret)
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  692  				return ret;
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  693  		}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  694  	}

bounced_size not initialized on else path

91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  695  
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  696  	ret = usb_gadget_map_request_by_dev(ci->dev->parent,
aeb78cda51005f drivers/usb/chipidea/udc.c       Arnd Bergmann      2017-03-13  697  					    &hwreq->req, hwep->dir);
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  698  	if (ret)
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  699  		return ret;
5e0aa49ec61e88 drivers/usb/chipidea/udc.c       Alexander Shishkin 2012-05-11  700  
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  701  	if (hwreq->sgt.sgl) {
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  702  		/* We've mapped a bigger buffer, now recover the actual size */
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  703  		sg = sg_last(hwreq->req.sg, hwreq->req.num_sgs);
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12 @704  		sg_dma_len(sg) = min(sg_dma_len(sg), bounced_size);
                                                                                                                                     ^^^^^^^^^^^^

91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  705  	}
91db40933ca942 drivers/usb/chipidea/udc.c       Xu Yang            2024-09-12  706  
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  707  	if (hwreq->req.num_mapped_sgs)
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  708  		ret = prepare_td_for_sg(hwep, hwreq);
e48aa1eb443f80 drivers/usb/chipidea/udc.c       Peter Chen         2020-02-21  709  	else

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


