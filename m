Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5192D2F0F1B
	for <lists+linux-usb@lfdr.de>; Mon, 11 Jan 2021 10:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbhAKJ3K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 04:29:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:33334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728266AbhAKJ3J (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Jan 2021 04:29:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D8E48224F9;
        Mon, 11 Jan 2021 09:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610357309;
        bh=VsJf0gkn4cnQOZkIym/hiz+2A4VjXcg9UdODZ6ITzp0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BVUcXcPn2WaFiyBw27UiXJF0C9a5h6trxC7d4GOxI+3gTU9WyMDNqq/mRjGt5V5Dc
         6ZJo6T4LMx9vEhSOfUirpOb93CqHJdXzM4x8O4juRhqh5rYpIjlroPz/GD5Syr45aB
         C9k2SAQkC0CTlZwF+Qhsx4bjjD5n7+UWmXqO2c1YqNMePRg8aVKoGRilHUaFO8To5K
         qOMgBnuTEUUXis5r8IPVsaCtz4z9rqyH+ph99XlkvGAcNjx79AmwqM1MTt3cktfQaA
         PTIiqgPofbPiWbo/nrzws/3Z0P1W3Sro2eOMg56ty2u7rAIEMwDpeav5yVpaZoYiRI
         /XLI2uBuDrQ4A==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kytV3-000772-Nu; Mon, 11 Jan 2021 10:28:33 +0100
Date:   Mon, 11 Jan 2021 10:28:33 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Joe Abbott <jabbott@rollanet.org>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: pl2303.c 110 baud not working
Message-ID: <X/waQXmnsYGX3d1b@hovoldconsulting.com>
References: <CADuz4ONmN299aw460r4wXCEK5F1v9kt_cewCCrdg2hb5nJV9uQ@mail.gmail.com>
 <X/gwVvn09NFiIOWw@hovoldconsulting.com>
 <CADuz4ONNPq+mADWYPKp8+M2rZtuoMwjO=+HDXfgrO2dQ0S1vQA@mail.gmail.com>
 <X/htEGiNbjGb2dy8@hovoldconsulting.com>
 <CADuz4OPCnq_4Xx-sWc-ZijoQRAZR-4+MRvpOx4np2rXifoCL5A@mail.gmail.com>
 <X/rtPpHMii7AxXPJ@hovoldconsulting.com>
 <CADuz4OPhcFSdRhw9pmjzhEwaLJMih+X-suZg=NRR-QwOq8410A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADuz4OPhcFSdRhw9pmjzhEwaLJMih+X-suZg=NRR-QwOq8410A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 10, 2021 at 04:15:41PM -0600, Joe Abbott wrote:

> > Look for the set-line-request control request:
> >
> >         bmRequestType   0x21
> >         bRequest        0x20    (SET_LINE_REQUEST)
> >         wValue          0
> >         wIndex          0
> >         wLength         7
> >
> > the data stage should contain the corresponding 7 bytes of request data
> > for 110/cs7/parenb:
> >
> >         d5 0e 00 80 00 02 07
> 
> Windows wireshark  URB_CONTROL_OUT packets
> using putty set to at 110 baud 7E1
> 
> The windows usb captures have these 7 bytes for 110 baud:
>            a8 a6 01 80 00 02 07

Interesting...

> and these 7 bytes for 9600 baud:
>            80 25 00 00 00 02 07   0x2580 = 9600
> 
> --------------------------------------------------------------------
> Linux wireshark URB_CONTROL_OUT packet
> using stty 110 evenp
> 
> usb capture for 110 baud 7E1
>             d5 0e 00 80 00 02 07
> 
> I tried hard coding the first four 110 baud bytes into buf[0] - buf[3]
> in the divisor subroutine and
> 110 baud work fine.  Possible problem in the divisor routine?

Or rather a new feature which do not yet support (or understand).

I tried hardcoding the same request with a HXD and it doesn't give me
110 baud. Instead the unsupported bits appears to be ignored and the
current divisor algorithm is applied so that

	a8 a6 01 80 00 02 07

gives the same result as if

	a8 06 00 80 00 02 07

had been requested (~35720 baud).

So in any case, we'd need to key this off of the device type.

I noticed that

	12000000 / 0x1a6a8 ~= 110.9

Possibly just a coincidence, especially as 0x1aa22 would be closer
match. But perhaps you can try a few more rates not in baud_sup and see
if you can figure it out.

Johan
