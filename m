Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84AD878CC75
	for <lists+linux-usb@lfdr.de>; Tue, 29 Aug 2023 20:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235478AbjH2Suv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Aug 2023 14:50:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238631AbjH2Su2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Aug 2023 14:50:28 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0E224CFF
        for <linux-usb@vger.kernel.org>; Tue, 29 Aug 2023 11:50:03 -0700 (PDT)
Received: (qmail 396283 invoked by uid 1000); 29 Aug 2023 14:49:21 -0400
Date:   Tue, 29 Aug 2023 14:49:21 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     USB list <linux-usb@vger.kernel.org>
Subject: Re: alauda_check_media() doubts
Message-ID: <001562e9-bc84-498f-a15a-8b4a01f172a7@rowland.harvard.edu>
References: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eee774db-0cd1-5870-8909-b616d962791f@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 29, 2023 at 08:14:05PM +0200, Oliver Neukum wrote:
> Hi Alan,
> 
> as you did something on this driver, doesn't
> this condition:
> 
> (status[0] & 0x80) ||
>                 ((status[0] & 0x1F) == 0x10) || ((status[1] & 0x01) == 0)
> 
> look odd to you? Especially the parentheses?

(The actual text in my copy of the file is:

	if ((status[0] & 0x80) || ((status[0] & 0x1F) == 0x10)
		|| ((status[1] & 0x01) == 0)) {

This probably doesn't affect your point...)

Certainly the layout is a little peculiar, and the extra parentheses 
don't help any.  But they don't really hurt, either, and the meaning is 
clear.  It doesn't look obviously wrong.

Those two lines go back to the original version of the driver, added in 
2005 by commit e80b0fade09e ("[PATCH] USB Storage: add alauda support"), 
written by Daniel Drake and edited by Matt Dharm.  So it's been around 
for quite a while and there may not be many devices left that need this 
driver.

Did you want to change it?

Alan Stern
