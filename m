Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 229AF6CC94C
	for <lists+linux-usb@lfdr.de>; Tue, 28 Mar 2023 19:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjC1Rcb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Mar 2023 13:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjC1Rc3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Mar 2023 13:32:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0C3BBA3
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 10:32:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B90F9618AF
        for <linux-usb@vger.kernel.org>; Tue, 28 Mar 2023 17:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C838EC433EF;
        Tue, 28 Mar 2023 17:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680024748;
        bh=XwYvNg9F2luTR5pmhR8QhHqD9FDvfqmUFdrCy/qE7nE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xHNZ2KIrMazH5OWTsdAd8lCkV9loTLJHpNqKlJCBXOHm36O1F3ppfpVOwx5IihlMm
         jyGcZTEKId6DC2qNJ2zFS2+KirAbrVCeFFNs0ivQX9IH1lsv9Yvnc9c0AccPaJjMf4
         NGb6CLHM/F+Xbo/O3Pyv34/1zTDmiFb+oWQWh0Yg=
Date:   Tue, 28 Mar 2023 19:32:25 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb tree branch usb-linus merge plan ?
Message-ID: <ZCMkqSD8-DtaY6Oc@kroah.com>
References: <8d92e4f66c153bb43c040c5e2f6666978196efd4.camel@infinera.com>
 <ZBrps8reH2AYqZoJ@kroah.com>
 <7e2d175b1e018d116bff9087c364d7fc398338c2.camel@infinera.com>
 <a61062edbd266f6c8a260fd30886a97242133ea0.camel@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a61062edbd266f6c8a260fd30886a97242133ea0.camel@infinera.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 28, 2023 at 05:25:20PM +0000, Joakim Tjernlund wrote:
> On Wed, 2023-03-22 at 14:55 +0100, Joakim Tjernlund wrote:
> > On Wed, 2023-03-22 at 12:42 +0100, Greg KH wrote:
> > > On Wed, Mar 22, 2023 at 10:22:28AM +0000, Joakim Tjernlund wrote:
> > > > In https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fgregkh%2Fusb.git%2Flog%2F%3Fh%3Dusb-linus&data=05%7C01%7CJoakim.Tjernlund%40infinera.com%7Cd0efe8021d0b43a707b908db2aca907b%7C285643de5f5b4b03a1530ae2dc8aaf77%7C1%7C0%7C638150821713395063%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=z3vZ9PJ05Ty5JxE76hbPPphJer9AtAWR9nHiAZujoDc%3D&reserved=0 there UCSI fixes that
> > > > prevent OOPS in stable Linux.
> > > 
> > > What specific commit are you concerned about?
> > 
> > usb: ucsi_acpi: Increase the command completion timeout
> > usb: ucsi: Fix ucsi->connector race
> > usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
> > 
> > They have been there for 13 days and I started to wonder if they were delayed or marked for a much later release.
> > 
> > > 
> > > > I don't see any of them in Linus tree and wonder if these are planned for later?
> > > 
> > > Hopefully they will get sent to Linus later this week.  Is there a
> > > specific rush that you need this now?
> > 
> > Later this week is fine. 
> > 
> >   Thanks
> >           Jocke
> > 
> 
> I noticed above UCSI patches in the stable queue except this one : "usb: ucsi: Fix ucsi->connector race",
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0482c34ec6f8557e06cd0f8e2d0e20e8ede6a22c
> Marked for stable, perhaps forgotten ?

Nope, does not apply:
	https://lore.kernel.org/all/16800048817970@kroah.com/
(also for other branches.)

If you can provide a working backport, I will gladly apply it.

thanks,

greg k-h
