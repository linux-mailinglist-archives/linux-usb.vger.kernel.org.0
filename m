Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C68B5F0BC5
	for <lists+linux-usb@lfdr.de>; Fri, 30 Sep 2022 14:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231156AbiI3McN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Sep 2022 08:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbiI3McM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Sep 2022 08:32:12 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC32111DE3
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 05:32:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CAC0CB8271C
        for <linux-usb@vger.kernel.org>; Fri, 30 Sep 2022 12:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C856C433D6;
        Fri, 30 Sep 2022 12:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1664541129;
        bh=Rw8FHO/OxUv804kp+5gGbF7P0//Qc0gtlXK2BWS6egQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yu6dNh4aWtmGbkRD6YnlP9Nr9wVmOWCl40gKSLPoJpUunQGeK8CisnFi/9PEPP8SM
         t8WD6JkJVSw5hC5V715HkD7iK63oue9yAAcOky2TR6kOMucDSj/ZQ8TiuB3i1Tc8FJ
         q6fzIr0WmzNJ7M+voxjkb2ULgpmXJHdkRuYPmaAo=
Date:   Fri, 30 Sep 2022 14:32:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 216543] kernel NULL pointer dereference
 usb_hcd_alloc_bandwidth
Message-ID: <Yzbhxt7/zFoRzdw3@kroah.com>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
 <bug-216543-208809-9SJHQpIfGA@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-216543-208809-9SJHQpIfGA@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 30, 2022 at 11:38:46AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=216543
> 
> --- Comment #4 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
> Created attachment 301906
>   --> https://bugzilla.kernel.org/attachment.cgi?id=301906&action=edit
> kernel log from first crash
> 
> Previously uploaded file is from second log snippet, this is the first one for
> completeness since stack traces are slightly different there.

The log file is full of warnings and other messages way before USB is
ever involved.  You might want to resolve those first.

Anyway, yes, the device disconnects itself from the USB bus which is an
electrical event and the video driver fails trying to send data to it,
and then things blow up again.  As there is a real solution for this
(fix the cable), I recommend doing that first :)

thanks,

greg k-h
