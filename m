Return-Path: <linux-usb+bounces-1830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D07CD0A7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 01:24:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 237731C20842
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 23:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AFB33FE21;
	Tue, 17 Oct 2023 23:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMLPl3ET"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2CA2F525;
	Tue, 17 Oct 2023 23:23:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14AA812C;
	Tue, 17 Oct 2023 16:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585012; x=1729121012;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Jfwi6zOwIf92FmGVyVBCRV0UI9mYK0d0yD+xgDrknf4=;
  b=bMLPl3ETKVpRqctlX69LJH1HV9FfevBy10c1ZGc+mZ3tl12cU11JYSpE
   dfQa5tnxM9C99ohsrHJ2iG2nbDs8Zy4se2XBJeKBaPXPVOht6XtO+/OmS
   +a4WrdnlpHKrDAxfuEidU5E6/TdGxnfokEhmnhdRpIx+1ohqkhBS5H8tR
   3g286j63i6hvZBc0z8eLIsXleHozhXWiFkDMAGoOktUKrs5rnBo5DSrqG
   9u8RvjF7ZgDqxfQMAAxs5XevCSCAIxvHtq8LN+8NNaXhg+RGkD75yIR7R
   9ZoAA+7QcToCJ2BjvfCXiKgremac72KrFiDEO47kD28/bM3QJuEoYD2Gq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778235"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="384778235"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637523"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="826637523"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179]) ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:23:30 -0700
Message-ID: <97c16b75-1277-41f1-a0b6-293e76dbcb7f@linux.intel.com>
Date: Tue, 17 Oct 2023 18:07:15 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 33/34] ALSA: usb-audio: Allow for rediscovery of
 connected USB SND devices
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
 <20231017200109.11407-34-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-34-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net



On 10/17/23 15:01, Wesley Cheng wrote:
> In case of notifying SND platform drivers of connection events, some of
> these use cases, such as offloading, require an ASoC USB backend device to
> be initialized before the events can be handled.  If the USB backend device
> has not yet been probed, this leads to missing initial USB audio device
> connection events.
> 
> Expose an API that traverses the usb_chip array for connected devices, and
> to call the respective connection callback registered to the SND platform
> driver.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/card.c | 19 +++++++++++++++++++
>  sound/usb/card.h |  2 ++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 88f431917c15..7d3f470754ca 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -202,6 +202,25 @@ struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  }
>  EXPORT_SYMBOL_GPL(snd_usb_find_suppported_substream);
>  
> +/*
> + * in case the platform driver was not ready at the time of USB SND
> + * device connect, expose an API to discover all connected USB devices
> + * so it can populate any dependent resources/structures.

it's really unclear how the "platform driver was not ready at the time
of USB SND device connect" condition can be detected. It's my
understanding that we should never assume any specific order or timing
on platform driver probes. And things should also work if a driver is
unbound.

> + */
> +void snd_usb_rediscover_devices(void)
> +{
> +	int i;
> +
> +	mutex_lock(&register_mutex);
> +	for (i = 0; i < SNDRV_CARDS; i++) {
> +		if (usb_chip[i])
> +			if (platform_ops && platform_ops->connect_cb)
> +				platform_ops->connect_cb(usb_chip[i]);
> +	}
> +	mutex_unlock(&register_mutex);
> +}
> +EXPORT_SYMBOL_GPL(snd_usb_rediscover_devices);
> +
>  /*
>   * disconnect streams
>   * called from usb_audio_disconnect()
> diff --git a/sound/usb/card.h b/sound/usb/card.h
> index 01f7e10f30f4..c0aeda17ed69 100644
> --- a/sound/usb/card.h
> +++ b/sound/usb/card.h
> @@ -221,11 +221,13 @@ int snd_usb_unregister_platform_ops(void);
>  #if IS_ENABLED(CONFIG_SND_USB_AUDIO)
>  struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  			struct snd_pcm_hw_params *params, int direction);
> +void snd_usb_rediscover_devices(void);
>  #else
>  static struct snd_usb_stream *snd_usb_find_suppported_substream(int card_idx,
>  			struct snd_pcm_hw_params *params, int direction)
>  {
>  	return NULL;
>  }
> +static void snd_usb_rediscover_devices(void) { }
>  #endif /* IS_ENABLED(CONFIG_SND_USB_AUDIO) */
>  #endif /* __USBAUDIO_CARD_H */

