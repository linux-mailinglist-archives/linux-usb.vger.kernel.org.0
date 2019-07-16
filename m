Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E5C46AF21
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 20:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388420AbfGPSuA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 14:50:00 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:46199 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388348AbfGPSt7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Jul 2019 14:49:59 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so10211367lfh.13
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2019 11:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dawes-za-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HMzfIG1uRFdZFwWf1/G77UHnR4RoD1+cPW6gOihjUYg=;
        b=Alh7wQ8iKHtbiJCA2h0GdjUoDrkOxDx+Hr3xQTZBHmd68t4zOikfO9yZV+UWACU0Nm
         rxWHqods4Rv4S2Y64RcFQ/GUG1j/s6k2PZU3TaLwcGuTSdLdZfRnQrZM9ahlok2zGA3G
         AlqT+3ujfJm73O2WVbURi+5JTgb+wwNGWchjqE6a1IxH61DCcjMsJ8EPJd58HyqKmTSK
         Vp09HHZihcbATcdacyrYySnP9drRyx3ZnexB1NMDKskZpNkYDgi3K7tXE1Snz3IfDTR9
         vZ+CROdIndpY5X031OqEOKqFTFhR+iyHQpeXl4lhpQo3+ysfJQViFEnMmYT4IQ9TsrTH
         sKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HMzfIG1uRFdZFwWf1/G77UHnR4RoD1+cPW6gOihjUYg=;
        b=uITJKafNSkX+WXezmL8D3qv/00Wh6grcvjRYTqP3RQagkEmpzWWED8/d0UzJWY5o5Z
         eBX7EQf6EvAjyLbxWvZoRVvBpWqbBuIk3VWO7ydn/tAzJauMP8RFq3Z5H6TcfRXyqLis
         7HKsSZ/j9LW5OHMbUo/CammIJPXvVjrWyS7KcwbBjih4PqDj2jwP8U49F9JMA97+6FqS
         r8Uw+CocYQZxAm0RPpV5ALadbNFq4Y8s/Mt6daka8IDC2bPF2lPgEFLAEBUK+4LzGNaI
         CbZClCBWZPAS8QaHPZIjSM2C+QhNZM047TFQlK8D7PFTVQi7MC8S6Hm2VWfBXMc4SZ1f
         XNCQ==
X-Gm-Message-State: APjAAAWgjUvPww2rwGAI2CrBrDXEsEw+c9wafwak+0beWufr8q+kXPwD
        lyHnxSczOxkfpGGFvDXNgY9MxqiXOEVPPyZ39cM=
X-Google-Smtp-Source: APXvYqxNYccU1kYQ4r93oTc+Kqw/TqWv+SpQSAkG3PZSnhGYL+zMYUF9vR/e5ezab8XvfNTr0uaNyb8il4Wr6DoOxmI=
X-Received: by 2002:ac2:5636:: with SMTP id b22mr15197706lff.2.1563302997507;
 Tue, 16 Jul 2019 11:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190711094012.GA16316@lisa.dawes.za.net> <20190711103457.GA17414@lisa.dawes.za.net>
 <20190716091122.GB3522@localhost> <CAOYdKdiEUsk9O=ytis=u2yD-69LoKNSE8=ivwer8K3sMNCd8Dw@mail.gmail.com>
 <20190716111711.GD3522@localhost> <1eda7a85-f71d-950b-8efd-d3258ffeeab5@gmail.com>
 <20190716180510.GO3522@localhost> <CAOYdKdjFODZYpgQQJtck7Z=wtb5qPRujC5WiEvGEfZrDnCFyig@mail.gmail.com>
In-Reply-To: <CAOYdKdjFODZYpgQQJtck7Z=wtb5qPRujC5WiEvGEfZrDnCFyig@mail.gmail.com>
From:   Rogan Dawes <rogan@dawes.za.net>
Date:   Tue, 16 Jul 2019 20:49:46 +0200
Message-ID: <CAOYdKdjBtYt_2CuBxaTYKXCt7En+ESdOKeJ+kEEvvcNhkYs_7w@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: option: add D-Link DWM-222 device ID
 [version 2]
To:     Johan Hovold <johan@kernel.org>
Cc:     Lars Melin <larsm17@gmail.com>, linux-usb@vger.kernel.org,
        Dan Williams <dcbw@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 16, 2019 at 8:40 PM Rogan Dawes <rogan@dawes.za.net> wrote:
>
> I have no idea how to do that, I'm afraid.
>
> I'm mostly a cargo cult C-programmer :-) I can copy and paste, but
> that's about it!

That said, I think that I have already blacklisted interface 4, as it
was also blacklisted in the DWM-222 A1 hardware.

Rogan
