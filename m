Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABBA7294C9A
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 14:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440285AbgJUM3i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 08:29:38 -0400
Received: from netrider.rowland.org ([192.131.102.5]:53663 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2440264AbgJUM3i (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Oct 2020 08:29:38 -0400
Received: (qmail 983431 invoked by uid 1000); 21 Oct 2020 08:29:37 -0400
Date:   Wed, 21 Oct 2020 08:29:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     "M. Vefa Bicakci" <m.v.b@runbox.com>,
        Pany <pany@fedoraproject.org>, linux-usb@vger.kernel.org
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
Message-ID: <20201021122937.GA982989@rowland.harvard.edu>
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <20201020152859.GA945128@rowland.harvard.edu>
 <74e25095-53fa-b98c-6baf-c97eea574d1c@runbox.com>
 <e7ecea72755147dc3252e8d5c1735903993caa1e.camel@hadess.net>
 <530352a1e69aaf7c8c0933b56aaba68119e0b7fa.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <530352a1e69aaf7c8c0933b56aaba68119e0b7fa.camel@hadess.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 21, 2020 at 02:02:55PM +0200, Bastien Nocera wrote:
> On Wed, 2020-10-21 at 13:53 +0200, Bastien Nocera wrote:
> <snip>
> > I'll prepare a patch that adds a match function. I'll let you (Vefa)
> > look at which of your patches need backporting though, as I'm really
> > quite a bit lost in the different patch sets and branches :/
> 
> Something like that (untested):
> 
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
> index b403094a6b3a..bb89dde018b1 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -163,17 +163,26 @@ static const struct power_supply_desc apple_mfi_fc_desc = {
>         .property_is_writeable  = apple_mfi_fc_property_is_writeable
>  };
>  
> +static bool mfi_fc_match(struct usb_device *udev)
> +{
> +       int idProduct, idVendor;
> +
> +       idVendor = le16_to_cpu(udev->descriptor.idVendor);
> +       idProduct = le16_to_cpu(udev->descriptor.idProduct);
> +       /* See comment above mfi_fc_id_table[] */
> +       return (idVendor == APPLE_VENDOR_ID &&
> +               idProduct >= 0x1200 &&
> +               idProduct <= 0x12ff);
> +}
> +
>  static int mfi_fc_probe(struct usb_device *udev)
>  {
>         struct power_supply_config battery_cfg = {};
>         struct mfi_device *mfi = NULL;
> -       int err, idProduct;
> +       int err;
>  
> -       idProduct = le16_to_cpu(udev->descriptor.idProduct);
> -       /* See comment above mfi_fc_id_table[] */
> -       if (idProduct < 0x1200 || idProduct > 0x12ff) {
> +       if (!mfi_fc_probe(udev))

That should be mfi_fc_match(udev).

Alan Stern
