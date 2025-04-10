Return-Path: <linux-usb+bounces-22878-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E5FA839A6
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 08:44:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D13B3A42D7
	for <lists+linux-usb@lfdr.de>; Thu, 10 Apr 2025 06:41:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF044204582;
	Thu, 10 Apr 2025 06:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKOfMOT3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AC02040BC
	for <linux-usb@vger.kernel.org>; Thu, 10 Apr 2025 06:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744267309; cv=none; b=kosN0mZBmug7dwTipOYcc49QDg+NEWjz+JL5nuTKM6q3r+LqhO+9VZt2tYOaUDTcUy0ucPJvJYhmvc5EQV9B2WOAbAUN/9DDB3QB4F5D7aO3UjSGkz7HKkBmyShdT6o/EE55bvtolKzX5pYZj+rcuttRZ4STAEUBDq5ey9QOngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744267309; c=relaxed/simple;
	bh=eKWdlsR+gZq/WMnwiDfDDPjy/aOdQaKP5Tog0oX8hXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2Cb88mXuKumBx64nBTjBGptMjj2spt5QLUkDqsU4Xi3hX0DFfsgp0bFPelMh4tf1n+e+8aJjszq+4UWtKVDSR/SSCvkkQjFSBYe+U79DIv4QaxsqE8iK8XG8XBiLbwR5nB6WNw0e/Juhoj64dRP/DoLndKfAoC5A2SJoY6lYQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKOfMOT3; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a9a74d9cso87676266b.1
        for <linux-usb@vger.kernel.org>; Wed, 09 Apr 2025 23:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744267306; x=1744872106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbl05XNjXwXIwA7PmbRBkyTSHc10MQi0pg5RfqUxRjQ=;
        b=dKOfMOT3zf19q3/SaMp71AMOwSWNO+Nymp479U1orkzGBNoTOt6WawgFtJ6autr5QO
         EESJW7gb6g59d1iRQ2+BPF2n63YmmYpo9hJfAH9Hvc/9n3uoZoeb/AwD32pmzxpBsHws
         eV2yZM6VnR78EFytfqT/yyBBms9rJ0p7Blo0ZJ0eiODVswhjE3reinDNrEiNIVZVwWF7
         zMNAk9xdevU4bRWduYuOu5Gv2Kx0DVOvYWSdMJY8oznb8N4ELKGxFEpts/SwsLaa/Xhu
         u9fxOhvRYoO8OHI7O6U/6HDCqVsdLgLsfg9Xfs/due7Vbt5NgDBp8AHTr5SHKQd0EbZt
         9vgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744267306; x=1744872106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sbl05XNjXwXIwA7PmbRBkyTSHc10MQi0pg5RfqUxRjQ=;
        b=kQ4pR5veVbEjLJsulboxPPZKk3mtmFdwrfuT/0LQs892FL42i2sKmLnEbGWGCXJf5P
         Pr5v2vc0CMwt52yXtVVBDIvoAZ0/vWVxjuK6zF5ifVXkVHY9xehaerhUnzXUeW0Qn+Tg
         uyyfHGp34jM9a9EwDjgPBkHZtzEYEpP9na+Uf11VXZW+qBFwdB7H/4yB4C2wWENwThmU
         hu7u2qsMXv8DssA/w5QnxKUEhnnKvEMORB1Vk+1PG3tFK7pI6CS6hLEcBqYLrE8ISgXy
         HzuCDAgIpH49iKPyMZX20ylDnBjEFHAWnyZTiWzbZeD3t1kTrjqSj84giZAc7j0w3dyd
         Gg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW404l3GGUHag9EHJH2SGolyEXr1dt9ebsq0DQuITW+rywpm7a60hOdi1SQTMvQUvyR67dOulVsPpo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn3k0Hcdz0XftNd2f5/hFmDiaOmKRALyp2tRi8xIfefV0ryVJ9
	iIoFWLpVCItuzaK0ei8H34TOXppWx4Dpva9zogSPl54W9qUL+M0UPWN38EK8ols=
X-Gm-Gg: ASbGncuWOlwamvL4nJfSA/YN/lMGmfBNTz4A7N6qInZT1KwZ+z0RFerY8NM1/XBLV91
	T/n9mjHk5G7/T3nLo5be7O9+FP6hMt+ObhmoC9gIQDRZSNkdvheKu55bTOByDf3kVo/OQ0K2vEc
	kZBjK4PopDmpZ23BB3OYlZ/XvmiEYiOuT6k5bzI6vG7IR9E5PWUY/nfMvSlh1hNIklRJDF0FEuK
	ckkkmXSuTVVs6juSPopMWoF8F5I1dfuY7SgXcCbp+QXxBSW1XZjX85bstytvIvwdrYGhVU6ZHLu
	RyDiQJIP2Rp6p/UkTp0YWG4LV7Ja3KUoKi9rJpQRG8SrVJsLUbwbR5ATxhXtHw==
X-Google-Smtp-Source: AGHT+IGIijzSQTIvNZFHk1vd6j481tQc4BPdHGyE68UEhUubBExhKjE2Tspefm3pBMUpCnsjgm2sQw==
X-Received: by 2002:a17:907:3cc3:b0:ac3:afb1:dee7 with SMTP id a640c23a62f3a-acabd20d17dmr128884466b.28.1744267305615;
        Wed, 09 Apr 2025 23:41:45 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:ae8a:4fb8:9c71:6be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9632sm221324866b.66.2025.04.09.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:41:45 -0700 (PDT)
Date: Thu, 10 Apr 2025 08:41:40 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
	krzk+dt@kernel.org, pierre-louis.bossart@linux.intel.com,
	Thinh.Nguyen@synopsys.com, tiwai@suse.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 26/31] ASoC: qcom: qdsp6: Fetch USB offload mapped
 card and PCM device
Message-ID: <Z_doJMXjSFHt6eAp@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <20250409194804.3773260-27-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409194804.3773260-27-quic_wcheng@quicinc.com>

On Wed, Apr 09, 2025 at 12:47:59PM -0700, Wesley Cheng wrote:
> The USB SND path may need to know how the USB offload path is routed, so
> that applications can open the proper sound card and PCM device.  The
> implementation for the QC ASoC design has a "USB Mixer" kcontrol for each

Is this "USB_RX Audio Mixer" now?

> possible FE (Q6ASM) DAI, which can be utilized to know which front end link
> is enabled.
> 
> When an application/userspace queries for the mapped offload devices, the
> logic will lookup the USB mixer status though the following path:
> 
> MultiMedia* <-> MM_DL* <-> USB Mixer*

^

> 
> The "USB Mixer" is a DAPM widget, and the q6routing entity will set the

^

> DAPM connect status accordingly if the USB mixer is enabled.  If enabled,
> the Q6USB backend link can fetch the PCM device number from the FE DAI
> link (Multimedia*).  With respects to the card number, that is
> straightforward, as the ASoC components have direct references to the ASoC
> platform sound card.
> 
> An example output can be shown below:
> 
> Number of controls: 9
> name                                    value
> Capture Channel Map                     0, 0 (range 0->36)
> Playback Channel Map                    0, 0 (range 0->36)
> Headset Capture Switch                  On
> Headset Capture Volume                  1 (range 0->4)
> Sidetone Playback Switch                On
> Sidetone Playback Volume                4096 (range 0->8192)
> Headset Playback Switch                 On
> Headset Playback Volume                 20, 20 (range 0->24)
> USB Offload Playback Route PCM#0        0, 1 (range -1->255)
> 
> The "USB Offload Playback Route PCM#*" kcontrol will signify the
> corresponding card and pcm device it is offload to. (card#0 pcm - device#1)
> If the USB SND device supports multiple audio interfaces, then it will
> contain several PCM streams, hence in those situations, it is expected
> that there will be multiple playback route kcontrols created.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6usb.c | 98 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 98 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 6634e132787e..274c251e84dd 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -134,6 +134,103 @@ static int q6usb_audio_ports_of_xlate_dai_name(struct snd_soc_component *compone
>  	return ret;
>  }
>  
> +static int q6usb_get_pcm_id_from_widget(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +	struct snd_soc_dai *dai;
> +
> +	for_each_card_rtds(w->dapm->card, rtd) {
> +		dai = snd_soc_rtd_to_cpu(rtd, 0);
> +		/*
> +		 * Only look for playback widget. RTD number carries the assigned
> +		 * PCM index.
> +		 */
> +		if (dai->stream[0].widget == w)
> +			return rtd->id;
> +	}
> +
> +	return -1;
> +}
> +
> +static int q6usb_usb_mixer_enabled(struct snd_soc_dapm_widget *w)
> +{
> +	struct snd_soc_dapm_path *p;
> +
> +	/* Checks to ensure USB path is enabled/connected */
> +	snd_soc_dapm_widget_for_each_sink_path(w, p)
> +		if (!strcmp(p->sink->name, "USB Mixer") && p->connect)
> +			return 1;

I assume this also needs to be changed. Please make sure you test the
series again. :)

> +
> +	return 0;
> +}
> +
> +static int q6usb_get_pcm_id(struct snd_soc_component *component)
> +{
> +	struct snd_soc_dapm_widget *w;
> +	struct snd_soc_dapm_path *p;
> +	int pidx;
> +
> +	/*
> +	 * Traverse widgets to find corresponding FE widget.  The DAI links are
> +	 * built like the following:
> +	 *    MultiMedia* <-> MM_DL* <-> USB Mixer*

^

Thanks,
Stephan

