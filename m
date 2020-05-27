Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC0791E3F46
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 12:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbgE0KlQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 06:41:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:51834 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729828AbgE0KlO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 06:41:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 80568AEEF;
        Wed, 27 May 2020 10:41:16 +0000 (UTC)
Message-ID: <1590576068.2838.56.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 27 May 2020 12:41:08 +0200
In-Reply-To: <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
         <1590418977.2838.16.camel@suse.com>
         <b39259fc7f397b27f4af145eeafb33ec36638660.camel@infinera.com>
         <a3f4a9bbde9efd2827b2a02c46f86c8ba7853bc6.camel@infinera.com>
         <1590482853.2838.26.camel@suse.com>
         <8cf71160e703a18b28d27a844406d42f6cadf39b.camel@infinera.com>
         <1590488084.2838.34.camel@suse.com>
         <42c92312c74e90e5507de4103bd15bbbe175f98d.camel@infinera.com>
         <4c2bd25aa7f6672cb132487f7af6a787ffc1fab6.camel@infinera.com>
         <1590568683.2838.42.camel@suse.com>
         <f4a809ba4ca132266e476ca1805e4ff9e5663f9f.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 27.05.2020, 09:40 +0000 schrieb Joakim Tjernlund:
> On Wed, 2020-05-27 at 10:38 +0200, Oliver Neukum wrote:
> > CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
> > 
> > 
> > Am Dienstag, den 26.05.2020, 17:19 +0000 schrieb Joakim Tjernlund:
> > > 
> > > This "u-boot SPL" is the first thing u-boot writes and somehow this is remembered, I assume, by cdc_acm
> > > and gets echoed back when I open ttyACM0
> > 
> > Hi,
> > 
> > that makes sense, but it is not something that we could really
> > change in CDC-ACM, I am afraid.
> 
> Why not? CDC-ACM should echo back anything it has received before open of ttyACM

Well, there is an inherent race condition with loading the module I am
afraid. By default cdc-acm should actually echo. You can set the
DISABLE_ECHO echo quirk for your device if you want to get rid of it.

Is CDC-ACM violating some standard with respect to echoing? Changing
defaults really hurts users, no matter what you do.

	Regards
		Oliver

