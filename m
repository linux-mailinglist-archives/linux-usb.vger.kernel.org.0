Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EEBF52637E
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 16:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239343AbiEMONO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 10:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237900AbiEMONM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 10:13:12 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BA7118006
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:13:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34274620FF
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 14:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E022C34100;
        Fri, 13 May 2022 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652451190;
        bh=7I9dAQCAmJ8P9jRiIMKvQ+58ihJHJxte00CKWEsFs6c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uJQTawp9w4dclji40qtkc1YDtb1FNIvQqjEPCxK1a2d+gGseQ4eg4v66EgQ8foDNJ
         HTjmXV5RO5NYIemzyoT439PJ5tk7V/eE55HQ7SKSjvl1EGxf+dUet/EQ7ZSYSiYXGk
         6rE0WtgvstRHC3AL6+0HXQffK+X3oEggUh1fs6cM=
Date:   Fri, 13 May 2022 16:13:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        linux-usb@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <Yn5nc2mSHrdy/8h6@kroah.com>
References: <20220504151647.471885-1-jtornosm@redhat.com>
 <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
 <Yn5mliJq+7W8khe9@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn5mliJq+7W8khe9@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 13, 2022 at 10:09:26AM -0400, Alan Stern wrote:
> On Fri, May 13, 2022 at 11:50:26AM +0200, Jose Ignacio Tornos Martinez wrote:
> > Ok, I will try to identify the "bad" devices in some way.
> > 
> > Thanks
> > 
> > José Ignacio
> > 
> > 
> > On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > I'll drop this for now as there are no in-kernel users for this quirk
> > > yet.  When there is a need for one, please resubmit it.
> 
> Hold on; Greg's comment doesn't seem fair.  There are no in-kernel 
> users for this quirk because it is meant to be a user API.  (Just as 
> there are no in-kernel users for read(2) -- it is there so that 
> userspace can call it).

True, but the kernel calls read(2) itself as well in places, it just
looks a bit different, kernel_read_file()  :)

> Jose does have users for the new quirk: Anybody with one of the bad 
> Bluetooth CSR knockoff chips.  Now I agree; it would be great if there 
> was some way to identify them automatically.  But if that's not 
> possible, the only alternative is to allow userspace to set the quirk 
> flag whenever it knows the quirk is needed.

Is that the case here that we know how to identify this?  I thought
Marcel said something else was happening here.

If the bluetooth developers/maintainers say this is needed for some
devices to work properly and they will be handled in userspace somehow
through a udev rule or the like, I will gladly add this.  But I thought
this thread died out as it was determined that this wasn't needed at
this point in time which is why I dropped it.

thanks,

greg k-h
