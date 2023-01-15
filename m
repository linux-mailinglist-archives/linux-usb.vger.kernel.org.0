Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A13C66B2AC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jan 2023 17:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231179AbjAOQ5h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Jan 2023 11:57:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjAOQ5g (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Jan 2023 11:57:36 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 1476DEC49
        for <linux-usb@vger.kernel.org>; Sun, 15 Jan 2023 08:57:35 -0800 (PST)
Received: (qmail 101887 invoked by uid 1000); 15 Jan 2023 11:57:34 -0500
Date:   Sun, 15 Jan 2023 11:57:34 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Gerald Lee <sundaywind2004@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: usb: A use-after-free Write in put_dev
Message-ID: <Y8QwfhXZBDJNaqsg@rowland.harvard.edu>
References: <CAO3qeMVzXDP-JU6v1u5Ags6Q-bb35kg3=C6d04DjzA9ffa5x1g@mail.gmail.com>
 <Y5dV11OoM3ojxNHy@rowland.harvard.edu>
 <CAO3qeMWZLEJeKg4B6p6g=AHecexQ9iPBXttujzbvHz-hRGwQjg@mail.gmail.com>
 <Y8QqQiJfLH8gwsOH@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y8QqQiJfLH8gwsOH@eldamar.lan>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 15, 2023 at 05:30:58PM +0100, Salvatore Bonaccorso wrote:
> Hi,
> 
> On Tue, Dec 13, 2022 at 09:02:53AM +0800, Gerald Lee wrote:
> > Hi Alan,
> > 
> > I've tested this patch. It resolves the problem.
> > 
> > Thanks.

...

> AFAICS, this patch has not yet been applied in mainline, is this
> correct?

Correct.  It was submitted on December 23 (during the last merge window) 
and we are still waiting for Greg KH to accept it.

Alan Stern
