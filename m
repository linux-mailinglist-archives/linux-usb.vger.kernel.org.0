Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45EB76BCEC7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Mar 2023 12:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjCPLyu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Mar 2023 07:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjCPLyq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Mar 2023 07:54:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DF7B79E6
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 04:54:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3DCE2B81F9B
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 11:54:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84144C433D2;
        Thu, 16 Mar 2023 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678967681;
        bh=JWZ519DA17BaEe2em5zu/AXIl5mniUHsyHZhh0rpM+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KSCvCUCv41G1Ufoze87P94WUZECM53twuS64oqCO/nyDloq4Rm5jKDLUofBJNC5zt
         d99+DXhdUo6sz7MU1it4dxn4pAYLEcskczURBFMrJ22kvFkhGyGdRFWdR8MhRgPgc/
         hqo7axtjK1xvP1kwmJ7VudTHqxh1fWM/Y7Mlmwus=
Date:   Thu, 16 Mar 2023 12:54:39 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return
 -EINVAL if request role is the same with current role
Message-ID: <ZBMDf6P/xzCP+oOZ@kroah.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20230210085505.GC1991028@nchen-desktop>
 <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 16, 2023 at 09:57:05AM +0000, Xu Yang wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Peter Chen <peter.chen@kernel.org>
> > Sent: Friday, February 10, 2023 4:55 PM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>
> > Subject: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL if request role is the same with current role
> > 
> > Caution: EXT Email
> > 
> > On 22-11-30 16:12:29, Xu Yang wrote:
> > > It should not return -EINVAL if the request role is the same with current
> > > role, return non-error and without do anything instead.
> > >
> > > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > > cc: <stable@vger.kernel.org>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > 
> > Acked-by: Peter Chen <peter.chen@kernel.org>
> 
> Could you please add these three patches to your repo?

Can you please resend them, I don't seem to have them anymore.  Also
split this into 2 different series, one for bugfixes-only, that needs to
go to Linus for 6.3-final, and the others that are new features, to go
for 6.4-rc1.

thanks,

greg k-h
