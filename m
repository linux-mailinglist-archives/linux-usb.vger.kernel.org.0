Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6C1657918C
	for <lists+linux-usb@lfdr.de>; Tue, 19 Jul 2022 06:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbiGSEAD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jul 2022 00:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbiGSEAC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jul 2022 00:00:02 -0400
Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB0D02F013;
        Mon, 18 Jul 2022 20:59:58 -0700 (PDT)
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.17.1/8.17.1) with ESMTPS id 26J3xHBV030466
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 19 Jul 2022 13:29:18 +0930
Date:   Tue, 19 Jul 2022 13:29:17 +0930
From:   Jonathan Woithe <jwoithe@just42.net>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org, Aidan Thornton <makosoft@gmail.com>,
        Grigori Goronzy <greg@chown.ath.cx>,
        Michael Hanselmann <public@hansmi.ch>
Subject: Re: [Regression] CH341 USB-serial converter passes data in 32 byte
 chunks
Message-ID: <YtYsFVCShDeVCeis@marvin.atrad.com.au>
References: <Ys1iPTfiZRWj2gXs@marvin.atrad.com.au>
 <Ys1sfRyL6El7go94@kroah.com>
 <Ys2nEmkvz2dfAKkU@hovoldconsulting.com>
 <Ys4QOgNF0pJDwRCJ@marvin.atrad.com.au>
 <YtUfcSOTl/ia+ahL@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtUfcSOTl/ia+ahL@hovoldconsulting.com>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 18, 2022 at 10:53:05AM +0200, Johan Hovold wrote:
> [ +CC: Aidan, Grigori and Michael ]
> 
> On Wed, Jul 13, 2022 at 09:52:18AM +0930, Jonathan Woithe wrote:
> > On Tue, Jul 12, 2022 at 06:53:38PM +0200, Johan Hovold wrote:
> 
> > > Simply reverting the commit blamed by the bisection should only makes
> > > things worse, at least for some device types.
> > > 
> > > Perhaps we need to set that bit 7 based on the type, even if the bit
> > > meaning having been inverted seems a bit far-fetched.
> > > 
> > > Jonathan, could you try simply commenting out the
> > > 	
> > > 	val |= BIT(7);
> > > 
> > > statement in ch341_set_baudrate_lcr()?
> > 
> > Commenting out the above line brought some improvement.  In minicom with a
> > loopback connector in place, the first byte sent does not get echoed
> > back at all.  However, all other bytes are echoed as soon as they are sent.
> 
> Ok, so at least that addresses the disabled TX timer.
> 
> What happens if you change the line speed? Does the first character
> after changing speed also get dropped?

Yes it does.  Starting out at 115200 in minicom I confirmed the loss of the
first character.  I changed the line speed to 38400 in minicom and the next
character to be pressed was dropped.  All others after it were fine.  I then
returned to 115200 in minicom and the pattern repeated: the first character
after the speed change was lost, but all others came through.  All these
tests were done in the same minicom session under kernel 672c0c5 with the

  val |= BIT(7);

line still commented out.

> There were a few more changes done to the initialisation sequence at
> that time and more changes in this area has followed since.
> 
> Could you try the patch below which addresses the disabled tx timer and
> restores one of the init commands that were removed in 4.10.

Unfortunately the patch didn't bring back the first character.  The first
character is still missed (immediately after starting minicom, and also
after changing the line speed within minicom), but all others are delivered
as they should be.

> If that doesn't help, we'll keep digging. One more thing to try then
> could be to comment out the above line on a 4.10 kernel to rule the
> impact of any later changes on the first lost character.

I assume the "above line" is the

  val |= BIT(7);

statement in ch341_set_baudrate_lcr().  With this line commented out in the
"v4.10" tag (c470abd), the first character is lost but all others are
send/received as expected.  As you suggested, this appears to rule out
later changes as the source of the lost first character.

> > The kernel used for the above test was 672c0c5 (5.18-rc5), which is the most
> > recent I can conveniently get onto the test machine at present.  I tested
> > the unmodified kernel before commenting out the line and confirmed that it
> > exhibited the full fault condition (bytes come back in blocks of 32).
> 
> > > Also, what chip version do you have (see debug statement in
> > > ch341_configure())?
> > 
> > Chip revision is 0x27.
> 
> Interesting. The devices I have here both have version 0x30. While the
> tx-timer bit has no effect on the CH340G it must be set on the CH341A in
> order for the FIFO to empty before it is full.
> 
> Michael Hanselmann posted a patch mentioning that devices before 0x30
> has never been supported by the mainline driver:
> 
> 	2c509d1cc86d ("USB: serial: ch341: name prescaler, divisor registers")
> 
> but your programmer seems to suggest otherwise, even if there may be
> other differences here left to account for.

I can confirm that this USB-serial converter has apparently been working
fine for me with kernel 4.4.14 (and continued to do so up until the comment
identified by the bisect).  This wasn't just with the programmer hardware
though.  I was also using a second identical CH341 USB-serial converter with
minicom for debugging of external hardware, and this also worked fine under
4.4.14.  Given the comment in the commit you referenced above, it may be
that we were just lucky.  Whatever the reason, these two CH341 version 0x27
converters have definitely been working in practice for me.

> The joys of reverse-engineering...

Yes, having been there myself I totally agree.

Regards
  jonathan
