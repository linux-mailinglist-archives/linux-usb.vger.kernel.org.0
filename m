Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD4EA4F7E79
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 13:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239030AbiDGL4i convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 Apr 2022 07:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233421AbiDGL4h (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 07:56:37 -0400
X-Greylist: delayed 2927 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 07 Apr 2022 04:54:35 PDT
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C905EF785
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 04:54:34 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 13011E0005;
        Thu,  7 Apr 2022 11:54:32 +0000 (UTC)
Message-ID: <586a8a0f923d6e4baa5656d357f376b86158109e.camel@hadess.net>
Subject: Re: device type in apple-mfi-fastcharfe
From:   Bastien Nocera <hadess@hadess.net>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Thu, 07 Apr 2022 13:54:32 +0200
In-Reply-To: <CAO-hwJKEU=L96=Sa2ePrFFhmgZfpa8E4jgjps8XPv69bL7vayA@mail.gmail.com>
References: <b0b97178-80ec-65f9-9ae9-7f72ffc6af74@suse.com>
         <da557b84330a2fc5ace11ca9436de9351149ddce.camel@hadess.net>
         <CAO-hwJKEU=L96=Sa2ePrFFhmgZfpa8E4jgjps8XPv69bL7vayA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2022-04-07 at 13:42 +0200, Benjamin Tissoires wrote:
> If the following patch doesn't break existing userspace and is the
> "correct" way of reporting battery, sure, why not.

Sent as a proper patch to linux-input, thanks!
