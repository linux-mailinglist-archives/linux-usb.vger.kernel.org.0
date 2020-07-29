Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECF76231DBE
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jul 2020 13:58:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgG2L6d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jul 2020 07:58:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG2L6d (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jul 2020 07:58:33 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BBEF20829;
        Wed, 29 Jul 2020 11:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596023913;
        bh=kgCgKW/UkVNpxT8QVejdxYR/6KM4D7G5fhSqjL1wBFw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TJB0uXtNU0bOSFogp1h6ALScveVD9ZfV45DRKsC1e5RUkxGhwoBwWmAaMQTy4rrUX
         uRcvrx6MPW5ecEfw1bR3W+wsOXmGX9BY87topK+hOwz98YSTuNeX3R6q5W2kmGklKa
         N37ZYhqN7TnpB59K//pq2iAfGafLLmtVSoYsZiak=
Date:   Wed, 29 Jul 2020 13:58:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea changes for v5.9-rc1
Message-ID: <20200729115824.GA2813582@kroah.com>
References: <AM7PR04MB7157A59D46B7E843DF7645018B700@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157A59D46B7E843DF7645018B700@AM7PR04MB7157.eurprd04.prod.outlook.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 02:12:37AM +0000, Peter Chen wrote:
> The following changes since commit af7b4801030c07637840191c69eb666917e4135d:
> 
>   Merge git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net (2020-06-07 17:27:45 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.9-rc1
> 
> for you to fetch changes up to d6f93d21001e4388a25b0b922e02e64bc6004d2f:
> 
>   usb: chipidea: imx: get available runtime dr mode for wakeup setting (2020-07-28 14:12:11 +0800)
> 
> ----------------------------------------------------------------
> ENDIAN issue fix and one query controller role API is introduced.
> 

Can you provide a bit more information in here in the future?  This is
what shows up in the changelog, and it says nothing about chipidea
stuff.

I've pulled this now, thanks.

greg k-h
