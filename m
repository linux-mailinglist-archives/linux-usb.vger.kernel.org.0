Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E6FEA9D8C
	for <lists+linux-usb@lfdr.de>; Thu,  5 Sep 2019 10:53:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732836AbfIEIxH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 Sep 2019 04:53:07 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:38385 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732205AbfIEIxG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 Sep 2019 04:53:06 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 079563C005E;
        Thu,  5 Sep 2019 10:53:04 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 0sKHFPSkMrKD; Thu,  5 Sep 2019 10:52:58 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 758703C00C5;
        Thu,  5 Sep 2019 10:52:58 +0200 (CEST)
Received: from vmlxhi-070.adit-jv.com (10.72.93.148) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.468.0; Thu, 5 Sep 2019
 10:52:57 +0200
Date:   Thu, 5 Sep 2019 10:52:51 +0200
From:   veeraiyan chidambaram <external.veeraiyan.c@de.adit-jv.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        "REE erosca@DE.ADIT-JV.COM" <erosca@DE.ADIT-JV.COM>,
        Veeraiyan Chidambaram <veeraiyan.chidambaram@in.bosch.com>
Subject: Re: [PATCH v2] usb: gadget: udc: renesas_usb3: add suspend event
 support
Message-ID: <20190905085251.GA28016@vmlxhi-070.adit-jv.com>
References: <TYAPR01MB454435E0431173D3C7F76D65D8B80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
 <1567608481-771-1-git-send-email-external.veeraiyan.c@de.adit-jv.com>
 <OSAPR01MB4529159D4DA9764B0688D4A4D8BB0@OSAPR01MB4529.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <OSAPR01MB4529159D4DA9764B0688D4A4D8BB0@OSAPR01MB4529.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.148]
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Shimoda-san,

Thanks a lot . 

On Thu, Sep 05, 2019 at 02:09:42AM +0000, Yoshihiro Shimoda wrote:
> Hi Veeraiyan,
> 
> Thank you for the patch!
> 
> > From: Veeraiyan Chidambaram, Sent: Wednesday, September 4, 2019 11:48 PM
> <snip>
> > --- a/drivers/usb/gadget/udc/renesas_usb3.c
> > +++ b/drivers/usb/gadget/udc/renesas_usb3.c
> > @@ -767,6 +767,20 @@ static void usb3_irq_epc_int_1_resume(struct renesas_usb3 *usb3)
> >  	usb3_transition_to_default_state(usb3, false);
> >  }
> > 
> > +static void usb3_irq_epc_int_1_suspend(struct renesas_usb3 *usb3)
> > +{
> > +	usb3_disable_irq_1(usb3, USB_INT_1_B2_SPND);
> > +
> > +	if (usb3->driver &&
> > +	    usb3->driver->suspend &&
> 
> As I mentioned on v1 patch [1], I'd like to remove these conditions.
> After fixed it,
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> [1] https://patchwork.kernel.org/patch/11129797/#22862513

I have create V2 patch [1], please review.

[1] https://patchwork.kernel.org/patch/11132433/

Best regards,
Veeraiyan chidambaram

> Yoshihiro Shimoda
> 
> > +	    usb3->gadget.speed != USB_SPEED_UNKNOWN &&
> > +	    usb3->gadget.state != USB_STATE_NOTATTACHED) {
> > +		if (usb3->driver && usb3->driver->suspend)
> > +			usb3->driver->suspend(&usb3->gadget);
> > +		usb_gadget_set_state(&usb3->gadget, USB_STATE_SUSPENDED);
> > +	}
> > +}
> > +
> >  static void usb3_irq_epc_int_1_disable(struct renesas_usb3 *usb3)
> >  {
> >  	usb3_stop_usb3_connection(usb3);
> > @@ -852,6 +866,9 @@ static void usb3_irq_epc_int_1(struct renesas_usb3 *usb3, u32 int_sta_1)
> >  	if (int_sta_1 & USB_INT_1_B2_RSUM)
> >  		usb3_irq_epc_int_1_resume(usb3);
> > 
> > +	if (int_sta_1 & USB_INT_1_B2_SPND)
> > +		usb3_irq_epc_int_1_suspend(usb3);
> > +
> >  	if (int_sta_1 & USB_INT_1_SPEED)
> >  		usb3_irq_epc_int_1_speed(usb3);
> > 
> > --
> > 2.7.4
> 
