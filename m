Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619FF4BB707
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 11:39:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbiBRKj1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 05:39:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233865AbiBRKjZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 05:39:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49DB117289B
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 02:39:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CD6AD61D7F
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 10:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BDA5C340E9;
        Fri, 18 Feb 2022 10:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645180748;
        bh=AXk2+EOvPxt+EsgH98RvaHo3VvfiaQ9uGDMWbs4K9rQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GNc8YOMLI/uSWjvk4TA2BR3xx9WRi+E4O3hS6rBETOM2hGs7hForvBG/OeuEwup+M
         kmLRrWUvVQeT2+8NAwmfbGItCbcmL6jzW/91YcMX8RDz6Ou4kTfit5DkEkcmbfZQa8
         Iednuy6D20ByrMZc04Rhw7qV+SYXe/I9g22H3fzc=
Date:   Fri, 18 Feb 2022 11:39:04 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc:     Thorsten Leemhuis <regressions@leemhuis.info>,
        Leo Li <leoyang.li@nxp.com>,
        "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Message-ID: <Yg93SMnfNlDK7MIM@kroah.com>
References: <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
 <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
 <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 18, 2022 at 10:21:12AM +0000, Joakim Tjernlund wrote:
> I think you could apply them as is, only criticism was the commit msgs.

That is always a good reason to reject a change.  Please resubmit them
with the commit message cleaned up and I will be glad to review it
again.

thanks,

greg k-h
