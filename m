Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BEE419AA85
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732189AbgDALNE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 07:13:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44338 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgDALNE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Apr 2020 07:13:04 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D2ED20776;
        Wed,  1 Apr 2020 11:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585739583;
        bh=0Fz6XQyhtWGpSkYD4knBXRC+LUAPjVlTaqT3ZA1Hufk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fl+XSxVTeL7wVBUdr9bkzwxRQw2tdQhxhj/ZTB+i4ENj1UeZkQZFr2GerulguSVCF
         aoz1Hr5iGAlwlOJEdtbSiG1mOyJtCRqVEBRd67CPdWAOpcMSa1k9DPfZNW6mBL2o27
         K7fH9HkSHVdBQFvD4jIaAsSSahGXqCirDsqwjgqk=
Date:   Wed, 1 Apr 2020 13:13:00 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
Message-ID: <20200401111300.GB2070530@kroah.com>
References: <20200401073249.340400-1-balbi@kernel.org>
 <20200401073806.GA2019004@kroah.com>
 <87pncr1wgn.fsf@kernel.org>
 <AM7PR04MB7157968F8BC12AC42CD397B38BC90@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157968F8BC12AC42CD397B38BC90@AM7PR04MB7157.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 01, 2020 at 10:26:25AM +0000, Peter Chen wrote:
>  
> > Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > > On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
> > >>  764 files changed, 86304 insertions(+), 86304 deletions(-)
> > >
> > > Ah, a nice tiny patchset, I'll try to sneak this in during the merge
> > > window now :)
> > 
> > That's great, Greg. It'll help hundreds of people, I'm sure.
> > 
> > > nice job...
> > 
> > Thank you
> > 
> > > greg "I know what day this is..." k-h
> > 
> > felipe "I've been mostly confined" balbi
> > 
> > --
> 
> Just one small comment, it may let the code line exceed 80 characters often,
> is it OK? Or the 80 characters per line is not mandatory?

It's ok, it gives people who like running checkpatch.pl something to do :)
