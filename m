Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74E1023FD9
	for <lists+linux-usb@lfdr.de>; Mon, 20 May 2019 20:03:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbfETSDQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 May 2019 14:03:16 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:36287 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbfETSDQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 May 2019 14:03:16 -0400
Received: by mail-vk1-f196.google.com with SMTP id l199so4110668vke.3
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 11:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l37zIVlCi4dbNDMGaFWNQ6h6zOWM8mlC8MVadX95qhk=;
        b=ZDuGf+wIJRM3SUZGnB5R5xtdCvh6zDqkd2hQEQlMJrnwn1aNAweMHsf9xJTipnH5Xm
         JZf3UZvTYWJlvaaVC3pYVCAC/YPgsGT0hFI1XlBBBwmfxPsN2niZv35FfsxOzbIDe8sL
         1oYbID6Y9SrEv12zWHhdJyfiOGNfn2VcH3VoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l37zIVlCi4dbNDMGaFWNQ6h6zOWM8mlC8MVadX95qhk=;
        b=mezpdHNjDZXe8erMk42vP+weE4mcRikTW7IMt3K7lYMDCbwZaoxth+8Zia/jqkZrss
         ohX/RBDRExKDFA6r0h+sHv/MbTPYw2RT56IiSepy7ZV1fNqqqBXZgwEpjMHxXqIE7dRt
         rHl4TY99tPE1aiWTW28C1AM7/Bq236WA94V+HLQkMBJ1bWK6D/DEMFSmIcVqMpwkag+S
         gSz64RQRrcQ/Zicm/FS8+2++B12g4Sg5OlXTPWsAgQz+qDB013o2Dti9wdrOjgS5asdR
         Hxj92svO4hpd0LMkxspUL94jtyE3yD7AizGLvmUXireA2iJPPdkJ0WhN4Mm22YTyoCDa
         V4kg==
X-Gm-Message-State: APjAAAWgae+voGVa9kYMMM1+D6SsewN06AYWEU/ZVibtJHgkS2EU8oHm
        D6DJYnCHwNJkXjaflcvkfJgqzNDB9DU=
X-Google-Smtp-Source: APXvYqzhcsra7ouRHK5+6vFV8v01TGWHNOFvszEpjx9SqZY/RGh+tKqjVUe/Pr0e2R7rSfl3IrQn8A==
X-Received: by 2002:ac5:c542:: with SMTP id d2mr8468081vkl.57.1558375394449;
        Mon, 20 May 2019 11:03:14 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id j8sm1014223vsd.0.2019.05.20.11.03.14
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 11:03:14 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id d7so4110923vkf.1
        for <linux-usb@vger.kernel.org>; Mon, 20 May 2019 11:03:14 -0700 (PDT)
X-Received: by 2002:a1f:a410:: with SMTP id n16mr8477054vke.73.1558375068277;
 Mon, 20 May 2019 10:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190516225941.170355-3-dianders@chromium.org> <201905201037.p3rNy0yX%lkp@intel.com>
In-Reply-To: <201905201037.p3rNy0yX%lkp@intel.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 20 May 2019 10:57:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VOPAufL=u5iRCpO=Rdg--goZJ3jxM1znzyEXMTVBTFJg@mail.gmail.com>
Message-ID: <CAD=FV=VOPAufL=u5iRCpO=Rdg--goZJ3jxM1znzyEXMTVBTFJg@mail.gmail.com>
Subject: Re: [REPOST PATCH v2 2/3] USB: dwc2: Don't turn off the usbphy in
 suspend if wakeup is enabled
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Alexandru M Stan <amstan@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Julius Werner <jwerner@chromium.org>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Sun, May 19, 2019 at 7:08 PM kbuild test robot <lkp@intel.com> wrote:
>
> Hi Douglas,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on balbi-usb/next]
> [also build test ERROR on v5.2-rc1 next-20190517]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]
>
> url:    https://github.com/0day-ci/linux/commits/Douglas-Anderson/Documentation-dt-bindings-Add-snps-need-phy-for-wake-for-dwc2-USB/20190520-033119
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git next
> config: x86_64-randconfig-h0-05191510 (attached as .config)
> compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    ld: drivers/usb/dwc2/platform.o: in function `dwc2_can_poweroff_phy':
> >> drivers/usb/dwc2/platform.c:545: undefined reference to `usb_wakeup_enabled_descendants'

Thank you.  Fixed in v3:

https://lkml.kernel.org/r/20190520175605.2405-1-dianders@chromium.org

-Doug
