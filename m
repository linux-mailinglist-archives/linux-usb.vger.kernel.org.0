Return-Path: <linux-usb+bounces-8479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932188E7A7
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 16:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC4AE1F328EC
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BD212D77B;
	Wed, 27 Mar 2024 14:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVGj+uBl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE22433AA
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 14:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711548899; cv=none; b=KHOMzzHGLHasLbBcwXkOLX/y+0RzIbj4Xbx4TpOBjOyLTGD2f0ReFtJCHSVmBoAh3fGh8EYqZJBjQ64vjOW+IJ1tuH5weAk0l76vLMmhF819bEW/fXVdsq14+U/xOqqOafTtLOwtHQMz3/VkYefFMnkTpkafQ8Wr6OVsO/CF1MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711548899; c=relaxed/simple;
	bh=2YDDMinx6qNThn/yNq7jZ54gbXreVSj4ebhOv4Ggf0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nZYACrYi0IzzpCfYMHT9Uf/uQxIJXNDpIlwknIrQVlABzJF6rt8sK2c0mtx+OgDApu7VOvI29AUH20IAXJ4NuK/JA2FFcvorzsB4Pjnvu7q1WYwhQnydd90YtXGKmEvrCZInnqpRAkGyEdrOttVXwdw63oTVf/ZXpKpO4YQzx/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVGj+uBl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711548898; x=1743084898;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=2YDDMinx6qNThn/yNq7jZ54gbXreVSj4ebhOv4Ggf0E=;
  b=RVGj+uBlAN/BhQOxXS7dKscNiVw98GIOWG15CqdSBJuwMk5nOAN6q9vn
   7N4TZCb/3qAKS5VvaQimTuTXFq0Pt4xmavgLPSTKU4kDm2LpnjhnEgUHf
   iGtfTmTUqm6wFOmxtsZO4QOqZUEEiynFoQmOzktNJvJwEUWf7SN4aNgrw
   W4p9HRVXXRspim+fff3zNU7aLp8257zLZIpeTY5amzCn5V4/zZoknevU0
   hzWI6iAzUZd1B0UAez68K3vf54Y+vmwJ0pUQjg2OXWNkRvNRtoHlp0S5P
   N2JoC1i6hKqEakWPtKhY2QjmdhmZGc3F1KYQWNOnhfw7Tj712wgFH5Ou/
   A==;
X-CSE-ConnectionGUID: 3lVeDtzyQSOFUiavQb8ylw==
X-CSE-MsgGUID: DcKMmwhTRGKkLil2vslJAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="6590917"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="6590917"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 07:14:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="937074604"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="937074604"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2024 07:14:49 -0700
Message-ID: <14f764b4-5df4-d983-7d4a-cdbc4caafbc8@linux.intel.com>
Date: Wed, 27 Mar 2024 16:16:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH] usb: xhci: correct return value in case of STS_HCE
Content-Language: en-US
To: Oliver Neukum <oneukum@suse.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <20240327084136.29663-1-oneukum@suse.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20240327084136.29663-1-oneukum@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.3.2024 10.41, Oliver Neukum wrote:
> If we get STS_HCE we give up on the interrupt, but for the purpose
> of IRQ handling that still counts as ours. We may return IRQ_NONE
> only if we are positive that it wasn't ours. Hence correct the default.
> 
> Fixes: 2a25e66d676df ("xhci: print warning when HCE was set")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---

Thanks, added
-Mathias


