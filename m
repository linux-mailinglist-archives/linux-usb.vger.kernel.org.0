Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 859F06BE04A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 05:50:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjCQEuk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 00:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCQEuj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 00:50:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB8555D44C
        for <linux-usb@vger.kernel.org>; Thu, 16 Mar 2023 21:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7EA7E6219F
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 04:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847BDC433EF;
        Fri, 17 Mar 2023 04:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1679028635;
        bh=XWkFtPouo2KDuCILSdW64ie09GYaMdHJvk+zc/e+cg8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IOhb7H3YU0veN98/nQs0lqa+80wskPSXMev9n8R0ZNPMKKdHPIsuM7JYuIm+rSYBs
         m8E0PBrndqLYrQZL4TpvvlUgadfsSphbqeda8pho4689JRfGS0Pz3J5KEetBM4/2ze
         wCOPikpoPyvejHS8qLuzXGFD9xv+sCNT3q8tnWH4=
Date:   Fri, 17 Mar 2023 05:50:33 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     Peter Chen <peter.chen@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return
 -EINVAL if request role is the same with current role
Message-ID: <ZBPxmYBESaEAOEZC@kroah.com>
References: <20221130081231.3127369-1-xu.yang_2@nxp.com>
 <20230210085505.GC1991028@nchen-desktop>
 <DB7PR04MB4505C0FFBA12A15D35A0BBED8CBC9@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <ZBMDf6P/xzCP+oOZ@kroah.com>
 <DB7PR04MB4505ED500F2FE7814C4B61688CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB4505ED500F2FE7814C4B61688CBD9@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 17, 2023 at 02:37:47AM +0000, Xu Yang wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>
> > Sent: Thursday, March 16, 2023 7:55 PM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: Peter Chen <peter.chen@kernel.org>; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Jun Li
> > <jun.li@nxp.com>
> > Subject: Re: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL if request role is the same with current role
> > 
> > Caution: EXT Email
> > 
> > On Thu, Mar 16, 2023 at 09:57:05AM +0000, Xu Yang wrote:
> > > Hi Greg,
> > >
> > > > -----Original Message-----
> > > > From: Peter Chen <peter.chen@kernel.org>
> > > > Sent: Friday, February 10, 2023 4:55 PM
> > > > To: Xu Yang <xu.yang_2@nxp.com>
> > > > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <linux-imx@nxp.com>; Jun Li
> > <jun.li@nxp.com>
> > > > Subject: [EXT] Re: [PATCH v2 1/3] usb: chipdea: core: don't return -EINVAL if request role is the same with current role
> > > >
> > > > Caution: EXT Email
> > > >
> > > > On 22-11-30 16:12:29, Xu Yang wrote:
> > > > > It should not return -EINVAL if the request role is the same with current
> > > > > role, return non-error and without do anything instead.
> > > > >
> > > > > Fixes: a932a8041ff9 ("usb: chipidea: core: add sysfs group")
> > > > > cc: <stable@vger.kernel.org>
> > > > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > >
> > > > Acked-by: Peter Chen <peter.chen@kernel.org>
> > >
> > > Could you please add these three patches to your repo?
> > 
> > Can you please resend them, I don't seem to have them anymore.  Also
> > split this into 2 different series, one for bugfixes-only, that needs to
> > go to Linus for 6.3-final, and the others that are new features, to go
> > for 6.4-rc1.
> 
> Patch 2/3 is a bugfix, but it depends on patch 1/3. I cannot simply
> separate them. After I resend them, could you please let them all go
> to Linus for 6.4-rc1?

Resend and I will review, but that sounds like you also need to mark
patch 1 as a fix, and then patch 3 is not part of the series and can be
separate, right?

What would you do if you were in my position here?  Make it easy for
maintainers please :)

thanks,

greg k-h
