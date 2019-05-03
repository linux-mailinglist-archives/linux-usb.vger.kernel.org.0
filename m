Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F33713107
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 17:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfECPQU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 11:16:20 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:41938 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbfECPQU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 May 2019 11:16:20 -0400
Received: by mail-vs1-f65.google.com with SMTP id g187so3805236vsc.8
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 08:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/7DMlLhZpYsWuofw8OIODIFO7gaAmV2hSfavk1PWNjw=;
        b=XUmZiwqwzLoqpAUVe8w0tkVHbFRykUE91OYgujzpgaBCx48baPDuGmg0M6jQyV4YII
         OWTb+7Zdpdig3RsJGJk/hfTgq68bJikh98t4m/Hra5MvlqkXrXqojZor8kcLrun7IcVq
         NOfXaNbyYGwDM79mwwB5iVPjXFMqHWmAq2c4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/7DMlLhZpYsWuofw8OIODIFO7gaAmV2hSfavk1PWNjw=;
        b=oWeeOqGegeJSNWYZ7Yjmo6hORd4MDH8uGZn5nhv5B3+PhOF+dG8BSFpCZSr51jxpoh
         IBTANrIq4QWlJ5F79mF9XAqrwaVN7/jogIFbZ8WE8xD93G+HCnmMrafsakQHsFCIAEmv
         pCY/79WyxVNfKeFMTcabvUnm/2vjvgbVe7XxPj37tPRzACEptsPuSzg0BBtKOkxrSINi
         9y14DYTF6wC/sY9Igxt7l1L13Mha1IPwAU4VwmOQkHhTz5KLeghvGv7Ajs0GQaaajw0Z
         Wqt0NtaFw6kxdHFjb5/saBjqFevu8i0NDbjEst1qDqJ1yQ26iwka5YFXnX6il8VbZf+q
         CcwA==
X-Gm-Message-State: APjAAAXq+iSNLPVQJZ24cWqEC50CsL6IQyvUxqTEYsQ7uCsA/xU7AVHq
        cB2KM8zx1d7J8Gv2Nkn17czJgaSKUjU=
X-Google-Smtp-Source: APXvYqxB+PKYKgVE5q4rOxIz24sXnRTOGgOxiMnvbPZNyHoZ3s+mdLg96Y+ViTuDRUcg5LjiyBiIFA==
X-Received: by 2002:a67:83c5:: with SMTP id f188mr5686485vsd.163.1556896513907;
        Fri, 03 May 2019 08:15:13 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id z127sm964836vsc.5.2019.05.03.08.15.13
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 May 2019 08:15:13 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id o33so2113614uae.12
        for <linux-usb@vger.kernel.org>; Fri, 03 May 2019 08:15:13 -0700 (PDT)
X-Received: by 2002:ab0:2709:: with SMTP id s9mr4499637uao.21.1556896064408;
 Fri, 03 May 2019 08:07:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-2-dianders@chromium.org> <CAD=FV=UGjQz9Di=NL_r_g1Hofqv-FWBywfSm9Vu6gGr22wzPrA@mail.gmail.com>
 <SN1PR12MB243136608514210F3E3E536EA7350@SN1PR12MB2431.namprd12.prod.outlook.com>
In-Reply-To: <SN1PR12MB243136608514210F3E3E536EA7350@SN1PR12MB2431.namprd12.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 3 May 2019 08:07:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V97+_cQ1aD=w_a3SifGOG3M5DPvcnvxYVUJMkX_WLTFg@mail.gmail.com>
Message-ID: <CAD=FV=V97+_cQ1aD=w_a3SifGOG3M5DPvcnvxYVUJMkX_WLTFg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] usb: dwc2: bus suspend/resume for hosts with DWC2_POWER_DOWN_PARAM_NONE
To:     Artur Petrosyan <Arthur.Petrosyan@synopsys.com>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alexandru M Stan <amstan@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Julius Werner <jwerner@chromium.org>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, May 3, 2019 at 1:25 AM Artur Petrosyan
<Arthur.Petrosyan@synopsys.com> wrote:
>
> On 5/2/2019 03:58, Doug Anderson wrote:
> > Hi,
> >
> >
> > On Wed, Apr 17, 2019 at 5:15 PM Douglas Anderson <dianders@chromium.org=
> wrote:
> >>
> >> This is an attempt to rehash commit 0cf884e819e0 ("usb: dwc2: add bus
> >> suspend/resume for dwc2") on ToT.  That commit was reverted in commit
> >> b0bb9bb6ce01 ("Revert "usb: dwc2: add bus suspend/resume for dwc2"")
> >> because apparently it broke the Altera SOCFPGA.
> >>
> >> With all the changes that have happened to dwc2 in the meantime, it's
> >> possible that the Altera SOCFPGA will just magically work with this
> >> change now.  ...and it would be good to get bus suspend/resume
> >> implemented.
> >>
> >> This change is a forward port of one that's been living in the Chrome
> >> OS 3.14 kernel tree.
> >>
> >> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >> ---
> >> This patch was last posted at:
> >>
> >> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lkml.kernel.org=
_r_1446237173-2D15263-2D1-2Dgit-2Dsend-2Demail-2Ddianders-40chromium.org&d=
=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVrrlYOeOQjP_HlVzYqr=
C_D7niMJI&m=3D7rxT8EFX9mqUDtTL4P7iuzYNsYROe9rxHGCresSKPTg&s=3DlTaNUA2XIYPat=
417fkd1A4Zpvb5eyYtTc1H_NIfW8Vw&e=3D
> >>
> >> ...and appears to have died the death of silence.  Maybe it could get
> >> some bake time in linuxnext if we can't find any proactive testing?
> >>
> >> I will also freely admit that I don't know tons about the theory
> >> behind this patch.  I'm mostly just re-hashing the original commit
> >> from Kever that was reverted since:
> >> * Turning on partial power down on rk3288 doesn't "just work".  I
> >>    don't get hotplug events.  This is despite dwc2 auto-detecting that
> >>    we are power optimized.
> >> * If we don't do something like this commit we don't get into as low
> >>    of a power mode.
> >
> > OK, I spent the day digging more into this patch to confirm that it's
> > really the right thing to do.  ...and it still seems to be.
> >
> > First off: I'm pretty sure the above sentence "If we don't do
> > something like this commit we don't get into as low of a power mode."
> > is totally wrong.  Luckily it's "after the cut" and not part of the
> > commit message.  Specifically I did a bunch of power testing and I
> > couldn't find any instance saving power after this patch.
> >
> > ...but, then I looked more carefully at all the history of this
> > commit.  I ended up at:
> >
> > https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__chromium-2Drevie=
w.googlesource.com_c_chromiumos_third-5Fparty_kernel_-2B_306265_&d=3DDwIBaQ=
&c=3DDPL6_X_6JkXFx7AXWqB0tg&r=3D9hPBFKCJ_nBjJhGVrrlYOeOQjP_HlVzYqrC_D7niMJI=
&m=3D7rxT8EFX9mqUDtTL4P7iuzYNsYROe9rxHGCresSKPTg&s=3DLiyyIyaCPmr88nJeI7TCGt=
oJBFLRWir_reikYtAHHDw&e=3D
> Looking at this code review I see that this patch fixes whatever issues
> you have on Chrome OS 3.14. But your patch has landed on the top of
> latest Kernel version. With the latest version I think you would not
> have the regression issue.
> So you are fixing Chrome OS 3.14.

I'm confused why you ignored the rest of my email where I said I also
ported it to 4.19 (which, from a dwc2 host point of view, is pretty
much mainline) and saw that the patch was still needed.

-Doug
