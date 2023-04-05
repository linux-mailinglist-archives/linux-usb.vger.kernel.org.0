Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E596D76F4
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 10:31:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237493AbjDEIbK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 04:31:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237498AbjDEIbJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 04:31:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225283A9C
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 01:31:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A2AE624BC
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 08:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0091C433D2;
        Wed,  5 Apr 2023 08:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680683465;
        bh=y21glHPCvrzBAhvoB9uIiBL3sWJSo9x83d2AMI4YFbM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qMKJI2YwNfK38IGVcnRy8wn3Po/DqoQN1+ITKqIU292QLT2jiJaN1Y6s26Igl7q4u
         3L11y2ktYv6JcXN1QOLBflK6ivmGBeYg15P7rJ2jhz81tL7NB+lKE/cqBl2tQ3ubHC
         1UyIWgY/loKQAhxoReWo8yWBDCiRSO/GCoip9PwCa2W3CRl4jHesore98ABXlNdGAu
         5uoIPp3mbWGlT3SeLI5HETxltG8grqvi1FaxyCd6Wh24VQXQYkEOP2YKpzwh03FfSx
         3TebNfOPTlgD87DE0hQUejwgb05MFgC+6+dkXiAnNZRIVT2G6jw+AFwiQdBwFi2wWP
         VivjVEah/AdGw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjyYJ-000078-7I; Wed, 05 Apr 2023 10:31:35 +0200
Date:   Wed, 5 Apr 2023 10:31:35 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZC0x589/77gYu77b@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
 <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
 <20230404220306.qasfe3eg5w6eyaki@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404220306.qasfe3eg5w6eyaki@synopsys.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 10:03:09PM +0000, Thinh Nguyen wrote:
> On Tue, Apr 04, 2023, Johan Hovold wrote:
> > On Tue, Apr 04, 2023 at 02:07:22PM +0200, Oliver Neukum wrote:
> > > 
> > > 
> > > On 04.04.23 13:43, Johan Hovold wrote:
> > > 
> > > > The device is being used; by the driver and ultimately by a user telling
> > > 
> > > I am afraid that is just an assumption we cannot make. The user may just as
> > > well be reading a device state before a device is being used as that may matter.
> > 
> > It's a perfectly valid assumption to make, and it is was all drivers do
> > for debugfs (as well as sysfs). You are the one arguing for making an
> > exception, which I don't think is warranted.
> > 
> > > > the driver to do something on their behalf. The fact that the user is
> > > > initiating an action through an interface which intended for debugging
> > > > should not matter (and the user always has the option to check the
> > > > runtime pm state before initiating the action if that matters at all).
> > > 
> > > 1. That is a race condition.
> > 
> > Sure, but you can't have it both ways. Your proposed inverted logic is
> > racy as you may or may not get any data.
> > 
> > > 2. Quite a lot of bugs we are looking at involve power transitions.
> > > You just cannot assume that a device will react the same way if it was
> > > waken up between events.
> > 
> > Then just don't use the interface if you for whatever reason don't want
> > to wake the device up.
> > 
> 
> How can we know when to use and when not to use it? We can't just rely
> on runtime_status for that. The device can go into suspend any time.

You can disable runtime PM through sysfs if you want to avoid prevent
the device from suspending underneath you.

The point is that by having a consistent behaviour for debugfs with
respect to runtime PM you can *always* use it. It doesn't crash and it
does not return random errors based on external events.

Sure, if you are trying to debug some runtime PM related issue, this may
or may not interfere with that, but then you probably need a more
specialised instrumentation to debug that anyway (e.g. dumping state
when you receive wakeup events, etc).

A manually controlled sysfs interface for dumping registers really isn't
enough to debug power-state *transitions*.

That leaves inspection of the suspended state, but the whole reason that
we're having this discussion is that that state is not available to the
driver while suspended in the first place.

Johan
