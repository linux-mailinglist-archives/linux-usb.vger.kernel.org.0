Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97B4D6E65D1
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 15:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231502AbjDRN0n (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 09:26:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbjDRN0m (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 09:26:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D8B0CC29
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 06:26:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A5D5634D1
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 13:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB6FAC433D2;
        Tue, 18 Apr 2023 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681824400;
        bh=PZfpFPL5Cb6HHjASlKUEf5vSiBtwn9dcDzZWZv46xCo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aowBiihdTv6tdqfFz4DvezkVqy5SV9cMV7Wyb93vx1aGwaYH9JlfALeixOYqdSnbC
         VTBQQEOhcC/0FevZvHCFEgAa8hnLA1bMtLA1X15AgQRCsGfJXx5W1oR8Eg6poyUhcQ
         zUYMmjohGvMSbK4ulCA6cM8fdK53FYmCr7P9yIN8=
Date:   Tue, 18 Apr 2023 15:26:37 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>,
        Udipto Goswami <quic_ugoswami@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>, linux-usb@vger.kernel.org,
        Oliver Neukum <oneukum@suse.com>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v5] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <2023041813-stowing-rug-710a@gregkh>
References: <20230418121835.17550-1-quic_ugoswami@quicinc.com>
 <ZD6Us2PoD4UfY27S@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZD6Us2PoD4UfY27S@hovoldconsulting.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 03:01:39PM +0200, Johan Hovold wrote:
> On Tue, Apr 18, 2023 at 05:48:35PM +0530, Udipto Goswami wrote:
> 
> First, the subject of this patch looks wrong.
> 
> > When the dwc3 device is runtime suspended, various required clocks would
> > get disabled and it is not guaranteed that access to any registers would
> > work. Depending on the SoC glue, a register read could be as benign as
> > returning 0 or be fatal enough to hang the system.
> > 
> > In order to prevent such scenarios of fatal errors, make sure to resume
> > dwc3 then allow the function to proceed.
> > 
> > Signed-off-by: Oliver Neukum <oneukum@suse.com>
> > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> 
> I did not sign-off on this patch (and neither did Oliver I presume).
> 
> You must never add a SoB on behalf on someone else without their
> permission. Please read Documentation/process/submitting-patches.rst and
> make sure you understand what SoB means before sending any further
> patches.

Ah, I thought so :(

Udipto, please go complete the developer legal training that I know your
company provides for dealing with things like this as they take it very
seriously, before you resubmit this, or any other kernel patches.

thanks,

greg k-h
