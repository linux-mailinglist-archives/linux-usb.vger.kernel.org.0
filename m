Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D845279880F
	for <lists+linux-usb@lfdr.de>; Fri,  8 Sep 2023 15:45:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241557AbjIHNpI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Sep 2023 09:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231284AbjIHNpH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Sep 2023 09:45:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B1731BC6
        for <linux-usb@vger.kernel.org>; Fri,  8 Sep 2023 06:45:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [93.93.133.154])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9AAF63F1;
        Fri,  8 Sep 2023 15:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1694180611;
        bh=n+9aSxWI3oNNo1baYMbF1z/yC0UBEe1dVxjfjOPlf5I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O1RG14nFZ8dg2uY20M6e505RlFDQ1pd12DClyJJUSv9aWjEUoL7fdgFbVDwXdlGW/
         VSpYmADnPDNkcoYQa0+tZ0ASGsOz9hLN5HGLp7PcA3HXgR3e98w3vTLgg8frngpvq3
         BXRNLQ9F3oX/RY2a4sV8Pmulj4khY0YbBYWULOb8=
Date:   Fri, 8 Sep 2023 16:45:13 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Yue Haibing <yuehaibing@huawei.com>, gregkh@linuxfoundation.org,
        dan.scally@ideasonboard.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH -next] usb: gadget: function: Remove unused declarations
Message-ID: <20230908134513.GA15721@pendragon.ideasonboard.com>
References: <20230818124025.51576-1-yuehaibing@huawei.com>
 <aaef84e5-4845-eeab-3d72-0b95966ac001@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaef84e5-4845-eeab-3d72-0b95966ac001@collabora.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 08, 2023 at 03:33:29PM +0200, Andrzej Pietrasiewicz wrote:
> Hi,
> 
> Nice catches!
> 
> You probably want 4 separate patches. In particular...
> 
> W dniu 18.08.2023 o 14:40, Yue Haibing pisze:
> > These declarations are not implemented anymore, remove them.
> > 
> > Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> > ---
> >   drivers/usb/gadget/function/u_phonet.h | 1 -
> >   drivers/usb/gadget/function/u_serial.h | 4 ----
> >   drivers/usb/gadget/function/uvc.h      | 2 --
> >   3 files changed, 7 deletions(-)
> > 
> > diff --git a/drivers/usb/gadget/function/u_phonet.h b/drivers/usb/gadget/function/u_phonet.h
> > index c53233b37192..ff62ca22c40d 100644
> > --- a/drivers/usb/gadget/function/u_phonet.h
> > +++ b/drivers/usb/gadget/function/u_phonet.h
> > @@ -20,7 +20,6 @@ struct f_phonet_opts {
> >   struct net_device *gphonet_setup_default(void);
> >   void gphonet_set_gadget(struct net_device *net, struct usb_gadget *g);
> >   int gphonet_register_netdev(struct net_device *net);
> > -int phonet_bind_config(struct usb_configuration *c, struct net_device *dev);
> 
> ...this fixes 0383070e8d904f006b6eaffceb3fae4cdd25c01a
> 
> >   void gphonet_cleanup(struct net_device *dev);
> >   
> >   #endif /* __U_PHONET_H */
> > diff --git a/drivers/usb/gadget/function/u_serial.h b/drivers/usb/gadget/function/u_serial.h
> > index 102a7323a1fd..901d99310bc4 100644
> > --- a/drivers/usb/gadget/function/u_serial.h
> > +++ b/drivers/usb/gadget/function/u_serial.h
> > @@ -71,8 +71,4 @@ void gserial_disconnect(struct gserial *);
> >   void gserial_suspend(struct gserial *p);
> >   void gserial_resume(struct gserial *p);
> >   
> > -/* functions are bound to configurations by a config or gadget driver */
> > -int gser_bind_config(struct usb_configuration *c, u8 port_num);
> 
> ... this fixes 9786b4561228099f579ad88912aa305812526ea1
> 
> > -int obex_bind_config(struct usb_configuration *c, u8 port_num);
> 
> ... and this fixes 9b2252cace741e4843983d77ead80c3cf1d74e20
> > -
> >   #endif /* __U_SERIAL_H */
> > diff --git a/drivers/usb/gadget/function/uvc.h b/drivers/usb/gadget/function/uvc.h
> > index 100475b1363e..6751de8b63ad 100644
> > --- a/drivers/usb/gadget/function/uvc.h
> > +++ b/drivers/usb/gadget/function/uvc.h
> > @@ -178,8 +178,6 @@ struct uvc_file_handle {
> >    */
> >   
> >   extern void uvc_function_setup_continue(struct uvc_device *uvc);
> > -extern void uvc_endpoint_stream(struct uvc_device *dev);
> > -
> 
> @Laurent: I was unable to track this one.

The issue has been there from the start. It doesn't matter much though,
this patch has been merged already.

> >   extern void uvc_function_connect(struct uvc_device *uvc);
> >   extern void uvc_function_disconnect(struct uvc_device *uvc);
> >   

-- 
Regards,

Laurent Pinchart
