Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF394D260
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 17:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726649AbfFTPpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 11:45:21 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:44738 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726530AbfFTPpV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 11:45:21 -0400
Received: (qmail 4457 invoked by uid 2102); 20 Jun 2019 11:45:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 20 Jun 2019 11:45:20 -0400
Date:   Thu, 20 Jun 2019 11:45:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     dmg <dmg@turingmachine.org>
cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 46/46] drivers/usb//misc/adutux.c:375:4: warning:
 format '%lu' expects argument of type 'long unsigned int', but argument 5
 has type 'size_t {aka unsigned int}'
In-Reply-To: <87wohgs3lh.fsf@mn.cs.uvic.ca>
Message-ID: <Pine.LNX.4.44L0.1906201142040.1512-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Jun 2019, dmg wrote:

> 
> kbuild test robot <lkp@intel.com> writes:
> 
> [...]
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/printk.h:332:0,
> >                     from include/linux/kernel.h:15,
> >                     from drivers/usb//misc/adutux.c:19:
> >    drivers/usb//misc/adutux.c: In function 'adu_read':
> >>> drivers/usb//misc/adutux.c:375:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t {aka unsigned int}' [-Wformat=]
> >        "%s : while, data_in_secondary=%lu, status=%d\n",
> 
> I am not sure what is the best way to address this warning.
> 
> size_t seems to be architecture dependent. On my computer (intel64)
> size_t is long unsigned int, but in this test it is int unsigned.
> 
> Are there any suggestions on what is the best way to deal with this?

Use the %zu format specifier instead of %lu.  This is explained in
Documentation/core-api/printk-formats.rst.

Alan Stern

> casting size_t to long unsigned int will work, but it sounds kind of
> ugly.
> 
> 
> thank you,
> 
> 
> --daniel
> 
> 
> --
> Daniel M. German                  "We die. That may be the meaning of life.
>                                    But we do language. That may be
>    Toni Morrison ->                the measure of our lives."
> http://turingmachine.org/
> http://silvernegative.com/
> dmg (at) uvic (dot) ca
> replace (at) with @ and (dot) with .
> 
> 

