Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4565F95A8D
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 11:01:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729340AbfHTJBf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 05:01:35 -0400
Received: from mx2.suse.de ([195.135.220.15]:35436 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728879AbfHTJBf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 05:01:35 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id F3213B659;
        Tue, 20 Aug 2019 09:01:33 +0000 (UTC)
Message-ID: <1566291689.11678.3.camel@suse.com>
Subject: Re: divide error in usbtmc_generic_read
From:   Oliver Neukum <oneukum@suse.com>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Dmitry Vyukov <dvyukov@google.com>
Cc:     syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        steve_bayless@keysight.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        guido.kiener@rohde-schwarz.com,
        syzbot <syzbot+55b0304b360654a7537b@syzkaller.appspotmail.com>,
        USB list <linux-usb@vger.kernel.org>
Date:   Tue, 20 Aug 2019 11:01:29 +0200
In-Reply-To: <CAAeHK+xum44QNGCgnFc-W69AfA4Rt1hEiRc4SrSWhFfqhhuf0A@mail.gmail.com>
References: <000000000000a59094059013dd63@google.com>
         <1565875886.5780.7.camel@suse.com>
         <CAAeHK+zd9P2hLXuXynbZfhVpSE1Sak2GihX6sDCPWfD+kPaEGg@mail.gmail.com>
         <1566218263.5663.22.camel@suse.com>
         <CAAeHK+xX3vk_JoJ=2tHF__LECxNmPXuPMkxWz6u+K6L-MdN=9g@mail.gmail.com>
         <1566220164.5663.25.camel@suse.com>
         <CAAeHK+wGzWGvW0AVSr6qA+AcpLr7A3Xi8wR7f-rBQJmMmQgU2A@mail.gmail.com>
         <1566222541.5663.27.camel@suse.com>
         <CAAeHK+xum44QNGCgnFc-W69AfA4Rt1hEiRc4SrSWhFfqhhuf0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 19.08.2019, 17:40 +0200 schrieb Andrey Konovalov:
> 
> This implies that we can differentiate between different crashes. We
> can differentiate between different manifestations of crashes, but
> those can be caused by the same bug. I think we can remove the word
> "still" though, so the words will be: "syzbot has tested the proposed
> patch, but the reproducer triggered a crash".

That is exactly my point. There are three cases:

- no crash
- clearly the same crash
- something

Yet syzbot has two answers only. We are killing information needlessly.

	Regards
		Oliver

