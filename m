Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC65F6A953E
	for <lists+linux-usb@lfdr.de>; Fri,  3 Mar 2023 11:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230365AbjCCKaI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Mar 2023 05:30:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjCCK3y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Mar 2023 05:29:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E4BE5D895
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 02:29:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B0D62B811FB
        for <linux-usb@vger.kernel.org>; Fri,  3 Mar 2023 10:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4406C433EF;
        Fri,  3 Mar 2023 10:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677839386;
        bh=s302LYjE1Qzg7webV/GMbj90eZRCzKKth2XI4/EGzb4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dxy27baHST8PT0OmnmulRUyIdW43ckMvw+fLP08emFAfORFiezANLrW9CUOQznZgA
         RbLcTTcKzPT1SOJt1smxLV78gSTmTkqvdEdSY1bxMJKmce8NswdGnMTWaB1o6qwDOY
         222/1Fuzud0Koc6GBGiumt8oH5Fd7+SYlut5ZvVI=
Date:   Fri, 3 Mar 2023 11:29:43 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [RFC PATCH 2/2] usb: core: hub: avoid reset hub during probe
Message-ID: <ZAHMFw9Bo6nWKGFO@kroah.com>
References: <1677835718-7405-1-git-send-email-quic_linyyuan@quicinc.com>
 <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677835718-7405-2-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 03, 2023 at 05:28:38PM +0800, Linyu Yuan wrote:
> When start probe hub, during INIT, INTT2, INIT3 stage, when link state
> change to inactive, currently it will reset the device, maybe it will
> trigger warning in usb_submit_urb() due to urb->hcpriv is still active.

I am sorry, but I do not understand this text at all.  Can you reword
it?

> Add a flag name init_stage to avoid reset the device.

I do not understand, what is "flag name"?

thanks,

greg k-h
