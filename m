Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0AF2B1D93
	for <lists+linux-usb@lfdr.de>; Fri, 13 Nov 2020 15:37:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgKMOhc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Nov 2020 09:37:32 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:43806 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726443AbgKMOhc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Nov 2020 09:37:32 -0500
Received: by mail-lf1-f47.google.com with SMTP id d17so14099880lfq.10
        for <linux-usb@vger.kernel.org>; Fri, 13 Nov 2020 06:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZHY872/0WcYO4ydQa857YZgLKhKQ8e4tP7SuYJav/XA=;
        b=jAaTd0CDUcK1AnX6DJCwdUfFBJ/QqEf7OKSde+rNoiIMpX/e7B8e7hKBKg7lYdSS9f
         JOn/jkoNHyDVCvNLmwB30E82DgbTA6PGrX7fHX98u2d8AiD1PjKdurEpbjJPXn42k3JQ
         wc/hHfS5TfotsJfHMJZ2a2xbRnia7OZrsoUSFunBqRlexX7b/M0gHibt94ighYXNoLYQ
         WlbmXhh5wLXqMk6xWJsh580ekd64i2gOe0xmHAU9njf7ehPhj37P9Y94ylppmikYgUpv
         yby2pszO3cp3QGOLTThhz6UQm50G5HFRTM0SIeTqJlEcXJsHQPYTzXAVYb6Uf9R90Lu7
         1VmA==
X-Gm-Message-State: AOAM5322PKVyoo6q3gHk3a7MKVPjLtJJ3jFndsdHUNTyx2aabbNqWMOz
        nUhVmbj4CDeCxXO0o5jD9wg=
X-Google-Smtp-Source: ABdhPJwMTx53x43eDWtDGOtIeFH15aS39G/WnhzyoOKEgOnUi0Xjr8ict3x/c4srL8G7J/RdKc4OIg==
X-Received: by 2002:a19:7f55:: with SMTP id a82mr1159315lfd.603.1605278250178;
        Fri, 13 Nov 2020 06:37:30 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id f62sm1583800lfd.144.2020.11.13.06.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:37:29 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kdaCo-00024Q-9n; Fri, 13 Nov 2020 15:37:38 +0100
Date:   Fri, 13 Nov 2020 15:37:38 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Johan Hovold <johan@kernel.org>, Bin Liu <b-liu@ti.com>,
        Felipe Balbi <balbi@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kbingham@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: USB multi-serial using few endpoints?
Message-ID: <X66aMn2K4Kla/s5T@localhost>
References: <CAMuHMdU4VQ8kvM=1bXpDmVGicU7-T78f0uZw8G2wZWctnwsJog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4VQ8kvM=1bXpDmVGicU7-T78f0uZw8G2wZWctnwsJog@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 13, 2020 at 02:07:41PM +0100, Geert Uytterhoeven wrote:
> Hi all,
> 
> TL;DR: I'm looking for a USB-to-multi-serial solution that uses as few
> USB endpoints as possible.  Anyone with a good suggestion?

Moxa has a device with 16 ports that only use three endpoints; see the
mxuport driver.

> While I cannot replace USB-serial convertors on development boards, I
> can replace the USB serial implementation on the Teensy.  Hence I'm
> looking for a more efficient USB-multi-serial protocol (preferably one
> that has a Linux driver), using as few endpoints as possible.
> I'm not a USB expert, but If I'm not mistaken, an N-port
> USB-multi-serial adapter could be implemented using only 2 or 3
> endpoints (one "locked" input endpoint for signalling, and one (TX/RX
> combined) or two (TX and RX separated) multiplexed endpoints for data)?

Right, you'd (typically) need two bulk endpoints for tx and rx. The Moxa
protocol use a third for signalling events. (And USB devices always have
a control endpoint, which I don't count here).

> If no such thing exists, I guess I can use the mos7840 protocol instead?
> Or is there a better solution?

You can always roll your own minimal mux protocol in case the moxa one
is too complex (and we may want to keep an alternative implementation
separate for other reasons).

And then there's the n_gsm line discipline...

Johan
