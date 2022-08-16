Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FBD5956CD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Aug 2022 11:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbiHPJmp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Aug 2022 05:42:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233714AbiHPJmH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Aug 2022 05:42:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E93F7A758
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 01:27:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A872C611EA
        for <linux-usb@vger.kernel.org>; Tue, 16 Aug 2022 08:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3DEDC433D7;
        Tue, 16 Aug 2022 08:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660638443;
        bh=A/qVtxXl72bs3bTMPMrg+yEimYCQtkpKrULAEhPtwJA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uYnb3NPwQ8H7ePk3uNl7ESpdPXc0b2S0wK6K+J/kYGhyg5PC2AmWR/q2Kk8GU8nde
         z+CAg4bgfoP1YjPUe8Rltpvgh1FhS6mKyXuE0FjWRlgSk1aDA0l6xE6FbdjD772/q9
         6vOyIZqoRVawQ+VwhPyUGss9GrsZQ2Kecm3dhgi0=
Date:   Tue, 16 Aug 2022 09:57:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Adam Borowski <kilobyte@angband.pl>
Cc:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        linux-usb@vger.kernel.org
Subject: Re: build failure due to drivers/usb/dwc3/dwc3-qcom.c
Message-ID: <YvtOAIjBZs/lUWvB@kroah.com>
References: <YvrlS9ear/Ku1bKt@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YvrlS9ear/Ku1bKt@angband.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 16, 2022 at 02:31:07AM +0200, Adam Borowski wrote:
> Hi!
> With CONFIG_USB=n CONFIG_USB_GADGET=y I get the following fail:
> 
> ld: drivers/usb/dwc3/dwc3-qcom.o: in function `dwc3_qcom_suspend':
> dwc3-qcom.c:(.text+0x3d4): undefined reference to `usb_hub_find_child'
> 
> I tried writing a patch but I don't know how much code applies to host
> mode only -- and whether the device supports gadget at all.  Thus, I'm
> just reporting instead.
> 
> Broken in 6895ea55c385c9afdd2aec1eef27ec24917a112f.

Thanks, this has been discussed a bunch on the linux-usb list and should
be resolved soon.

greg k-h
