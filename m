Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF2129605E
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 15:41:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730068AbfHTNkY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 09:40:24 -0400
Received: from mx2.suse.de ([195.135.220.15]:34896 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728248AbfHTNkX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 09:40:23 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 9D012AE74;
        Tue, 20 Aug 2019 13:40:22 +0000 (UTC)
Message-ID: <1566308421.11678.18.camel@suse.com>
Subject: Re: WARNING in wdm_write/usb_submit_urb
From:   Oliver Neukum <oneukum@suse.com>
To:     =?ISO-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org
Date:   Tue, 20 Aug 2019 15:40:21 +0200
In-Reply-To: <87imqs56ae.fsf@miraculix.mork.no>
References: <000000000000719222059081d6f2@google.com>
         <1566304128.11678.14.camel@suse.com><1566304128.11678.14.camel@suse.com>
         (Oliver Neukum's message of "Tue, 20 Aug 2019 14:28:48 +0200") <87imqs56ae.fsf@miraculix.mork.no>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 20.08.2019, 15:13 +0200 schrieb Bjørn Mork :
> Oliver Neukum <oneukum@suse.com> writes:
> 
> > +	wait_event(desc->wait,
> > +			/*
> > +			 * needs both flags. We cannot do with one
> > +			 * because resetting it would cause a race
> > +			 * with write() yet we need to signal
> > +			 * a disconnect
> > +			 */
> > +			!test_bit(WDM_IN_USE, &desc->flags) &&
> > +			test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> I'm confused now...  Won't this condition always be false?
> Should be
> 
>   wait_event(desc->wait,
>              !test_bit(WDM_IN_USE, &desc->flags) ||
>              test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> 
> instead, or?


<censored> <censored> ...

You are right.

	Regards
		Oliver
 
