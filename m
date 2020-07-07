Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578122175C5
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 20:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgGGSCn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 14:02:43 -0400
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:36291 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727777AbgGGSCm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jul 2020 14:02:42 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 8BDD9811;
        Tue,  7 Jul 2020 14:02:41 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 07 Jul 2020 14:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm1; bh=VrcCEEInyPynFdWSKhxZReyqlg5
        HpQicoVL6OU+3XzE=; b=NWUvNZ54NnHBmH9NQvF3G5aZ6wjFWp7fIM9DG8Yp/p8
        HxUJzkGQR3AmEuNKCXSp56LC2zqVD0xporGJ/AfyblQxku59bXUhNNcND0DsK4BQ
        1CwOmt5mdibLx4WqZbys+UcQeSugNvDJXV26SEavTF5eSDAWwg0ZAZEpG0XiTZ/r
        NSbwdJ+YpVHER2/i37YCZl+ZGsF5/kvx32tYHzTBDpR9xyHeOhm4v1Cz5uR4lVOM
        HriB5ByqWYaGov/Q8dYWG6EpjtdcTilMlKKbO889JPcgFEutjJHsqHA3wR0joWFW
        wAUrioFPGNc6B9HV7U+NBtZeslR3CUXC0+zWxNEUCkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VrcCEE
        InyPynFdWSKhxZReyqlg5HpQicoVL6OU+3XzE=; b=nfWdOGwcUC8XVQrZO0xR/z
        aaSwk9071y8Oyxa+k7+Q2rIE9zXNNi31ptL6rmxUSIHYNP2FXzAMpTGL9ssSfczQ
        lPHTAUeynCTz9lJBwts8lYGZFJN9eqcCts7RT+CQd29Zf00nwRe5rbudJu6iolwM
        FZU4sFMM5/i5ypE/rP5NZ244FWo9QT2+BqRI8u7Cdl6tAsZMBU3tF8WKJYXaUkeI
        /rh3Db+HQOyeTnFT/uN91HPCEPHmZu1tLOYGDlX6tIMg9FPdtmoM3bd3uXgdjP+o
        Q17YV+hau6RHeL8Y+OO79QBLQgIb7v7lIDhX0DcIyjD3ZGQiC//FXmb5oF9p5uOw
        ==
X-ME-Sender: <xms:wLgEXycD5Ok2Hju6lBSWMtNeevzuAoSXGQdp0-XIhzNDMZT_m3eaGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgdduudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrkeelrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:wLgEX8N91HJvb93bkf78oISBOltjHV2H0_oFy_Z26nwRBeYUqwLskA>
    <xmx:wLgEXzgWm86pk_T2Ya8jzfLCZUXy7T2QoP3o98rslsUdTDzpOlCmWQ>
    <xmx:wLgEX_8xgp4sJll10C_OZ0XqOAz5raOaWnEv5u574DRxKTKPJPye3w>
    <xmx:wbgEXzXeBwJ-cEvvzcKxNwxRo7KfnoknJw6VnQPrTAtFidHPukYZxQ>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        by mail.messagingengine.com (Postfix) with ESMTPA id E977E3280060;
        Tue,  7 Jul 2020 14:02:39 -0400 (EDT)
Date:   Tue, 7 Jul 2020 20:02:38 +0200
From:   Greg KH <greg@kroah.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: correct kernel-doc inconsistency
Message-ID: <20200707180238.GA252415@kroah.com>
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
 <6c25acb6-f702-0ce0-508d-d55080fe469f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c25acb6-f702-0ce0-508d-d55080fe469f@infradead.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 10:14:24PM -0700, Randy Dunlap wrote:
> On 7/6/20 9:52 PM, Colton Lewis wrote:
> > Silence documentation  build warning by correcting  kernel-doc comment
> > for sub_validate_langid function.
> > 
> > ./drivers/usb/gadget/usbstring.c:77: warning: Function parameter or member 'langid' not described in 'usb_validate_langid'
> > ./drivers/usb/gadget/usbstring.c:77: warning: Excess function parameter 'lang' description in 'usb_validate_langid'
> > 
> > Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
> > ---
> >  drivers/usb/gadget/usbstring.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/gadget/usbstring.c b/drivers/usb/gadget/usbstring.c
> > index 58a4d3325090..119505fac777 100644
> > --- a/drivers/usb/gadget/usbstring.c
> > +++ b/drivers/usb/gadget/usbstring.c
> > @@ -68,7 +68,7 @@ EXPORT_SYMBOL_GPL(usb_gadget_get_string);
> >  
> >  /**
> >   * usb_validate_langid - validate usb language identifiers
> > - * @lang: usb language identifier
> > + * @langid: usb language identifier
> >   *
> >   * Returns true for valid language identifier, otherwise false.
> >   */
> > 
> 
> Hi,
> I sent a patch for this on June 28, but it has not yet been merged anywhere
> AFAIK.

Have a message-id?  I don't see it in my queue.

thanks,

greg k-h
