Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6935F75F212
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233099AbjGXKGu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 06:06:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbjGXKGe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 06:06:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAA8844B2
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 02:59:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 698B461011
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 09:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB324C433C8;
        Mon, 24 Jul 2023 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690192697;
        bh=NfnBu8TqHXRiBOuSbG5E810YGgMAMNxY5tlRlr/Toas=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lddyrs/CbCilCyLSZ/CUoram3ODdDfqWthf2dOwDuXuLwY7x1DpxABuEcScV/ALJU
         C86yYK3HijVlh5rlYLsUgob0+TuHXTrkniM+9HVrodho2NbmzWCEbcuJWpKV4i6n1m
         wwygTDWYVrk0iCB9AiQ0qxirhVZXm8D1+okisrHhuzXYays4tNiPMmFadYqIulgwmU
         Pevs8bCcINOk7RsubX1wU1p/+VW3A+b+n5z0LrA+sLxE5FbTf3ymgkgM5dYKbSzxKm
         XrY1YYMa+9jQJgS8BYRYnLGKaeoMF7jHn4bnWwqzbsEAVk2AnrRx5VLjgobEtEHms7
         zYZuUMfgJZO/w==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qNsKi-0003sy-2B;
        Mon, 24 Jul 2023 11:58:28 +0200
Date:   Mon, 24 Jul 2023 11:58:28 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Martin Kohn <m.kohn@welotec.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] Quectel EM05G LTE Modem with new Product ID
Message-ID: <ZL5LRAqvEjYw52xr@hovoldconsulting.com>
References: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <ZLlACymhpmIx59UX@hovoldconsulting.com>
 <AM0PR04MB5764A20ECDD077042E6D768F9702A@AM0PR04MB5764.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB5764A20ECDD077042E6D768F9702A@AM0PR04MB5764.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Marin,

When working upstream you should remember to reply inline (and trim
unneeded context) rather than top posting as you did here.

Also wrap your mails at 72 columns or so (I've added the missing
newlines below).

On Mon, Jul 24, 2023 at 09:24:34AM +0000, Martin Kohn wrote:

> Could you please point me to what I did exactly wrong, now I tried
> second time and as I'm new here, I honestly do not know what I did
> wrong?

It looks your second attempt worked correctly:

	https://lore.kernel.org/all/AM0PR04MB576480684AA0896B32D32975973FA@AM0PR04MB5764.eurprd04.prod.outlook.com/#t

In your previous attempt, tabs had specifically been replaced by spaces.

> I did run checkpatch and applied it back to my repository and
> everything is fine on my side.

As long as you ran checkpatch on the patch (and applied it) *after*
mailing it to yourself, you should be good.

Also remember to include me as a recipient when posting. My filters
should catch it anyway, but it may take some time before I see it.

Johan
