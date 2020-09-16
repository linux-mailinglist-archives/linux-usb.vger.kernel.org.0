Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9E626C19B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 12:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbgIPKTv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 06:19:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:42194 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726612AbgIPKSM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 06:18:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D7382AC24;
        Wed, 16 Sep 2020 10:18:26 +0000 (UTC)
Message-ID: <1600251486.2424.17.camel@suse.com>
Subject: Re: [RFC 0/5] fix races in CDC-WDM
From:   Oliver Neukum <oneukum@suse.com>
To:     Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc:     bjorn@mork.no, linux-usb@vger.kernel.org
Date:   Wed, 16 Sep 2020 12:18:06 +0200
In-Reply-To: <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
References: <20200812132034.14363-1-oneukum@suse.com>
         <ee0af733-903f-8e8f-8027-b5490a37032f@i-love.sakura.ne.jp>
         <1599728957.10822.9.camel@suse.com>
         <4f285044-aae9-c3be-23ba-90790cd624f1@i-love.sakura.ne.jp>
         <1600161279.2424.5.camel@suse.com>
         <4b8f6305-52fd-cb72-eb13-9d0a0bf07319@i-love.sakura.ne.jp>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 15.09.2020, 19:30 +0900 schrieb Tetsuo Handa:
> On 2020/09/15 18:14, Oliver Neukum wrote

> > Is there something we can do in flush()?
> 
> I consider that wdm_flush() is a wrong place to return an error. It is possible that

I am afraid that is a basic problem we need to resolve. As I understand
 it, flush() as a method exists precisely to report errors. Otherwise
you could implement it in release(). But this is not called for every
close().

Hence a driver is supposed to start IO upon write() and report the
result to the next call, which can be either write() or close(), the
latter corresponding to flush().

> a userspace process reaches wdm_flush() due to being killed by SIGKILL (rather than
> via calling close() syscall). Then, that userspace process will never receive the error

If you are killed by a signal you are in a race condition
anyway. It cannot be handled.

> fetched from wdm_flush(). Also, if that userspace process is killed by the OOM killer,
> being able to terminate and release resources as soon as possible is more preferable
> than try to wait for response.

Right, so should we just proceed in case of a dieing task? How do we
do that?

	Regards
		Oliver

