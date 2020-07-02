Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C582212162
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 12:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbgGBKda (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 06:33:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:35872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728331AbgGBKda (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 06:33:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 67DA42073E;
        Thu,  2 Jul 2020 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593686010;
        bh=qSuu7uAkT+1gy0iK1Dx2XV1S5skvkvweaOvFMBrx8ro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=koKawob6+XsVXkTQSAtYP8+72nOIXIb2Xug5YeT7iiutUefkwpUA7ASVoKvy+4LkF
         aUWgAWnfPqian/HcPyZY8gOdSrn+bWIqk8ylr2CncwgNbw5dUxALqn8Iasq7pPZ240
         nl+6TodZNPE2hHgdlY6IDRrcYZkUA8SnELY2xMtk=
Date:   Thu, 2 Jul 2020 12:33:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        Ran Wang <ran.wang_1@nxp.com>, Leo Li <leoyang.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] USB: phy: fsl-usb: remove character device usage
Message-ID: <20200702103333.GA1313090@kroah.com>
References: <20200702072914.1072878-1-gregkh@linuxfoundation.org>
 <20200702072914.1072878-2-gregkh@linuxfoundation.org>
 <AM7PR04MB71575977E680A7F6405D8B3F8B6D0@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB71575977E680A7F6405D8B3F8B6D0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 02, 2020 at 09:07:43AM +0000, Peter Chen wrote:
>  
> > 
> > No idea why this driver is using a char device node, statically allocated, with no
> > dynamic allocation or hook up with devtmpfs, along with a reserverd major number,
> > for "special" operations, not all of which ever were implemented.
> > 
> > So just rip it out, as no one must be using it because no modern system will ever
> > actually create the /dev/ node it needs.
> > 
> 
> Add related people from NXP.

If there are related people, MAINTAINERS should have reflected that :)
