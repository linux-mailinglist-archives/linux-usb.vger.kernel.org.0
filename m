Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10A2E1E3CB2
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2020 10:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388314AbgE0IxO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 May 2020 04:53:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:57314 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388112AbgE0IxO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 27 May 2020 04:53:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id F3B52AD65;
        Wed, 27 May 2020 08:53:15 +0000 (UTC)
Message-ID: <1590569589.2838.50.camel@suse.com>
Subject: Re: Kernel Oops in cdc_acm
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Rene Dawin <jdawin@math.uni-bielefeld.de>
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 27 May 2020 10:53:09 +0200
In-Reply-To: <20200526195750.GA10336@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
         <1590409690.2838.7.camel@suse.com>
         <20200525191624.GA28647@math.uni-bielefeld.de>
         <1590491586.2838.38.camel@suse.com>
         <20200526195750.GA10336@math.uni-bielefeld.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 26.05.2020, 21:57 +0200 schrieb Jean Rene Dawin:
> Oliver Neukum wrote on Tue 26/05/20 13:13:
> > Hi,
> > 
> > may I ask whether you did the test with removing the battery twice with
> > an older kernel? Could you please go back to
> > f6cc6093a729ede1ff5658b493237c42b82ba107
> > and repeat the test of a second battery removal with that state?
> > I just cannot find anything pointing to a change that could cause
> > this issue within that time.
> 
> Hi,
> 
> testing with f6cc6093a729ede1ff5658b493237c42b82ba107 looks like this:

OK, we have two possibilities here. Either
a4e7279cd1d19f48f0af2a10ed020febaa9ac092 or
0afccd7601514c4b83d8cc58c740089cc447051d

have had a really wierd effect, or they introduced a bug
that hid a later bug. Can I ask you to run a complicated test
to decide between these possibilities?

Could you test a4e7279cd1d19f48f0af2a10ed020febaa9ac092
together with the patch I sent you applied on top?

> Interesting is, that at the second time, the usb disconnect message
> conmes first, and then a message from cdc_acm acm_port_activate.

Basically you are deliberately creating a race condition between error
handling and disconnect. That is a feature of the HC design.

	Regards
		Oliver

