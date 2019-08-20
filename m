Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5814395F93
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2019 15:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729261AbfHTNNg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Aug 2019 09:13:36 -0400
Received: from canardo.mork.no ([148.122.252.1]:37219 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728595AbfHTNNg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Aug 2019 09:13:36 -0400
Received: from miraculix.mork.no ([IPv6:2a02:2121:301:f490:2886:93ff:fe90:318c])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id x7KDDDJ3013260
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Tue, 20 Aug 2019 15:13:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1566306794; bh=0T5LzHKB96aCeBiY/QH/lE5XRY7wPvG0Bd1Nxw1LE+Q=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=kWW9y5Fh3HZu49+oI+AFlSZfaeKfzw4Qf/iMwWJm965FW6/4rgWQPbuuO2GuHaZ2p
         IX4QtVmnYbmFzFqIyZVrgfGRz+t77lvsoyabyS2wg1BIf7jlcwmWrN7qR89U4X00R6
         pD78/KC9SnnmUnzoHxCBJbGPHCp2/LWl9IorlqwY=
Received: from bjorn by miraculix.mork.no with local (Exim 4.92)
        (envelope-from <bjorn@mork.no>)
        id 1i03wn-0000Wu-JX; Tue, 20 Aug 2019 15:13:13 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+d232cca6ec42c2edb3fc@syzkaller.appspotmail.com>,
        gustavo@embeddedor.com, andreyknvl@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: WARNING in wdm_write/usb_submit_urb
Organization: m
References: <000000000000719222059081d6f2@google.com>
        <1566304128.11678.14.camel@suse.com>
Date:   Tue, 20 Aug 2019 15:13:13 +0200
In-Reply-To: <1566304128.11678.14.camel@suse.com> (Oliver Neukum's message of
        "Tue, 20 Aug 2019 14:28:48 +0200")
Message-ID: <87imqs56ae.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.101.2 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Oliver Neukum <oneukum@suse.com> writes:

> +	wait_event(desc->wait,
> +			/*
> +			 * needs both flags. We cannot do with one
> +			 * because resetting it would cause a race
> +			 * with write() yet we need to signal
> +			 * a disconnect
> +			 */
> +			!test_bit(WDM_IN_USE, &desc->flags) &&
> +			test_bit(WDM_DISCONNECTING, &desc->flags));

I'm confused now...  Won't this condition always be false?
Should be

  wait_event(desc->wait,
             !test_bit(WDM_IN_USE, &desc->flags) ||
             test_bit(WDM_DISCONNECTING, &desc->flags));


instead, or?



Bj=C3=B8rn
