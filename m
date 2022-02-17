Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE41D4BA468
	for <lists+linux-usb@lfdr.de>; Thu, 17 Feb 2022 16:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242521AbiBQPbe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Feb 2022 10:31:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242517AbiBQPbc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Feb 2022 10:31:32 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72682B2C73
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 07:31:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 546E361EC6
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 15:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B3C340E8;
        Thu, 17 Feb 2022 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645111876;
        bh=sVtS9yh28F1Fnko4xbrtn/2OLrArPuSPTSdZ57vWlN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f913LM/znHsrVvU+TJ8WFBJ5TFGiEvHqLev1UmO0at6dZ0yFrRViCEVdUzbxx+RUb
         /QoMs3SQnzxbQrbyisQlIEnCvdZ9KqeVCJurSGt2Y9JYQPyMsdP3/+1iAUC86iDZbu
         MoeRLgJqvDY5zBb8Bdg4SAJvwcwHTre0guaQCgIc=
Date:   Thu, 17 Feb 2022 16:31:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 0/9] usb/dwc3 / phy/tusb1210: Add TUSB1211 charger
 detection
Message-ID: <Yg5qQXUFd/Takm7V@kroah.com>
References: <20220213130524.18748-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220213130524.18748-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Feb 13, 2022 at 02:05:15PM +0100, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patchs-series to add support for USB charger-type
> (SDP/DCP) detection using a tusb1210 phy connected to a dwc3 controller.
> 
> Changes in v2:
> [PATCH v2 9/9] phy: ti: tusb1210: Add charger detection:
> - Add an online attribute to the registered power_supply class device,
>   otherwise upower thinks it is an extra system battery
> - Add tusb1210_remove_charger_detect() function to properly unregister
>   the tusb->psy_nb notifier and to cancel tusb->chg_det_work
> 
> v1 cover-letter:
> 
> Some Android x86 tablets with a Bay Trail (BYT) SoC (with DWC3 UDC)
> and a Crystal Cove PMIC, which does not support charger-detection,
> rely on a TUSB1211 phy for charger-detection.
> 
> This series adds support for this, it starts with some dwc3 bug-fixes
> for issues hit while developing this, as well as adding support to
> the dwc3 code to set a special property checked by the tusb1210 driver
> to signal that it needs to enable charger-detection.
> 
> The 2nd half of the series does some refactoring / fixes to the
> tusb1210 driver and adds the charger-detection support.

The first 4 are all in my usb trees now, thanks.

greg k-h
