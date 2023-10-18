Return-Path: <linux-usb+bounces-1817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FA7CD073
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 01:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 498A6B212D0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 23:23:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0338D2F528;
	Tue, 17 Oct 2023 23:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6gqk0r0"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5352F516;
	Tue, 17 Oct 2023 23:23:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85EDB92;
	Tue, 17 Oct 2023 16:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697584992; x=1729120992;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=6FmwvcvajV2f7h9b1CWlPuCramAFAdJ8bLbyZrG1pSM=;
  b=T6gqk0r0oII06ao6mDXuj/5dqq1pEeFAfbxZA+pOwvEzfdzIoj9qlVRF
   JZSjPQ7tX+/JCsYg0l9AIsNxDuFQnSyUwRQIzaMvGewZZCLvcCPI+flOi
   mqDcpJk1AqtEPXcYu5wMqQi9ud9bZMQkjWUjI+ORcKw0WrnkrTm5Q5ixf
   rvuMtpS21xfA+Yz7SWVGBMHJEd5rs0aYx3x+t/lOHCRxYmRfFxJu6G0aA
   SuX2bh9XQ8qtSfbtN9UdPjW6/YBebIcrjbqf01FVppkrpm/zg+DFAMy8c
   yroJfWP0/LJtkpXYMWtTFSva3xQYWi/Tu7dGt73ogFsZ8CqGpftaL9Xic
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778015"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384778015"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637427"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="826637427"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179]) ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:10 -0700
Message-ID: <9942bb93-31ea-4574-940f-98d87a2fc127@linux.intel.com>
Date: Tue, 17 Oct 2023 15:58:20 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/34] Introduce QC USB SND audio offloading support
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
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-1-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

It's been a very long time since I reviewed earlier versions, and I am
still lost on terminology and concepts. The explanations below should
really be added as a .rst file in Documentation for reference, not just
as a cover letter.

> Several Qualcomm based chipsets can support USB audio offloading to a
> dedicated audio DSP, which can take over issuing transfers to the USB
> host controller.  The intention is to reduce the load on the main
> processors in the SoC, and allow them to be placed into lower power modes.
> There are several parts to this design:
>   1. Adding ASoC binding layer
>   2. Create a USB backend for Q6DSP

"backend" is a loaded terms for ASoC. Can you clarify which part of the
ascii art below is a 'backend'?

>   3. Introduce XHCI interrupter support
>   4. Create vendor ops for the USB SND driver
> 
>       USB                          |            ASoC
> --------------------------------------------------------------------
>                                    |  _________________________
>                                    | |sm8250 platform card     |
>                                    | |_________________________|
>                                    |         |           |
>                                    |      ___V____   ____V____
>                                    |     |Q6USB   | |Q6AFE    |  
>                                    |     |"codec" | |"cpu"    |
>                                    |     |________| |_________|
>                                    |         ^  ^        ^
>                                    |         |  |________|
>                                    |      ___V____    |
>                                    |     |SOC-USB |   |
>    ________       ________               |        |   |
>   |USB SND |<--->|QC offld|<------------>|________|   |
>   |(card.c)|     |        |<----------                |
>   |________|     |________|___     | |                |
>       ^               ^       |    | |    ____________V_________
>       |               |       |    | |   |APR/GLINK             |
>    __ V_______________V_____  |    | |   |______________________|
>   |USB SND (endpoint.c)     | |    | |              ^
>   |_________________________| |    | |              |
>               ^               |    | |   ___________V___________
>               |               |    | |->|audio DSP              |
>    ___________V_____________  |    |    |_______________________|
>   |XHCI HCD                 |<-    |
>   |_________________________|      |
> 
> 
> Adding ASoC binding layer:
> soc-usb: Intention is to treat a USB port similar to a headphone jack.

What is a 'port'? USB refers to "interfaces" and "endpoints". Is a
"port" a 1:1 mapping to "endpoint"?

Below I read "AFE port" so not sure what concepts refer to what.

> The port is always present on the device, but cable/pin status can be
> enabled/disabled.  Expose mechanisms for USB backend ASoC drivers to
> communicate with USB SND.
> 
> Create a USB backend for Q6DSP:
> q6usb: Basic backend driver that will be responsible for maintaining the

The asciiart above suggests that q6usb exposes a codec DAI - but the
backend dailink is created by the platform card?

> resources needed to initiate a playback stream using the Q6DSP.  Will

is capture supported? there's explicit references to "num_capture" in
following patches.

> be the entity that checks to make sure the connected USB audio device
> supports the requested PCM format.  If it does not, the PCM open call will
> fail, and userpsace ALSA can take action accordingly.
> 
> Introduce XHCI interrupter support:
> XHCI HCD supports multiple interrupters, which allows for events to be routed
> to different event rings.  This is determined by "Interrupter Target" field
> specified in Section "6.4.1.1 Normal TRB" of the XHCI specification.
> 
> Events in the offloading case will be routed to an event ring that is assigned
> to the audio DSP.
> 
> Create vendor ops for the USB SND driver:
> qc_audio_offload: This particular driver has several components associated
> with it:
> - QMI stream request handler
> - XHCI interrupter and resource management
> - audio DSP memory management
> 
> When the audio DSP wants to enable a playback stream, the request is first
> received by the ASoC platform sound card.  Depending on the selected route,
> ASoC will bring up the individual DAIs in the path.  The Q6USB backend DAI
> will send an AFE port start command (with enabling the USB playback path), and
> the audio DSP will handle the request accordingly.

what about capture, e.g. for a headset?

> Part of the AFE USB port start handling will have an exchange of control
> messages using the QMI protocol.  The qc_audio_offload driver will populate the
> buffer information:
> - Event ring base address
> - EP transfer ring base address
> 
> and pass it along to the audio DSP.  All endpoint management will now be handed
> over to the DSP, and the main processor is not involved in transfers.
> 
> Overall, implementing this feature will still expose separate sound card and PCM
> devices for both the platorm card and USB audio device:

typo: platform

>  0 [SM8250MTPWCD938]: sm8250 - SM8250-MTP-WCD9380-WSA8810-VA-D
>                       SM8250-MTP-WCD9380-WSA8810-VA-DMIC

How do you plan on exposing the USB PCM device?

The lines above are really cryptic, and with no USB reference in any of
the short/long card names it's not obvious that this card is different
from the no-offload case, is it?

>  1 [Audio          ]: USB-Audio - USB Audio
>                       Generic USB Audio at usb-xhci-hcd.1.auto-1.4, high speed

likewise some sort of qualifier would be useful to show that card 0 and
card 1 can target the same USB endpoints.

> This is to ensure that userspace ALSA entities can decide which route to take
> when executing the audio playback.  In the above, if card#1 is selected, then
> USB audio data will take the legacy path over the USB PCM drivers, etc...
> 
> This feature was validated using:
> - tinymix: set/enable the multimedia path to route to USB backend
> - tinyplay: issue playback on platform card

