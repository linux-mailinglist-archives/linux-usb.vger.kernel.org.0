Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EEF6D65A9
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 16:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbjDDOoX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 10:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbjDDOoW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 10:44:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34D5E10FC
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 07:44:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AD00A63522
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 14:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAD0C433EF;
        Tue,  4 Apr 2023 14:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680619460;
        bh=CEhP/gSzYivXLHUFZ0eNsr+7RcW5zKtQVIOnYRo/XNw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lJeQywBHAI4rLrSI7fDWyV1jFhfG1TnyVrMva02EAhOwgQSwhBUuWUM0nIQBozshs
         UwNaBv0WBjcs4LHz1x+rdt+7UP93zACk1m5if8MUYbVzyrMl3PewYaHeWCFCaXwWjN
         O/VVxENJ1p9eGFdPX2C1gK6CZBMAnaNkT2H+MSgyu9nw99YbKmAj47KPsfZrOrO9N8
         inlT6jYzX/eeMHmD3koviF7dPJU7L315kcIT1yqyFATaOZnX4Ga647XuRl7znbDSN5
         /XePhDgJuctXirV5DufJSatOMimqxlJDanxTR2oS83RoQ4eHKOPULK0qoy9s0gTG6b
         RldiglEtZ/uhg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjhtv-00011R-QX; Tue, 04 Apr 2023 16:44:47 +0200
Date:   Tue, 4 Apr 2023 16:44:47 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZCw33woJ3C6roK93@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 05:46:13PM +0530, Udipto Goswami wrote:
> On 4/4/23 5:13 PM, Johan Hovold wrote:
> > On Tue, Apr 04, 2023 at 01:09:19PM +0200, Oliver Neukum wrote:
> >> On 04.04.23 13:05, Johan Hovold wrote:

> >>> This is backwards. If you need the device to be active to access these
> >>> registers then you should resume it unconditionally instead of failing.
> > 
> >> usually you would be right. But this is debugfs. It is intended to observe
> >> the system in the state it is actually in. If by the act of observation you
> >> wake up the device, you change the experiment.
> > 
> > I admittedly didn't look to closely at what this particular debugfs
> > interface is used for, but I generally do not agree with that reasoning.
> > 
> > The device is being used; by the driver and ultimately by a user telling
> > the driver to do something on their behalf. The fact that the user is
> > initiating an action through an interface which intended for debugging
> > should not matter (and the user always has the option to check the
> > runtime pm state before initiating the action if that matters at all)

> for instance, lets say user is trying to dump the value of link_state 
> register through dwc3_link_state_show, wouldn't a pm_runtime_get would 
> change the link_state? or I'm assuming it wrong?

There may be some specific debugfs interfaces (e.g. related to PM) where
taking the runtime pm state into account makes sense, but then I don't
think you should return an error if the device happens to be suspended.

Looking at the dwc3 'link_state', it currently just returns "Not
available\n" when not in peripheral mode, for example. Perhaps you can
do something similar if you can neither infer or retrieve the actual
link state.

But after skimming the backstory for this patch, you yourself said that
the motivation for this patch is simply to avoid crashing when accessing
these interfaces if the device happens to be runtime suspended.

For that you should just resume the device unconditionally before the
register accesses as all other drivers do (and such a patch should
be backported to stable).

There's no need to take hypothetical PM debugging issues into account to
address this.

Johan
