Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 183D11A165B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2020 22:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgDGUAk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Apr 2020 16:00:40 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:38138 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgDGUAk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Apr 2020 16:00:40 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 48xdYy3FFgzGL;
        Tue,  7 Apr 2020 22:00:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1586289638; bh=5xnG2lcxdLNlYJHyzuLqGlB+30R0TG/hB0uI8xRBvA0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TnCsoC/wBF/7n6YBcWyAfjzyuAkm1DbEuIjNj36xkLhAAsppuZx98XJd6u6BljKIN
         GMrckW9uKrzRWWxqH4N7YoZTeq9S1SLQzxsl3bwXi1R4u4W3COkm4bUInwfVeA4hwM
         d5FCkww6dm6zNQbhheSnk4gzfKN7VUl5h0pkKKJPFBEFBh0Kj6IdfnRdeJPILKkHfM
         wxAkvkn61qRKKzM3crHm8pF7pi4Jm6roVN6rVGvIQM8fmpvf2JDBV5AXoOTWdfNq1v
         uIRSuJI9kt4c2DlRpU3bLKegxH1gMaLSstwQcn0cOL8XHJRn7mg63YO6/AK6GNdCiF
         6mztxbUf5UtYQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.2 at mail
Date:   Tue, 7 Apr 2020 22:00:37 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 5/5] usb: chipidea: allow disabling glue drivers if
 EMBEDDED
Message-ID: <20200407200037.GB744@qmqm.qmqm.pl>
References: <2b6d70595475a3ddbd5bb8ae1765868a98c404b6.1585958250.git.mirq-linux@rere.qmqm.pl>
 <1bf89d4301baa8632daf48b3e28858aff5371954.1585958250.git.mirq-linux@rere.qmqm.pl>
 <20200407031300.GB26899@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200407031300.GB26899@b29397-desktop>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 07, 2020 at 03:12:36AM +0000, Peter Chen wrote:
> On 20-04-04 02:00:06, Micha� Miros�aw wrote:
> > Allow to cut down on driver size for embedded config.
> > 
> > Signed-off-by: Micha� Miros�aw <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/usb/chipidea/Kconfig  | 37 ++++++++++++++++++++++++-----------
> >  drivers/usb/chipidea/Makefile | 12 +++++-------
> >  2 files changed, 31 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/usb/chipidea/Kconfig b/drivers/usb/chipidea/Kconfig
> > index d53db520e209..8bafcfc6080d 100644
> > --- a/drivers/usb/chipidea/Kconfig
> > +++ b/drivers/usb/chipidea/Kconfig
> > @@ -18,17 +18,6 @@ config USB_CHIPIDEA
> >  
> >  if USB_CHIPIDEA
> >  
> > -config USB_CHIPIDEA_OF
> > -	tristate
> > -	depends on OF
> > -	default USB_CHIPIDEA
> > -
> > -config USB_CHIPIDEA_PCI
> > -	tristate
> > -	depends on USB_PCI
> > -	depends on NOP_USB_XCEIV
> > -	default USB_CHIPIDEA
> > -
> >  config USB_CHIPIDEA_UDC
> >  	bool "ChipIdea device controller"
> >  	depends on USB_GADGET
> > @@ -43,4 +32,30 @@ config USB_CHIPIDEA_HOST
> >  	help
> >  	  Say Y here to enable host controller functionality of the
> >  	  ChipIdea driver.
> > +
> > +config USB_CHIPIDEA_PCI
> > +	tristate "Enable PCI glue driver" if EMBEDDED
[...]
> Why depends on EMBEDDED for this driver? Not everyone needs this
> configuration.

This does not make the driver depend on EMBEDDED, only the prompts are.
By default (without CONFIG_EMBEDDED) you will have all glue layers built
if you enable the driver. I can remove the 'if EMBEDDED', but
I suppose those options are only relevant for people building for
resource-constrained systems, so would have EMBEDDED enabled anyway.

Best Regards,
Micha��Miros�aw
