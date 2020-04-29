Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1966C1BD22F
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 04:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbgD2CUd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 22:20:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbgD2CUc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 22:20:32 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 849CCC03C1AC
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 19:20:31 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d184so354671pfd.4
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 19:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QU9YnDq0B1lSLnKPkTeV1SB9aq1zJxrEKnVQfqdeHz0=;
        b=HwawRZZiCDqb7NPcvT2e8AoqloEPHB/0EG74BeD0bZRyxOyi+OsR7g0VglRiT2kS1L
         roi7zKjetA+dV/HBP50+JF2q1NexXHLoINb+YBaaMz76HAqa5RmqNGtxakT0zEBbbuSY
         EDKKOCmDyrfmSG4AqWTMGym31rlpNatKdR8RO9yb8luBZKws5nw1HwknFaDZEscejR82
         ZxSkBsBok6H//Hlfd3qg+iY5xxpnDdG+Rab4JHGJA2s6AmI15Hgw03OuLWmdzu4aVktH
         P9VZ7B7yt6vl8sDNKAegcPkbdI5eQ8dIhrnCsogtvFmpWO9mhPC7sOgeAPJJjKF1Ky/p
         P+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QU9YnDq0B1lSLnKPkTeV1SB9aq1zJxrEKnVQfqdeHz0=;
        b=snD6+kQppncWlrOFYZ1Ma5R3W5xeCVetlgcXhv4xANFM0ghi83ZyPJT/i4wOH8S0wZ
         LqYVUuEiGcqhtCOFObE/oNVb4K3dlRV/K1yJD6LKbIpi+aDzHvnC0QujgczVG6a0I1Yf
         ZtLxIWFYk9Zp0mV6Spwl1w4ltEKAOGMb+nClJoJBGcTYJg13cfVK6hBb8SYaX7R/uH+3
         8CrIxnJlOFMrCv11TlpXWERLplb+JWSofhzS8TqE5PqK4rVN+Ft5lISv0VXkDpnmfWDI
         qeWDo+ZJI2JvmF26k/iuOmqKuu6eJlq2dJGaxNBvGoLRxDaM59jJraBT6GQrrgkdAAb5
         g5GA==
X-Gm-Message-State: AGi0PuZC1vi0s4oeJHeMB2I7A2njwG5PzGtyv5/H98gH0UpmpWAQll5d
        OuCDQ5AzQpWC35JrckhRsKFWzOpLhEZogpdtnQe/ZOZYP7g=
X-Google-Smtp-Source: APiQypJyfBidoXG0v2pX2Ug//SUNrCTklId8WVumsofMy1+CzkIONwPlcRrEFxG6MNffIuJQT1oa5H95V3QxwSBHIIc=
X-Received: by 2002:a62:5289:: with SMTP id g131mr23510194pfb.318.1588126830732;
 Tue, 28 Apr 2020 19:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+x5-z85v97ySvX+5=sJTn=hVbpkbCiQBZCD-6BKvKPSpQ@mail.gmail.com>
 <Pine.LNX.4.44L0.2004101136490.15021-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004101136490.15021-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 29 Apr 2020 04:20:19 +0200
Message-ID: <CAAeHK+x7AK=D1TA+K6hosWA=0-z0pqGu0W0QEVeZwqGNdFMaMQ@mail.gmail.com>
Subject: Re: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 10, 2020 at 5:53 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Fri, 10 Apr 2020, Andrey Konovalov wrote:
>
> > On Fri, Apr 10, 2020 at 2:29 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> > Something else: I've been testing raw-gadget with various UDCs that I
> > have [1] and everything seems to work, except for emulating SuperSpeed
> > devices with net2280. I've just found it out yesterday night, and
> > haven't had a chance to debug that yet, but if you know about some
> > potential issues I could encounter with SuperSpeed/USB3+, please let
> > me know.
>
> Well, USB-3 has streams, unlike USB-2.  You may want to think about
> supporting them.

Do I understand correctly, that to support streams I basically need to
allow the user to set stream_id on the request being submitted?
