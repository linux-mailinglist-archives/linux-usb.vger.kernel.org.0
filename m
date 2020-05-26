Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9031E1CF0
	for <lists+linux-usb@lfdr.de>; Tue, 26 May 2020 10:08:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgEZIIv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 May 2020 04:08:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:48942 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727772AbgEZIIv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 26 May 2020 04:08:51 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 4EFD3ACA1;
        Tue, 26 May 2020 08:08:53 +0000 (UTC)
Message-ID: <1590480528.2838.24.camel@suse.com>
Subject: Re: Kernel Oops in cdc_acm
From:   Oliver Neukum <oneukum@suse.com>
To:     Jean Rene Dawin <jdawin@math.uni-bielefeld.de>,
        linux-usb@vger.kernel.org
Date:   Tue, 26 May 2020 10:08:48 +0200
In-Reply-To: <20200525191624.GA28647@math.uni-bielefeld.de>
References: <20200525120026.GA11378@math.uni-bielefeld.de>
         <1590409690.2838.7.camel@suse.com>
         <20200525191624.GA28647@math.uni-bielefeld.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 25.05.2020, 21:16 +0200 schrieb Jean Rene Dawin:


Hi,

good, so the primary bug is fixed. I will send it upstream.
May I include your "Reported-by:" to give you the deserved fame?

> The first time the battery is removed and inserted again, everything is
> quite fine. Except that the USB cable has to be plugged out and in for the
> connection to be re-established. But that was needed in previous
> kernels, too.

Yes, I know. It sucks. But I cannot tell that it is the same device
in the kernel. Nor can I reestablish the connection, as it is done with
AT commands. It also means I cannot support reset_resume(). It sucks.
Any ideas?

I can only encourage you to contact the people developing the tool set
you are using.

> # turn on phone
> [  572.928634] ------------[ cut here ]------------
> [  572.928643] WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:1473 __queue_work+0x38a/0x430

This is extremely interesting and unexpected. It is in USB core. I am
looking into this.

	Regards
		Oliver

