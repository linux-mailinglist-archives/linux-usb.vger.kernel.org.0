Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62A2B517779
	for <lists+linux-usb@lfdr.de>; Mon,  2 May 2022 21:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1387150AbiEBTgW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 May 2022 15:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387147AbiEBTgQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 May 2022 15:36:16 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id ED9AC6365
        for <linux-usb@vger.kernel.org>; Mon,  2 May 2022 12:32:46 -0700 (PDT)
Received: (qmail 1060885 invoked by uid 1000); 2 May 2022 15:32:46 -0400
Date:   Mon, 2 May 2022 15:32:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: USB device disconnects on resume
Message-ID: <YnAx3uvVrK4UXd05@rowland.harvard.edu>
References: <YmAbZDd6LJwCCvkB@rowland.harvard.edu>
 <4fb8bd5842135a9f723bbe0406ed1afc023c25fe.camel@puri.sm>
 <YmFpMFlTt83s90an@rowland.harvard.edu>
 <b80c032c350c525d620968e95b7a653fc855d806.camel@puri.sm>
 <YmgIlFBC8mYQ2xwJ@rowland.harvard.edu>
 <232334eeb9d7321df1632e453839a6d433e6be45.camel@puri.sm>
 <YmrnVHA2/kttJQJa@rowland.harvard.edu>
 <1cb1cd1178703b4a67db849cc4c074b0c00b1332.camel@puri.sm>
 <YmxI5rIlyxOrPBHD@rowland.harvard.edu>
 <fdc8354e39f9162bcc63ab99f237bdbbe30d6017.camel@puri.sm>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fdc8354e39f9162bcc63ab99f237bdbbe30d6017.camel@puri.sm>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 02, 2022 at 03:54:34PM +0200, Martin Kepplinger wrote:
> Am Freitag, dem 29.04.2022 um 16:21 -0400 schrieb Alan Stern:
> > I don't see why re-initialization works any better.  It's not likely
> > to 
> > be a question of waiting long enough, since you already waited for 5 
> > seconds.  There must be something different between the reset-resume
> > and 
> > the re-initialization, but I can't tell what.
> 
> Thanks for this great analysis and clarifications! It really looks like
> that difference is what I want to find.
> 
> > 
> > Maybe a usbmon trace showing the entire thing, both the reset-resume
> > and 
> > the following re-initialization, would help.
> > 
> 
> I append that here. A recording of the whole syslog until the modem is
> re-enumerated and working again. And the usbmon recording. I added a
> few usbmon timestampts to the kernel log to be able to correlate the 2
> a bit easier.

The usbmon trace shows that quite a lot happens during re-enumeration 
that doesn't happen during the reset-resume.  No doubt the reason for 
this is that the cdc-wdm driver doesn't have a real reset-resume 
handler; the operations it carries out for a reset-resume are the same 
as for a normal resume, and that clearly is not appropriate here.

For example, the usbmon trace shows that the kernel sends a 
Set-Interface request to the modem during re-enumeration and then does a 
whole lot of probing that I don't understand.  None of this stuff 
happens during the reset-resume.  Probably the modem decides that 
without any of this extra configuration, it doesn't need to do 
anything -- and that's why it disconnects itself.

So the person you need to talk to is the maintainer of the USB CDC 
drivers, Oliver Neukum (CC'ed).

Alan Stern
