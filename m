Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9FE4CD638
	for <lists+linux-usb@lfdr.de>; Fri,  4 Mar 2022 15:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbiCDOVC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Mar 2022 09:21:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231664AbiCDOVB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Mar 2022 09:21:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D851BA92A
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 06:20:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C1812617E4
        for <linux-usb@vger.kernel.org>; Fri,  4 Mar 2022 14:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B45C340E9;
        Fri,  4 Mar 2022 14:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1646403613;
        bh=82RHPbKYaBxahcxTnnqX7gZSoXp6vzfHXkknNkVXsIM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Otzd1uMpSaT8Fhgw7h78oksXKn9VhihG5rD1+6kjPE0uuA7EksPwgd/5G0OmSPh1S
         0JR5d/CyxBf9C4ueQCw5XmowFwO7pdtyHjzROdPfebB1f/HyqdaqEA5ZSbphtudjNe
         ipnGUcJRZ+DtwzQY6oiyZqvtZDkfBi+NTpBi5Z2A=
Date:   Fri, 4 Mar 2022 15:20:08 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc:     linux-usb@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Ville Syrjala <syrjala@sci.fi>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henk Vergonet <Henk.Vergonet@gmail.com>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Benjamin Valentin <benpicco@googlemail.com>,
        Oliver Neukum <oliver@neukum.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Woojung Huh <woojung.huh@microchip.com>,
        Felix Fietkau <nbd@nbd.name>,
        Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
        Ryder Lee <ryder.lee@mediatek.com>,
        Kalle Valo <kvalo@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Helmut Schaa <helmut.schaa@googlemail.com>,
        Duncan Sands <duncan.sands@free.fr>,
        Alan Stern <stern@rowland.harvard.edu>,
        Olav Kongas <ok@artecdesign.ee>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Clemens Ladisch <clemens@ladisch.de>,
        UNGLinuxDriver@microchip.com,
        Shayne Chen <shayne.chen@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Leon Romanovsky <leon@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kees Cook <keescook@chromium.org>,
        Zheng Yongjun <zhengyongjun3@huawei.com>,
        Thomas Toye <thomas@toye.io>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Chris Chiu <chris.chiu@canonical.com>,
        Rajat Jain <rajatja@google.com>,
        Kelly Devilliv <kelly.devilliv@gmail.com>,
        Shubhankar Kuranagatti <shubhankarvk@gmail.com>,
        Cai Huoqing <caihuoqing@baidu.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Will Deacon <will@kernel.org>,
        Davidlohr Bueso <dbueso@suse.de>,
        Mark Tomlinson <mark.tomlinson@alliedtelesis.co.nz>,
        Peter Zijlstra <peterz@infradead.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Arnd Bergmann <arnd@arndb.de>,
        Wei Yongjun <weiyongjun1@huawei.com>,
        Colin Ian King <colin.king@intel.com>,
        Len Baker <len.baker@gmx.com>,
        gushengxian <gushengxian@yulong.com>
Subject: Re: [PATCH] usb: rework usb_maxpacket() and remove its third argument
Message-ID: <YiIgGOkNntEiu78O@kroah.com>
References: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304105420.1059585-1-mailhol.vincent@wanadoo.fr>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_RED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 04, 2022 at 07:53:50PM +0900, Vincent Mailhol wrote:
> Change the prototype of usb_maxpacket() from:
> | static inline __u16
> | usb_maxpacket(struct usb_device *udev, int pipe, int is_out)
> 
> into:
> | static inline u16 usb_maxpacket(struct usb_device *dev, int pipe)
> 
> and rewrite the function.
> 
> Rationale:
> 
>   * The third argument of usb_maxpacket(): is_out can be derived from
>     its second one: pipe using usb_pipeout(pipe). Furthermore,
>     usb_pipoout(pipe) is being called within usb_maxpacket()
>     regardless to confirm the input.
> 
>   * This function is not exposed to the UAPI so return type should be
>     u16, not __u16.
> 
>   * Let's not reinvent the wheel and rely on usb_endpoint_maxp() to
>     make this a one liner function.
> 
> All the users of usb_endpoint_maxp() are then updated.
> 
> Two of the users: oxu210hp-hcd.c and isp1760-hcd.c rely on a local
> macro: max_packet() to mask the maximum size. Because this masking is
> already performed by usb_maxpacket(), this patch also removes these
> redundant sanitization and remove the local macro if not needed any
> more (keep it in oxu210hp-hcd.c which uses it elsewhere but remove it
> in isp1760-hcd.c).

This type of "change all callers of this function" is brutal to do like
this, as is evident by the number of people you had to cc: here.

How about doing it the normal way.  Create a new function, with the
proper options you wish to see be used, and then move everyone over to
it, and when that is done, remove the old function.  Bonus points for
doing this with some crazy macros to keep the old name in the end (it
can be done, but I don't recommend it for the faint-of-heart, so it's
not required.)

thanks,

greg k-h
