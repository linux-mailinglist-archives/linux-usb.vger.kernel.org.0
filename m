Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D61B83DF9EC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 05:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234838AbhHDDMv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Aug 2021 23:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234796AbhHDDL6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Aug 2021 23:11:58 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 531D5C061764
        for <linux-usb@vger.kernel.org>; Tue,  3 Aug 2021 20:11:45 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id c9so540350wri.8
        for <linux-usb@vger.kernel.org>; Tue, 03 Aug 2021 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rtst-co-kr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6r0ndsSf7Z+HdghLRcZVGA3/g6PSfdxZjW/WqYems54=;
        b=fplA0V57aEr0uVScGZXeVKsovZcygWCVBvXuTg+TufRgQtBa3sShC5Rcs0hXT/lLTo
         Ms+dza7+OfLDiUdA4dnzfwY4BjecbKZcOVR+/885/D8GZM99AzmyQ/hSdP0LiQtWrqVl
         /qDs66f6onAQUpRVkGqdXsmWcUK/RHy0soIi+w8ODtvCAwGNbuwMUdXdKnHH4dY2ZeGX
         4LZS3Ix65eVu8ChFWRddexu3GRBzKzJDNakNfoyDYRiDpYBer+F8GZgx+HBLmyliMPv0
         fNfRI655jLJsq1MKmzGiy2LlxoEkOP9K6r+Gm+Q3xC0wsItxJPMOSBGaoPaZ2mCqLl3c
         e9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6r0ndsSf7Z+HdghLRcZVGA3/g6PSfdxZjW/WqYems54=;
        b=Sjckqqbj85lF6m9/3uHo4+A2NVYZD3OvBa2jOs+p7/mOe1xLUwZT1kPB3G3xY9DK12
         LRQXWBaWdZIa0/sSk5KJ+dxydraOycLnYH2k2Ahn3AwMhkttph6jAWy/EP6EDaEwV+QJ
         AHvH9+Sz9d/sH1+DpQqDMZL6Yvudcthyf+7EWhpF5F0eVnWhLyW6aa4wsbs/e3OEuIUa
         gAPPfAmqqKVGFBKvwqbN5VOQh0rhSapbH9NPgOGFONHe6dX11bRO/j/pFLVdNKKqJCiN
         h3KsifsrFs7hmB49Tkd7gBfHqE7OHVFi4KQnpsY6n/41iZezueAxi4JYwjI6nkl+gsjM
         JwIw==
X-Gm-Message-State: AOAM531B4IJwt3jtLiMLPyF6FYnggiq7r/1NFZcckMnIdP0R3+CWRD3m
        Ch3+jTK9ivkOgOpg1AgFkD8WS9W2qHslMW1OVPapvA==
X-Google-Smtp-Source: ABdhPJwp4oTovOnscM2JrWzLjfcLdRTu4RU72BfaApzhA2wRldBnd4jxwC19bdWSBRtJvroUmpiokgYoTffL9P0Bt2I=
X-Received: by 2002:adf:8169:: with SMTP id 96mr25646646wrm.424.1628046703827;
 Tue, 03 Aug 2021 20:11:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAJk_X9hBB_edByfEvueSyWgKjpYGZbS2rPLPCSpRrPr+icFz_Q@mail.gmail.com>
 <20210804013252.GA16420@nchen>
In-Reply-To: <20210804013252.GA16420@nchen>
From:   Jeaho Hwang <jhhwang@rtst.co.kr>
Date:   Wed, 4 Aug 2021 12:11:31 +0900
Message-ID: <CAJk_X9gZ_dmQKeYJjkPZAQqdg==X=7s=XHtCg5cuu06z8Hd-GQ@mail.gmail.com>
Subject: Re: Chipidea USB device goes infinite loop due to interrupt while hw_ep_prime
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        =?UTF-8?B?67OA66y06rSRKEJ5ZW9uIE1vbyBLd2FuZykv7J6Q64+Z7ZmU7JewKUF1dG9tYXRpb24gUGxhdGZvcm0=?=
         =?UTF-8?B?7Jew6rWs7YyA?= <mkbyeon@lselectric.co.kr>,
        Linux team <team-linux@rtst.co.kr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks for the answer Peter. I still have two questions.

1) There's a busy loop in hw_ep_prime to wait for endpoint priming. Is
it safe without timeout?

 192 static int hw_ep_prime(struct ci_hdrc *ci, int num, int dir, int is_ct=
rl)
 193 {
 194     int n =3D hw_ep_bit(num, dir);
 195
 196     /* Synchronize before ep prime */
 197     wmb();
 198
 199     if (is_ctrl && dir =3D=3D RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT=
(num)))
 200         return -EAGAIN;
 201
 202     hw_write(ci, OP_ENDPTPRIME, ~0, BIT(n));
 203
 204     while (hw_read(ci, OP_ENDPTPRIME, BIT(n)))
 205         cpu_relax();
 206     if (is_ctrl && dir =3D=3D RX && hw_read(ci, OP_ENDPTSETUPSTAT, BIT=
(num)))
 207         return -EAGAIN;
 208
 209     /* status shoult be tested according with manual but it doesn't wo=
rk */
 210     return 0;
 211 }

2) We experienced an infinite loop in hw_ep_set_halt, which is called
at isr_tr_complete_handler due to an error encountered that we
reported in the previous mail. It seems that hw_write to set halt
fails. Is it related to the interruption while hw_ep_prime is running?
If we make a timeout for the loop and error return, are there any
considerations for the caller functions?

 223 static int hw_ep_set_halt(struct ci_hdrc *ci, int num, int dir, int va=
lue)
 224 {
 225     if (value !=3D 0 && value !=3D 1)
 226         return -EINVAL;
 227
 228     do {
 229         enum ci_hw_regs reg =3D OP_ENDPTCTRL + num;
 230         u32 mask_xs =3D (dir =3D=3D TX) ? ENDPTCTRL_TXS : ENDPTCTRL_RX=
S;
 231         u32 mask_xr =3D (dir =3D=3D TX) ? ENDPTCTRL_TXR : ENDPTCTRL_RX=
R;
 232
 233         /* data toggle - reserved for EP0 but it's in ESS */
 234         hw_write(ci, reg, mask_xs|mask_xr,
 235               value ? mask_xs : mask_xr);
 236     } while (value !=3D hw_ep_get_halt(ci, num, dir));
 237
 238     return 0;
 239 }

Thanks.

>
> On 21-08-02 17:35:01, Jeaho Hwang wrote:
> > Hi.
> >
> > We found an infinite loop inside the function hw_ep_set_halt
> > (drivers/usb/chipidea/udc.c) if a cablle is repeatedly
> > connnected/disconnected while ping through RNDIS with chipidea USB devi=
ce.
> >
> > Using ftrace tracing, we found that hw_ep_set_halt is called due to err=
or
> > return of hw_ep_prime(drivers/usb/chipidea/udc.c:202) which is called f=
rom
> > isr_tr_complete_handler -> isr_setup_status_phase -> _ep_queue.
> >
> > The comment of function hw_ep_prime says (execute without interruption)=
 but
> > timer interrupt is occurred while hw_ep_prime is executing. We believe =
that
> > the interrupt causes an error return of hw_ep_prime. We tried to protec=
t
> > hw_ep_prime from irqs and then no case of the infinite loop is occurred=
.
> >
> > I want ask if it is appropriate way that turning off irq inside (thread=
ed)
> > irq handlers. And should we explicitly turn off irqs before calling
> > hw_ep_prime?
> >
>
> Jeaho, do you use RT-Linux or standard Linux? The function hw_ep_prime is
> only called at udc_irq which is registered as top-half irq handlers.
> Why the timer interrupt is occurred when hw_ep_prime is executing?
>
> --
>
> Thanks,
> Peter Chen
>


--=20
=ED=99=A9=EC=9E=AC=ED=98=B8, Jay Hwang, linux team manager of RTst
010-7242-1593
