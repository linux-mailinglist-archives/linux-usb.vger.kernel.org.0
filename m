Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE326735ACA
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jun 2023 17:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230282AbjFSPH2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jun 2023 11:07:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjFSPHT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jun 2023 11:07:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97B4A170C;
        Mon, 19 Jun 2023 08:06:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DD7B860C72;
        Mon, 19 Jun 2023 15:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004EFC433C8;
        Mon, 19 Jun 2023 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1687187210;
        bh=ErWuQq2NfHQ3CyVJprCo+42/PXz4z1R0rTbz/ijpHOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sg/HYWKa+WV9Xfp1laspMOtmWUUYp/1Ow6byBCHG7nu+3OOTZOuTDgZuXFTVJxO/C
         UCnS3UNoK535hnwuC+ZyUWW3sB5k9dDQMP+u8zV5hZYIVgw0o57FDkglJaqoBXEhdi
         ABxVOaq0Zbr6YnMARHLdLooAe9QzkrbL5dKkvCtI=
Date:   Mon, 19 Jun 2023 17:06:46 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Badhri Jagan Sridharan <badhri@google.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Elson Roy Serrao <quic_eserrao@quicinc.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: core: Fix double unlock in
 usb_gadget_activate()
Message-ID: <2023061937-remedial-chrome-6c09@gregkh>
References: <32e22952-8574-4120-979b-ebb6af5f54b4@moroto.mountain>
 <2023061959-volley-badland-81a2@gregkh>
 <031bd76e-7955-4a71-94fa-276d08d5ada5@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <031bd76e-7955-4a71-94fa-276d08d5ada5@kadam.mountain>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 19, 2023 at 05:46:28PM +0300, Dan Carpenter wrote:
> On Mon, Jun 19, 2023 at 03:39:05PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Jun 15, 2023 at 06:43:03PM +0300, Dan Carpenter wrote:
> > > Do not call mutex_unlock(&gadget->udc->connect_lock) twice in a row.
> > > 
> > > Fixes: 286d9975a838 ("usb: gadget: udc: core: Prevent soft_connect_store() race")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >  drivers/usb/gadget/udc/core.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> > > index 83fd1de14784..d58640a9d0ca 100644
> > > --- a/drivers/usb/gadget/udc/core.c
> > > +++ b/drivers/usb/gadget/udc/core.c
> > > @@ -878,8 +878,6 @@ int usb_gadget_activate(struct usb_gadget *gadget)
> > >  	 */
> > >  	if (gadget->connected)
> > >  		ret = usb_gadget_connect_locked(gadget);
> > > -	mutex_unlock(&gadget->udc->connect_lock);
> > > -
> > >  unlock:
> > >  	mutex_unlock(&gadget->udc->connect_lock);
> > >  	trace_usb_gadget_activate(gadget, ret);
> > > -- 
> > > 2.39.2
> > > 
> > 
> > Does not apply to my tree :(
> 
> No longer required.  The patch was reverted.

Ah good, thanks for checking.
