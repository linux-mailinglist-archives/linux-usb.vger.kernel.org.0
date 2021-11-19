Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B234576FF
	for <lists+linux-usb@lfdr.de>; Fri, 19 Nov 2021 20:27:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhKSTag (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Nov 2021 14:30:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhKSTaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Nov 2021 14:30:35 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA581C06173E
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 11:27:33 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y8so8888020plg.1
        for <linux-usb@vger.kernel.org>; Fri, 19 Nov 2021 11:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=lsppzZdzu+Waonf7w8q0N1vP3OgbHGJj0JhrjEEHC0w=;
        b=sdsdx0ECSB96vcQ3k2RO6euUeTaYzHNHHySgOi1TWAYLU6aP/1JhKuvNFr7RTpC6wb
         ZJOhnbwQv7hWRqgvDpkXlLfamAhJgZRNEFrqcS7JYOSsCOKUbiJFsxNpTCLytXXsrH8l
         vjkAxpXsYiBZ6XgtI6NKAP8v2xXKyXzwrJD8j847Oq4q/LAUB2G8I3JOah1ktjceP/YP
         skeEwcTQ0ANnl6g8jWvtd0oRXQ8o53eGfB/hAYUkotB719+ftf1/zbRFnqM1nfjxzC9V
         r93Vmx+P5JJ2uT6DMdMHE15dVCbRsEzDYMgS+fZjbP1F5z3/fvnxr5hzvkg1Bw1myizB
         rE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=lsppzZdzu+Waonf7w8q0N1vP3OgbHGJj0JhrjEEHC0w=;
        b=gf6BjY2jEiOgUmNggyHoxpv0UPmM12hjsnuY3qIQZwb8fiE/BBtA4C4OoULlLonxsN
         bU0pjXpKpuDfD8R4jXifWD7l39+LaUaxHINGl8rPZsDlR7OgmA8XJ296yT0yi+5Ey0K5
         7HRUMWY3uulW2Yh5n2Sno5iBIExSkGd4PlYfdCHbAx+oxkZsYlg+Z1yIQ91jLyFlDumb
         39qcVpFccjwKSILoou9CNNviJhoFwCNPHYuK0FW2C3xqqr2JOfuCGcsVnOIq3mgqi62d
         1cOHeODJe4VtXCK50NNSnETg95toeDR8x2F9wybRyfI6DSYFLHE+xBXt/Sihj2LqhiAy
         UprQ==
X-Gm-Message-State: AOAM532bre/fAFBqEgiSkksJM1kUDuZbt4o9cP/HMF3SzlFAo4D//4OW
        SC/EYQH254iQ5GkkIDqcSTyyZbmXPb66/A==
X-Google-Smtp-Source: ABdhPJxOo/o7SIb2aVYrZEfxQvdQltW4IlVreuuhSwTq9VHRSiasfHQpkb2LnTZ+qwuAmLwg8QEVFw==
X-Received: by 2002:a17:902:b28a:b0:142:3e17:38d8 with SMTP id u10-20020a170902b28a00b001423e1738d8mr80719122plr.56.1637350053331;
        Fri, 19 Nov 2021 11:27:33 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id mp12sm11291688pjb.39.2021.11.19.11.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 11:27:32 -0800 (PST)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc:     Amjad Ouled-Ameur <aouledameur@baylibre.com>,
        p.zabel@pengutronix.de, balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/3] usb: meson: fix shared reset control use
In-Reply-To: <20211112162827.128319-1-aouledameur@baylibre.com>
References: <20211112162827.128319-1-aouledameur@baylibre.com>
Date:   Fri, 19 Nov 2021 11:27:32 -0800
Message-ID: <7htug854kb.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:

> This patchset fixes a usb suspend warning seen on the libretech-cc by
> using reset_control_rearm() call of the reset framework API. 
> This call allows a reset consummer to release the reset line even when 
> just triggered so that it may be triggered again by other reset
> consummers.
>
> reset_control_(de)assert() calls are called, in some meson usb drivers, 
> on a shared reset line when reset_control_reset has been used. This is not
> allowed by the reset framework.
>
> Finally the meson usb drivers are updated to use this new call, which
> solves the suspend issue addressed by the previous reverted 
> commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
> use").

Tested-by: Kevin Hilman <khilman@baylibre.com>

Tested suspend/resume on Khadas VIM3 and confirmed that the reset
warnings are gone.

Kevin
