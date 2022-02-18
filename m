Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B02D4BB89F
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 12:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234693AbiBRLtG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 06:49:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbiBRLtF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 06:49:05 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E865B0D22
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 03:48:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 094B6B82605
        for <linux-usb@vger.kernel.org>; Fri, 18 Feb 2022 11:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A7EAC340E9;
        Fri, 18 Feb 2022 11:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1645184926;
        bh=WhW0aAd1F3Od9uOMytOnk0ks8K+UWlDHmd9ltereQQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NJHmljkiNTf12a7ryGEcTOVYtj9ZHU4ST6zjATA6JyNrERzwnwLTmvZK91z1t0G1X
         jEt8n2+U/KkDe2dSil9rGA3tYV50jfs+1dEUFqYOQU2wnMLwyxp3MdZ8l4WSMdHzJF
         3RFxLAYQFeD+afs6ZwASVozWkszUIO8KCynmd7tI=
Date:   Fri, 18 Feb 2022 12:48:39 +0100
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
Message-ID: <Yg+HlwF9nMQH6Qtu@kroah.com>
References: <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
 <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
 <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
 <Yg93SMnfNlDK7MIM@kroah.com>
 <PH0PR10MB46157BFF656AC1E17E83A302F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR10MB46157BFF656AC1E17E83A302F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 18, 2022 at 11:17:59AM +0000, Joakim Tjernlund wrote:
> I was happy with commit msgs and I don't know what the criticism was.

I have no context anymore, sorry.

Can someone resubmit the change again and we can take it from there?

thanks,

greg k-h
