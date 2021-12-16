Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55C02477E0E
	for <lists+linux-usb@lfdr.de>; Thu, 16 Dec 2021 22:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241529AbhLPVBW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Dec 2021 16:01:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbhLPVBV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Dec 2021 16:01:21 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C9BC061574
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 13:01:20 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b40so407522lfv.10
        for <linux-usb@vger.kernel.org>; Thu, 16 Dec 2021 13:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qmdq20bwbw/gzUdf5zXOLxv7YfklhZaXo4OhGN0CDfY=;
        b=qEgU2sRSXS5WLsA8DBWKaMIsvgN/3TVuQ7tlv8eGu1VfjETqcjGxbjnv9h1aP2ll1C
         uEUgPFZ+uzBd06UlXVP9qCkMWhDPp3Y1GiMehhPwNmgfTfs+mUMzeJfugd8tyqN1aHPk
         EgM4r/1q3nKHu49HdkTsK4Re8JPnUcc10w/KaMvT7D/UNSS5ZeTQhPjZ97NIdHV9pv4C
         nY6N6z2G9PVvDWsWlhohfjxZlzRlrXDgy9n/GNW1R2SayTLvGGpZKjZoqcL2yrkiI7ZC
         YIsq9AHOzSNpzhGNy6vtPJQ+JRx9HiMNHj0nhltEfYqcWOzNWd9dXyYEkQBtw9qz+Fru
         LtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qmdq20bwbw/gzUdf5zXOLxv7YfklhZaXo4OhGN0CDfY=;
        b=1PAokIbBZt+YvH6EjIAiSRVSG0Xw5Jhz+2rXsog+IhM5fmIqQ3/7QO9ngzxIWJlOdg
         zGzWdZ6ZnuGC4JqPi5AHeMlPn5PAqIdnKqQlzSl7c6nlHzcXhnBHb8rTizN6McyRd7/9
         sSbM77nwjnUK9ChHrbBKQVixgH+2wibcDr7ZtiytxvkpPLqWyFtIqIIjwD4ClCSixkBJ
         gKsbqDGs0EcAQhVY+DM5acTDZUpgdbxmw9OhZ5MOPgqj8o8/hx1UtNvxwFOiBlZW5twe
         1mbweir+FKTgOY0x/d5KUrmbm+8to20IZJ8Lm24fiz88k7gGNih1kWP0a/XcpDX2FEaN
         Y8Vw==
X-Gm-Message-State: AOAM5334Gqr73UiAAQEp8EncZbSI+/reTAsNyNDihH8hNFMBtErF3+GQ
        CCVRdmv21Bk+6BQo1nlcB9o=
X-Google-Smtp-Source: ABdhPJwYg2usutGv++H0s9FuMl4eyNTxxc1tSRhWaVV8dgID6lwv5O9gnbxQ4HrAzZFnFDfX/jCaSg==
X-Received: by 2002:a05:6512:3250:: with SMTP id c16mr17029480lfr.123.1639688478288;
        Thu, 16 Dec 2021 13:01:18 -0800 (PST)
Received: from dell-precision-T3610 (h-98-128-167-144.NA.cust.bahnhof.se. [98.128.167.144])
        by smtp.gmail.com with ESMTPSA id t7sm1045307lfg.115.2021.12.16.13.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 13:01:17 -0800 (PST)
Date:   Thu, 16 Dec 2021 22:01:16 +0100
From:   Lars Gunnarsson <gunnarsson.lars@gmail.com>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 0/5] tools/usbip: Patch set summary
Message-ID: <20211216210116.GA5743@dell-precision-T3610>
References: <20211130222254.GA16447@dell-precision-T3610>
 <ea85cb17-69a1-6f6b-d1ab-a75eb73991e1@linuxfoundation.org>
 <20211209211134.GA12115@dell-precision-T3610>
 <475637fb-6636-aaa5-39e4-ec7eed0ee995@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <475637fb-6636-aaa5-39e4-ec7eed0ee995@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 14, 2021 at 03:22:57PM -0700, Shuah Khan wrote:
> On 12/9/21 2:11 PM, Lars Gunnarsson wrote:
> > On Mon, Dec 06, 2021 at 01:02:35PM -0700, Shuah Khan wrote:
> > > On 11/30/21 3:22 PM, Lars Gunnarsson wrote:
> > > > To forward a remote usb device over usbip the following steps is required:
> > > > 
> > > > 1. Execute "usbip bind" on remote end.
> > > > 2. Execute "usbip attach" on local end.
> > > > 
> > > > These steps must be perfomed in above order and after usb device is plugged in.
> > > > If the usb device is unplugged on the remote end the steps above needs to be
> > > > performed again to establish the connection. This patch set implements a feature
> > > > to persistently forward devices on a given bus. When using flag "-p|--persistent"
> > > > on remot end, the USB device becomes exported when plugged in. When using flag
> > > > "-p|--persistent" on local end, the USB device becomes imported when available
> > > > on remote end. Thus it is only required to run the usbip command once on each
> > > > end, in any order, to persistently forward usb devices on a given bus.
> > > > 
> > > > This is sent in five separate patches:
> > > >     tools/usbip: update protocol documentation
> > > >     tools/usbip: update manual pages
> > > >     tools/usbip: add usb event monitor into libusbip
> > > >     tools/usbip: export USB devices on a given bus persistently
> > > >     tools/usbip: import USB devices on a given bus persistently
> > > > 
> > > 
> > > When -p is used, the command stays in foreground. This is a very
> > > different use model compared to current model. In addition, once
> > > persistent flag is set on a bus, all devices even the ones that
> > > are inserted in the future get exported. What happens if one of
> > > the devices shouldn't be exported?
> > 
> > Yes it's conceptually more like exporting/importing the physical usb port,
> > rather than exporting/importing a device plugged into the usb port. Using flag
> > "-p" on both ends will behave like a "virtual" usb hub, a device plugged in on
> > the server (on a chosen bus) will automatically be available on the client.
> > Using flag "-p" has no dependency on the other end though. Using "-p" on one end
> > doesn't enforce usage on the other end. It is only for exporting and importing
> > devices automatically when they become available.
> > 
> > There might be better choices than naming flag to "persistent" for easily
> > communicate this concept. Would "port" be more intuitive?
> > "usbip attach --port 3-3.1" and "usbip bind --port 3-3.1"
> > 
> 
> Terminology isn't what I am concerned about. My concern is the idea of
> automatically making devices available for export at bus level.
> 
> > > 
> > > There are several conditions to be thought through:
> > > 
> > > - What happens if if the command that is running on the foreground
> > >    is killed on either end?
> > 
> > If "attach" cmd gets killed (client side) it will stop the foreground
> > monitoring. The device will still remain imported if user exit at imported state.
> > The user then needs to manually unimport the device with "detach".
> > 
> > If "bind" cmd gets killed (server side) it will stop the foreground monitoring.
> > The device will still remain exported if exit at exported state. The user then
> > needs to manually unexport the device with "unbind".
> > 
> 
> My concern is the persistence nature of these exports/imports through
> reboots. I have to give it some though on how this can be implemented
> addressing my concerns.

Can you elaborate on your thoughts about "the persistence nature of these exports/imports through reboots"?
reboot as in exit from foreground and run the command again?

> 
> > > - What happens when one or more devices are detached?
> > 
> > If user exit from "attach" cmd running in foreground, followed by detaching the
> > device manually, it will work as previously. The device will become available on
> > the server for importing again.
> > 
> > If user running "attach" cmd in foreground, while executing "detach" manually
> > from another terminal or similar, the foreground "attach" command will detect
> > the disconnection and re-establish the import. I don't see any use case for
> > this, it's just for explaining.
> > 
> > If user running "attach" cmd in foreground, while the remote device becomes
> > unexported (or disconnected) it will start polling the usbipd.
> > When a device becomes exported on the chosen bus it gets imported immediately.
> > 
> > > - What happens when one or more devices are unbound from
> > >    the server?
> > > 
> > > Let's walk through these scenarios.
> > 
> > If user exit from "bind" cmd running in foreground, followed by unbind the
> > device manually it will work as previous. The usb device will become available
> > on the server again.
> > 
> > If user running "bind" cmd in foreground, while executing "unbind" from another
> > terminal or similar, the foreground "bind" command will detect the unexport
> > and re-establish the export. I don't see any use case for this, it's just for
> > explaining.
> > 
> > If user running "bind" cmd in foreground, while the device becomes unexported
> > or disconnected it will restart monitoring the busid. When a device becomes
> > plugged in on the chosen usb port it gets exported immediately.
> > 
> > One option to consider is to unexport & unimport the device at exit, but this
> > comes with the cost of creating a source code dependency between
> > bind --> unbind and attach --> detach.
> > 
> 
> How does this look like in code?
> 
> thanks,
> -- Shuah
