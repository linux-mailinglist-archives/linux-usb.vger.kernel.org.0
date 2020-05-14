Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9861D318A
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 15:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbgENNmt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 09:42:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726281AbgENNmt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 09:42:49 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26370C061A0C
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 06:42:49 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id r25so24551304oij.4
        for <linux-usb@vger.kernel.org>; Thu, 14 May 2020 06:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gjUlD/lRnqEmJx87EdZHbW6yAizeTdTaFklB0owA6lQ=;
        b=SLTbnJtffgqgcngdxn06ZHmxHp0dxStSZM0h4LgdbyH5vStAba3RGu4HLooR27spJk
         q02Rn7JOA1QCzwn5O7jMbUwHi1TzPFtLoe/anvQjozBJ2xn9Ox0E5/zCXyc5QUjpnC5z
         tt8n+LRwyZqtdrX9/gQ2dmiMn06V4GIJ6cc0ZDGjYoNarzXoA9v8Ca6W+WlvmSAW2Obu
         y1M3c90XOf7C+AjfNb+TJZgXFPAWcVthjwINfaeXdDyLOjiMipXvVbJdYaBiGHE//eAg
         KtiR7h4Rs2iaRqpWpsYrJDzRdewyWE4eQE0u+2sQfEtjb4I4Gi+1VbKO9ogzfMs9EPXQ
         gYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gjUlD/lRnqEmJx87EdZHbW6yAizeTdTaFklB0owA6lQ=;
        b=JSRorxUJh+6R3T88dOuXFXKP3giVtcf3Kff39Oh48dzaTYMfjnfQSKwoDv4U37Z+jd
         32SoXtiYSgyOdpTBD2WXRtWey1Af0q23XPYTb6h2nq+lSXfV7/LRgaoadZxHx+Fr5TIG
         ZwIkz81kmMHE232OR1K87lODLcsPrPgGlcfdYyZ8bKegUuSrDVVy8BqHxmXHXJe3Olnu
         fB7XWUTIQVguZrYXSaxa0WHFEqYEyQH4qz25RFijRS4EeFfxz4o6AaHAZuM56ZR//tb3
         KtMMKeVs2+lOTSKANPUU4Yiz/+6Qcj4oE50t/5Pkavbvv8RT84K6DeZb/N+d1AxkSr23
         EXzw==
X-Gm-Message-State: AGi0PuZ64aJQxgSUSiqB9p+WRfuDM7PMIku+vVSyksViLPhHyYu8D239
        gol1UzN7Tx4gOtF5byaRrd7IG6D1jQo9Y5aCmGIswBhS
X-Google-Smtp-Source: APiQypL1zD4vVMSFeXn2iXspdTdkoGitfCmSknBPAOcwWQ8kuxnzLGLFJm44lBmtFBKQp/+RCjKvDetd7ur11GamiOA=
X-Received: by 2002:aca:cc0d:: with SMTP id c13mr22529645oig.125.1589463768470;
 Thu, 14 May 2020 06:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY=qRRFV4SpNO5pb9vF=U95dbA_gN2ngP+vm34884NMk5q8gQ@mail.gmail.com>
 <bb16e374-3d9f-427c-8470-3542dc697fdb@www.fastmail.com>
In-Reply-To: <bb16e374-3d9f-427c-8470-3542dc697fdb@www.fastmail.com>
From:   Subhashini Rao Beerisetty <subhashbeerisetty@gmail.com>
Date:   Thu, 14 May 2020 19:12:35 +0530
Message-ID: <CAPY=qRRDCqdOOhV2TkyuBV7N-ab7e5110ZQ4u6cfT5dQk=TVnQ@mail.gmail.com>
Subject: Re: sound over USB
To:     Sid Spry <sid@aeam.us>
Cc:     kernelnewbies <kernelnewbies@kernelnewbies.org>,
        alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 13, 2020 at 8:53 PM Sid Spry <sid@aeam.us> wrote:
>
> On Tue, May 12, 2020, at 11:43 AM, Subhashini Rao Beerisetty wrote>
> >
> > How do I use it for playing and recording an audio?
> >
> > Basically first I want to gain knowledge on set of test cases I can
> > run on ALSA and then learn ALSA kernel modules stuff including
> > snd_usb_audio mdule.
> >
> > So please guide me by providing related documentation/Steps.
> >
>
> Hi, searching for an ALSA tutorial will get you far. However on a modern Linux distribution you will likely want to target pulseaudio. There are other libraries like RtAudio or PortAudio that may be easier to use and are cross platform.
>
> ALSA seems to give the most reliable results when enumerating audio devices. This can be done when pulseaudio is installed. The pulseaudio results are harder to interpret.
>
> In my experience, and not necessarily targeted at you, I have experienced massive difficulties getting RtAudio and PortAudio working in a reproducible way. ALSA is the most reliable but an unusual configuration, and pulseaudio is a hot complicated mess.
>
>
> For what it's worth, the sound API on Linux is so pointlessly complex that I have, in the past, created a custom USB driver to avoid going through the sound API. It was easier to use libusb and get raw samples.
Great. Does the custom USB driver is available in public repository?
