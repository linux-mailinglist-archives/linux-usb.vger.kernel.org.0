Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55C0D12F5A9
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jan 2020 09:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727220AbgACIoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jan 2020 03:44:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:55950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726640AbgACIoI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jan 2020 03:44:08 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6160721D7D;
        Fri,  3 Jan 2020 08:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578041047;
        bh=O98c330wJ+yit3cNj7UledYuE4zwC0j4iFKZGfkh7fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XgWEKYMn4BZxk2DksfggKy13C4WF3ocNV3U/lXFFC34NrSaJmhlA7GZs/SfZN7ZoP
         oTAXfzP3T8MGkWmeL5p0IobGwuPA8TdKSc4FROcfyLu9FSDRD6k7vlqfWqLOgSn2I3
         ysftd8vAim/AFjOkC5NkrrI3/jsRD1S2gpSlGUYo=
Date:   Fri, 3 Jan 2020 09:44:05 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Baolin Wang <baolin.wang7@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>
Subject: Re: [PATCH 1/1] usb: cdns3: add NXP imx8qm glue layer
Message-ID: <20200103084405.GB855576@kroah.com>
References: <1577426348-31227-1-git-send-email-peter.chen@nxp.com>
 <878smqksjo.fsf@kernel.org>
 <VI1PR04MB532770282A2C0701BD2A0EBA8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
 <CADBw62roaEi6UWV3X2NtqQ55w_SONactEn=JxrPShMV7oj98vQ@mail.gmail.com>
 <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI1PR04MB53274DD899A84806D84C5FBB8B230@VI1PR04MB5327.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jan 03, 2020 at 03:20:17AM +0000, Peter Chen wrote:
>  
> > > Hi Felipe,
> > >
> > > How to make sure it works? Except for enabling CONFIG_COMPLIE_TEST,
> > > what else I need to do? Thanks.
> > 
> > Felipe's suggestion is you should change your config dependency as:
> > depends on ARCH_MXC || COMPILE_TEST
> > 
> > Then user can compile your driver to find warning or something else though the
> > ARCH_MXC config is not enabled.
> 
> Hi Baolin,
> 
> I know that, I have already changed that,  unset ARCH_MXC and enable
> CONFIG_COMPILE_TEST. What else I could do to make sure it could compile OK
> at every architecture?

Add that option and then actually build it for all arches :)

thanks,

greg k-h
