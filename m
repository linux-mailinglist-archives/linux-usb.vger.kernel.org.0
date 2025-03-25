Return-Path: <linux-usb+bounces-22069-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8102FA6EC69
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 10:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82D743B3B7B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 09:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFFE925484F;
	Tue, 25 Mar 2025 09:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g/I7qsIG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DE31D619F
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 09:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742894693; cv=none; b=WhTU6FMR1IZjU5xMrSRkcNMesr9h/dj/HUmPmH9q7qhMXzTLG2gNRIHT9krq3tfNfakn6c0aOQnAeV7QHxSc5kMI9xlV0PGFsxnCR/zsmJ4NF6XvehaXQBu1eYKeQ8VWXYqRhvq3hF4u7VvJVwpg+HXd5/sfPZZyCN4hoC+IzVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742894693; c=relaxed/simple;
	bh=RDgi8oUrYPzxq8I/3imAdzSYLiEZID1DXXJxuZZFr3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qTF8EuZGFJNDODmiKvdEjUbld8mEFV7p20CxVSzop2NQv7YgQcroRdn8ng0nyF64WZOgj++3KKhk/p7BS3f+Ypn/S9PspX0gt3K88rva0kb6sEtQXCSbZa0Nawao4snlLiTXoqC3k4s/fC68++2OLSJugVSiKsl04D9vy1Bbgw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g/I7qsIG; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3965c995151so2639635f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742894689; x=1743499489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86AzUTJ4+mEfJqZADF0whmQAVP0hg36bqJP63AG39wo=;
        b=g/I7qsIG9eEZo8eaf3zSSPxuEZ9Vnfhit3kPSkYQJgLT4QBOqNbn37TRnqDo7DKsk5
         R19JrDHLPB7xoUyLWctY0mupAT7SFhml9Gv6g0aLADEzpIlLxHJb66Xs84S5L7uEyPCK
         cEEL8jcf93kwtTQj5bpGTatPMKHk1Gfug5Xxvi7/LxYj/5g5pbc7qqhTOI1HYuh3+rXh
         aYc8qKlldAjF29CYr8TUTucRNIJ9PmcokrI74HLOFhuVCy/FgVeytSwnFZVSQHOrDFuh
         6PGBDN8wGtkjM0TKc14Iqy+IV0bRtUlBA5s9fz1bg70L8V22oOKbxxJaovhJuNYbxYuS
         rTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742894689; x=1743499489;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86AzUTJ4+mEfJqZADF0whmQAVP0hg36bqJP63AG39wo=;
        b=kuyEpcFmAos1CNZDMadtZ+c2uwMCZQqYtb86uIeHiiPhYOLHEdRhu2tQYELmfXcxGy
         MWeKv7G2DuTXIWr+U4jCbsee+6d8cGn1KuoRdtGr9BkFuEcS/XRFOWDIIKbsZxiR7mwO
         mEnQSucGpIzMeppWgzWdJU8FPzVQNHFL0tPaVbscEcUAjjkZNy5MGBA5Nhmn6olmV1gU
         3qK946JGdVVCLQPIEt3bvvViCB1mBWR89sKJzQfF6w7hfYYcaAdUPOuzmGixSNwVnSrX
         Ua2tXYBSApDouVM3mfTTXCopBDSr/Es0YQ+ugXgBelPQ2n/2DEBopqhHwGZwZN6w+uFp
         JXSA==
X-Forwarded-Encrypted: i=1; AJvYcCXqwCf2gzcb9pBjtXtCvzk433EfvnPHZ+7b8nYlZukBvaIM9iXjA1BwRZI1+97VaB2UEMf6MyQeRmI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVviFanes1OAD3kMv+tVCXWZYy+cLLKU2v52jDGTXvRjJYro2U
	5YygkbvWa+Bs9y4UhMDncactEtilr/6K+eQZBDGZB52aXvvQp3HBaObABLsZb0c=
X-Gm-Gg: ASbGncs4izO+PLOgNYR903tX2ex0ujM835SwNtZshyvGaWwhYxA20bmxEpDyr6WTBZp
	CuqR25VCV9Nz55TyTkvCncSu7OW0sFzTd6zQxtbzxyB0SsTCw8PdwWtatE/7rdJ2e2Jr5APhcYj
	Zn+5oPxJ0EnErVxbG+l1/Y2wMkjckDv8kphhqskzn56G31wqhTwOrcuX7QollwozCVcTdPdfA3u
	7Ih+/KE9TGfg6N/rPDLCg8bqYWOqoMGXrVJd9hmYXZ/gToxCknHbOI6/xxSDjVGUupl7V04AI3q
	wN5a9G75H/BtZ1wlhdfTi7IpZFmQ2um3RyOWCozM2xC+kCm//1tWKWeKYOT1LgIhbQ==
X-Google-Smtp-Source: AGHT+IH3278bGiz+UZjf2wAVfJw46AJiKS/mkdQDYD7N/oxrEgBXGJu9FDwxWA2QpMXJGkhHSIm5jA==
X-Received: by 2002:a05:6000:21c2:b0:399:6d53:68d9 with SMTP id ffacd0b85a97d-3997f939949mr10089874f8f.38.1742894688812;
        Tue, 25 Mar 2025 02:24:48 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:f88a:e8d5:82b:cbb5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b260fsm13004461f8f.43.2025.03.25.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 02:24:48 -0700 (PDT)
Date: Tue, 25 Mar 2025 10:24:42 +0100
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz,
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net,
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH v36 22/31] ASoC: qcom: qdsp6: Introduce USB AFE port to
 q6dsp
Message-ID: <Z-J2WnrZHP6iMIhT@linaro.org>
References: <20250319005141.312805-1-quic_wcheng@quicinc.com>
 <20250319005141.312805-23-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319005141.312805-23-quic_wcheng@quicinc.com>

On Tue, Mar 18, 2025 at 05:51:32PM -0700, Wesley Cheng wrote:
> The QC ADSP is able to support USB playback endpoints, so that the main
> application processor can be placed into lower CPU power modes.  This adds
> the required AFE port configurations and port start command to start an
> audio session.
> 
> Specifically, the QC ADSP can support all potential endpoints that are
> exposed by the audio data interface.  This includes isochronous data
> endpoints, in either synchronous mode or asynchronous mode. In the latter
> case both implicit or explicit feedback endpoints are supported.  The size
> of audio samples sent per USB frame (microframe) will be adjusted based on
> information received on the feedback endpoint.
> 
> Some pre-requisites are needed before issuing the AFE port start command,
> such as setting the USB AFE dev_token.  This carries information about the
> available USB SND cards and PCM devices that have been discovered on the
> USB bus.  The dev_token field is used by the audio DSP to notify the USB
> offload driver of which card and PCM index to enable playback on.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/soc/qcom/qdsp6/q6afe-dai.c         |  60 +++++++
>  sound/soc/qcom/qdsp6/q6afe.c             | 192 ++++++++++++++++++++++-
>  sound/soc/qcom/qdsp6/q6afe.h             |  36 ++++-
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  23 +++
>  sound/soc/qcom/qdsp6/q6dsp-lpass-ports.h |   1 +
>  sound/soc/qcom/qdsp6/q6routing.c         |  32 +++-
>  6 files changed, 341 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
> index 7d9628cda875..0f47aadaabe1 100644
> --- a/sound/soc/qcom/qdsp6/q6afe-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
> [...]
> @@ -513,12 +520,96 @@ struct afe_param_id_cdc_dma_cfg {
>  	u16	active_channels_mask;
>  } __packed;
>  
> +struct afe_param_id_usb_cfg {
> +/* Minor version used for tracking USB audio device configuration.
> + * Supported values: AFE_API_MINOR_VERSION_USB_AUDIO_CONFIG
> + */
> +	u32                  cfg_minor_version;
> +/* Sampling rate of the port.
> + * Supported values:
> + * - AFE_PORT_SAMPLE_RATE_8K
> + * - AFE_PORT_SAMPLE_RATE_11025
> + * - AFE_PORT_SAMPLE_RATE_12K
> + * - AFE_PORT_SAMPLE_RATE_16K
> + * - AFE_PORT_SAMPLE_RATE_22050
> + * - AFE_PORT_SAMPLE_RATE_24K
> + * - AFE_PORT_SAMPLE_RATE_32K
> + * - AFE_PORT_SAMPLE_RATE_44P1K
> + * - AFE_PORT_SAMPLE_RATE_48K
> + * - AFE_PORT_SAMPLE_RATE_96K
> + * - AFE_PORT_SAMPLE_RATE_192K
> + */
> +	u32                  sample_rate;
> +/* Bit width of the sample.
> + * Supported values: 16, 24
> + */
> +	u16                  bit_width;
> +/* Number of channels.
> + * Supported values: 1 and 2
> + */
> +	u16                  num_channels;
> +/* Data format supported by the USB. The supported value is
> + * 0 (#AFE_USB_AUDIO_DATA_FORMAT_LINEAR_PCM).
> + */
> +	u16                  data_format;
> +/* this field must be 0 */
> +	u16                  reserved;
> +/* device token of actual end USB audio device */
> +	u32                  dev_token;
> +/* endianness of this interface */
> +	u32                   endian;

Nitpick: The indentation between u32 and the struct field names is odd,
can you use a single tab character like in the afe_param_id_cdc_dma_cfg
instead?

> +/* service interval */
> +	u32                  service_interval;
> +} __packed;
> +
> + [...]
> diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> index 4919001de08b..4a96b11f7fd1 100644
> --- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> +++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
> @@ -97,6 +97,26 @@
>  	}
>  
>  static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
> +	{
> +		.playback = {
> +			.stream_name = "USB Playback",
> +			.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_11025 |
> +					SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_22050 |
> +					SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
> +					SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_96000 |
> +					SNDRV_PCM_RATE_192000,
> +			.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S16_BE |
> +					SNDRV_PCM_FMTBIT_U16_LE | SNDRV_PCM_FMTBIT_U16_BE |
> +					SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S24_BE |
> +					SNDRV_PCM_FMTBIT_U24_LE | SNDRV_PCM_FMTBIT_U24_BE,
> +			.channels_min = 1,
> +			.channels_max = 2,
> +			.rate_min =	8000,
> +			.rate_max = 192000,

Nitpick: Indentation after rate_max is also odd here, please choose one
of the styles, either

			.rate_min = 8000,

or

			.rate_max =     192000,

> +		},
> +		.id = USB_RX,
> +		.name = "USB_RX",
> +	},
>  	{
>  		.playback = {
>  			.stream_name = "HDMI Playback",
> [...]
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index 90228699ba7d..b7439420b425 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -435,6 +435,26 @@ static struct session_data *get_session_from_id(struct msm_routing_data *data,
>  
>  	return NULL;
>  }
> +
> +static bool is_usb_routing_enabled(struct msm_routing_data *data)
> +{
> +	int i;
> +
> +	/*
> +	 * Loop through current sessions to see if there are active routes
> +	 * to the USB_RX backend DAI.  The USB offload routing is designed
> +	 * similarly to the non offload path.  If there are multiple PCM
> +	 * devices associated with the ASoC platform card, only one active
> +	 * path can be routed to the USB offloaded endpoint.
> +	 */
> +	for (i = 0; i < MAX_SESSIONS; i++) {
> +		if (data->sessions[i].port_id == USB_RX)
> +			return true;
> +	}
> +
> +	return false;
> +}

What is different about USB_RX compared to other output ports we have in
Q6AFE? Obviously, we can only play one stream on an output port. But
doesn't the ADSP mix streams together when you have multiple routes?

Also, this doesn't actually check for *active* routes only. It just
looks if any other MultiMedia DAI is configured to output to USB_RX.
That doesn't mean they will ever be active at the same time.

I might for example want to have MultiMedia1 and MultiMedia2 both
configured to output to USB_RX. Let's assume MultiMedia1 is a normal PCM
DAI, MultiMedia2 is a compress offload DAI. When I want to playback
normal audio, I go through MultiMedia1, when I want to play compressed
audio, I go through MultiMedia2. Only one of them active at a time.
Why can't I set this up statically in the mixers?

If you confirm that it is really impossible to have multiple streams
mixed together to the USB_RX output in the ADSP, then this should be a
runtime check instead when starting the stream IMO.

> +
>  /**
>   * q6routing_stream_close() - Deregister a stream
>   *
> @@ -499,7 +519,8 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
>  	struct session_data *session = &data->sessions[session_id];
>  
>  	if (ucontrol->value.integer.value[0]) {
> -		if (session->port_id == be_id)
> +		if (session->port_id == be_id ||
> +		    (be_id == USB_RX && is_usb_routing_enabled(data)))
>  			return 0;
>  
>  		session->port_id = be_id;
> @@ -515,6 +536,9 @@ static int msm_routing_put_audio_mixer(struct snd_kcontrol *kcontrol,
>  	return 1;
>  }
>  
> +static const struct snd_kcontrol_new usb_mixer_controls[] = {

usb_rx_mixer_controls

> +	Q6ROUTING_RX_MIXERS(USB_RX) };
> +
>  static const struct snd_kcontrol_new hdmi_mixer_controls[] = {
>  	Q6ROUTING_RX_MIXERS(HDMI_RX) };
>  
> @@ -950,6 +974,10 @@ static const struct snd_soc_dapm_widget msm_qdsp6_widgets[] = {
>  	SND_SOC_DAPM_MIXER("MultiMedia8 Mixer", SND_SOC_NOPM, 0, 0,
>  		mmul8_mixer_controls, ARRAY_SIZE(mmul8_mixer_controls)),
>  
> +	SND_SOC_DAPM_MIXER("USB Mixer", SND_SOC_NOPM, 0, 0,
> +			   usb_mixer_controls,
> +			   ARRAY_SIZE(usb_mixer_controls)),

Please put this next to the other playback mixers above (below
"RX_CODEC_DMA_RX_7 Audio Mixer").

I think it would also be more clear if you call this "USB_RX Mixer"
instead for consistency with the other playback mixers. This would also
avoid confusion later when USB_TX is added in addition to USB_RX.


Are you planning to send follow-up patches for USB recording offload
(USB_TX) later? Me and Luca successfully used your series to playback
voice call audio via the ADSP to an USB headset, recording would be also
needed to use this fully. :-)

Thanks,
Stephan

