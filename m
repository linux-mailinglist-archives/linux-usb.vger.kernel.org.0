Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA4946D76B6
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 10:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237381AbjDEIUV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 04:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237470AbjDEIUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 04:20:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C3DE40E6
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 01:20:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAF1B62EB9
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 08:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD1EC433D2;
        Wed,  5 Apr 2023 08:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680682816;
        bh=ZwAvcWGUPuoymQ6pgsZ8uwulFuinOZuUZL+zKrIuG2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hGHK3P6NMrWNeOlxQP1ULzhfk3P2DuPzBRJcjESsAGs+kwqjo2tAQoOt5khk94ag1
         Y8jKmOMzwuFCQCYyds2bpNWUbSGBTdIWsxR5sFdEfDHBteAKP1clzJtv/4rfzwlsMA
         ntWUITjC0+PwP43UnR2jL3V5dFmE4I4NHJBCj0kMhP7hFD6/Rzd5PBnAXvkxvL2PCf
         aYcaXF2vGYbWveXi3DSXPtKByTm3Lg8OA4GjP0K0q4PjAGpwHeYHXSFXO4nDAJogM4
         ngzVHKS3kj91efTBMFOBl3075Wyqrv3eTYNEcMj5CGd/fxLajd50ECTxTkOvj7JLmW
         GVJ8oFjAaDeNA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjyNp-0008UH-Fi; Wed, 05 Apr 2023 10:20:46 +0200
Date:   Wed, 5 Apr 2023 10:20:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZC0vXcn+tTZHepIN@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
 <ZCw33woJ3C6roK93@hovoldconsulting.com>
 <20230404213625.zta3tdkqdrthufbl@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404213625.zta3tdkqdrthufbl@synopsys.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 09:36:28PM +0000, Thinh Nguyen wrote:
> On Tue, Apr 04, 2023, Johan Hovold wrote:
> > On Tue, Apr 04, 2023 at 05:46:13PM +0530, Udipto Goswami wrote:

> > > for instance, lets say user is trying to dump the value of link_state 
> > > register through dwc3_link_state_show, wouldn't a pm_runtime_get would 
> > > change the link_state? or I'm assuming it wrong?
> > 
> > There may be some specific debugfs interfaces (e.g. related to PM) where
> > taking the runtime pm state into account makes sense, but then I don't
> > think you should return an error if the device happens to be suspended.
> 
> Agree here.
> 
> > 
> > Looking at the dwc3 'link_state', it currently just returns "Not
> > available\n" when not in peripheral mode, for example. Perhaps you can
> > do something similar if you can neither infer or retrieve the actual
> > link state.
> > 
> > But after skimming the backstory for this patch, you yourself said that
> > the motivation for this patch is simply to avoid crashing when accessing
> > these interfaces if the device happens to be runtime suspended.
> > 
> > For that you should just resume the device unconditionally before the
> > register accesses as all other drivers do (and such a patch should
> > be backported to stable).
> > 
> > There's no need to take hypothetical PM debugging issues into account to
> > address this.
> > 
> 
> I disagree here. We should not unconditionally resume the device.
> Checking these states should not interfere with the device current
> operation. These debugfs attributes are meant to provide the user with
> debug info. Whether the controller is currently in suspend or not,
> that's a data point.

But this is not what other drivers do, which means that you will end up
with different behaviour with regards to runtime PM (possibly even for
the very same piece of hardware, see below) depending, on which file in
debugfs you access.

See for example commit 30332eeefec8 ("debugfs: regset32: Add Runtime PM
support") which made this behaviour part of the generic debugfs helpers,
and grepping for drivers that bail out from their debugsfs callbacks
does not seem to show any other instances.

Alan did point out though, that the ehci driver returns a string like
"suspended" when trying to access registers for a suspended device.

That behaviour dates back to before the git era though and long before
we had runtime PM. In fact, ehci still does not seem to implement
runtime PM so this check would essentially only kick when the HCD is
dead IIUC.

Notably both the chipidea and musb drivers runtime resume the controller
when accessing registers through debugfs.

I just tried the xhci debugfs interface and it apparently crashes just
like the dwc3 debugfs do if the device is suspended. Turns out no one
has yet wired up the device pointer which would be used by the generic
debugfs helpers to resume the device before register accesses.

I'll send a patch to fix that up.

Johan
