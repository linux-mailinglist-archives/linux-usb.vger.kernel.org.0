Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD55C493651
	for <lists+linux-usb@lfdr.de>; Wed, 19 Jan 2022 09:28:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352461AbiASI2K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 Jan 2022 03:28:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350447AbiASI2H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 19 Jan 2022 03:28:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB62C061574
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 00:28:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77E3E61447
        for <linux-usb@vger.kernel.org>; Wed, 19 Jan 2022 08:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45715C004E1;
        Wed, 19 Jan 2022 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1642580885;
        bh=vg0ymns1lhOX8VazK7xuSFllvE018HiEtIFtrwVk3pI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ajqYcA4mujEDsMt2WWy+ZZ8qNa60BZSmTVw/35HlqNNInT0qPcCYTapUFWM+P2kNl
         pwgTX64KAbo4sBZXkVpoymwu/WLRHEAnVAl8R0ARd+FEp00uhy4BjVvZc1/X31HWDj
         /UOlsfycgGLzE7e0ikLSudcXPViJxXYz1ySQzyiU=
Date:   Wed, 19 Jan 2022 09:28:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Benson Leung <bleung@google.com>
Cc:     Rajaram Regupathy <rajaram.regupathy@gmail.com>,
        linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Prashant Malani <pmalani@chromium.org>, jthies@google.com,
        saranya.gopal@intel.com
Subject: Re: [ANNOUNCE] libtypec_0.1/lstypec_0.1 is released
Message-ID: <YefLk+hmEfg6Tp6F@kroah.com>
References: <CAD039W71Hf06Bw4H_qjm7bRg__BjHfG=p-E7HXL62g0Yc7txBA@mail.gmail.com>
 <YeUYQB4neDz8Z0Tb@kroah.com>
 <CAD039W5ZmTcYErXsnSpdksc6k2L3fNwry1uP2Kr96Uo04fO9PQ@mail.gmail.com>
 <YeWNYUkOYBWXjBFw@kroah.com>
 <CAD039W41ds-1xi0owBTRPCweB-tt=7gL7uH4FmUSOyEdgrq77g@mail.gmail.com>
 <YecIA5hEYqrZo+6G@kroah.com>
 <YecSDHXscl4LX5g9@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YecSDHXscl4LX5g9@google.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 18, 2022 at 11:16:28AM -0800, Benson Leung wrote:
> Hi Greg,
> 
> On Tue, Jan 18, 2022 at 07:33:39PM +0100, Greg KH wrote:
> > On Tue, Jan 18, 2022 at 10:01:02PM +0530, Rajaram Regupathy wrote:
> > > > Again, why does this have to be a library?
> > > >
> > > The aim of having a library is to abstract application(s) from OS,
> > > platform, PD Controller or Embedded Controller protocols ambiguities
> > > and provide common methods. The methods will be similar/closer to UCSI
> > > standard.
> > 
> > What methods are needed by an operating system that your library is
> > going to provide?  How will it be done in a unified way that the current
> > user/kernel api isn't providing already today?
> > 
> 
> A unified libtypec would be useful because the USB Type-C and USB PD
> specifications are evolving, and continue to change. Spec changes affect the
> decoding of the objects that are exposed by the connector class (the existing
> API), and we are at a point where if we left it as-is, you'd have multiple
> userspace implementations that would have to independently be updated and
> fixed every time there's a new USB PD spec revision or version update.
> 
> Just as a concrete example, Jameson (jthies@google.com), who works on my team,
> recently put together a little helper utility to decode the typec connector
> class in order to print it to our feedback report collector. This was all
> done before libtypec:
> 
> https://chromium.googlesource.com/chromiumos/platform2/+/749621a6288cc5e80b31a9e6050437a419209fb9/debugd/src/helpers/typec_connector_class_helper.cc
> 
> A problem we ran into almost immediately was that the utility was based on
> the most recent USB PD specification documents (USB PD R2.0 and USB PD R3.1),
> and had definitions on how to decode PD 2.0 and PD 3.1 objects that it would
> read from the typec connector class, however, it was missing definitions for
> USB PD R3.0 (a spec revision which is not obvious how to find in USB-IF's
> document archive).
> 
> So, we added it: https://chromium.googlesource.com/chromiumos/platform2/+/eb1efefc187feab1182a7680f42fcec6bb14c618
> 
> Now, every other hypothetical type-c connector class user application or daemon
> could potentially make this mistake, and would have to duplicate the work
> to fix it.
> 
> If we had libtypec, it would be the unified place to make such a change, and
> we'd reduce the burden of new typec apps from having to do all this decode
> in the future.

Ok, that's fine, but please work to create a library that can handle
such changes in non-breaking ways.  The first version of this library
does not look like it would do that at all as it is exporting way too
many things in a "public" interface.

thanks,

greg k-h
