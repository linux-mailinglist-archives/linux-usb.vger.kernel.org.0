Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B86B15BB0B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Feb 2020 09:56:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729515AbgBMI40 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Feb 2020 03:56:26 -0500
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:59173 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbgBMI40 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Feb 2020 03:56:26 -0500
X-Originating-IP: 83.155.44.161
Received: from classic (mon69-7-83-155-44-161.fbx.proxad.net [83.155.44.161])
        (Authenticated sender: hadess@hadess.net)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id A701440008;
        Thu, 13 Feb 2020 08:56:23 +0000 (UTC)
Message-ID: <034bc43c35a75a84787bc786c8694607552a8139.camel@hadess.net>
Subject: Re: [usb:usb-testing 18/18]
 drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse: restricted
 __le16 degrades to integer
From:   Bastien Nocera <hadess@hadess.net>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date:   Thu, 13 Feb 2020 09:56:23 +0100
In-Reply-To: <202002131558.UH2wlHsI%lkp@intel.com>
References: <202002131558.UH2wlHsI%lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-02-13 at 15:01 +0800, kbuild test robot wrote:
> tree:   
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-
> testing
> head:   249fa8217b846a7c031b997bd4ea70d65d3ff774
> commit: 249fa8217b846a7c031b997bd4ea70d65d3ff774 [18/18] USB: Add
> driver to control USB fast charge for iOS devices
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-166-g7e4a5b6f-dirty
>         git checkout 249fa8217b846a7c031b997bd4ea70d65d3ff774
>         make ARCH=x86_64 allmodconfig
>         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> 
> sparse warnings: (new ones prefixed by >>)
> 
> > > drivers/usb/misc/apple-mfi-fastcharge.c:173:29: sparse: sparse:
> > > restricted __le16 degrades to integer
>    drivers/usb/misc/apple-mfi-fastcharge.c:174:29: sparse: sparse:
> restricted __le16 degrades to integer
> 
> vim +173 drivers/usb/misc/apple-mfi-fastcharge.c
> 
>    165	
>    166	static int mfi_fc_probe(struct usb_device *udev)
>    167	{
>    168		struct power_supply_config battery_cfg = {};
>    169		struct mfi_device *mfi = NULL;
>    170		int err;
>    171	
>    172		/* See comment above mfi_fc_id_table[] */
>  > 173		if (udev->descriptor.idProduct < 0x1200 ||
>    174		    udev->descriptor.idProduct > 0x12ff) {

Is that something I should be fixing? I'm guessing that I just need to
cast the constant side to a type the same size as those fields, but is
that necessary?

Cheers

