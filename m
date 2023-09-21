Return-Path: <linux-usb+bounces-451-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 225EB7A9BA8
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 21:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C6DD4282514
	for <lists+linux-usb@lfdr.de>; Thu, 21 Sep 2023 19:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B758348835;
	Thu, 21 Sep 2023 18:34:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAFA66DFC
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 18:34:53 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 987E5D2B1D
	for <linux-usb@vger.kernel.org>; Thu, 21 Sep 2023 11:23:07 -0700 (PDT)
Received: (qmail 1274718 invoked by uid 1000); 21 Sep 2023 10:23:05 -0400
Date: Thu, 21 Sep 2023 10:23:05 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Massimo Burcheri <massimo@burcheri.de>
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: JMicron JMS567 and UAS
Message-ID: <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Thu, Sep 21, 2023 at 02:22:13PM +0200, Massimo Burcheri wrote:
> On Tue, 2023-09-19 at 11:13 -0400, Alan Stern wrote:
> 
> > > coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan/

That email refers to vendor & product 357d:7788.  But your device, as 
shown in the earlier email message, is 152d:0567.  So it's puzzling why 
you referred back to this bug report, even though the devices do have 
similar names (JMicron J566 and J567).

> > > as I understand UAS was working for JMicron JMS567 in the past, then was
> > > disabled in the kernel, now using usb-storage.
> 
> > How did you get that idea?  After looking through the email archives, I 
> > found this bug report from 2015:
> > 
> >         https://bugzilla.redhat.com/show_bug.cgi?id=1260207
> 
> I got the idea from my original thread.
> I did not test it on old kernel.

In fact, I don't see anything in the current kernel that would prevent 
your device from working with uas.  The entry in unusual_uas.h merely 
has the BROKEN_FUA and NO_REPORT_OPCODES flags set, neither of which 
should have a bad effect.

Am I missing something?

> > That bug report indicates that the device wasn't working properly with a 
> > 4.1.4 kernel.  Of course, it's possible that the problem had more to do 
> > with the drive inside the enclosure than the enclosure itself.
> 
> From the report the idProduct is different from my product, might be a different
> bridge.

Indeed.

> So from what I understand it is blacklisted currently because of issues.
> 
> Is there a way I can bypass the blacklisting, like forcing to use uas similar to
> the workaround by forcing usb-storage? I would like to know if there are still
> issues in uas mode with this bridge.
> 
> The (chinese?) product is sold with UAS support. I know this is no warranty. The
> JMicron bridge itself should support UASP:
> https://pcper.com/wp-content/uploads/2014/12/0813-jms567.pdf
> 
> I found someone that fixed it by flashing an older firmware:
> https://forum.openmediavault.org/index.php?user-post-list/36559-sanjager/
> (Version 20.06.00.01, before 138.01.00.01)
> 
> It seems a similar device Icybox 4HDD enclosure is also using the JMS567:
> https://answers.launchpad.net/ubuntu/+source/linux/+question/688498
> 
> This all sounds like UAS is not entirely missing but somehow faulty in this
> bridge.
> 
> I'm going to test with a Windows machine soon, if UAS is working stable there.
> But that won't help me on Linux, just for saying the enclosure hardware is UAS
> capable.
> 
> How can I help exploring / debugging this?

If you can, start by figuring out why your kernel isn't using the uas 
driver for the JMS567.  Is the driver itself blacklisted on your 
computer?

Alan Stern

