Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3972C6D5F50
	for <lists+linux-usb@lfdr.de>; Tue,  4 Apr 2023 13:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbjDDLnE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 07:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbjDDLnD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 07:43:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D44E6FF
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 04:43:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6A52160BDE
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 11:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D9C433EF;
        Tue,  4 Apr 2023 11:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680608581;
        bh=sUN6ttspl+nSnLgZMWlZ6HbpIFGszr2APz+NFpknX/E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N9Xyb/9nlt6ZSz6p5euHRY5rwlKiX1d+uuzfRe/wQc0xqx4594C94PyUuPCrpb53U
         0X5c02cH6npP+CMmJtj0E3kSCu+vJTxCRRbBrEF8lotPKrWBEDUyAmr1lDaUvpg9wD
         78L7OACbE/rWlzuUH7ZSsL/jsF9Mh2ZHF+a3r0MWYeb0R10E2Un+ryUUHvwai6otQx
         j5+CMysB8vFi6PpIYG/WcJj9zjApR/RPur7BKpEkqVUE501eFXQeiz+SzryWqInXcc
         wpuDjYS7JJ4EPm7weumLvGzxONWhF03Jr/llWVx1FXQ0H0gRXW1HxV9frvMlzWD7dM
         0ZqNa7T866l7g==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pjf4T-0006lJ-Br; Tue, 04 Apr 2023 13:43:29 +0200
Date:   Tue, 4 Apr 2023 13:43:29 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 04, 2023 at 01:09:19PM +0200, Oliver Neukum wrote:
> On 04.04.23 13:05, Johan Hovold wrote:
> 
> > This is backwards. If you need the device to be active to access these
> > registers then you should resume it unconditionally instead of failing.

> usually you would be right. But this is debugfs. It is intended to observe
> the system in the state it is actually in. If by the act of observation you
> wake up the device, you change the experiment.

I admittedly didn't look to closely at what this particular debugfs
interface is used for, but I generally do not agree with that reasoning.

The device is being used; by the driver and ultimately by a user telling
the driver to do something on their behalf. The fact that the user is
initiating an action through an interface which intended for debugging
should not matter (and the user always has the option to check the
runtime pm state before initiating the action if that matters at all).

Johan
