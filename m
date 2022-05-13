Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AE24F52652B
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 16:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381370AbiEMOrS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 10:47:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381639AbiEMOq7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 10:46:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5A04968D
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:46:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A50A62070
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 14:46:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6A3C34100;
        Fri, 13 May 2022 14:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652453198;
        bh=80KvcRb22a/2UEPcIkuquGUvmxLxMw3Xeyxb/T8Ra2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WeGxNZZyvDI4A4r4h3aFlg3MqcpJKnXye347SSGgQsA14xRSl9H4uKccbYt0XuLzf
         Ux2Bb3TbkkxgBZXg5V6ToaIXi0maBolXnIjRayzCaZMAlLbHTY4CSEPJKp8L/6mSFz
         VmNH59JvR5Vo44wa9V6Wdnz6NXiOjOpU33SEEPmw=
Date:   Fri, 13 May 2022 16:46:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        linux-usb@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <Yn5vS3cA4qP3MXfV@kroah.com>
References: <20220504151647.471885-1-jtornosm@redhat.com>
 <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
 <Yn5mliJq+7W8khe9@rowland.harvard.edu>
 <Yn5nc2mSHrdy/8h6@kroah.com>
 <Yn5qerFAcHP3scAZ@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Yn5qerFAcHP3scAZ@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 13, 2022 at 10:26:02AM -0400, Alan Stern wrote:
> On Fri, May 13, 2022 at 04:13:07PM +0200, Greg KH wrote:
> > On Fri, May 13, 2022 at 10:09:26AM -0400, Alan Stern wrote:
> > > On Fri, May 13, 2022 at 11:50:26AM +0200, Jose Ignacio Tornos Martinez wrote:
> > > > Ok, I will try to identify the "bad" devices in some way.
> > > > 
> > > > Thanks
> > > > 
> > > > José Ignacio
> > > > 
> > > > 
> > > > On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > I'll drop this for now as there are no in-kernel users for this quirk
> > > > > yet.  When there is a need for one, please resubmit it.
> > > 
> > > Hold on; Greg's comment doesn't seem fair.  There are no in-kernel 
> > > users for this quirk because it is meant to be a user API.  (Just as 
> > > there are no in-kernel users for read(2) -- it is there so that 
> > > userspace can call it).
> > 
> > True, but the kernel calls read(2) itself as well in places, it just
> > looks a bit different, kernel_read_file()  :)
> 
> Okay, but you get the point.  :-)
> 
> > > Jose does have users for the new quirk: Anybody with one of the bad 
> > > Bluetooth CSR knockoff chips.  Now I agree; it would be great if there 
> > > was some way to identify them automatically.  But if that's not 
> > > possible, the only alternative is to allow userspace to set the quirk 
> > > flag whenever it knows the quirk is needed.
> > 
> > Is that the case here that we know how to identify this?  I thought
> > Marcel said something else was happening here.
> > 
> > If the bluetooth developers/maintainers say this is needed for some
> > devices to work properly and they will be handled in userspace somehow
> > through a udev rule or the like, I will gladly add this.  But I thought
> > this thread died out as it was determined that this wasn't needed at
> > this point in time which is why I dropped it.
> 
> It's kind of an odd situation.  In ordinary usage the device works okay.  
> But it stops working after it has been exported over usbip; that is what 
> Jose wants to fix.
> 
> Come to think of it, maybe there is a simple workaround.  If userspace 
> resets the device after it is unconfigured, there's a good chance that 
> will get it to start working again.  Jose, can you try this?  There is a 
> usbreset program you can use, floating around on the web.  (Greg, did 
> that program or something like it ever get added to the usbutils 
> package?)

Yes, it is in the usbutils package.  I don't think many distros package
the prebuilt binary, but the .c file can be found here:
	https://github.com/gregkh/usbutils/blob/master/usbreset.c

