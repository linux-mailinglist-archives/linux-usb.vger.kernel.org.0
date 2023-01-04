Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B15F65DDBE
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 21:37:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235054AbjADUhx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 15:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234337AbjADUhw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 15:37:52 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 411871A820
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 12:37:51 -0800 (PST)
Received: (qmail 481152 invoked by uid 1000); 4 Jan 2023 15:37:50 -0500
Date:   Wed, 4 Jan 2023 15:37:50 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <Y7Xjnpt21ciK4SUX@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
 <20230104164900.31a3243d@meshulam.tesarici.cz>
 <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
 <20230104174731.5527b1ed@meshulam.tesarici.cz>
 <Y7WxltobCK0zQz9k@rowland.harvard.edu>
 <20230104182750.1529bd78@meshulam.tesarici.cz>
 <Y7XWB0GzEL5cv6lM@rowland.harvard.edu>
 <20230104211453.4ea6f6cf@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104211453.4ea6f6cf@meshulam.tesarici.cz>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 09:14:53PM +0100, Petr Tesařík wrote:
> On Wed, 4 Jan 2023 14:39:51 -0500
> Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> > Another option would be to create a short udev script that would write 
> > "on" to the power/control attribute file (thereby turning autosuspend 
> > off) whenever it sees a new USB device with the vendor and product IDs 
> > of your phone.  That seems like a very practical solution.
> 
> Yes, that sounds good, because autosuspend is usually not set to zero.
> Thank you! FWIW it works for me, and I have also proposed this solution
> in the heimdall GitHub issue. They install their own udev rules file
> already, so the patch is a one-liner.
> 
> BTW manufacturing broken USB devices in large quantities should become
> a crime and a federal felony... ;-)

Alas, a large fraction of the perpetrators are outside the US's 
jurisdiction.

Anyway, congratulations on fixing your problem.  And in just a few 
hours!

Alan Stern
