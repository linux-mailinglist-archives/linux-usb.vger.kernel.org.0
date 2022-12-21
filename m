Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0E18652F27
	for <lists+linux-usb@lfdr.de>; Wed, 21 Dec 2022 11:11:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234319AbiLUKL0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Dec 2022 05:11:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232975AbiLUKLY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Dec 2022 05:11:24 -0500
Received: from h1.cmg1.smtp.forpsi.com (h1.cmg1.smtp.forpsi.com [81.2.195.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A7BBB5
        for <linux-usb@vger.kernel.org>; Wed, 21 Dec 2022 02:11:22 -0800 (PST)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id 7w4Ep1HVhPm6C7w4FppflA; Wed, 21 Dec 2022 11:11:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671617479; bh=vcocw7BJkvvWkAAh84zETI4gnwnkQGPu8xZsX8EERGk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=GmSDWNA0VwNF3CwzJjttuYxEAkOhNycK4KIZ4TMhCnZdHr8gS+7e5H9ILtW9LSsMh
         xL13lsnfXdY1/9De7mHmRzlsnuxcr3pq8fuuvzmgwdq9qc0QyE8jP0IIKTWz7vnygr
         lzNg6xGNiHeMREvDtB7fA7XN6Ka4myGivPTB1u7f+A+zRyi5PJ1MvlPmWKJxeeD+vr
         QQk3yP5pNogeQUmoOwV0vDBmxHvQgA3RIbHG6fnAb/tnMvL0TY5SkC1HnuSJC/NkdX
         fzirYuEYNar+xy0Wmdv4a1pB0DPv3SUWgA1TBg/4UcHEuSkn4G3VB+bwXNaVBp+7It
         wkJWmtNUKA0KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1671617479; bh=vcocw7BJkvvWkAAh84zETI4gnwnkQGPu8xZsX8EERGk=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=GmSDWNA0VwNF3CwzJjttuYxEAkOhNycK4KIZ4TMhCnZdHr8gS+7e5H9ILtW9LSsMh
         xL13lsnfXdY1/9De7mHmRzlsnuxcr3pq8fuuvzmgwdq9qc0QyE8jP0IIKTWz7vnygr
         lzNg6xGNiHeMREvDtB7fA7XN6Ka4myGivPTB1u7f+A+zRyi5PJ1MvlPmWKJxeeD+vr
         QQk3yP5pNogeQUmoOwV0vDBmxHvQgA3RIbHG6fnAb/tnMvL0TY5SkC1HnuSJC/NkdX
         fzirYuEYNar+xy0Wmdv4a1pB0DPv3SUWgA1TBg/4UcHEuSkn4G3VB+bwXNaVBp+7It
         wkJWmtNUKA0KQ==
Date:   Wed, 21 Dec 2022 11:11:18 +0100
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Sneeker Yeh <sneeker.yeh@gmail.com>
Subject: Re: xHCI host dies on device unplug
Message-ID: <Y6Lbxhc/98QA6dMU@lenoch>
References: <Y45iXb6VCNiz7ZVd@lenoch>
 <Y49A1Pv6dUScQ9x/@lenoch>
 <Y5tHWwHctY6wr+CJ@lenoch>
 <abfec817-0b32-ece3-4965-7503aa5a77fa@linux.intel.com>
 <Y5zkCxQqBWR+/b4F@lenoch>
 <983a1eb1-4599-517b-6c88-63a0051ae261@linux.intel.com>
 <Y6Ct5s5fIoA9FsAt@lenoch>
 <Y6Dbh1xJucfNvwXq@lenoch>
 <Y6KyWqnHi1TFN0pa@lenoch>
 <6ac1cee8-b58a-b53f-2d0f-94336ac039b1@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ac1cee8-b58a-b53f-2d0f-94336ac039b1@linux.intel.com>
X-CMAE-Envelope: MS4wfJCRbpuqrXKuI6XqNsd6EUtFK3PdBf9HvKPbxgnlYfN9uSv1P+NAv0Zt1LZi0ktH4gqpjQ1oa4tCApIEwDz7Ev97H0T8D4jCEtZPsBVBvOEMqCbrognF
 fTsI7UkfyDoixsyyHEnJL0vRcUx9xZCofisE0cafqLUQdzzqI9CanY8hi/8sc6n2GZqLJ8Z8KrFdKUROZvOL+HWBllRHA2Wg0TaAwRHh3YZtjBSV60tRNbOz
 mb+Y+20DOFSMweo+iZG9og==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 21, 2022 at 11:58:42AM +0200, Mathias Nyman wrote:
> On 21.12.2022 9.14, Ladislav Michl wrote:
> > +Cc: Sneeker Yeh
> > 
> > On Mon, Dec 19, 2022 at 10:45:43PM +0100, Ladislav Michl wrote:
> > > On Mon, Dec 19, 2022 at 07:31:02PM +0100, Ladislav Michl wrote:
> > > > On Mon, Dec 19, 2022 at 02:25:46PM +0200, Mathias Nyman wrote:
> > > > > 
> > > > > Looks like controller didn't complete the stop endpoint command.
> > > > > 
> > > > > Event for last completed command (before cycle bit change "c" -> "C") was:
> > > > >    0x00000000028f55a0: TRB 00000000035e81a0 status 'Success' len 0 slot 1 ep 0 type 'Command Completion Event' flags e:c,
> > > > > 
> > > > > This was for command at 35e81a0, which in the command ring was:
> > > > >    0x00000000035e81a0: Reset Endpoint Command: ctx 0000000000000000 slot 1 ep 3 flags T:c
> > > > > 
> > > > > The stop endpoint command was the next command queued, at 35e81b0:
> > > > >    0x00000000035e81b0: Stop Ring Command: slot 1 sp 0 ep 3 flags c
> > > > > 
> > > > > There were a lot of URBs queued for this device, and they are cancelled one by one after disconnect.
> > > > > 
> > > > > Was this the only device connected? If so does connecting another usb device to another root port help?
> > > > > Just to test if the host for some reason partially stops a while after last device disconnect?
> > > > 
> > > > Device is connected directly into SoC. Once connected into HUB, host doesn't die
> > > > (as noted in other email, sorry for not replying to my own message, so it got lost)
> > > > It seems as intentional (power management?) optimization. If another device is
> > > > plugged in before 5 sec timeout expires, host completes stop endpoint command.
> > > > 
> > > > Unfortunately I cannot find anything describing this behavior in
> > > > documentation, so I'll ask manufacturer support.
> > > 
> > > As support is usually slow I asked search engine first and this sounds
> > > familiar:
> > > "Synopsis Designware USB3 IP earlier than v3.00a which is configured in silicon
> > > with DWC_USB3_SUSPEND_ON_DISCONNECT_EN=1, would need a specific quirk to prevent
> > > xhci host controller from dying when device is disconnected."
> > > 
> > > usb: dwc3: Add quirk for Synopsis device disconnection errata
> > > https://patchwork.kernel.org/project/linux-omap/patch/1424151697-2084-5-git-send-email-Sneeker.Yeh@tw.fujitsu.com/
> > > 
> > > Any clue what happened with that? I haven't found any meaningfull traces...
> > 
> > Lets step back a bit. All test so far was done with mainline 6.1.0 kernel.
> > I also tested Marvell's vendor tree, one based on 4.9.79, second on 5.4.30,
> > both heavily patched. The last version of above patch I found is v5:
> > https://lkml.org/lkml/2015/2/21/260
> > 
> 
> Looked at that same series and turned patch 1/5 into a standalone quick hack that applies on 6.1
> 
> Untested, does it work for you?

Applied on the top of you stop_endpoint_fixes, 6.1.0. is a base tree:
[   24.800835] xhci-hcd xhci-hcd.0.auto: Delay clearing port-1 CSC
[   24.806788] usb 1-1: USB disconnect, device number 2
[   28.148451] ieee80211 phy0: rt2x00usb_vendor_request: Error - Vendor Request 0x07 failed for offset 0x101c with error -19
[   29.828466] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command
[   29.856656] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[   29.864804] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[   29.949460] xhci-hcd xhci-hcd.0.auto: Late clearing port-1 CSC, portsc 0x202a0

What about checking whenever anything is still connected on command timeout
and considering device autosuspended instead of killing it?

	ladis
