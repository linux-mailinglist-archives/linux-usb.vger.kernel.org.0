Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD54F2568A4
	for <lists+linux-usb@lfdr.de>; Sat, 29 Aug 2020 17:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgH2P0A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 29 Aug 2020 11:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728196AbgH2PZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 29 Aug 2020 11:25:58 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90170C061236
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2020 08:25:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id q4so1723930eds.3
        for <linux-usb@vger.kernel.org>; Sat, 29 Aug 2020 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VlZBchCAyWhuNUD37n2dPDCJAJclNP7/k78UQz5aH6Y=;
        b=m4XsMpk25tlrcGVQqQpM+7r2/Bjvrr/qPL8d+LgyuzzcqusO+srnJUfIvx3rpfniRn
         WQVU9S+3ZgzFOp07by3VNOMcFIiUV5a3pAqviuOe6MziClK7/p4YVJFTB2k9q570znSy
         R5dVw0/r66Jsq0tpkawxKhFVA2gVyaN0toXYqFfpOIB0Gio1LwJc3XH8iq1qR4+tHhLV
         MQTdl5TFkqMyYi0VO34MhMI+OrZ1eivXF8wMEhu0Jitn9S4+qNOgrKmKfTfew1Jj9G6x
         z5V0KfyGayhpShYxFXvSL3ui35InB8tShz5RUI+qjPSoQx6gh8/tPf3I/t22u0W42euW
         YwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VlZBchCAyWhuNUD37n2dPDCJAJclNP7/k78UQz5aH6Y=;
        b=EyQf7TkTEwizHuIE95Olhlma+IFdX0/b43BqtjbmL8f9fuEFoKX1SHDQqzl9vdxCun
         arLjyFPyYG/72EaXv1F00Gz1ep2VbyxgTMLWYA0R4F7UPb32Z1lHX/AuoMxslyggmFAE
         jpWWXgmxHm7cx3/vunePRewK2oRXhAmPwwd0F+eVhOed+hlazN3eXcKJ6uFo/7IV0ywq
         BBqIHCvbFbRNmFiKFIBHDSf3mrWgyZgP45WLdZ38yGyVZ1YXooP2d6w9qOReMi9ch4mF
         qiLfDfLYKmu5SZlobxj1pI63KcARJoKCnrdTD5+Agj2jiaDt79rlM+liNlPoMMVHq1TU
         I+zQ==
X-Gm-Message-State: AOAM530GgazPm7n395rOR82NPWH8cm9EW58VzXx0HEOM/GIPWZ4HM33z
        v7tvMknx3pjPR+Iv57ow9L7+muyChd/MbTKlQ7g=
X-Google-Smtp-Source: ABdhPJz5XzPTbZ7BAUYzHuDxgUeYvsO0Qg+A3sH8USWhY8loqiIGsVFvzhKelnueGLLZLJeSRSprgA9A9IRvPluCnNU=
X-Received: by 2002:a05:6402:1443:: with SMTP id d3mr3975828edx.40.1598714755843;
 Sat, 29 Aug 2020 08:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200713160522.19345-1-dan@dlrobertson.com> <20200713160522.19345-2-dan@dlrobertson.com>
 <1jy2maekzf.fsf@starbuckisacylon.baylibre.com> <ff07b04450080fd14d8da4470aeb6e1c28e4215f.camel@pengutronix.de>
 <1j8se43yrw.fsf@starbuckisacylon.baylibre.com> <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
In-Reply-To: <18105405541cbc32cecaff181e1427f5434fafc3.camel@pengutronix.de>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 29 Aug 2020 17:25:45 +0200
Message-ID: <CAFBinCC60WzSRitVGBPon9zZVJ_eUjdcEoP7NBHiHR24mLBgig@mail.gmail.com>
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Dan Robertson <dan@dlrobertson.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, aouledameur@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Philipp,

On Tue, Aug 25, 2020 at 12:20 PM Philipp Zabel <p.zabel@pengutronix.de> wrote:
[...]
> > reset_control_clear()
> > would be the way to state that the ressource is no longer used and, that
> > from the caller perspective, the reset can fired again if necessary.
> >
> > If we take the probe / suspend / resume example:
> > * 1st device using the shared will actually trigger it (as it is now)
> > * following device just increase triggered_count
> >
> > If all devices go to suspend (calling reset_control_clear()) then
> > triggered_count will reach zero, allowing the first device resuming to
> > trigger the reset again ... this is important since it might not be the
> > one which would have got the exclusive control
> >
> > If any device don't go to suspend, meaning the ressource under reset
> > keep on being used, no reset will performed. With exlusive control,
> > there is a risk that the resuming device resets something already in use.
> >
> > Regarding the condition, on shared resets, call reset_control_reset()
> > should be balanced reset_control_clear() - no clear before reset.
>
> Martin, is this something that would be useful for the current users of
> the shared reset trigger functionality (phy-meson-gxl-usb2 and phy-
> meson8b-usb2 with reset-meson)?
for the specific use-case (system suspend) this would currently not be
useful for the two drivers you have named. This is because the
platforms on which they are used currently don't support system
suspend.
if other drivers are going to benefit from this change then please go
ahead and add the necessary API. Then I can also use it in these
drivers. however, (as far as I understand) I won't be able to verify
the new "fixed" behavior


Best regards,
Martin
