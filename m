Return-Path: <linux-usb+bounces-13535-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA979545E4
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 11:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFAFD1C222CF
	for <lists+linux-usb@lfdr.de>; Fri, 16 Aug 2024 09:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F15413DBBE;
	Fri, 16 Aug 2024 09:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GaaRf/rS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A2812CDA5
	for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 09:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723801116; cv=none; b=K0zxYfli+hSBb8aXxOdtvPIaicB4RgkBsBYaHjL3C8FFQiVaUX6FqUA3FafSPv6SgOjrZNmlq6obD6son0eT5ZT51aSy3gQvttMYuYsvv1TbAN8NwJ7G1uPjNBl3ps+7bvux7v3iz8wGRlxMpuWPsoZLLEfgBI7Gx1AfllNzlM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723801116; c=relaxed/simple;
	bh=XOoTxRjVtRGFsPK5EWELKkL1XdqOplIH7QBBako0xHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=U6t1ABqq2V0chsXneEeZv7fLhsHCboZAhMN8KSsnncc10gliXIxPg/q/+psLB5OOzctcEQ/gC/VieW7cqPDCrYNPcYEXNpkrBTtY5a7X3WhgCpm5p5xR7V8epzTdIjhQho4jI+QVZC4xxVWygOW+ZyjPTv4GGx0vlLWKsqQvmzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GaaRf/rS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5bec4fc82b0so2118609a12.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Aug 2024 02:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723801112; x=1724405912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ALCyVUvADEycqvBmVWJgnXOAnW1UV6OFc1I2ge5Btys=;
        b=GaaRf/rSMx0nMmUiDSg7iTjw0uQgoMebq1hfQTgij5dTkc3Tf+JE07Tri55E/8DDGL
         9oiGoxIGKX4DTBTl1IEHAs/Se9sDY5Nv70UfBRmvOZwoi77CkZg3aZ2Ecy7WBzJ2V5aI
         g4rcGQCYmc/5NVbdSQpIT/FtELKj9er8NWoSh1swAimWJv+l6HrVTy4eRatjEf98rUcq
         Mrl4EW0X+h64UxOZDp0L7bMskYOO+9bleSD4aKclhHpS442/KmWvE3xP+/jkWD9xOeUb
         BAXTatdLpkMAKET8lJEbBikGp+cv4HOtw7fHDhcm2vZh2mVEdv4522O4HP4kqJPA+T3S
         rc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723801112; x=1724405912;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALCyVUvADEycqvBmVWJgnXOAnW1UV6OFc1I2ge5Btys=;
        b=lPKEwynIZmQbMvQXeF4evnPt2k4xckXTZb7YXP4zwEZMuyZHKuPTcCd4vQYwylJ+Ms
         YhvF8OgLDgkHWZozCeHvTS9MBCnuMfgvAUXWsApclkE2SEvsWaHYzEDYQjEk9154IHDL
         ji02MTfdp8UQs0L3mtFlK2uPdnxH+hMtQ8y5bOF5cmNPEcR4XcqCQzUlzmOatHDURspn
         xh70hCZL0AaRcVb/NJ1+AFKqvbYzpBOd7e68ac+mVF8UCrKBMX3EyUUPe9kAdJOD63JB
         9SGArISoHRBWKdh9pkK1u45hIX9I8pecvEOU1QHoM9OIJQPM6JwNTz2F+s0tCTGfibpt
         yYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVEIJbbN6p/3B5SW7xdcSjWIYQU7heAdKureygqGna9Avbia9B/ou/uKE9MlQCuJF6kPrKoox4+Gcm1DNR0vTUrQ7pILl0A6mi
X-Gm-Message-State: AOJu0YzcP3iv/Qevh0x9dtT+FI/4JOHPkUyC8AEjOIIceeNK18e4oz0Y
	YNQv22XVDu1uc9NwSbFvRJ1WmKv8HsA4jrADTv50NBLEdcVo8N0pgMjlzPm89zI=
X-Google-Smtp-Source: AGHT+IE7OStDoG/vZludgrbKFErHeWmhqvPlg8I1Vlpj3pe30rqCybr7fVWmCvcjiGtFHUGfWMMu+Q==
X-Received: by 2002:a17:907:94d4:b0:a7a:8a38:9d99 with SMTP id a640c23a62f3a-a83951c5bb5mr144031666b.35.1723801111976;
        Fri, 16 Aug 2024 02:38:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf03csm227699566b.50.2024.08.16.02.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 02:38:31 -0700 (PDT)
Date: Fri, 16 Aug 2024 12:38:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	R Kannappan <r.kannappan@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
Message-ID: <2ae5c18e-9f43-47d6-9bc4-63da8d3d3da3@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813110135.2178900-5-mika.westerberg@linux.intel.com>

Hi Mika,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mika-Westerberg/thunderbolt-Add-missing-usb4_port_sb_read-to-usb4_port_sw_margin/20240815-001205
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20240813110135.2178900-5-mika.westerberg%40linux.intel.com
patch subject: [PATCH 4/4] thunderbolt: Improve software receiver lane margining
config: i386-randconfig-141-20240815 (https://download.01.org/0day-ci/archive/20240816/202408161041.jjzazHm4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202408161041.jjzazHm4-lkp@intel.com/

smatch warnings:
drivers/thunderbolt/debugfs.c:1014 margining_run_sw() error: uninitialized symbol 'errors'.

vim +/errors +1014 drivers/thunderbolt/debugfs.c

c0188291a5471b R Kannappan     2024-08-13   986  static int margining_run_sw(struct tb_margining *margining,
c0188291a5471b R Kannappan     2024-08-13   987  			    struct usb4_port_margining_params *params)
c0188291a5471b R Kannappan     2024-08-13   988  {
c0188291a5471b R Kannappan     2024-08-13   989  	u32 nsamples = margining->dwell_time / DWELL_SAMPLE_INTERVAL;
c0188291a5471b R Kannappan     2024-08-13   990  	u32 errors;
c0188291a5471b R Kannappan     2024-08-13   991  	int ret, i;
c0188291a5471b R Kannappan     2024-08-13   992  
c0188291a5471b R Kannappan     2024-08-13   993  	ret = usb4_port_sw_margin(margining->port, margining->target, margining->index,
c0188291a5471b R Kannappan     2024-08-13   994  				  params, margining->results);
c0188291a5471b R Kannappan     2024-08-13   995  	if (ret)
c0188291a5471b R Kannappan     2024-08-13   996  		goto out_stop;
c0188291a5471b R Kannappan     2024-08-13   997  
c0188291a5471b R Kannappan     2024-08-13   998  	for (i = 0; i <= nsamples; i++) {
c0188291a5471b R Kannappan     2024-08-13   999  		ret = usb4_port_sw_margin_errors(margining->port, margining->target,
c0188291a5471b R Kannappan     2024-08-13  1000  						 margining->index, &margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1001  		if (ret)
c0188291a5471b R Kannappan     2024-08-13  1002  			break;
c0188291a5471b R Kannappan     2024-08-13  1003  
c0188291a5471b R Kannappan     2024-08-13  1004  		if (margining->lanes == USB4_MARGIN_SW_LANE_0)
c0188291a5471b R Kannappan     2024-08-13  1005  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_0_MASK,
c0188291a5471b R Kannappan     2024-08-13  1006  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1007  		else if (margining->lanes == USB4_MARGIN_SW_LANE_1)
c0188291a5471b R Kannappan     2024-08-13  1008  			errors = FIELD_GET(USB4_MARGIN_SW_ERR_COUNTER_LANE_1_MASK,
c0188291a5471b R Kannappan     2024-08-13  1009  					   margining->results[1]);
c0188291a5471b R Kannappan     2024-08-13  1010  		else if (margining->lanes == USB4_MARGIN_SW_ALL_LANES)
c0188291a5471b R Kannappan     2024-08-13  1011  			errors = margining->results[1];

The static checker wants an else statement.

c0188291a5471b R Kannappan     2024-08-13  1012  
c0188291a5471b R Kannappan     2024-08-13  1013  		/* Any errors stop the test */
c0188291a5471b R Kannappan     2024-08-13 @1014  		if (errors)
c0188291a5471b R Kannappan     2024-08-13  1015  			break;
c0188291a5471b R Kannappan     2024-08-13  1016  
c0188291a5471b R Kannappan     2024-08-13  1017  		fsleep(DWELL_SAMPLE_INTERVAL * USEC_PER_MSEC);
c0188291a5471b R Kannappan     2024-08-13  1018  	}
c0188291a5471b R Kannappan     2024-08-13  1019  
c0188291a5471b R Kannappan     2024-08-13  1020  out_stop:
c0188291a5471b R Kannappan     2024-08-13  1021  	/*
c0188291a5471b R Kannappan     2024-08-13  1022  	 * Stop the counters but don't clear them to allow the
c0188291a5471b R Kannappan     2024-08-13  1023  	 * different error counter configurations.
c0188291a5471b R Kannappan     2024-08-13  1024  	 */
c0188291a5471b R Kannappan     2024-08-13  1025  	margining_modify_error_counter(margining, margining->lanes,
c0188291a5471b R Kannappan     2024-08-13  1026  				       USB4_MARGIN_SW_ERROR_COUNTER_STOP);
c0188291a5471b R Kannappan     2024-08-13  1027  	return ret;
c0188291a5471b R Kannappan     2024-08-13  1028  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


