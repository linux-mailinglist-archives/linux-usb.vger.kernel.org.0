Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61E3E150287
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2020 09:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBCI3D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Feb 2020 03:29:03 -0500
Received: from mail-lj1-f179.google.com ([209.85.208.179]:41169 "EHLO
        mail-lj1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgBCI3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Feb 2020 03:29:03 -0500
Received: by mail-lj1-f179.google.com with SMTP id h23so13637488ljc.8;
        Mon, 03 Feb 2020 00:29:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=3YCnE/age39hCmeEd+nZ+45rvEHnTPimzDyiOBmMOcY=;
        b=VM/GvPivIEwwFxpEWLauGOInbXF501A7ZzJVe47UB+efZbzTln+n/IJUGVPyRruzgb
         ZSkglJrAJ0VXPMQFdcQ/47BdipHYjcW0vOkXsNN42loYFuo8+HGa+A8hGeJXaESAJNMI
         1CT/OtPB74n2luSssjt8VDpmxKT7TLXcjU3OJYXmusmzlFZzNUzSnawOd8gZXnFG/Ux1
         OwMyA9Ijq4XEoaz0s/xm1rOQISMKgnstNXyoR1aJWJmNPXqwWHzO19O85D76irV0jvd4
         fuO+IafEX1YdVpdb3I8Qq7BtsIQ14a+60owfiHUG8xhVq4gwwCJmeKqNi+5n+tkpj3k5
         L0xQ==
X-Gm-Message-State: APjAAAXbOxfu8Zsb/qb+pieEcItnMraD3+bWiLwRgltoNfEdQ75nA8Zr
        gBd6B/De5RE8qfLDg++0b0s=
X-Google-Smtp-Source: APXvYqzUxqN/1MsNJ1IGyarNjjF6F7M0Eh00ADy+7zRBkQNplNAnrd0P5aWwhYNh5FCwtcbjYBDNrg==
X-Received: by 2002:a2e:84d0:: with SMTP id q16mr13467708ljh.138.1580718540700;
        Mon, 03 Feb 2020 00:29:00 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id g27sm8586082lfh.57.2020.02.03.00.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 00:28:59 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iyX6S-0004GU-A2; Mon, 03 Feb 2020 09:29:08 +0100
Date:   Mon, 3 Feb 2020 09:29:08 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Takashi Iwai <tiwai@suse.de>
Cc:     edes <edes@gmx.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: kernel 5.4.11: problems with usb sound cards
Message-ID: <20200203082908.GR10381@localhost>
References: <20200201105829.5682c887@acme7.acmenet>
 <20200201141009.GK10381@localhost>
 <20200201132616.09857152@acme7.acmenet>
 <20200202101933.GL10381@localhost>
 <20200202134159.GM10381@localhost>
 <20200202202816.5a1d8af1@acme7.acmenet>
 <s5ha76085my.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <s5ha76085my.wl-tiwai@suse.de>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 03, 2020 at 08:57:41AM +0100, Takashi Iwai wrote:
> On Mon, 03 Feb 2020 00:28:16 +0100,
> edes wrote:
> > 
> > 
> > el 2020-02-02 a las 14:41 Johan Hovold escribi�:
> > 
> > > I realised I forgot the test to match on the device descriptor when
> > > applying the blacklist. It doesn't matter currently since I only enable
> > > the quirk for your device, but if you haven't tested the patch already,
> > > would you mind testing the below patch instead?
> > 
> > Hi, Johan, thank you for looking into this. I tested your patch, and it
> > works! (5.4.11 and 5.5.0).
> > 
> > I haven't performed extensive tests, but the card is again recognized as
> > both playback and capture device. Thank you!
> > 
> > Is this and acceptable solution and will this patch be integrated into the
> > kernel?
> 
> I don't mind where to blacklist; we may add a similar quirk in
> USB-audio driver side, too.

I'm afraid it needs to be done in core since this info is needed while
parsing the descriptors.

Johan
