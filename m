Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D40C69B1CF
	for <lists+linux-usb@lfdr.de>; Fri, 17 Feb 2023 18:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjBQRbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Feb 2023 12:31:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229799AbjBQRbu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Feb 2023 12:31:50 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D866EF05
        for <linux-usb@vger.kernel.org>; Fri, 17 Feb 2023 09:31:48 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id 188so1794548ybi.8
        for <linux-usb@vger.kernel.org>; Fri, 17 Feb 2023 09:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=liSt0sRaUA8nvJvDXS4dEE1Ac3wmg+RmpsYvQkMfiQ0=;
        b=TeM0wGNH9k+EZTL5gQ/FJK/3wse5JbI7uTKfl6apOBaocU20q9/3SMJyQCFYzpC7to
         1nIxdf60f0qKafad55uQMOez30aW6MfSXaa7zMd/uj4bEr0kSlPYnExtHou6YLDWIszu
         rzX4L6vj8EvlbGcF3dg9ypkwAnb1Ii5Ia2BV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liSt0sRaUA8nvJvDXS4dEE1Ac3wmg+RmpsYvQkMfiQ0=;
        b=WmiUZS+CrQb31KIRtnVzhV3Kd2GnTcf4nJU3shZH0ZhAv1pJCSPQhJYj1Sa7Cq0Wv7
         WX0XuIaoDl9HpKrZgimIW43HeZEY766LSKROTf746g5ZTagHaLELjq/NeKHRX5ZVgGY9
         VuhxC4BkUe2gqOLvAHeyPE5WDHd8RUm2PHvofrKBU2nJn+gBs38uuoLHR9W8Z6dXKWjC
         ePoOxSV/phdUlnoGx1wNKwaV9YFgMKAu0jgfLN75hJhvPOjbyLsdrAOWV95cVQckruFF
         Wnwf3w7/LgaU3HYM6YmbgtEP+bV1BpV6zI/hPojfjSQ8+L3yGqWs8Xw3xngJHBewlIb1
         kbUQ==
X-Gm-Message-State: AO0yUKUDYvt/b9KBf26Fqp0LAY0LV6HKZ5Oe2SnMScBTrayVDQ8jPhBg
        Ch9qqW8PUi00Iy68rvB79q77TBgdLIdXpOkeCQrZgDTN64J11A==
X-Google-Smtp-Source: AK7set/gaYxcX3wkjw7Be1ABmN4tHM9A4f5jRE9cqkf2axJYn4uEHkrpJph5DSJNcMu5cEoMTtdkZqwimJMEUa3TwfE=
X-Received: by 2002:a05:6902:726:b0:855:fdcb:4464 with SMTP id
 l6-20020a056902072600b00855fdcb4464mr465357ybt.5.1676655107709; Fri, 17 Feb
 2023 09:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20230208205318.131385-1-pmalani@chromium.org> <44487e67c4101db4b57090a1ece66974aeab28b9.camel@puri.sm>
In-Reply-To: <44487e67c4101db4b57090a1ece66974aeab28b9.camel@puri.sm>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 17 Feb 2023 09:31:36 -0800
Message-ID: <CACeCKacT2eMC_JzObCji9ZToq4oPqVcdc2CeDiS=DJdj3QdR5w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: altmodes/displayport: Fix probe pin assign check
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        bleung@chromium.org, stable@vger.kernel.org,
        Diana Zigterman <dzigterman@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guillaume Ranquet <granquet@baylibre.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 17, 2023 at 3:39 AM Martin Kepplinger
<martin.kepplinger@puri.sm> wrote:
>
> Am Mittwoch, dem 08.02.2023 um 20:53 +0000 schrieb Prashant Malani:
> > While checking Pin Assignments of the port and partner during probe,
> > we
> > don't take into account whether the peripheral is a plug or
> > receptacle.
> >
> > This manifests itself in a mode entry failure on certain docks and
> > dongles with captive cables. For instance, the Startech.com Type-C to
> > DP
> > dongle (Model #CDP2DP) advertises its DP VDO as 0x405. This would
> > fail
> > the Pin Assignment compatibility check, despite it supporting
> > Pin Assignment C as a UFP.
> >
> > Update the check to use the correct DP Pin Assign macros that
> > take the peripheral's receptacle bit into account.
> >
> > Fixes: c1e5c2f0cb8a ("usb: typec: altmodes/displayport: correct pin
> > assignment for UFP receptacles")
> > Cc: stable@vger.kernel.org
> > Reported-by: Diana Zigterman <dzigterman@chromium.org>
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >
> > I realize this is a bit late in the release cycle, but figured since
> > it
> > is a fix it might still be considered. Please let me know if it's too
> > late and I can re-send this after the 6.3-rc1 is released. Thanks!
>
>
> on the imx8mq-librem5r4.dts board, when using a typec-hub with HDMI,
> this patch breaks image output in one case for me: For a monitor where
> negotiation of resolution fails, a lower resolution works though, I now
> get an oops and hence an unusable system, see the
> dmesg_typec_hub_hdmi_new.txt logs I append. this should definitely not
> happen.

I'll let others comment here too, but more information is required here:
- What's the DP VDO being exported by the Hub?
- What DPConfigure VDM is being sent now (and what was being sent earlier) ?
- Which version of the kernel are you using?
- Can you point to where in the upstream kernel this board file is present?

>
> with your patch reverted, I get no oops and a perfectly usable system
> like before, which is the file dmesg_typec_hub_hdmi_old_ok.txt
>
> could this patch be wrong or at least no universally good for everyone?
> it looks like a regression to me.

I don't think this patch is the cause of the regression you are seeing.

I don't know about the 2nd part, but for the first part, it was
definitely not right
earlier; Pin compatibility checks need to take into account whether the
UFP is a receptacle or not. The stack trace you have shared does not
seem related to PD/Type-C or DRM.

Perhaps this change is uncovering a previously hidden bug on this board.
I'm not sure how this patch causes the failure you see; the patch alters
the conditions for a probe to succeed: either the HUB you are using will
pass this check (in which case you will get DP working) or it won't (in which
case DP should not work at all). Whatever happens after that depends
on the display driver.

BR,
