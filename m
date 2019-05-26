Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE1192AC03
	for <lists+linux-usb@lfdr.de>; Sun, 26 May 2019 22:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbfEZULO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 May 2019 16:11:14 -0400
Received: from mout.gmx.net ([212.227.17.20]:44917 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfEZULO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 May 2019 16:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1558901473;
        bh=am2sDsv9uOcqdQaJtN8eIr6k8922gt0ZSOykwadeZ9E=;
        h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
        b=aONinTyrhhb3AiCGSQ2lI8NQqzM5eOAVlrIZGjSZ+ujY4UUfbVQ+wp6X4c5VIf8KD
         uGZnib9zo69UUxwjd7jVhMsU28ZBrAast9huq9wQeZF8rd8naija9zuZ2fUZA/D6BR
         F+LAwGiXGiN4LipfsjkD0ftmzi08SVl/B5lU9x3w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.1.166] ([37.4.249.160]) by mail.gmx.com (mrgmx103
 [212.227.17.168]) with ESMTPSA (Nemesis) id 0MXIGf-1hAGwk189l-00WFy9; Sun, 26
 May 2019 21:58:07 +0200
Subject: Re: usb: dwc2: RODATA_FULL_DEFAULT_ENABLED causes kernel oops
To:     =?UTF-8?B?QW50dGkgU2VwcMOkbMOk?= <a.seppala@gmail.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will.deacon@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Martin Schiller <ms@dev.tdt.de>
References: <0ae6261e-96b3-cf8b-d523-a6b8851c951b@gmx.net>
 <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
From:   Stefan Wahren <wahrenst@gmx.net>
Message-ID: <a908bca3-b410-d58f-1011-4f47eca85da4@gmx.net>
Date:   Sun, 26 May 2019 21:58:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKv9HNaJg3OB3DrC_aJe0M97dFP9A0_Jew_wFqReHvzDoFF+sg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:9ix+/bY/JzTOYzR3GDsGCCwWhFWhLO78OhReIP7eZqWBQa7v0rX
 /MF0Qwd2zWX3FjwbaGV9psQMoLLzBGA1gPT856+byeMT/ZEVdYEPCXWT1L1Kud72QAx9K4b
 LiYNdHF1RS8ymnEHTXw+EjrWWkA1EHU7Z84Oz449Sr2ylifugRfmY0o06Z4dUMGaBA/AxsK
 xbNbBWIIC9/DeWgZ8jRZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:huAtIMJ969k=:Hy7fcLWBJ58/azUvDonUDO
 /v++2A8BUHaepuxFKcjLCWedEPmaSXbCQTrpF2ToSLiqRhxUxBdMCeytD3Z0QwXUoZxNMhv2S
 BHki7RuCWgaxuQ3MlroZBDhclkuVxhKEiN6tZJKL0jN11h8yS/FuhSC9CQt7beRZV/bIgbI63
 qm9pUZAxN24R+uvSfWBh32QaQCJd0FvnaSfbpcERtgdC2nZMwVvQLYSAD53EqQ5woXjEQgqCK
 1v1PkznwJ9HxfRvDYH+GPNSEk/cPFEubA4ogK/KbCjQwGtCFR9eB95UjTdnH35dmAPHdQKnEf
 o1z3g6pLrWyn4Q4Uw0YeK0YtxSjhasu0mQ9Duoj/GfguSKs7NECH6fjZbRIP/RM1wT1UULmTC
 5jSbWApOhQu+9cRomXSM77ACex1Tyt48IGXmls8iv/melZn8GIGmfSDck7Ow/7gdQMZowDK1t
 c1Pe/UqMRFEyTpDDRa9sviPZcVnD+xLQUBmAi/tQRmnbpWYWj+lsdhuF5PpOvcPRtgN2nWNdX
 YaewuCS9Kl2sTXgBdOeKuHiT/9t+sx+iTTpYlFR2hgdXP8SHAB+TYcF9lLfBRUVhqBQ0bicFz
 0C+Vu1W7Cy6X6l6l9dxb1sEVSrFteTCyIR+Wg37trDl3NeCg6DoXHpcxq198NbCVJu7D8cei8
 dc+zdZJbLdcvzo5tamgS9k4tlalXXmyi2Oox9wom6nFYlmFwZaPoYLYLf4qa531uddYvtcUGX
 eWRO38mt8NdsjtDM8sD99HUBFvAKs6pRGHr2Iq3rUpV7lUULY6A4713suLDyLOaiau9POQteu
 K9lByLEDO5rJbWhQmZfMXv1zYVFmKeWmuIcWN5uxVXFLLTiaPpfN1402iksUytoCNouKzicN1
 FpQTaLTyRGkeO1U2wCFfRsUlsEXsJ3aAWZf5ts5iLxoLC6PG7/pS2FZh2zf5kA62/+oDitxRT
 JXr+XmDYHU8yEKO0iiAcCAutWg6MDqU2K9JUBBrbrHFwDpIsKCGJM
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

Am 26.05.19 um 12:44 schrieb Antti Sepp=C3=A4l=C3=A4:
>
> Hello.
>
> This is just a shot in the dark but have you tried to apply DMA cache
> alignment issue fix [1] as a third workaround alternative?
> If it helps the fix should be merged upstream.

yes. After applying Martin's patch, i wasn't able to reproduce this
kernel oops.

Thanks to all

>
> [1] - https://patchwork.kernel.org/patch/10817377/
>
> Br,
