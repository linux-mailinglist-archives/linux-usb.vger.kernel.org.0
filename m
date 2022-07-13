Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A13B0572A3B
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jul 2022 02:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbiGMA0T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jul 2022 20:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbiGMA0S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jul 2022 20:26:18 -0400
X-Greylist: delayed 217 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 12 Jul 2022 17:26:17 PDT
Received: from server.atrad.com.au (server.atrad.com.au [150.101.241.2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25425CDA0A
        for <linux-usb@vger.kernel.org>; Tue, 12 Jul 2022 17:26:16 -0700 (PDT)
Received: from marvin.atrad.com.au (marvin.atrad.com.au [192.168.0.2])
        by server.atrad.com.au (8.17.1/8.17.1) with ESMTPS id 26D0MI7Z031440
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 13 Jul 2022 09:52:19 +0930
Date:   Wed, 13 Jul 2022 09:52:18 +0930
From:   Jonathan Woithe <jwoithe@just42.net>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-serial@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [Regression] CH341 USB-serial converter passes data in 32 byte
 chunks
Message-ID: <Ys4QOgNF0pJDwRCJ@marvin.atrad.com.au>
References: <Ys1iPTfiZRWj2gXs@marvin.atrad.com.au>
 <Ys1sfRyL6El7go94@kroah.com>
 <Ys2nEmkvz2dfAKkU@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys2nEmkvz2dfAKkU@hovoldconsulting.com>
X-MIMEDefang-action: accept
X-Scanned-By: MIMEDefang 2.86 on 192.168.0.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 12, 2022 at 06:53:38PM +0200, Johan Hovold wrote:
> On Tue, Jul 12, 2022 at 02:43:41PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jul 12, 2022 at 09:29:57PM +0930, Jonathan Woithe wrote:
> > > I have done a git bisect which identified the following commit as the source
> > > of the problem.
> > > 
> > > commit 55fa15b5987db22b4f35d3f0798928c126be5f1c
> > > Author: Johan Hovold <johan@kernel.org>
> > > Date:   Fri Jan 6 19:15:16 2017 +0100
> > 
> > Please always cc: the developer who wrote a commit that you have
> > questions about, so that they are sure to see it, otherwise it's just
> > random luck :)
> 
> Thanks for the report, and for forwarding it.

Apologies for overlooking the CC in this instance.

> > > It would be great if this regression could be addressed.  At present I must
> > > boot a pre-4.10 kernel whenever I need to use the programming dongle with
> > > this converter.
> > > 
> > > Please let me know if there is anything I can do to help resolve the
> > > problem.
> > 
> > If you revert this commit on top of the latest kernel release, does it
> > solve the problem for you?
> 
> Simply reverting the commit blamed by the bisection should only makes
> things worse, at least for some device types.
> 
> Perhaps we need to set that bit 7 based on the type, even if the bit
> meaning having been inverted seems a bit far-fetched.
> 
> Jonathan, could you try simply commenting out the
> 	
> 	val |= BIT(7);
> 
> statement in ch341_set_baudrate_lcr()?

Commenting out the above line brought some improvement.  In minicom with a
loopback connector in place, the first byte sent does not get echoed
back at all.  However, all other bytes are echoed as soon as they are sent.

The kernel used for the above test was 672c0c5 (5.18-rc5), which is the most
recent I can conveniently get onto the test machine at present.  I tested
the unmodified kernel before commenting out the line and confirmed that it
exhibited the full fault condition (bytes come back in blocks of 32).

> Also, what chip version do you have (see debug statement in
> ch341_configure())?

Chip revision is 0x27.

Regards
  jonathan
