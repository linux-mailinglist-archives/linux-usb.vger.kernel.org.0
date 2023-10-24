Return-Path: <linux-usb+bounces-2129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D434E7D53F1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 16:25:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114421C20C6E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 14:25:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936732C87A;
	Tue, 24 Oct 2023 14:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmHpGf89"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738582C85D;
	Tue, 24 Oct 2023 14:25:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B6910C2;
	Tue, 24 Oct 2023 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698157527; x=1729693527;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WwFLxwlK3z/Xf+xApxGXXQp0naSbrNazBZ+qab2Rats=;
  b=gmHpGf89MAx2L7Vt495UY3aWAv33slfUsIkh0B7egGZ/CHcg5/mpREQ9
   b1579gtbAv23yPC5NkKsnSC+8bbvxetAdYx0sCDm/W0lA+Njlypqk04AJ
   qLYMRB3eMZJdQyZJk27LC21hGH3Rv0QVpz5NMBYQy/nhU7+/IDMCGX5sO
   bBfbRf+WhjEedrIsRLeIhg5esBVJtCZLcLgcQfabz79nRc2MNGl7z2ods
   aIM7BOic+hXzzRFEHbizFCtn8rnt3CzXdMzyNB8GIRXNO/6fxrWgWoUZz
   ZtzGyXqNQAy0CDKx9CrorLkiWFpj8p2gNpxP6jjVehFigOQkap1SE/7e0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="386873937"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="386873937"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 07:25:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="758491622"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="758491622"
Received: from pwali-mobl.amr.corp.intel.com (HELO [10.209.188.4]) ([10.209.188.4])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 07:25:24 -0700
Message-ID: <efa9cdd0-4e5b-4b54-a4ea-7ec735224f44@linux.intel.com>
Date: Tue, 24 Oct 2023 08:35:06 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 34/34] ASoC: usb: Rediscover USB SND devices on USB
 port add
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
 <b503058d-e23f-4a63-99b8-f0a62b2a2557@linux.intel.com>
 <6409c486-7393-4352-489c-ecd488597c4c@quicinc.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <6409c486-7393-4352-489c-ecd488597c4c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/23/23 16:54, Wesley Cheng wrote:
> Hi Pierre,
> 
> On 10/17/2023 4:11 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 10/17/23 15:01, Wesley Cheng wrote:
>>> In case the USB backend device has not been initialized/probed, USB SND
>>> device connections can still occur.  When the USB backend is eventually
>>> made available, previous USB SND device connections are not
>>> communicated to
>>> the USB backend.  Call snd_usb_rediscover_devices() to generate the
>>> connect
>>> callbacks for all USB SND devices connected.  This will allow for the
>>> USB
>>> backend to be updated with the current set of devices available.
>>>
>>> The chip array entries are all populated and removed while under the
>>> register_mutex, so going over potential race conditions:
>>>
>>> Thread#1:
>>>    q6usb_component_probe()
>>>      --> snd_soc_usb_add_port()
>>>        --> snd_usb_rediscover_devices()
>>>          --> mutex_lock(register_mutex)
>>>
>>> Thread#2
>>>    --> usb_audio_disconnect()
>>>      --> mutex_lock(register_mutex)
>>>
>>> So either thread#1 or thread#2 will complete first.  If
>>>
>>> Thread#1 completes before thread#2:
>>>    SOC USB will notify DPCM backend of the device connection.  Shortly
>>>    after, once thread#2 runs, we will get a disconnect event for the
>>>    connected device.
>>>
>>> Thread#2 completes before thread#1:
>>>    Then during snd_usb_rediscover_devices() it won't notify of any
>>>    connection for that particular chip index.
>> Looks like you are assuming the regular USB audio stuff is probed first?
>>
>> What if it's not the case? Have you tested with a manual 'blacklist' and
>> "modprobe" sequence long after all the DSP stuff is initialized?
>>
>> It really reminds me of audio+display issues, and the same opens apply
>> IMHO.
> 
> Not necessarily...if the USB audio driver is not probed, then that is
> the same scenario as when there is no USB audio capable device plugged
> in, while the offload path is waiting for the connect event. I think
> this is the standard scenario.
> 
> In the situation where the platform sound card hasn't probed yet and USB
> audio devices are being identified, then that is basically the scenario
> that would be more of an issue, since its USB SND that notifies of the
> connection state (at the time of connect/disconnect).

Not following if this scenario is covered?

> I've tried with building these drivers as modules and probing them at
> different times/sequences, and I haven't seen an issue so far.

The scenario I have in mind is this:

the platform driver is on the deny list, the USB driver detects a
device. When the platform driver probes at a later time (with a manual
modprobe to make delays really long), how would the notification be handled?

Between audio and display, we use the 'drm_audio_component' layer to
model these sort of run-time binding between independent driver stacks.
It's not used here but we need a moral equivalent, don't we?

It would really help if you documented a bit more the dependencies or
timing assumptions, to make sure we have a stable solution to build on.


