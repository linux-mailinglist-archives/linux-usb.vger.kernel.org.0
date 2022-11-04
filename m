Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB366194D8
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 11:52:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiKDKw4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 06:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbiKDKwz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 06:52:55 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AE622B277
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 03:52:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF5FBB82CEE
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 10:52:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF982C433B5;
        Fri,  4 Nov 2022 10:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667559171;
        bh=KdiItrZbQOCUXGiXMSWjOWMCCdIEv1/MS7Bxkt7lwO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P7ObqvV0FPbcoxqkTWzFaLa8VXukYxHIWH/Irr/wRd+0jQL1cKT6vSG0FqQ/i3PE9
         Prz5aP3zg52YyoJ8XLyv+A+DJGYsXBWbU3ukr80JBIIYCO0Ibu7BCij/S+CxGDPFfK
         JTZHbqwFqiRmL6IstEslZnlRr+yDdVrMBDPRInuGMHdce+VwjWw/YO0+zDL+Rd6050
         D7BpH1Lma5kjc1WU3VxhcpXUXok5mr5wICexlmXnVzShO9/8qi6n6CrQKVIDjDH5Ns
         mOunurtIq9OagQ8z8gJ3HWoAJkUNiyzTUQfp58NLqnOGDLNLqgQetJlhkkuKtf1I+r
         erdLKB+/mtAow==
Date:   Fri, 4 Nov 2022 10:52:46 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>,
        gregkh@linuxfoundation.org
Cc:     Xu Yang <xu.yang_2@nxp.com>, gregkh@linuxfoundation.org,
        peter.chen@kernel.org, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com
Subject: Re: [PATCH] usb: chipidea: core: wrap ci_handle_power_lost() with
 CONFIG_PM_SLEEP
Message-ID: <Y2Tu/oeVL85JJQDs@spud>
References: <20221026121157.1491302-1-xu.yang_2@nxp.com>
 <Y1jbmacR2zyeQJGw@wendy>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1jbmacR2zyeQJGw@wendy>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 26, 2022 at 08:02:49AM +0100, Conor Dooley wrote:
> On Wed, Oct 26, 2022 at 08:11:57PM +0800, Xu Yang wrote:
> > If CONFIG_PM_SLEEP is not set, the following error will be shown up
> > when build kernel:
> >     error: 'ci_handle_power_lost' defined but not used.
> > 
> > This will move ci_handle_power_lost() to an area wrapped by
> > CONFIG_PM_SLEEP.
> > 
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > Fixes: 74494b33211d ("usb: chipidea: core: add controller resume support when controller is powered off")
> 
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Thanks for the quick fix. BTW, your mails show up timestamped in the
> future, maybe something's up with the TZ on your machine.

Hey Greg (I'm assuming you apply the chipidea stuff directly),

Apologies for the ping, this is a fix for the allmodconfig build on
RISC-V in -next so it'd be nice to get it applied.

Thanks,
Conor.

> > ---
> >  drivers/usb/chipidea/core.c | 38 ++++++++++++++++++-------------------
> >  1 file changed, 19 insertions(+), 19 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 2b170b434d01..484b1cd23431 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -661,25 +661,6 @@ static enum ci_role ci_get_role(struct ci_hdrc *ci)
> >  	return role;
> >  }
> >  
> > -static void ci_handle_power_lost(struct ci_hdrc *ci)
> > -{
> > -	enum ci_role role;
> > -
> > -	disable_irq_nosync(ci->irq);
> > -	if (!ci_otg_is_fsm_mode(ci)) {
> > -		role = ci_get_role(ci);
> > -
> > -		if (ci->role != role) {
> > -			ci_handle_id_switch(ci);
> > -		} else if (role == CI_ROLE_GADGET) {
> > -			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> > -				usb_gadget_vbus_connect(&ci->gadget);
> > -		}
> > -	}
> > -
> > -	enable_irq(ci->irq);
> > -}
> > -
> >  static struct usb_role_switch_desc ci_role_switch = {
> >  	.set = ci_usb_role_switch_set,
> >  	.get = ci_usb_role_switch_get,
> > @@ -1400,6 +1381,25 @@ static int ci_suspend(struct device *dev)
> >  	return 0;
> >  }
> >  
> > +static void ci_handle_power_lost(struct ci_hdrc *ci)
> > +{
> > +	enum ci_role role;
> > +
> > +	disable_irq_nosync(ci->irq);
> > +	if (!ci_otg_is_fsm_mode(ci)) {
> > +		role = ci_get_role(ci);
> > +
> > +		if (ci->role != role) {
> > +			ci_handle_id_switch(ci);
> > +		} else if (role == CI_ROLE_GADGET) {
> > +			if (ci->is_otg && hw_read_otgsc(ci, OTGSC_BSV))
> > +				usb_gadget_vbus_connect(&ci->gadget);
> > +		}
> > +	}
> > +
> > +	enable_irq(ci->irq);
> > +}
> > +
> >  static int ci_resume(struct device *dev)
> >  {
> >  	struct ci_hdrc *ci = dev_get_drvdata(dev);
> > -- 
> > 2.34.1
> > 
> > 
> 
