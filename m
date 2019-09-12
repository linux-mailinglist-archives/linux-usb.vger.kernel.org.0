Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA9AB0A8D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2019 10:45:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730228AbfILIpU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Sep 2019 04:45:20 -0400
Received: from mx2.suse.de ([195.135.220.15]:48292 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726159AbfILIpU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Sep 2019 04:45:20 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id DC52BAF84;
        Thu, 12 Sep 2019 08:45:18 +0000 (UTC)
Message-ID: <1568277005.4008.6.camel@suse.com>
Subject: Re: ttyACM and BREAK chars ?
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Thu, 12 Sep 2019 10:30:05 +0200
In-Reply-To: <6e35e841122c1053ce0ec63383a883c7f58fca06.camel@infinera.com>
References: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
         <1568211729.11279.6.camel@suse.com>
         <24612ff3f7cd87642a3ab298950be31f8945fcc2.camel@infinera.com>
         <1568226447.11279.8.camel@suse.com>
         <6e35e841122c1053ce0ec63383a883c7f58fca06.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 12.09.2019, 07:09 +0000 schrieb Joakim Tjernlund:
> On Wed, 2019-09-11 at 20:27 +0200, Oliver Neukum wrote:
> > Am Mittwoch, den 11.09.2019, 14:34 +0000 schrieb Joakim Tjernlund:
> > > On Wed, 2019-09-11 at 16:22 +0200, Oliver Neukum wrote:
> > > > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > > > 
> > > > 
> > > > Am Mittwoch, den 11.09.2019, 12:39 +0000 schrieb Joakim Tjernlund:
> > > > > Every now and then my ttyACM0 hangs up or sends a BREAK char to my device.
> > > > > I am trying to make ttyACM ignore incoming(over USB) and not emit
> > > > > any BREAK automatically using termios (IGN_BRK) but that does not make a difference.
> > > > > 
> > > > > Is BREAK handling unimpl. in ttyACM ?
> > > > 
> > > > acm_send_break() implements it.
> > > 
> > > Yes, I se that funktion but I don't see how one can ignore received BREAKs
> > > If I set IGN_BRK on /dev/ttyACM0 I expect that every BREAK should just be ignored
> > 
> > Handling breaks looks a bit broken on CDC-ACM.
> > Could you test the attached patch?
> > 
> 
> Sure, I can test it but from looking at the patch it seems like ACM already ignores
> BREAKs(hardcoded) and with your patch you actually start reporting them.

Well, what is not reported cannot really be ignored.
AFAICT  n_tty_receive_break() should solve the issue generically.

> My problem is sudden disconnects I cannot explain but I think they are connect to BREAKs
> I have seen these errors in dmesg though, not sure if they help the diagnose:
> [181780.167987] usb usb1-port6: disabled by hub (EMI?), re-enabling...

The relevant fault happens likely just before that.

> [181780.168208] cdc_acm 1-6.3:1.1: acm_ctrl_irq - usb_submit_urb failed: -19
> [181780.167996] usb 1-6: USB disconnect, device number 30
> [181780.176548] usb 1-6-port2: attempt power cycle
> [181781.772847] usb 1-6.3: USB disconnect, device number 32
> [181781.773134] cdc_acm 1-6.3:1.1: failed to set dtr/rts

Either your cabling is indeed crap, or something crashes your device.

	Regards
		Oliver

