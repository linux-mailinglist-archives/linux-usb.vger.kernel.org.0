Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2121277A0C8
	for <lists+linux-usb@lfdr.de>; Sat, 12 Aug 2023 17:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbjHLP2L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Aug 2023 11:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbjHLP2K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Aug 2023 11:28:10 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 72928E54
        for <linux-usb@vger.kernel.org>; Sat, 12 Aug 2023 08:28:13 -0700 (PDT)
Received: (qmail 317157 invoked by uid 1000); 12 Aug 2023 11:28:12 -0400
Date:   Sat, 12 Aug 2023 11:28:12 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Khazhy Kumykov <khazhy@google.com>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: core: Fix oversight in SuperSpeed initialization
Message-ID: <bcd6865e-4687-4414-8b63-0f2e6b5ae96c@rowland.harvard.edu>
References: <6eadec91-990a-4fbd-8883-8366c4a4d8e4@rowland.harvard.edu>
 <20230810002257.nadxmfmrobkaxgnz@synopsys.com>
 <e070f49d-9bd2-4711-b748-b15e1a6be901@rowland.harvard.edu>
 <c1a18876-c505-4d4f-9f58-264199135905@rowland.harvard.edu>
 <20230810223824.6kgawiwerwkaj6vh@synopsys.com>
 <3c63cad6-55ef-46dd-90b7-d19cbefedbea@rowland.harvard.edu>
 <20230811170500.xbjyzmcslvajs2qv@synopsys.com>
 <8809e6c5-59d5-4d2d-ac8f-6d106658ad73@rowland.harvard.edu>
 <2023081204-concave-yoga-f6f0@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023081204-concave-yoga-f6f0@gregkh>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 12, 2023 at 10:05:27AM +0200, Greg KH wrote:
> Process nit, when you add a patch to an existing patch series like this,
> when I run `b4` to download and apply the patch, it sucks in the
> original patch series, not this add-on patch (which then of course fails
> as the original patch series was already applied.)
> 
> So, if it's easy enough, can you just send add-on patches for stuff that
> has been applied, as a new thread?  That way the tools handle it
> automatically and I don't have to hand edit/apply the patch?

Sure.  I don't use b4, so I wasn't aware of this behavior.

If I ever forget in the future, feel free to yell at me.  :-)

Alan Stern
