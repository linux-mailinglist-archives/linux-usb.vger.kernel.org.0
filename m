Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72ED621D406
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 12:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728714AbgGMKyH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 06:54:07 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:33760 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728382AbgGMKyH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 06:54:07 -0400
Received: by mail-lf1-f68.google.com with SMTP id g2so8664193lfb.0
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 03:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=q8L/LjK8Q50GbXY1xBYCRtq/qTB/8fD0urs9q4jSpNE=;
        b=Eb+94PQqW3w/1Zw13YKBiXHGLK5+pvdblZ7uUZmaingxwI5pfftNbc/meYeQflG9G8
         8c6/dk4C6rB5kkAj7syjjs+UL+ImwTxM4069QDociLLC7L0O/Kl28ZnNHeyB0eRdr/hl
         eLVg1oeiUh1c7qQvkKKrnpk5izFFwJKTHEfhs4WD1iHJWDDAYMaCfdEm+ElYlCXzaiwi
         Gu325lnhfr85zujnaTaVPwSoOXOJFN1YUso0QLV3aEBuITLexMc+SrE6w6lhJ2/SH/8E
         4CUgl3r7uopfli8zqI6wSt4W3WeWdPOne7y/ipkaaXeuTzyRMkYwvG9bxmPTj6XlIw2c
         jqxw==
X-Gm-Message-State: AOAM530ya8P+momUMKaTk0G+O40AMaTdxz86DIFheOjjcTkJOWAEWEMX
        R8+QmMFwFYi5Tp/LlWFdCwQ=
X-Google-Smtp-Source: ABdhPJzThD+oKQiaWdrgJ1Rmv80E49RILWqwtfE4B8u3DlGOEOeOQRAUsyjjCF62hF5iCG7PcfxMxw==
X-Received: by 2002:a19:7111:: with SMTP id m17mr53583286lfc.156.1594637644721;
        Mon, 13 Jul 2020 03:54:04 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m9sm4600465lfb.5.2020.07.13.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 03:54:03 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1juw68-0007Do-0D; Mon, 13 Jul 2020 12:54:12 +0200
Date:   Mon, 13 Jul 2020 12:54:11 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry <Jerry@jrr.cz>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usbserial: cp210x - icount support for parity error
 checking
Message-ID: <20200713105411.GW3453@localhost>
References: <7bdff86f-0988-2afc-e1a6-35df2931fd5b@jrr.cz>
 <20200622053146.GB134804@kroah.com>
 <838f09f9-4063-1c2c-8b4d-c18dee6c18de@jrr.cz>
 <20200701154257.GF3334@localhost>
 <13482d69-b286-b20e-ee3a-f8c5f12aad18@jrr.cz>
 <20200703074539.GB3453@localhost>
 <20200703150104.GE3453@localhost>
 <61febd93-400b-d1f9-6fd9-82de0e799f3e@jrr.cz>
 <20200706135904.GJ3453@localhost>
 <3fc7bd0e-6cf6-140c-592f-b8c69d483309@jrr.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3fc7bd0e-6cf6-140c-592f-b8c69d483309@jrr.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 11:05:29PM +0200, Jerry wrote:
> Johan Hovold wrote on 7/6/20 3:59 PM:
> > On Mon, Jul 06, 2020 at 01:47:50PM +0200, Jerry wrote:
> >> Johan Hovold wrote on 7/3/20 5:01 PM:
> >>> Also, could try and see if your device detects breaks properly? Mine
> >>> just return a NUL char.

> I've done some experiments with CP2102 receiving a break.
> It seems that chip always receives 0x00 for the start of break (with 
> correct parity when even parity set, wrong for odd parity) and later 
> (probably after 250 ms) it also sets break flag in GET_COMM_STATUS.
> I don't see any indication of the break event in data. I tried to change 
> some things in your solution but without success.

Ok, thanks for testing! The SERIAL_BREAK_CHAR in ulFlowReplace probably
needs to be set for breaks to be reported in-band, but unfortunately
that doesn't seem to have any effect on CP2102.

> I also haven't ever seen Frame error (neither way). I tried several ways 
> (different tx/rx baudrate, receive a parity data without parity enabled, 
> generating shorter breaks) and I suppose that CP2102 can't indicate framing 
> error.
> 
> Luckily I haven't found any problem with parity checking.  :-)

That's good.

I've been giving this some more thought and decided that it's probably
best not to extend TIOCGICOUNT with a COMM_STATUS request after all.

TIOCGICOUNT is really only supposed to be used to retrieve the
modem-status interrupts in concert with TIOCMIWAIT, but the ioctl was
later amended with some error statistics as well. As I mentioned before,
the ioctl is linux-specific and the statistics counter are mostly
undocumented and the behaviour varies from driver to driver. And don't
think adding another device-specific implementation which essentially
polls for errors (rather than counts them) is a good idea.

Since you confirmed that the event based implementation works for your
use case I think we should stick to that as it's allows for the normal
POSIX mechanisms for detecting parity errors.

Johan
