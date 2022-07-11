Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A29D8562104
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 19:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235847AbiF3RNk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 13:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbiF3RNj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 13:13:39 -0400
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BC553C4AC
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 10:13:38 -0700 (PDT)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3178acf2a92so185858597b3.6
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wbVnB9JXd2WFukFG87rkbpuCu8ljUUZ2a2nEUPVBiI=;
        b=Wljl2fDN1PoFOcQQnC0+Se3tn48Vi1gCJaFUSK1BM2JnXaPC4srY60jaAXXLHqUmmK
         Dk1JMzYTq7FF7SIL7nvY46II4eACkWpMLz2EBMWzITLtdwAvA9Uy2g54/huf3BJq52Aj
         QzizP073+OeEZ0hQvd4fv5lDjfuWPUjxrAI7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wbVnB9JXd2WFukFG87rkbpuCu8ljUUZ2a2nEUPVBiI=;
        b=RkCwk5QYgTsp4CE/P/QqDsLMZL5o43+2KPiY8k3InbyrBpDPwCpecrqqNb6k5MqDQ2
         3aO1Q39JpyAhm/vgOIcEAmpZ9yWNOfvXB0HNJfJu+IHYrjAayPrKw4fYFSNQGeomcCm5
         bCWMoSCqkgG3POyAw9R7pP3V99Gw7TSYhelMJ2P00fW8gEQ4cJf1dIiwFM8mD6hYEH+5
         83Kr1ku5XPhaa1cTmUhWFCtlNFWjnGKi8Z3qHfzhjDerUVEw9LA6+jVQ1IZkMcM7yBbb
         5fWW0AFvKo8laSL4VLnrH2FS6UAetkQhjqFfpLh8zEyCg3Iojnml6ihYOCVnxh2wIdMG
         2J0A==
X-Gm-Message-State: AJIora+dbT8R+udptu2ciY+vKJF9yN4ArYzERHJrpmAljvYZt+Q4brRj
        iQZeuQ7uV/3U8MD1A4CRtEky2OP+5dSyjvB4xR2Aow==
X-Google-Smtp-Source: AGRyM1urYM7GEZ3MU1i8Nsz5L4MMmVmjO5EmdSKxPSy9gvRW7I1DfQyg2AGkklRJ6ZlRH66TstGV8Md3787unfdbDk0=
X-Received: by 2002:a81:8a44:0:b0:31b:c2d1:43a4 with SMTP id
 a65-20020a818a44000000b0031bc2d143a4mr11847676ywg.387.1656609217887; Thu, 30
 Jun 2022 10:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220629233314.3540377-1-pmalani@chromium.org>
 <20220629233314.3540377-2-pmalani@chromium.org> <Yr1cN1I14BR6rN3U@kuha.fi.intel.com>
In-Reply-To: <Yr1cN1I14BR6rN3U@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 30 Jun 2022 10:13:27 -0700
Message-ID: <CACeCKad3NFBEtWUN6P7WOa5W-_K_+Th2mBOKxiziPJCA8+oZUQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] usb: typec: Add support for retimers
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        chrome-platform@lists.linux.dev, bleung@chromium.org,
        Daisuke Nojiri <dnojiri@chromium.org>,
        "Dustin L. Howett" <dustin@howett.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <groeck@chromium.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for taking a look.

On Thu, Jun 30, 2022 at 1:18 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Jun 29, 2022 at 11:32:19PM +0000, Prashant Malani wrote:
> > Introduce a retimer device class and associated functions that register
> > and use retimer "switch" devices. These operate in a manner similar to
> > the "mode-switch" and help configure retimers that exist between the
> > Type-C connector and host controller(s).
> >
> > Type C ports can be linked to retimers using firmware node device
> > references (again, in a manner similar to "mode-switch").
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
>
> Cool! This looks really good to me.
>
> I'll add Mika here, just to keep him in the loop. Thunderbolt/USB4 can
> control the same physical retimers over the SBU line. Right now there
> is no conflict, but I think we want to later be able to use these
> devices to upgrade the retimer firmware, and that is something that
> the Thunderbolt/USB4 already does. So let's keep an eye on this.
>
> I wonder, would it make sense to later make the thunderbolt_retimer
> devices also part of the device class that's introduced here? I think
> that way it would be easier to later figure out which
> thunderbolt_retimer and which retimer_switch represent the same
> physical retimer. And perhaps it would also be more clear for the user
> space to have a single device class for the retimers?
>
> Maybe the device class could be named just "retimer", and the device
> type could then be named "typec_retimer" instead of "retimer_switch"?

Sure, I will make this modification in v2.
I assume we can still keep the firmware node handle as "retimer-switch"
to keep it aligned with "mode-switch" and "orientation-switch".

Thanks,

-Prashant
