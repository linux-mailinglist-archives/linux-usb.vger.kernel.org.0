Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F11A591B36
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 17:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239661AbiHMPId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Aug 2022 11:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235340AbiHMPIc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Aug 2022 11:08:32 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B87412763
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 08:08:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1EBD4B8010F
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 15:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AA01C433D6;
        Sat, 13 Aug 2022 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660403308;
        bh=zbsjvCLO3rlrcSAZa0OKmB75jkQyYGmrus9sgVa1JR4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h2NBOmOeXXn1yCAysuLc72fDnDVVX2Sbg+EfgADn9lsYSLbWQL+RicdbGprHin7BV
         qCzon+HA269IrYQwFGtGaZeyUuXPQNp/iCGMzVUMfPRCM0vnKpUblVt5+jnqnUwP7V
         SVWn3NASzh8ql2VYaQNyNlcq2AZm+WrKn+JjMS/M=
Date:   Sat, 13 Aug 2022 17:08:26 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Mori Hess <fmh6jj@gmail.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [BUG] usb: dwc2: split interrupt in transactions silently
 dropped due to driver latency
Message-ID: <Yve+avK9F4dCnvzB@kroah.com>
References: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
 <YvdPr0Hn5eOPehIm@kroah.com>
 <CAJz5OpfDH3kJV5e9UqU6Tcw8NWHK5-iGFJHdkCGBzeNW-fCRUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJz5OpfDH3kJV5e9UqU6Tcw8NWHK5-iGFJHdkCGBzeNW-fCRUQ@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Sat, Aug 13, 2022 at 07:52:05AM -0700, Frank Mori Hess wrote:
> I'm using a linux-socfpga altera (intel) patched kernel, and they
> don't have a 5.19 kernel available.

Then please work with your vendor as only they can provide the needed
support that you are already paying for.  Take advantage of that,
nothing we can do about odd vendor kernels, sorry.

good luck!

greg k-h
