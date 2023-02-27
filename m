Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7BA6A3B44
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 07:33:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbjB0GdI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 01:33:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbjB0GdH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 01:33:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41AEDAD18
        for <linux-usb@vger.kernel.org>; Sun, 26 Feb 2023 22:33:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E4AC9B80C6D
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 06:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015E7C433D2;
        Mon, 27 Feb 2023 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1677479581;
        bh=oldy81cZorHr19ZbcsfhcvIOk5eQShHziS1YVDGjkFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKx1lcu9T1CwacyogIZy2BbV75c6cxFt8UtdX6M8mfKNjPLhkl7Gu8R6wHfdPhva8
         YX6NVMm6y3z5Lz5FBXhL+Bgi3z5PUlCJCs8Zv8/G79m7k1geP1YYQ2pa/P30fjBfNd
         3vkvPSvq+7Q93HziGPCfTToBkyf++ygUCK1ESmgU=
Date:   Mon, 27 Feb 2023 07:32:58 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>, linux-usb@vger.kernel.org,
        Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v2 0/4] usb: replace some __dynamic_array() to __get_buf()
Message-ID: <Y/xOmnDFt8XTXKyO@kroah.com>
References: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1677465850-1396-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Feb 27, 2023 at 10:44:06AM +0800, Linyu Yuan wrote:
> some trace event funciton use __dynamic_array, but it only used at output
> time, change to __get_buf() will allocate tempary buffer for such usage.
> 
> 
> v2: remove Aswath Govindraju, seem mail not aviliable.
> 
> 
> Linyu Yuan (4):
>   usb: cdns3: change trace event cdns3_ring() operation
>   usb: cdns3: change some trace event __dynamic_array() to __get_buf()
>   usb: dwc3: change some trace event __dynamic_array() to __get_buf()
>   usb: xhci: change some trace event __dynamic_array() to __get_buf()
> 
>  drivers/usb/cdns3/cdns3-debug.h |  8 ++------
>  drivers/usb/cdns3/cdns3-trace.h | 28 +++++++++-------------------
>  drivers/usb/cdns3/cdnsp-trace.h | 12 ++++--------
>  drivers/usb/dwc3/trace.h        |  6 ++----
>  drivers/usb/host/xhci-trace.h   | 20 +++++++-------------
>  5 files changed, 24 insertions(+), 50 deletions(-)
> 
> -- 
> 2.7.4
> 


Hi,

This is the friendly semi-automated patch-bot of Greg Kroah-Hartman.
You have sent him a patch that has triggered this response.

Right now, the development tree you have sent a patch for is "closed"
due to the timing of the merge window.  Don't worry, the patch(es) you
have sent are not lost, and will be looked at after the merge window is
over (after the -rc1 kernel is released by Linus).

So thank you for your patience and your patches will be reviewed at this
later time, you do not have to do anything further, this is just a short
note to let you know the patch status and so you don't worry they didn't
make it through.

thanks,

greg k-h's patch email bot
