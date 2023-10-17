Return-Path: <linux-usb+bounces-1831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C72CB7CD0A9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 01:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82026281AF2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 23:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1E33FE25;
	Tue, 17 Oct 2023 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dwiBqsLe"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E23C08F;
	Tue, 17 Oct 2023 23:23:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1A5C134;
	Tue, 17 Oct 2023 16:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585013; x=1729121013;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=xwQ0iV/rBOQYg8kGL3cqHi/fxn3tom61XgY6fDIexWM=;
  b=dwiBqsLe6z+g5ULiSf7+jnbg8yc92HCSZXMa7pkVZS4kmqGB5cook92D
   V4dxiAwQTeP0ZfqMSuXOuc2uV8OoPaotnPrLCl9OfvdCWtB72jDOcfS3T
   zy0X7tnD6SS63jHsgSd1nBvLfB9S2fcPrfJBZA1TLjVEzU3WJqSqm47GI
   htrZDnr6IexVAGwZDBKmB5IArS17u+g9U9tc52MdqFQD0mkIIUUva5Vl4
   a9lB7FFBAtEHF/zADTPqNuQXIel8DNNkcz5S9hstWrLzkKsW6hslz8Eu8
   0Qxl4uCpjxOaLwEPoDITfpiwFPj49bwY9ii5uvZcJBTk0t6clE+yC+5YL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778247"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384778247"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637527"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="826637527"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179]) ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:31 -0700
Message-ID: <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
Date: Tue, 17 Oct 2023 18:11:57 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 34/34] ASoC: usb: Rediscover USB SND devices on USB
 port add
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-35-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-35-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/17/23 15:01, Wesley Cheng wrote:
> In case the USB backend device has not been initialized/probed, USB SND
> device connections can still occur.  When the USB backend is eventually
> made available, previous USB SND device connections are not communicated to
> the USB backend.  Call snd_usb_rediscover_devices() to generate the connect
> callbacks for all USB SND devices connected.  This will allow for the USB
> backend to be updated with the current set of devices available.
> 
> The chip array entries are all populated and removed while under the
> register_mutex, so going over potential race conditions:
> 
> Thread#1:
>   q6usb_component_probe()
>     --> snd_soc_usb_add_port()
>       --> snd_usb_rediscover_devices()
>         --> mutex_lock(register_mutex)
> 
> Thread#2
>   --> usb_audio_disconnect()
>     --> mutex_lock(register_mutex)
> 
> So either thread#1 or thread#2 will complete first.  If
> 
> Thread#1 completes before thread#2:
>   SOC USB will notify DPCM backend of the device connection.  Shortly
>   after, once thread#2 runs, we will get a disconnect event for the
>   connected device.
> 
> Thread#2 completes before thread#1:
>   Then during snd_usb_rediscover_devices() it won't notify of any
>   connection for that particular chip index.
Looks like you are assuming the regular USB audio stuff is probed first?

What if it's not the case? Have you tested with a manual 'blacklist' and
"modprobe" sequence long after all the DSP stuff is initialized?

It really reminds me of audio+display issues, and the same opens apply IMHO.

