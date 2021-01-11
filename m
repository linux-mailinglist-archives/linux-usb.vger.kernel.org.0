Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF68B2F2261
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 23:03:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732206AbhAKWDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 17:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731408AbhAKWDW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 17:03:22 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22EE9C061786
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 14:02:41 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id o19so304769lfo.1
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 14:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L04umv6qv4ESTh2voyQwzzNRDxtMh3ldDzgJSuRk7uw=;
        b=Wz04i5Nr0V1v2ypE/g4+U8fUexoNk2VFXx3OXYqaWzVl3osh85aVypL6Nz0C5gU1Cs
         A4JVfYI8hWA1Rs4Fyr9nfjCsditVrJVYbKpyEocxNBikBOmL54lZkRT5xtjUZ0Q27uDl
         pWXzZhz+8z3+5pfsZcI0pA9AMDzSf5sYHZlhgMB02y/rd2rxomCnXWuXzrvB6B5O+sjA
         GTGnda3zt2lHDuSK7A7YL6kIj+nG6+xtjsmC3OqM0A85gfwqiZhtO1DjulxpviY+NCgZ
         5jj94QBCiwS3FHQfddfaU3oo7FGEAUzF9l/kh9icMRIFeKG/zJl6HgrMts8FoeJfel4D
         sSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L04umv6qv4ESTh2voyQwzzNRDxtMh3ldDzgJSuRk7uw=;
        b=Pjba2Cmi3I2Fx+paW1J/uWIsQNcJKgzKN5r5ocJZy9sz+vYY1ygnMxdjJqIxmvZiAJ
         fb7z6rbKwBTQ69LithodwStCbKs5Le7IdH8niThLEPJBAzyn4bYyChrghwlZEgNQE9ng
         Ja/MQoz95A7pxa8ngBoZw6CbgUjM2/+9Foo8+fLHRUs8dbazIJTy9j3bmHd/Xse3A/9+
         KVb2hLaP8Sq5mAsRZbPgMSFi6clpu+ICJRf7wxCn9g3Zea1Xnc7oBxdnXOIA8DRBeLzb
         +tAsP8Rctu1xyx9BPgGRI4DwMc62e+SkQ/iGzXHgyiG46+cPv582kS6o9et39zX7Er61
         aHhg==
X-Gm-Message-State: AOAM532t2izQZ9JedqXfQ25J8WVgBiKi89/q2VXY3XFbAmtXowbG0igK
        ew2jQ9tIONu20aq/q0lZi92fYep/ycZ8XarQqwQ=
X-Google-Smtp-Source: ABdhPJz4I47ji0Ed9CNF0C+j7MvfMWvylTWTVkScqXlg/GesSCAQHVBfq/itZDhBY89/+yZrsEFgm7/BpnLesrUWE80=
X-Received: by 2002:ac2:5685:: with SMTP id 5mr736097lfr.325.1610402559561;
 Mon, 11 Jan 2021 14:02:39 -0800 (PST)
MIME-Version: 1.0
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com>
In-Reply-To: <X/y1ekqBrjXK8lZO@kroah.com>
From:   Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date:   Mon, 11 Jan 2021 23:02:28 +0100
Message-ID: <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
Subject: Re: Conflicting PCI ID in bdc driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Al Cooper <alcooperx@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 11, 2021 at 9:29 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Jan 11, 2021 at 08:34:01PM +0100, Patrik Jakobsson wrote:
> > Hi Al,
> > The PCI device ID of 0x1570 in the bdc driver (bdc_pci.c) is
> > conflicting with the Apple FacetimeHD webcam [1]. Is this caused by an
> > incorrect ID in the bdc driver or are there actually two devices with
> > the same ID in the wild? If we have a real conflict, how would we go
> > about solving this?
>
> Looks like someone at broadcom messed up :(
>
> Can you look for any other fields in the device other than just the
> vendor/device ids to verify that this really is a webcam so you can not
> bind to the same thing this driver wants to bind to?

Right, we could check the class. But I suppose it must be fixed in
both drivers? bdc must not bind to the webcam and facetimehd must not
bind to the UDC. So which class is bdc reporting?
PCI_CLASS_SERIAL_USB_DEVICE?

>
> thanks,
>
> greg k-h
