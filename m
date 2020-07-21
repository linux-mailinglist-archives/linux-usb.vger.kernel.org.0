Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4F0B227974
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 09:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgGUH1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 03:27:17 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43999 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725984AbgGUH1R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 03:27:17 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so22946539ljj.10
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 00:27:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uM1o/s5jzq3Whghqh/jti+1cVp5A7XS7/u7KiKObfzw=;
        b=dK/ccoIXoxWdnuFXBlSKggTBMRev8C11kfURrvk2qzYkqPk+ZV1vGKN8899jzNwUDP
         3jjgjaFf0fuI74CP8nC32frh0taa4B7wkbxEYIfFFG74JnWuCYidHz1Y1BgOEYE60rTW
         J3fBpaMq6zN+5KA3nDGJ2TB6iwq6NAZhvmsQMT4J6oYR8CYpBFxLnJ35YmHYkhoi1ayX
         LhEEjzZQo+GbYmFcY2DKvcOIIwaugkJMB20W8Q3p/CgHSa/DNJ4Y2pSakfFZb1CdUuTY
         h0BExMkyKXXcb/0b9ppAvl4jjYDBF+oPVrbzFXBBomG+nzHGKg3zXXTFej0uDALpTKyI
         1PMA==
X-Gm-Message-State: AOAM533rbIkvuUfvbzG44tWcoAFapUkZFTsu/vIhVQSKG6xoIaCJyHV/
        mZPm4G8fa0omoixWsO1lxsY=
X-Google-Smtp-Source: ABdhPJxyeStatsLvCZKF3EpjB7NYMu4yJiHo/1E9PvelgaITTUWOnNbtf9xBG5cV3KBDKCSZRxomrw==
X-Received: by 2002:a2e:9792:: with SMTP id y18mr12921037lji.172.1595316434520;
        Tue, 21 Jul 2020 00:27:14 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a5sm4775422lfh.15.2020.07.21.00.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:27:13 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jxmgA-0006La-TZ; Tue, 21 Jul 2020 09:27:10 +0200
Date:   Tue, 21 Jul 2020 09:27:10 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        George Spelvin <lkml@sdf.org>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix led-activity helpers
Message-ID: <20200721072710.GD3634@localhost>
References: <20200716085056.31471-1-johan@kernel.org>
 <20200716090503.GA1548743@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716090503.GA1548743@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 11:05:03AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jul 16, 2020 at 10:50:55AM +0200, Johan Hovold wrote:
> > The set-led command is eight bytes long and starts with a command byte
> > followed by six bytes of RGB data and ends with a byte encoding a
> > frequency (see iuu_led() and iuu_rgbf_fill_buffer()).
> > 
> > The led activity helpers had a few long-standing bugs which corrupted
> > the command packets by inserting a second command byte and thereby
> > offsetting the RGB data and dropping the frequency in non-xmas mode.
> > 
> > In xmas mode, a related off-by-one error left the frequency field
> > uninitialised.
> > 
> > Fixes: 60a8fc017103 ("USB: add iuu_phoenix driver")
> > Reported-by: George Spelvin <lkml@sdf.org>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Thanks for reviewing. Now applied for -next.

Johan
