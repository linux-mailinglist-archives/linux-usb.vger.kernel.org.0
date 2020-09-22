Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E40B274180
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 13:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgIVLtl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 07:49:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:57570 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726522AbgIVLth (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 07:49:37 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600775376;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iuOJkQS1x63lbThbroA3hbvRtG+6W/hfeFY6CNa3sY0=;
        b=IzoJxjObZ+QXs5cpzivGfRJBWBlaaVG8HBQNneTEODDuHvo91yjdb0vfcH6t7NOrxSgC3u
        XdVoHoCODn+QIvUKiateJUaAv1wuvVdCINFa1A/1IipiXw4nk56m7Ku87TXxtQKACi+NmJ
        N/BfIBCZDjFyp6OLg+a9WeWskEruvsk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 179ABAE7B;
        Tue, 22 Sep 2020 11:50:13 +0000 (UTC)
Message-ID: <1600775358.6926.20.camel@suse.com>
Subject: Re: [RFC 7/7] CDC-WDM: making flush() interruptible
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Tue, 22 Sep 2020 13:49:18 +0200
In-Reply-To: <5277d73f-725c-7960-669e-8c7a81532d73@i-love.sakura.ne.jp>
References: <20200922112126.16919-1-oneukum@suse.com>
         <20200922112126.16919-8-oneukum@suse.com>
         <5277d73f-725c-7960-669e-8c7a81532d73@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 22.09.2020, 20:38 +0900 schrieb Tetsuo Handa:
> On 2020/09/22 20:21, Oliver Neukum wrote:
> > There is no need for flush() to be uninterruptible. close(2)
> > is allowed to return -EINTR.
> > 
> > 30 seconds is quite long a time to sleep in an uninterruptible state.
> > Change it to an interruptible sleep.
> 
> Doesn't this conflict with
> 
>   Making the wait for IO interruptible would not solve the
>   issue. While it would avoid a hang, it would not allow any progress
>   and we would end up with an unclosable fd.
> 
> in [RFC 2/7] ? I suggested killable version, for giving up upon SIGKILL
> implies automatically closing fds by terminating that userspace process.

No. That we state in an earlier patch that an issue needs a timeout
instead of an interruptible sleep, does not mean that another issue
could not be solved by using an interruptible sleep.

	Regards
		Oliver

