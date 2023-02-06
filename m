Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FF9868B95A
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 11:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjBFKDi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 05:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230187AbjBFKD0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 05:03:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7712007A
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 02:02:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 03546B80E71
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 10:02:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01DA3C4339B;
        Mon,  6 Feb 2023 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675677738;
        bh=kNEZm3HTvaUOEFpCVlniq63Vb/VvfeDeGxKZSrG/NVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bH8n2haX97u+eIqqBf57+pgf/z3QVmUjsk32/47ZYwceFuSz1x9sgylECOEN7Hm+a
         HggF+XH0hVbT8wMMW6dFDufneo9VakZo2+a4sc09LPEGvw9c5SpbBB4na+wYubwcYB
         AOO6YZjn27xIy2BqPVD6+B/wjPbCFfkQ4RK3amKg=
Date:   Mon, 6 Feb 2023 11:02:15 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, balbi@kernel.org,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com,
        stern@rowland.harvard.edu
Subject: Re: [PATCH v4 00/11] Add XU support to UVC Gadget
Message-ID: <Y+DQJ3tWRljP33f8@kroah.com>
References: <20230202135508.447109-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202135508.447109-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 02, 2023 at 01:54:57PM +0000, Daniel Scally wrote:
> Hello all
> 
> This series adds support for the definition of extension units in configfs for
> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
> group under control, which seemed like an appropriate place to put them.
> 
> To allow the XU's to be inserted in the function graph, the bSourceID attribute
> for the default output terminal is made writeable - users will need to configure
> it with the bUnitID of the XU that they want to use as the OT's source. This does
> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
> that that's fine for now.
> 
> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
> and uvcdynctrl.
> 
> This version is almost identical to v3 but rebased onto usb-testing, with minor
> changes to 6/11 and 7/11.
> 
> v2 of the series here: https://lore.kernel.org/linux-usb/0ae65812-c937-d071-455b-7c1d6418b080@ideasonboard.com/

This series conflicts with the previous patch series you sent, how did
you create this?

Again, can you rebase and resubmit?

thanks,

greg k-h
