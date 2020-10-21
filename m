Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 860A5294C9D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 14:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440330AbgJUMbS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 08:31:18 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:57539 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440313AbgJUMbS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 08:31:18 -0400
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id AAF701C000E;
        Wed, 21 Oct 2020 12:31:15 +0000 (UTC)
Message-ID: <c47b996088953c616246cbe3d1067646faeeb154.camel@hadess.net>
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
From:   Bastien Nocera <hadess@hadess.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
Date:   Wed, 21 Oct 2020 14:31:15 +0200
In-Reply-To: <20201021122937.GA982989@rowland.harvard.edu>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
         <20201017200200.GB842001@rowland.harvard.edu>
         <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
         <20201019174028.GF898631@rowland.harvard.edu>
         <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
         <20201020152859.GA945128@rowland.harvard.edu>
         <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
         <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
         <530352a1e69aaf7c8c0933b56aaba68119e0b7fa.camel@hadess.net>
         <20201021122937.GA982989@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-10-21 at 08:29 -0400, Alan Stern wrote:
> On Wed, Oct 21, 2020 at 02:02:55PM +0200, Bastien Nocera wrote:
> > On Wed, 2020-10-21 at 13:53 +0200, Bastien Nocera wrote:
> > <snip>
> > > I'll prepare a patch that adds a match function. I'll let you
> > > (Vefa)
> > > look at which of your patches need backporting though, as I'm
> > > really
> > > quite a bit lost in the different patch sets and branches :/
> > 
> > Something like that (untested):
> > 
> > diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c
> > b/drivers/usb/misc/apple-mfi-fastcharge.c
> > index b403094a6b3a..bb89dde018b1 100644
> > --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> > +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> > @@ -163,17 +163,26 @@ static const struct power_supply_desc
> > apple_mfi_fc_desc = {
> >         .property_is_writeable  =
> > apple_mfi_fc_property_is_writeable
> >  };
> >  
> > +static bool mfi_fc_match(struct usb_device *udev)
> > +{
> > +       int idProduct, idVendor;
> > +
> > +       idVendor = le16_to_cpu(udev->descriptor.idVendor);
> > +       idProduct = le16_to_cpu(udev->descriptor.idProduct);
> > +       /* See comment above mfi_fc_id_table[] */
> > +       return (idVendor == APPLE_VENDOR_ID &&
> > +               idProduct >= 0x1200 &&
> > +               idProduct <= 0x12ff);
> > +}
> > +
> >  static int mfi_fc_probe(struct usb_device *udev)
> >  {
> >         struct power_supply_config battery_cfg = {};
> >         struct mfi_device *mfi = NULL;
> > -       int err, idProduct;
> > +       int err;
> >  
> > -       idProduct = le16_to_cpu(udev->descriptor.idProduct);
> > -       /* See comment above mfi_fc_id_table[] */
> > -       if (idProduct < 0x1200 || idProduct > 0x12ff) {
> > +       if (!mfi_fc_probe(udev))
> 
> That should be mfi_fc_match(udev).

*facepalm*

Thanks

