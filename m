Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26BF13192E4
	for <lists+linux-usb@lfdr.de>; Thu, 11 Feb 2021 20:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhBKTP0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 11 Feb 2021 14:15:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhBKTPX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 11 Feb 2021 14:15:23 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F09A0C061756
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 11:14:42 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id o63so4582290pgo.6
        for <linux-usb@vger.kernel.org>; Thu, 11 Feb 2021 11:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=qqEry60T4DmTyCAXWg4gMVAOjQbNyth0ovp4BVqxCc8=;
        b=UnD7UfzYJXS9wCo8RcNk2NVDC0RL2SLfwid1NILUmfiMlyGyHHPF2HoFUXvjv1h3y8
         nyYd3031FB5XuwbTMIWp+2C7dPZ+sPJN7vq3FHxvZ3595t0tSOR0uvkvB/SRTNZhTsfa
         uTwOFWatxO8GhXs47gLTt8iYdWhCLLKQb40/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=qqEry60T4DmTyCAXWg4gMVAOjQbNyth0ovp4BVqxCc8=;
        b=XJlKv2Jj9TqW+N7x6qyDbZ7L73MqSyGZvbeHd9r005DTwC5/7MZoMtiwlximYOIak+
         BfJcGJ941MALK1nFnpmFWa6DTmIPmkMBbAQPC6B39DXzkoWOWKwRw/4d8XM9TUi8TUxm
         9PgeaaY/TLmBP+SnW59/JMqYQbKtWuV4ribMgIMawxdbVgNfpRIjYSYcR24fGFCT/v1v
         tE5gb7bW52tCbrqfmW+CY8Gt+m5UROULiuUO6IH+PE8d6WnMUoQ7EZKp+ZODMRMJOl9U
         MsYfmTHU/UMgQnIhpcVCZtEXDTTtMCTMXxzdv/GOhbmegWfxCb3/Qo+bcLixdBzejej1
         tjHw==
X-Gm-Message-State: AOAM530DOs+9eBoGotRpAmYtBvyCeakZzYSQeGgpqiumXjcegv+ba4Z+
        oIrDAjhDoIC6hMrJvtyVCILc3A==
X-Google-Smtp-Source: ABdhPJxaHXPT1uNqwUJY66FnRWUqcI1rm9E9OacVvqIg74qBdRv36OEYX0LSltX6WM39oME+ct7jqQ==
X-Received: by 2002:a62:1708:0:b029:1da:2f7a:3639 with SMTP id 8-20020a6217080000b02901da2f7a3639mr8920114pfx.78.1613070881351;
        Thu, 11 Feb 2021 11:14:41 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:f038:5688:cf3c:eca2])
        by smtp.gmail.com with ESMTPSA id y24sm6307848pfr.152.2021.02.11.11.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 11:14:40 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YCRcIuCxB8nYi7/e@google.com>
References: <20210210171040.684659-1-mka@chromium.org> <20210210091015.v5.3.I7a3a7d9d2126c34079b1cab87aa0b2ec3030f9b7@changeid> <20210210210645.xapaua7djdsvr3ca@kozik-lap> <YCRcIuCxB8nYi7/e@google.com>
Subject: Re: [PATCH v5 3/4] usb: host: xhci-plat: Create platform device for onboard hubs in probe()
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        devicetree@vger.kernel.org, Peter Chen <peter.chen@nxp.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        linux-kernel@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>
Date:   Thu, 11 Feb 2021 11:14:39 -0800
Message-ID: <161307087919.1254594.11784819060723374369@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Quoting Matthias Kaehlcke (2021-02-10 14:20:18)
>=20
> On Wed, Feb 10, 2021 at 10:06:45PM +0100, Krzysztof Kozlowski wrote:
> >=20
> > This looks hackish... what if later we have something else than hub?
> > Another if()?
> >=20
> > What if hub could be connected to something else than XHCI controller?
>=20
> In earlier versions this was standalone driver, which was more flexible a=
nd
> didn't require cooperation from the XHCI driver:
>=20
> https://lore.kernel.org/patchwork/patch/1313001/
>=20
> Rob Herring raised objections about the DT bindings, since the USB hub wo=
uld be
> represented twice in the DT, once in the USB hierachry (with an explicit =
node or
> implicitly) plus a node for the platform device for the new driver:
>=20
> https://lore.kernel.org/patchwork/patch/1305395/
> https://lore.kernel.org/patchwork/patch/1313000/
>=20
> Alan Stern suggested to create the platform device in the XHCI platform d=
river:
>=20
> https://lore.kernel.org/patchwork/patch/1313000/#1510227
>=20
> I wasn't super happy about involving xhci-plat, but at least the code is =
minimal
> and all the device specific stuff is handled by the onboard_usb_hub drive=
r.
>=20
> If you have better suggestions that might satisfy all parties please let =
us
> know :)
>=20

Is it possible to use the graph binding to connect the USB controller on
the SoC to the port on the hub? Then the hub would be a standalone node
at the root of DT connected to the USB controller (or phy) and xhci code
could probe the firmware to see if there's a graph connection downstream
that is a powered hub like this. I didn't see this idea mentioned in the
previous discussions, but maybe I missed it.
