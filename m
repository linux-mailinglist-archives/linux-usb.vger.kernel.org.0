Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43321190A2E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbgCXKFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:05:43 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:43391 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbgCXKFn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:05:43 -0400
Received: by mail-lf1-f67.google.com with SMTP id n20so12668513lfl.10
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=muL5WwuZeHRIWwUtcJeJpBMAizLFgTYYGfm0B1HRdEM=;
        b=pkVGdii+StnxMAgELNPz2MnY6aPu2WiHdU3wQwItoQEL71Yn9vw9kqOEuREDqyIgIr
         B2IX0qeKt/kZdeQMZ8CXnpyrqXpyoWmV1sPRk+h9PC3033daIIJUKHvne6YblxBPwqGE
         xA5q8PJ05tf43fYONQVQ/h4CCxhAndX8rP0nOS08VCSejQXc67HzTvI0ykwW/jJ+XN87
         CjWhlHxiePreiO1sQiqo/hTngAw+rTjsTam4ylP5QBMFWL9dsM1VjnO+Z3HVG08xCc9r
         a6z0ypBuryi0rr2BXwJSqktGxuzlnufbH5NWgR0D3sp6/XNi14GJ/gsmwuyF6XJKhvHA
         t8cg==
X-Gm-Message-State: ANhLgQ29vJ7r8rURkw6CIqtEXGh9zELIiYF0ECjJKU4pzn2ybbjhFvd6
        cPC7k838KjFs20vDyc+d2gzAdPyl
X-Google-Smtp-Source: ADFU+vvBeVjeD0Dxc9OTp+l7kyvuXX3e5JTj4yBW8M4a157o/pgaTDhub69ZbQqFzAvFbmdcR1AV1A==
X-Received: by 2002:ac2:5de1:: with SMTP id z1mr15762735lfq.95.1585044341759;
        Tue, 24 Mar 2020 03:05:41 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id r4sm9454020lfc.40.2020.03.24.03.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:05:41 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jGgR8-0006MQ-7R; Tue, 24 Mar 2020 11:05:30 +0100
Date:   Tue, 24 Mar 2020 11:05:30 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH 0/4] ch341: Add support for HL340 devices
Message-ID: <20200324100530.GD5810@localhost>
References: <cover.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1583520568.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Fri, Mar 06, 2020 at 07:00:41PM +0000, Michael Hanselmann wrote:
> A subset of CH341 devices does not support all features, namely the
> prescaler is limited to a reduced precision and there is no support for
> sending a RS232 break condition.
> 
> These devices can usually be identified by an imprint of "340" on the
> turquoise-colored plug. They're also sometimes called "HL340", hence the
> terminology in this series and driver.

You need to come up with a different designation. I have a HL340 device
here which works just fine.

> This series adds detection of these devices, adjusts the
> divisor/prescaler setup and implements a simulated break condition.
> 
> Michael Hanselmann (4):
>   ch341: Name more registers
>   ch341: Detect HL340 variant
>   ch341: Limit prescaler on HL340 variant
>   ch341: Simulate break condition on HL340 variant

Nit: please use a "USB: serial: ch341:" subject prefix.

Also, if possible, please move the second and third patches first in the
series as these could be considered fixes rather than new features (and
considered for backporting).

>  drivers/usb/serial/ch341.c | 196 +++++++++++++++++++++++++++++++++----
>  1 file changed, 176 insertions(+), 20 deletions(-)

Johan
