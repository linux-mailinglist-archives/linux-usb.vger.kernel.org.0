Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C481647EA
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2020 16:10:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgBSPKr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Feb 2020 10:10:47 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:39585 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbgBSPKr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Feb 2020 10:10:47 -0500
Received: by mail-qk1-f193.google.com with SMTP id a141so396819qkg.6
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 07:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=dFx4RjJWgUpdnWS0fHQoyKLvXIGLCYKuO6j3IpQwQsQ=;
        b=dXvmngLFP9lz0nUnehtIPzU9/Ym5SbdsKq6i+ECoCyEMk533q+5RgTOjW0kv12qjjJ
         gIy3g3ZmauFD42x1Zs1QgM+/AweVlxyIr0p0NCCHM9Jsow4TKtddONCwV/ISZx86nKBj
         KGFtlelmpL/2HRELlEQk0v8aFBhCVaaeJlJD1ZjLA8KzHRHUS5KctzkFV6DJx0eevCYb
         fAaNP6k1hDzgqM23SR2oCPHmxO3vthx7ENetNJNhjtjfKQUE8LrElDNJk4UB6ABZKEDY
         qMobYUj27uVKn5k36sDNEIS57JZ46nHDwi3KqpPRFKibP+4iYXPFaHPstXPDUb37Rv6e
         XvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=dFx4RjJWgUpdnWS0fHQoyKLvXIGLCYKuO6j3IpQwQsQ=;
        b=PeL5TS3ZDXAMKu8cYOrJNpQjhVLb7MuUMVFUybcJd1z6MNRsaWg/QfYD6M4/LGLz/M
         ovId8IFlyMqRw4uy2rgmtFJlbDXKyV1WuI/TAHQOVuCBHvoXHZMCifyy0gu74SBUr1M2
         lniXHyYpARqL5qo9NJLf1cZUqu2qjdpdILH8/jR1/GY8ay0g+T93nSSNfffCr2gx01Q+
         Xf88DqyD9FjPuk3lPnEBQKlQ3afUvm4iGb+Fw5VlS+b8a37Y37KkIKno07rCrvnBz8St
         BOm4wi5rjSR1+GFlFF63pFQHaCVW/nFMqKV6n6MO3b6XuJMRWPXBRWbcj0puw90tzmBX
         t9bw==
X-Gm-Message-State: APjAAAVm1UyfRzL91WPLPuVGKU2IZMMhSB5A6XJINGObyuQMbHGe/401
        97e9EE3gm7yeDmS7CU5Tz6dfT/kh/QQ0aw==
X-Google-Smtp-Source: APXvYqwVS1J1n2LC8X/sEhVxkdWCusWOoSsCWEXw4/2M73dnye6HTLRVbPb8UhdSzoby95l+Iz7GOw==
X-Received: by 2002:a37:9245:: with SMTP id u66mr24650039qkd.102.1582125045528;
        Wed, 19 Feb 2020 07:10:45 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id p135sm1132908qke.2.2020.02.19.07.10.43
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Feb 2020 07:10:43 -0800 (PST)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qk1-f170.google.com with SMTP id d11so384291qko.8
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2020 07:10:43 -0800 (PST)
X-Received: by 2002:a37:c48:: with SMTP id 69mr2675652qkm.46.1582125042992;
 Wed, 19 Feb 2020 07:10:42 -0800 (PST)
MIME-Version: 1.0
References: <CAP9ODKprPi8N-dU8NaKwneXH-3b0ipSEDpU5mDbGntxuyhGhJw@mail.gmail.com>
 <41a7bfe7-54b1-84eb-091f-469d971ab968@synopsys.com> <CAP9ODKoUH=Cc=uuhfaUy7fkSVdfBHhX-6oS9_hi3Wd6GgDiZYw@mail.gmail.com>
 <ee47be28-ba9f-750f-65d2-51a722ce291d@synopsys.com> <CAP9ODKqa_4NSsFMUpyFDt3ohgGBCMgbOyKaVjYfSjmcZLmmC+A@mail.gmail.com>
 <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
In-Reply-To: <380d765b-8867-a899-b67a-c016c09fa27b@synopsys.com>
Date:   Wed, 19 Feb 2020 12:10:31 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
Message-ID: <CAP9ODKqL_GN+iebL3wPX_9fEUtUVP8Ahv03yJ1R-JLDr=Cn0BA@mail.gmail.com>
Subject: Re: USB DWC2 stops responding when insert/remove cable multiple times
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>,
        Johan Hovold <johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Minas,

On Wed, Feb 19, 2020 at 9:26 AM Minas Harutyunyan
<Minas.Harutyunyan@synopsys.com> wrote:
> On 2/17/2020 11:53 PM, Otavio Salvador wrote:
> > On Mon, Feb 17, 2020 at 10:26 AM Minas Harutyunyan
> > <Minas.Harutyunyan@synopsys.com> wrote:
> >> Enable debug prints to get full dwc2 debug prints to see what happen
> >> with dwc2.
>
> > [ 1054.529774] dwc2 30180000.usb: ep0 state:0
> > [ 1054.529785] dwc2 30180000.usb: dwc2_hsotg_start_req: DxEPCTL=0x84088200
> > [ 1054.529801] dwc2 30180000.usb: dwc2_hsotg_start_req: DXEPCTL=0x80088200
> > [ 1054.529928] dwc2 30180000.usb: ep2out: req 26bd9b9f: 512@06b7dbca,
> > noi=0, zero=0, snok=0
> > [ 1054.537095] dwc2 30180000.usb: dwc2_hsotg_irq: 04008428 00000400
> > (d88c3cc4) retry 8
> > [ 1054.537119] dwc2 30180000.usb: GINTSTS_ErlySusp
> > [ 1054.540147] dwc2 30180000.usb: gintsts=04008828  gintmsk=d88c3cc4
> > [ 1054.540172] dwc2 30180000.usb: USB SUSPEND
> > [ 1054.540191] dwc2 30180000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x5ad801
> > [ 1054.540211] dwc2 30180000.usb: DSTS.Suspend Status=1 HWCFG4.Power
> > Optimize=1 HWCFG4.Hibernation=0
> > [ 1054.540242] dwc2 30180000.usb: dwc2_hsotg_irq: 04008028 00000000
> > (d88c3cc4) retry 8
> > [ 1054.585402] dwc2 30180000.usb: ep1in: req 01eff31b: 353@bf8d62d8,
> > noi=0, zero=1, snok=0
> > [ 1054.585422] dwc2 30180000.usb: dwc2_hsotg_ep_queue: submit request
> > only in active state
> > [ 1054.661667] dwc2 30180000.usb: dwc2_hsotg_irq: 04008428 00000400
> > (d88c3cc4) retry 8
> > [ 1054.661694] dwc2 30180000.usb: GINTSTS_ErlySusp
> > [ 1054.664715] dwc2 30180000.usb: gintsts=04008828  gintmsk=d88c3cc4
> > [ 1054.664741] dwc2 30180000.usb: USB SUSPEND
> > [ 1054.664760] dwc2 30180000.usb: dwc2_handle_usb_suspend_intr: DSTS=0x5ad801
> > [ 1054.664781] dwc2 30180000.usb: DSTS.Suspend Status=1 HWCFG4.Power
> >
>
> Actually, I don't see any issue with dwc2 from the log. Only not clear
> why SUSPEND happen hear. Is it because of disconnect/connect or
> reloading g_serial?
> Is this log recorded when issue seen?

Yes, the log was recorded however we did not reload the g_serial
module. So when we gathered the logs, it was stuck.

> Anyway, before SUSPEND and after dwc2 successfully perform transfers on
> all EP's - ep1in bulk, ep2out bulk and ep3in interrupt.
> Can you provide dmesg with dwc2 debug prints with exception case inside.

The log I sent was taken with:

1) boot device
2) ran 'dmesg -c' so we cleaned the old messages
3) cause the lock up to happen
4) gather dmesg output

What sequence do you want us to do?
--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
