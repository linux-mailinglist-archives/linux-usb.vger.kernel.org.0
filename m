Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02AB5273D17
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 10:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbgIVIRI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 04:17:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:35176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgIVIRI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 04:17:08 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 56C90239E5;
        Tue, 22 Sep 2020 08:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600762627;
        bh=VYomaq57LWCGAFRzqfGsUXWonIZoAJcXzEMb0TnCrwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GvfofHPMFi6kM8Zd7Hqlu7Uyf1Nmqh9Qd2QLsTNnaiJSeAetVRknfMQ849PNxpP/C
         9PJK4ROmlim91BlnIRQa0YjY2CicGR4GNK+Du5oOze3m5tyliDfMpLVPTdmkhNjdGA
         tfS5y/PC3ZWRXcXx6wZnVf8NuyFEnrrecC/wAKX0=
Date:   Tue, 22 Sep 2020 10:17:13 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.10-rc1
Message-ID: <20200922081713.GA2083535@kroah.com>
References: <AM7PR04MB7157233EB3BA56F78ACAF2B38B3B0@AM7PR04MB7157.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM7PR04MB7157233EB3BA56F78ACAF2B38B3B0@AM7PR04MB7157.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 22, 2020 at 05:44:39AM +0000, Peter Chen wrote:
> The following changes since commit 28157b8c7d9a9c92d1da31af486fe4ad39862edd:
> 
>   USB: Better name for __check_usb_generic() (2020-08-18 13:10:40 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.10-rc1

Pulled and pushed out, thanks.

greg k-h
