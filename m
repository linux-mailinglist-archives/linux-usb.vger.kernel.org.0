Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F2B2B3F33
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 09:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgKPI42 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 03:56:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:33434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727969AbgKPI42 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 03:56:28 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7A462216C4;
        Mon, 16 Nov 2020 08:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605516986;
        bh=JuwRTAad5mpY6IcjypNRwerZvbyZZ7G3ej1HDQ0SoEQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oiq15DHyWlWIJtraM47ZZyfH5WPwRvOUCibtlDqAA3FNWIZnFJYyxG8XkUPKvsb9J
         kefnyF5CIEvxf+nYXKBucl46SbSvQtz9hGKuDybu4dUlesWMA6jEuSDPzZgqKJ8L4I
         nvEr9VWAby0soepyK/OLKT6+J3r9MRTxZeUvH6N8=
Date:   Mon, 16 Nov 2020 09:57:16 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: fixes for v5.10-rc5
Message-ID: <X7I+7N+P5ukmOVl0@kroah.com>
References: <DBBPR04MB79796D9ADEBB335ED878450D8BE30@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB79796D9ADEBB335ED878450D8BE30@DBBPR04MB7979.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 16, 2020 at 08:41:14AM +0000, Peter Chen wrote:
> The following changes since commit afaa2e745a246c5ab95103a65b1ed00101e1bc63:
> 
>   USB: Add NO_LPM quirk for Kingston flash drive (2020-11-03 10:19:07 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-fixes-v5.10-rc5

Pulled and pushed out, thanks.

greg k-h
