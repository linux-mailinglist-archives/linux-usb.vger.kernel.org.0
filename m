Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E862E4845E7
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jan 2022 17:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235244AbiADQVt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jan 2022 11:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiADQVs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jan 2022 11:21:48 -0500
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B8A8C061784
        for <linux-usb@vger.kernel.org>; Tue,  4 Jan 2022 08:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=metanate.com; s=stronger; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-ID:Content-Description;
        bh=Ohq6sYm83V8twpPd4IXfx+XpqjK0CEtfwD38pYOE3Kc=; b=U+eGuKunHaoaXsYYvCmMC/d0d2
        0/jhYuVZEaHIK1PvmBS9g0myiJE2an7nSuhdeyMtAq6w6lKll/z733QfPdkpXsh+ks+kYhg+ZnqpA
        Ewd/xh3UFwJDCMunOcuhxFoCUEHi5y55Dqv9eSHjScstL+74NKu9XolDRuGAExmt08L6V0opPbU3d
        b5JJDKUlaF3p1xYWTnKbGV9GjajMgN90oGdTecOsaZ9jg7SNzbLpCbhaw3XMuHN3P1G5uskTO5lXj
        BmRJIuM3QaVIUofuCTlkeFQH+yuYdNugFXEDEq1a8yCaepER2F+VhRjrOlrovAgSii18rIa239hwL
        ngtOAE4w==;
Received: from [81.174.171.191] (helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1n4mZ5-0000XL-1d; Tue, 04 Jan 2022 16:21:35 +0000
Date:   Tue, 4 Jan 2022 16:21:33 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        Julian Scheel <julian@jusst.de>,
        Jack Pham <jackp@codeaurora.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Yunhao Tian <t123yh.xyz@gmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: Correct stopping capture and playback substreams?
Message-ID: <YdR0DeYefGFU+SVX@donbot>
References: <448e059f-fbac-66ed-204b-f6f9c2c19212@ivitera.com>
 <9635d70f-dc12-f9ed-29f5-ce34a1d4b112@ivitera.com>
 <baefb4a7-0373-49b0-0247-f70c3c585eaf@perex.cz>
 <fbd19fee-343c-c5c6-d426-02ccaa497f7f@ivitera.com>
 <s5ho84tm2vv.wl-tiwai@suse.de>
 <581f6464-37ef-9ab6-e7e2-657ad645aa9e@perex.cz>
 <86ad951b-29f7-59ef-d369-a6c06f9422a4@ivitera.com>
 <YdRuU5EB+bj/e9F+@donbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YdRuU5EB+bj/e9F+@donbot>
X-Authenticated: YES
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 04, 2022 at 03:57:09PM +0000, John Keeping wrote:
> On Mon, Jan 03, 2022 at 01:54:13PM +0100, Pavel Hofman wrote:
> > 
> > 
> > Dne 03. 01. 22 v 13:28 Jaroslav Kysela napsal(a):
> > > On 03. 01. 22 13:15, Takashi Iwai wrote:
> > > > On Mon, 03 Jan 2022 12:32:53 +0100,
> > > > Pavel Hofman wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > Dne 03. 01. 22 v 10:10 Jaroslav Kysela napsal(a):
> > > > > > On 03. 01. 22 9:22, Pavel Hofman wrote:
> > > > > > > 
> > > > > > > Dne 23. 12. 21 v 9:18 Pavel Hofman napsal(a):
> > > > > > > > Hi Takashi,
> > > > > > > > 
> > > > > > > > I am working on stopping alsa streams of audio USB
> > > > > > > > gadget when USB host
> > > > > > > > stops capture/playback/USB cable unplugged.
> > > > > > > > 
> > > > > > > > For capture I used code from AK4114 SPDIF receiver
> > > > > > > > https://elixir.bootlin.com/linux/latest/source/sound/i2c/other/ak4114.c#L590:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > 
> > > > > > > > static void stop_substream(struct uac_rtd_params *prm)
> > > > > > > > {
> > > > > > > > �� ����unsigned long _flags;
> > > > > > > > �� ����struct snd_pcm_substream *substream;
> > > > > > > > 
> > > > > > > > �� ����substream = prm->ss;
> > > > > > > > �� ����if (substream) {
> > > > > > > > �� ������� snd_pcm_stream_lock_irqsave(substream, _flags);
> > > > > > > > �� ������� if (snd_pcm_running(substream))
> > > > > > > > �� ����������� // TODO - correct handling for playback substream?
> > > > > > > > �� ����������� snd_pcm_stop(substream, SNDRV_PCM_STATE_DRAINING);
> > > > > > > > �� ������� snd_pcm_stream_unlock_irqrestore(substream, _flags);
> > > > > > > > �� ����}
> > > > > > > > }
> > > > > > > > 
> > > > > > > > For setup I found calling snd_pcm_stop(substream,
> > > > > > > > SNDRV_PCM_STATE_SETUP)
> > > > > > > > (https://elixir.bootlin.com/linux/latest/source/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c#L63)
> > > > > > > > 
> > > > > > > > 
> > > > > > > > �� �Or for both capture and playback using
> > > > > > > > SNDRV_PCM_STATE_DISCONNECTED
> > > > > > > > (https://elixir.bootlin.com/linux/latest/source/sound/core/pcm.c#L1103).
> > > > > > > > 
> > > > > > > > 
> > > > > > > > Or perhaps using snd_pcm_dev_disconnect(dev) or
> > > > > > > > snd_pcm_drop(substream)?
> > > > > > > > 
> > > > > > > > Please what is the recommended way?
> > > > > > > > 
> > > > > > > 
> > > > > > > Please can I ask for expert view on this issue? E.g. in
> > > > > > > SoX stopping the
> > > > > > > stream with
> > > > > > > SNDRV_PCM_STATE_SETUP/SNDRV_PCM_STATE_DRAINING does not
> > > > > > > stop
> > > > > > > the application, while with SNDRV_PCM_STATE_DISCONNECTED
> > > > > > > SoX exits with
> > > > > > > non-recoverable status. I am considering implementing both methods and
> > > > > > > letting users choose their suitable snd_pcm_stop operation (none
> > > > > > > (default)/SETUP-DRAINING/DISCONNECTED) for the two events (host
> > > > > > > playback/capture stop, cable disconnection) with a
> > > > > > > configfs param. Would
> > > > > > > this make sense?
> > > > > > 
> > > > > > The disconnection state is unrecoverable. It's expected that the
> > > > > > device will be freed and cannot be reused.
> > > > > > 
> > > > > > If you expect to keep the PCM device, we should probably introduce a
> > > > > > new function which puts the device to the SNDRV_PCM_STATE_OPEN
> > > > > > state. In this state, all I/O routines will return -EBADFD for the
> > > > > > applications, so they should close or re-initialize the PCM device
> > > > > > completely.
> > > > > > 
> > > > > > https://elixir.bootlin.com/linux/latest/source/sound/core/pcm_native.c#L794
> > > > > > 
> > > > > > 
> > > > > 
> > > > > The fact is that after closing the USB host can re-open the device
> > > > > with different samplerate (and perhaps later on with different
> > > > > channels count/sample size). That would hint at the need to
> > > > > re-initialize the gadget side before opening� anyway.
> > > > > 
> > > > > As of keeping the device - it's likely some use cases would prefer
> > > > > keeping the device, to minimize the operations needed to react to the
> > > > > host-side playback/capture start.
> > > > > 
> > > > > A function you describe would make sense for this. IMO from the gadget
> > > > > POW there is no difference� between the host stopping playback/capture
> > > > > and cable disconnection, in both cases the data stream is stopped and
> > > > > next stream can have entirely different parameters. Maybe the gadget
> > > > > configfs parameter could only toggle between no action (i.e. current
> > > > > situation) and the new alsa function stopping the stream.
> > > > > 
> > > > > Jaroslav, please can you draft such a function? Perhaps both changes
> > > > > could make it to 5.17.
> > > > 
> > > > (Sorry for the delayed response, as I've been on vacation and now
> > > > catching up the huge pile of backlogs...)
> > > > 
> > > > About the change to keep PCM OPEN state: I'm afraid that the
> > > > disconnection in the host side may happen at any time, and keeping the
> > > > state OPEN would confuse the things if the host is indeed
> > > > unrecoverable.
> > > 
> > > I don't think so. The SNDRV_PCM_IOCTL_HW_PARAMS must be issued by the
> > > application (in the PCM_OPEN state) and if the USB bus connection is no
> > > longer active, it may fail. We can distinguish between host -> device
> > > disconnection and device -> host one. It is not really a similar thing.
> > > 
> > > I think that the idea was to avoid to re-build the whole card / device
> > > structure for the fixed device allocation.
> > > 
> > > Pavel, if the USB host is not connected to the gadget, where the
> > > playback PCM device fails now ? Is the PCM device created or not ?
> > > 
> > 
> > The gaudio PCM device is created when the gadget function is activated
> > (module loaded), regardless whether the USB host is actually connected. The
> > playback/capture fails after the blocking read/write times out. The data
> > delivery/consumption method is simply not called when no usb requests get
> > completed https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L147
> > .
> > 
> > The current code does basically nothing to the alsa pcm stream at
> > capture/playback start/stop by the host (called when altsetting changes in
> > the gadget) https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L468 https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/function/u_audio.c#L557
> 
> Thinking about it, I think the current behaviour is probably correct.
> 
> It's not 100% possible to detect when the host stops data transfer - we
> can detect two scenarios:
> 
> 	- Cable disconnected
> 	- Interface alt 0 selected
> 
> but it's equally possible to just leave the device configured as it was
> and stop sending data.
> 
> While resetting state may be necessary when the cable is disconnected,
> if the host is just stopping and restarting the stream then I don't see
> why the gadget application should have to reconfigure the PCM device.
> 
> It's clearly useful to have some indication of host state, but I'm not
> at all convinced the PCM state is the best way to provide that.

D'oh, I totally forgot about the case of changing sample rate here,
which is the new feature in Pavel's proposed patches.

I still think the existing behaviour is correct when the sample rate
hasn't changed.  But if the sample rate changes, maybe we have to force
the gadget application to reconfigure the PCM as the available sample
rate is now different.  And I guess changing the PCM state is necessary
in that case.

But I'd really like to avoid it for a gadget with only one available
sample rate (and ideally in the case where a gadget supporting multiple
sample rates is stopped and re-started at the same rate).


John
