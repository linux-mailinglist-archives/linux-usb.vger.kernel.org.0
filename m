Return-Path: <linux-usb+bounces-1981-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2B47D1079
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 15:24:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 58842282358
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 13:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FE31BDD4;
	Fri, 20 Oct 2023 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qmk8fTcm"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE178F5A;
	Fri, 20 Oct 2023 13:24:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E29D1A4;
	Fri, 20 Oct 2023 06:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697808279; x=1729344279;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=n9FPj37TUa187KHzBLooUs4gDeQupW8sJoyGo3Mm6Yw=;
  b=Qmk8fTcmjSTcbH4EFYwbONXXjDCTedR0dul8UCdtq5mBcz1kGOoj/Gnq
   BKXyA0EZaHgGHhZMq7s4l/csWCAY2+5B/8Pj9Y27m4vSdce5Jplqk0gGx
   Yq8R1t8KaDbUKj4y0KymajqcmFVtnPz1KeGrtl9UBnOS++WmPyf/MStTn
   ClhlzWEmOTW+MtE83KTBiRhDfZGLJ2dEyHY3hdpOtsFB/UGoUkShfg46r
   VR81AY4UlXeO22T01IniXHOtS/8f/I071r6x64BKs2169hiG6iRarH4RD
   WTKq0VJlNGnqY81sfHKHIStlZHY4IFVIlD3von5FaoYOTYvYp2/MSE1OK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="385372627"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="385372627"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="881083831"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; 
   d="scan'208";a="881083831"
Received: from mtadesse-mobl.amr.corp.intel.com (HELO [10.209.140.77]) ([10.209.140.77])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 06:24:37 -0700
Message-ID: <1840ba70-279b-499a-ad42-e7659a9a6ad1@linux.intel.com>
Date: Thu, 19 Oct 2023 15:39:26 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 30/34] ASoC: qcom: qdsp6: Add SND kcontrol for fetching
 offload status
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
 <20231017200109.11407-31-quic_wcheng@quicinc.com>
 <92971bbf-b890-4e41-8ef1-9213e15d81b2@linux.intel.com>
 <c9c5f13f-b3e7-6591-f277-cd86162152e4@quicinc.com>
 <2e300bef-3722-8b00-2bdf-e9386796f38f@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <2e300bef-3722-8b00-2bdf-e9386796f38f@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>>> Add a kcontrol to the platform sound card to fetch the current offload
>>>> status.  This can allow for userspace to ensure/check which USB SND
>>>> resources are actually busy versus having to attempt opening the USB
>>>> SND
>>>> devices, which will result in an error if offloading is active.
>>>
>>> I think I mentioned this a while back, but why not add the status in the
>>> USB card itself? That's a generic component that all userspace agent
>>> could query. Having a QCOM-specific control doesn't make the life of
>>> userspace easier IMHO.
>>>
>>>
>>
>> Will take a look at this based on the comments you had in the other
>> kcontrol patch.  Seeing if we can move it to a more generic layer.
>>
> 
> I think it would make more sense to see if we can keep all the offload
> kcontrols under the sound card exposed by the platform.  Especially, if
> we are going to modify the components string of the card to signify that
> it supports USB offload.

A two-way relationship would be ideal, i.e.
- the USB card has an indicator that it's currently bound with another
"platform" card that offers optimized offloaded capabilities.
- the platform card has a indicator that it exposes one or more PCM
devices routed to the USB card endpoint.

Android/HAL would typically start with the latter while other more
generic solutions would start from the former.

