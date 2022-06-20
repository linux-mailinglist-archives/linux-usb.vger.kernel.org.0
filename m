Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C222551921
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 14:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242758AbiFTMlN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 08:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239184AbiFTMlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 08:41:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1AA15FE7
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 05:41:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4F3F9B81147
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 12:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 125BDC3411B;
        Mon, 20 Jun 2022 12:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655728868;
        bh=/1Dbsw98GYSDgDlgqzM+9DtfLm6IzVmXGOTUEWy3Vi4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GCPdYgic/pqQCCHQuAK3kJX9EpeD9poUXqtO3vix7NTQBYaIlfSoWq7fXyNATqjFS
         l+9C9gGP43MqYURk9A7xal31Ht0DRngaXjV5pPvoUbcDEpxGmWMMVTs32Iu04X4HAe
         bfdT1hT16potkV07hIv3MG/PK0JXVmeOAM8ss/1ZmzwENm91z76c/+NhsSaMx7U+xO
         yu64wz2RdFb0+DTdlEuoRmlMEDXMx6wyrRMbflLNFmtUuQRWOacWKlrmT1/c3MHr74
         l5NnpSN54n9DxTF5sfd4WMQSdCGpO0X1xfShajZz69k8basU/iWTOjgtFEZysz+Nlt
         hHOuhc24I9l+Q==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1o3GiF-0000jn-OV; Mon, 20 Jun 2022 14:41:04 +0200
Date:   Mon, 20 Jun 2022 14:41:03 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
Message-ID: <YrBq3+Q4geN0bF5x@hovoldconsulting.com>
References: <20220617133514.357-1-charlesyeh522@gmail.com>
 <YrBARs5dfARHW9Rl@hovoldconsulting.com>
 <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 20, 2022 at 06:51:58PM +0800, Charles Yeh wrote:
> > > The setting value of bcdUSB & bcdDevice of PL2303TA is the same as the
> > > setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN
> >
> > Which ones would that be?
> 
> PL2303GT_R4 (chip version: v4) is the same as PL2303TA.

[...]

> > > The setting value of bcdUSB & bcdDevice of PL2303TB is the same as the
> > > setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN
> >
> > Same question here.
> 
> PL2303GE_R4 (chip version: v4) is the same as PL2303TB.

Thanks for the details.

> > Could you provide a list of the bcdDevice you use for the various HXN
> > types instead?
> 
> I also hope to have a complete list of all HXN versions..
> But it is difficult.. I use PL2303GT as an example.
> PL2303GT is currently divided into PL2303GT_R4 / PL2303GT_R5 / PL2303GT_R5+
> 
> PL2303GT_R4  : idProduct : 0x23C3, bcdDevice: 0x0300
> PL2303GT_R5  : idProduct : 0x23C3, bcdDevice: 0x0305
> PL2303GT_R5+ : idProduct : 0x23A3, bcdDevice: 0x0305
> 
> The above three kinds of PL2303GT are currently available in the market.

Ok, but the above could be handled with two entries or if needed we can
just check the major number (i.e. the MSB, 0x03)?

Do the other types follow a similar pattern?

So far I've gathered that

	0x100	GC
	0x105	GC
	0x300	GT / TA
	0x305	GT
	0x405	GL
	0x500	GE / TB
	0x605	GS

So it look like we could use the major version number.

Anything more we need to add to the above list?

> From the bcdUSB & bcdDevice of PL2303GT_R4, it is the same as PL2303TA.
> So it needs to be checked again with hx_status check.

Right, the 0x300 and 0x500 need special handling.

> As mentioned earlier, some HXNs are currently on sale,
> and some HXN versions are coming out (bcdDevice will have other settings),
> HXN cannot use bcdDevice to determine the type one by one.

Surely you have way to determine the types since they have different
features. Are you not using bcdDevice for this for that other OS?

Johan
