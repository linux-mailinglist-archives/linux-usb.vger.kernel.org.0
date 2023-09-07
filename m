Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40048797631
	for <lists+linux-usb@lfdr.de>; Thu,  7 Sep 2023 18:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237013AbjIGQEe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Sep 2023 12:04:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236306AbjIGQDy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Sep 2023 12:03:54 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DD795FD0;
        Thu,  7 Sep 2023 08:52:44 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id C27FE21862;
        Thu,  7 Sep 2023 15:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1694101893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tk3J/weePsTr2+puEZaryztfMldIRsL7MjS11xHNPq4=;
        b=MG/RWiixzRUD5n21QY2yXLKv/zxycwe2jvwvqsZhnjyl0H7FMWmzreTziH5v3xUpVO2ST2
        yu4FWXTNDRNIKjs3oZrJrIlUYo9ByzoFJFbu7uGHWT000wzW87sPlE0S3X6h6mrCb2Poln
        jyaxTpMKrnwUimNWsKjEy53luKAW7rc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1694101893;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tk3J/weePsTr2+puEZaryztfMldIRsL7MjS11xHNPq4=;
        b=PgTRAY/jSIOr1hyGZbPTqd+ID749qUOYH1g8gzONDoREaJFpp8MDUTuBDrtTkNFrVzvWF8
        MQwXRemp0OfM7WCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4946E138FA;
        Thu,  7 Sep 2023 15:51:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id gkbnEIXx+WQ+CwAAMHmgww
        (envelope-from <tiwai@suse.de>); Thu, 07 Sep 2023 15:51:33 +0000
Date:   Thu, 07 Sep 2023 17:51:32 +0200
Message-ID: <8734zqasmz.wl-tiwai@suse.de>
From:   Takashi Iwai <tiwai@suse.de>
To:     Wesley Cheng <quic_wcheng@quicinc.com>
Cc:     <srinivas.kandagatla@linaro.org>, <mathias.nyman@intel.com>,
        <perex@perex.cz>, <lgirdwood@gmail.com>, <andersson@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <gregkh@linuxfoundation.org>,
        <Thinh.Nguyen@synopsys.com>, <broonie@kernel.org>,
        <bgoswami@quicinc.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
        <agross@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <quic_jackp@quicinc.com>, <quic_plai@quicinc.com>
Subject: Re: [PATCH v5 18/32] sound: usb: Introduce QC USB SND offloading support
In-Reply-To: <20230829210657.9904-19-quic_wcheng@quicinc.com>
References: <20230829210657.9904-1-quic_wcheng@quicinc.com>
        <20230829210657.9904-19-quic_wcheng@quicinc.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 29 Aug 2023 23:06:43 +0200,
Wesley Cheng wrote:
> 
> Several Qualcomm SoCs have a dedicated audio DSP, which has the ability to
> support USB sound devices.  This vendor driver will implement the required
> handshaking with the DSP, in order to pass along required resources that
> will be utilized by the DSP's USB SW.  The communication channel used for
> this handshaking will be using the QMI protocol.  Required resources
> include:
> - Allocated secondary event ring address
> - EP transfer ring address
> - Interrupter number
> 
> The above information will allow for the audio DSP to execute USB transfers
> over the USB bus.  It will also be able to support devices that have an
> implicit feedback and sync endpoint as well.  Offloading these data
> transfers will allow the main/applications processor to enter lower CPU
> power modes, and sustain a longer duration in those modes.
> 
> Audio offloading is initiated with the following sequence:
> 1. Userspace configures to route audio playback to USB backend and starts
> playback on the platform soundcard.
> 2. The Q6DSP AFE will communicate to the audio DSP to start the USB AFE
> port.
> 3. This results in a QMI packet with a STREAM enable command.
> 4. The QC audio offload driver will fetch the required resources, and pass
> this information as part of the QMI response to the STREAM enable command.
> 5. Once the QMI response is received the audio DSP will start queuing data
> on the USB bus.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  sound/usb/Kconfig                 |   15 +
>  sound/usb/Makefile                |    2 +-
>  sound/usb/qcom/Makefile           |    2 +
>  sound/usb/qcom/qc_audio_offload.c | 1813 +++++++++++++++++++++++++++++
>  4 files changed, 1831 insertions(+), 1 deletion(-)
>  create mode 100644 sound/usb/qcom/Makefile
>  create mode 100644 sound/usb/qcom/qc_audio_offload.c
> 
> diff --git a/sound/usb/Kconfig b/sound/usb/Kconfig
> index 4a9569a3a39a..da5838656baa 100644
> --- a/sound/usb/Kconfig
> +++ b/sound/usb/Kconfig
> @@ -176,6 +176,21 @@ config SND_BCD2000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called snd-bcd2000.
>  
> +config QC_USB_AUDIO_OFFLOAD

Keep SND_ prefix for consistency.  And, at best, align with the module
name.

> +	tristate "Qualcomm Audio Offload driver"
> +	depends on QCOM_QMI_HELPERS && SND_USB_AUDIO && USB_XHCI_SIDEBAND
> +	select SND_PCM
> +	help
> +	  Say Y here to enable the Qualcomm USB audio offloading feature.
> +
> +	  This module sets up the required QMI stream enable/disable
> +	  responses to requests generated by the audio DSP.  It passes the
> +	  USB transfer resource references, so that the audio DSP can issue
> +	  USB transfers to the host controller.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called qc-audio-offload.

Hmm, you renamed it differently, no?  In the below:

> --- /dev/null
> +++ b/sound/usb/qcom/Makefile
> @@ -0,0 +1,2 @@
> +snd-usb-audio-qmi-objs := usb_audio_qmi_v01.o qc_audio_offload.o
> +obj-$(CONFIG_QC_USB_AUDIO_OFFLOAD) += snd-usb-audio-qmi.o

... it's called snd-usb-audio-qmi.


thanks,

Takashi
