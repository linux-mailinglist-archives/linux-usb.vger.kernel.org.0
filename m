Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51CEF48CFEF
	for <lists+linux-usb@lfdr.de>; Thu, 13 Jan 2022 02:03:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbiAMBDE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 20:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbiAMBDB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 20:03:01 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F12EAC061748
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:03:00 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id i82so6252158ioa.8
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tolh3fWC8TzEFvR0VYDqmge8PKhESkhvv8oEEP8Bf/E=;
        b=DUaImKW4iNccfk54IyZZJnpJecwSSeSobRWp8u89j4HUEsFQE8MsHVfuSlYkQSEhUI
         Z0j/sc4J9KiunrdW8P+yG3Q+mm9bMgK4yLACViPVZtGSV99RnleBTlWB8yWzzykNQFk6
         AuEfF63NVZ4XuNRXJYbIIVtNLLjjKpTtZBc4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tolh3fWC8TzEFvR0VYDqmge8PKhESkhvv8oEEP8Bf/E=;
        b=Hz3xEXSlziAubbzKqkMPkaaRVFZVLelLOc+UlxOpc+uzOisk1NQu06SegMxzxlnzYq
         S95LRDPCbYxuyFpPVSrmNwZ/4s25kYYpA/kfv7YGCHfaOctaxJEV2OB+AtLH4dGeG1ds
         i6vTcUu1BPrhtHF/YXBnUgSqG5a5qzm45QCB7S6bmWCyzKau5UQdIEegHuM1rL/yTkwr
         xluRaNxGadAY9mqYCwRf5ldHMI/d6ddhr0C5DzQQhM9oRWw3PQT2HkDKCogSD8huX2kN
         e2I9soYGHZqbx5tkdJ5JRngPnNbXrAxwYFHYZPij9+MMl2qehOzVxQP23oB5We1Fas5H
         X+Eg==
X-Gm-Message-State: AOAM530hkblOIUcg38vaq0Y1TAAjbeQP0ofqPL9UC1vlvrHkHdPdZQTi
        8A9XhE2q0qBDPGasK2BzJZcv9bT5xQlyEg==
X-Google-Smtp-Source: ABdhPJylvpq+wFrnICipsZ0RWFpNQqXGSwRRaztFUv/v1DBEkw1s3mslVzi536yQTx//bPt5u1S7IA==
X-Received: by 2002:a05:6602:1502:: with SMTP id g2mr1006821iow.155.1642035780078;
        Wed, 12 Jan 2022 17:03:00 -0800 (PST)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id h7sm829017ior.53.2022.01.12.17.02.59
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 17:02:59 -0800 (PST)
Received: by mail-il1-f181.google.com with SMTP id z17so2133298ilm.3
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 17:02:59 -0800 (PST)
X-Received: by 2002:a05:6e02:20e6:: with SMTP id q6mr1247332ilv.180.1642035779032;
 Wed, 12 Jan 2022 17:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20220112191048.837236-1-mka@chromium.org> <20220112111028.v19.2.Ie1de382686d61909e17fa8def2b83899256e8f5d@changeid>
In-Reply-To: <20220112111028.v19.2.Ie1de382686d61909e17fa8def2b83899256e8f5d@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 12 Jan 2022 17:02:48 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xt79oe=wCOpBqE-Y6wKbOV+77-BXVnxb9itozcX0WjPQ@mail.gmail.com>
Message-ID: <CAD=FV=Xt79oe=wCOpBqE-Y6wKbOV+77-BXVnxb9itozcX0WjPQ@mail.gmail.com>
Subject: Re: [PATCH v19 2/5] driver core: Export device_is_bound()
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Jan 12, 2022 at 11:11 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> Export device_is_bound() to enable its use by drivers that are
> built as modules.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v19:
> - none
>
> Changes in v18:
> - patch added to the series
>
>  drivers/base/dd.c | 1 +
>  1 file changed, 1 insertion(+)

Though it's probably above my pay grade to do so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
