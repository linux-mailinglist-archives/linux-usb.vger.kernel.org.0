Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E998230C88F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 18:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234197AbhBBRyu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 12:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238004AbhBBRxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 12:53:06 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7F4AC061788
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 09:52:26 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id y9so9721372ejp.10
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1tB4S5jLhLKvo7gnN06wmykthBef2GlOrD2/xcVl1A4=;
        b=a7ZnMTm4sWt6fyn+YApSQ0w4EABfeCbs9vFvoF2wWi5tUInQEA9ulPooKhD1GMMVeB
         TAA+Wt19ay/5u7Ngp3nONfJFLbQ2JuGUBoXoZHeWizvJiRIltrPVcS7RDkYH8EhMGnwT
         PWRuZXgGETL+EFckEimG550ma+kboXbKPeaxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1tB4S5jLhLKvo7gnN06wmykthBef2GlOrD2/xcVl1A4=;
        b=qU3HCtNXHUcBabfZCtKGP+Q7OUGlr58PlbDzAG+f9tJMZti6kzESt/NnYyEdfjR5Dm
         r+KkYl9TljtJ81A9KGYnBjYr9SF4rI15Eyq93ZEg5vwudRtF7QZGhv3JKpvWS2poKuue
         HnKJ6JJWXxZzGmtp7J/oa7uIQzQL2somJwq1PeAD4Xc0TMJY9Rk8fD3nVes4gOpB830x
         45CJA//kTNas09U2Vh4NFgfbSYH36fKfT3E6+brRGDTzzW0X7gAl0LUBOb21AXP40nXm
         6tOdQi7gE6Iqx86Y/DwxQtWWKb0xKcG61H8qwbuEHcBjBURQ1OXrqRnj5GL0iOhxwlzq
         tbgQ==
X-Gm-Message-State: AOAM532IVg7HaUZcaK0odvC6IeFbCNZp7JKi3dqWAiF91bfgU0sTUIFO
        acibY48SHpb/p5Y9C7QWNycRah3JwniMRDLboeNwMA==
X-Google-Smtp-Source: ABdhPJz9j3bI4orrAdE7VqjHuU+Oh1ba5hhmYn/Zjuu6iN8UHXGhDXjaATmQaFyVUpo5W2FIaguym6nJO9O98UfQMrM=
X-Received: by 2002:a17:906:2407:: with SMTP id z7mr23893655eja.219.1612288345094;
 Tue, 02 Feb 2021 09:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20210202164531.3982778-1-bleung@chromium.org> <YBmFo5L1eeUwCJ9B@kroah.com>
In-Reply-To: <YBmFo5L1eeUwCJ9B@kroah.com>
From:   Benson Leung <bleung@chromium.org>
Date:   Tue, 2 Feb 2021 09:52:13 -0800
Message-ID: <CANLzEkuFgLK9saqHhHdrKhOjsiG001d1N9EYXsnohoMPHsAPGg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/chrome: cros_ec_typec: Fix call to typec_partner_set_pd_revision
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Prashant Malani <pmalani@chromium.org>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Tue, Feb 2, 2021 at 9:02 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Feb 02, 2021 at 08:45:31AM -0800, Benson Leung wrote:
> > typec_partner_set_pd_revision returns void now.
> >
> > Fixes: cefc011f8daf ("platform/chrome: cros_ec_typec: Set Partner PD revision from status")
> > Signed-off-by: Benson Leung <bleung@chromium.org>
> > ---
> >  drivers/platform/chrome/cros_ec_typec.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
>
> What changed from "v1"?
>

Just the "Fixes" line in the commit message.

-- 
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
