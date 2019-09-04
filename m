Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196ACA7AB1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2019 07:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfIDFVF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Sep 2019 01:21:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:36748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725774AbfIDFVF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Sep 2019 01:21:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 672E72073F;
        Wed,  4 Sep 2019 05:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567574463;
        bh=HMRcyEk3huV8a0cdBx7wY83RryFHcPc53tfZ2CWT/fo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cy2tiBepn68Ss7ReaskqAnO4Wi6SzZxP7h2rV4+koLtrjb+bqIrExFfEUqPgIwOuo
         8Uvru8enJ4kO+6SxyfDnAD4/przAA8jXwKblTg+YYFB9xy4O9RaAI/cvRCAwu6K/LP
         nK45WqnTvhMUQLV6xN73NeMrSYxSdfFWnTfuXHrU=
Date:   Wed, 4 Sep 2019 07:21:01 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] xhci: tegra: Parameterize mailbox register addresses
Message-ID: <20190904052101.GA17236@kroah.com>
References: <20190902082127.17963-1-jckuo@nvidia.com>
 <20190903135822.GA10466@kroah.com>
 <90794861-1fe7-b659-fd33-4fb0f2e7f929@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <90794861-1fe7-b659-fd33-4fb0f2e7f929@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 04, 2019 at 09:43:08AM +0800, JC Kuo wrote:
> On 9/3/19 9:58 PM, Greg KH wrote:
> > On Mon, Sep 02, 2019 at 04:21:27PM +0800, JC Kuo wrote:
> >> Tegra194 XUSB host controller has rearranged mailbox registers. This
> >> commit makes mailbox registers address a part of "soc" data so that
> >> xhci-tegra driver can be used for Tegra194.
> >>
> >> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> >> ---
> >>  drivers/usb/host/xhci-tegra.c | 58 +++++++++++++++++++++++++----------
> >>  1 file changed, 42 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> >> index dafc65911fc0..247b08ca49ee 100644
> >> --- a/drivers/usb/host/xhci-tegra.c
> >> +++ b/drivers/usb/host/xhci-tegra.c
> >> @@ -42,19 +42,18 @@
> >>  #define XUSB_CFG_CSB_BASE_ADDR			0x800
> >>  
> >>  /* FPCI mailbox registers */
> >> -#define XUSB_CFG_ARU_MBOX_CMD			0x0e4
> >> +/* XUSB_CFG_ARU_MBOX_CMD */
> >>  #define  MBOX_DEST_FALC				BIT(27)
> >>  #define  MBOX_DEST_PME				BIT(28)
> >>  #define  MBOX_DEST_SMI				BIT(29)
> >>  #define  MBOX_DEST_XHCI				BIT(30)
> >>  #define  MBOX_INT_EN				BIT(31)
> >> -#define XUSB_CFG_ARU_MBOX_DATA_IN		0x0e8
> >> +/* XUSB_CFG_ARU_MBOX_DATA_IN and XUSB_CFG_ARU_MBOX_DATA_OUT */
> >>  #define  CMD_DATA_SHIFT				0
> >>  #define  CMD_DATA_MASK				0xffffff
> >>  #define  CMD_TYPE_SHIFT				24
> >>  #define  CMD_TYPE_MASK				0xff
> >> -#define XUSB_CFG_ARU_MBOX_DATA_OUT		0x0ec
> >> -#define XUSB_CFG_ARU_MBOX_OWNER			0x0f0
> >> +/* XUSB_CFG_ARU_MBOX_OWNER */
> >>  #define  MBOX_OWNER_NONE			0
> >>  #define  MBOX_OWNER_FW				1
> >>  #define  MBOX_OWNER_SW				2
> >> @@ -146,6 +145,13 @@ struct tegra_xusb_phy_type {
> >>  	unsigned int num;
> >>  };
> >>  
> >> +struct tega_xusb_mbox_regs {
> >> +	unsigned int cmd;
> >> +	unsigned int data_in;
> >> +	unsigned int data_out;
> >> +	unsigned int owner;
> > 
> > Shouldn't these all be u8 values?
> > 
> These data members represent register offset in Tegra XUSB FPCI area. Size of
> FPCI area is 0x1000, so it is possible for future Tegra XUSB to have mailbox
> registers allocated to somewhere > 0x100.

Ok, then u16?

> > This did not change any existing functionality, is there a follow-on
> > patch somewhere that takes advantage of this change to enable different
> > hardware?  Otherwise this doesn't seem worth it.
> > 
> Yes, I will submit another patch to enable Tegra194 XHCI. It will make use of
> this patch to declare Tegra194 XUSB mailbox registers as:
> 
> 	.mbox = {
> 		.cmd = 0x68,
> 		.data_in = 0x6c,
> 		.data_out = 0x70,
> 		.owner = 0x74,
> 	},

Can you send that out as patch 2/2 so that we see the need for this
change?

thanks,

greg k-h
