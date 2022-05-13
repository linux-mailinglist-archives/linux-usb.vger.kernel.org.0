Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 457D6526373
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 16:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233308AbiEMOJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 10:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiEMOJ3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 10:09:29 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6F9F31116C5
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:09:27 -0700 (PDT)
Received: (qmail 36156 invoked by uid 1000); 13 May 2022 10:09:26 -0400
Date:   Fri, 13 May 2022 10:09:26 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <Yn5mliJq+7W8khe9@rowland.harvard.edu>
References: <20220504151647.471885-1-jtornosm@redhat.com>
 <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 13, 2022 at 11:50:26AM +0200, Jose Ignacio Tornos Martinez wrote:
> Ok, I will try to identify the "bad" devices in some way.
> 
> Thanks
> 
> José Ignacio
> 
> 
> On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > I'll drop this for now as there are no in-kernel users for this quirk
> > yet.  When there is a need for one, please resubmit it.

Hold on; Greg's comment doesn't seem fair.  There are no in-kernel 
users for this quirk because it is meant to be a user API.  (Just as 
there are no in-kernel users for read(2) -- it is there so that 
userspace can call it).

Jose does have users for the new quirk: Anybody with one of the bad 
Bluetooth CSR knockoff chips.  Now I agree; it would be great if there 
was some way to identify them automatically.  But if that's not 
possible, the only alternative is to allow userspace to set the quirk 
flag whenever it knows the quirk is needed.

Alan Stern
