Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6F5F6D605E
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234794AbjDDMaA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 08:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234691AbjDDM37 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 08:29:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB63BB4
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 05:29:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8A4F363064
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 12:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7763C433D2;
        Tue,  4 Apr 2023 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680611397;
        bh=wgy/P+qENoZr+t+Vs8yDg8k0KRY360iwvJjz05bUGew=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nOjflyy2r5UEPw0q3lpCyfryrBwhkhZlC+uGCSlAJ3W/ME4XGI3zbqfJO143S1bSk
         3QMyDxz+Z3U5mRaPIzhrY2pCmA7TOEniGhWswN385vP6YjmvhoCnd7+mQvfH7RYrqy
         2K5Z5ngHchfGRhz61gr1BmbznwW9SfKMRxzFOmZticQLnNkRmUZ4HBXKMMextxLTRi
         KcBa/7JzS2vC0KFRhgIhFOWAfuLN1oc6vAlbwpKqqktaqIikWSbQc3s+d0NN5kloe0
         HHfqvniczsQsGgxhfancn+TKDC+S1qeueiYKsMZ9q4eVhpP9qatyPKVoebepz7GpQY
         CEMxK5qxDgK1Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjfnt-00072P-DW; Tue, 04 Apr 2023 14:30:25 +0200
Date:   Tue, 4 Apr 2023 14:30:25 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 02:07:22PM +0200, Oliver Neukum wrote:
> 
> 
> On 04.04.23 13:43, Johan Hovold wrote:
> 
> > The device is being used; by the driver and ultimately by a user telling
> 
> I am afraid that is just an assumption we cannot make. The user may just as
> well be reading a device state before a device is being used as that may matter.

It's a perfectly valid assumption to make, and it is was all drivers do
for debugfs (as well as sysfs). You are the one arguing for making an
exception, which I don't think is warranted.

> > the driver to do something on their behalf. The fact that the user is
> > initiating an action through an interface which intended for debugging
> > should not matter (and the user always has the option to check the
> > runtime pm state before initiating the action if that matters at all).
> 
> 1. That is a race condition.

Sure, but you can't have it both ways. Your proposed inverted logic is
racy as you may or may not get any data.

> 2. Quite a lot of bugs we are looking at involve power transitions.
> You just cannot assume that a device will react the same way if it was
> waken up between events.

Then just don't use the interface if you for whatever reason don't want
to wake the device up.

Johan
