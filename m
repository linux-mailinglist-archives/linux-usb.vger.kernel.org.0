Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9BD2625E45
	for <lists+linux-usb@lfdr.de>; Fri, 11 Nov 2022 16:24:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233067AbiKKPYF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 11 Nov 2022 10:24:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiKKPYB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 11 Nov 2022 10:24:01 -0500
X-Greylist: delayed 670 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Nov 2022 07:24:00 PST
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62FFFF50
        for <linux-usb@vger.kernel.org>; Fri, 11 Nov 2022 07:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
        s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=LnIGEPL8jbGf7GrhiIqzmETN1oZrbzv1naGwiEp2oos=; b=mXXrzYjlLfvvF2ThO4jFET5pS+
        TPHEenAjSvObY3W9BXZwL+aHyzhno5iggDir76w7hhVYvUp77NNOrnyiCN++//VTYHx36q1mSzFsk
        7gl9RiOORRU+5UTP6x/JhdE4msSg6upt38SSIXgRWF5ffprjDxRwk0BjsS7LcnoIwCumk+YiC9oCn
        3ku8W0TRg9xZxGJB6YPutK1ipnDwKoxl/DhrhFGGrEHa+zJOvmcT419n5yom6E8k1Z9ThxpKFZKPH
        uO+Ipm7wTpotXiOMfeLfwTGf0PzMI1+WpNJunrj240dCR6sScCzOuBMsMQoKrSGBpvZvYeQGOFRfV
        KGiFc7Ew==;
Received: from authenticated user
        by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
        (Exim 4.94.2)
        (envelope-from <carnil@debian.org>)
        id 1otVhq-009L97-Fl; Fri, 11 Nov 2022 15:12:33 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
        id 6A354BE2DE0; Fri, 11 Nov 2022 16:12:32 +0100 (CET)
Date:   Fri, 11 Nov 2022 16:12:32 +0100
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     833035@bugs.debian.org
Cc:     Jakob Haufe <sur5r@debian.org>, Chris Rhodin <chris@notav8.com>,
        ben@decadent.org.uk, Johan Hovold <johan@kernel.org>,
        linux-usb@vger.kernel.org
Subject: Re: Bug#833035: linux-image-3.16.0-4-amd64: Keyspan USB serial
 adapter USA-49WLC failed to load firmware
Message-ID: <Y25mYI9tLSRJ7bbS@eldamar.lan>
References: <20160731071614.13615.81977.reportbug@proliant.robinstreet>
 <20220207153349.67de08dc@beer.h47.haufe.it>
 <20160731071614.13615.81977.reportbug@proliant.robinstreet>
 <YgIVt0i6zxGJFNDT@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgIVt0i6zxGJFNDT@eldamar.lan>
X-Debian-User: carnil
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jakob,

On Tue, Feb 08, 2022 at 08:03:19AM +0100, Salvatore Bonaccorso wrote:
> Hi Jakob,
> 
> On Mon, Feb 07, 2022 at 03:33:49PM +0100, Jakob Haufe wrote:
> > This still affects 5.15.0-3-amd64:
> > 
> > [624300.704569] usb 5-1: new full-speed USB device number 2 using ohci-pci
> > [624300.901723] usb 5-1: New USB device found, idVendor=06cd, idProduct=011a, bcdDevice=80.01
> > [624300.901746] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> > [624300.903869] keyspan 5-1:1.0: Keyspan - (without firmware) converter detected
> > [624300.904014] usb 5-1: firmware: direct-loading firmware keyspan/usa49wlc.fw
> > [624304.121517] usb 5-1: ezusb_ihex_firmware_download - ezusb_writememory failed writing internal memory (-110 7F92 00000000b8cbdc0a 1)
> > [624304.121545] usb 5-1: failed to load firmware "keyspan/usa49wlc.fw"
> > [624304.121559] keyspan: probe of 5-1:1.0 failed with error -2
> > 
> > The patch applies with some fuzz but still solves the issue.
> > Refreshed patch is attached.
> > 
> > Has anyone already contacted upstream about this? I couldn't find
> > anything related on the linux-usb ML.
> 
> Not that I'm aware of. Given you have a tested patch, would it be
> possible that you contact upstream about it, keeping us in the loop or
> at least notify when it is applied in mainline?

Jakob, were you able to forward the patch upstream? I'm including
Johan and linux-usb list in this reply now.

Johan, fo context, it is about an older bug reported in Debian as
https://bugs.debian.org/833035 with users of the Keyspan USB serial
adapter USA-49WLC faling to load firmware.

There was a patch used, in
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833035#68 tough
which hs no commit message or Signed-off-by's . Original patch is from
Ben in https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=833035#24 .

Regards,
Salvatore
