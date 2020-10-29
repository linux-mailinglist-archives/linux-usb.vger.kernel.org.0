Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7415929EA32
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 12:12:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgJ2LMP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 07:12:15 -0400
Received: from mout.gmx.net ([212.227.17.22]:37755 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbgJ2LMO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 07:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603969916;
        bh=ckM2nVp6VjKEOaD9bLsrgu+pqV4vfPMuoS2FsRyEYag=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=UlDfoJfkPhrpecICgBb89KPJSyhS8Z7BJTwtjrnYtl2Rna8IxQtFJUw7CeGigWGJz
         a47qZzpgTosolsOAf5PfDsTF5/dG+fsxfEij41lW/xj/RI5q/WdAUiMYEsCYpoK0O/
         rMnr/2WjJPnS6Dk5sYT4SlNOYjCApmdFMOb3gwhM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.simpson.net ([185.146.51.69]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmfi-1kvmYY0b3S-00TGWU; Thu, 29
 Oct 2020 12:11:56 +0100
Message-ID: <c8a67a65091404e528297ef5c6b9c59cdc03a2c9.camel@gmx.de>
Subject: Re: [PATCH 3/3] xhci: Don't create stream debugfs files with
 spinlock held.
From:   Mike Galbraith <efault@gmx.de>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
        Li Jun <jun.li@nxp.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Thu, 29 Oct 2020 12:11:54 +0100
In-Reply-To: <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
References: <20201028203124.375344-1-mathias.nyman@linux.intel.com>
         <20201028203124.375344-4-mathias.nyman@linux.intel.com>
         <1cbb8b7defb1db1d4747995c11ebebb3dd9a66ec.camel@gmx.de>
         <30dd5079-375d-a2a3-cab3-1b2740661ea8@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fm8nJtJy/c+jBsVHbXs3Vo1zykrdcK/GZ7kIwePaGCDk9Dsk6n9
 cFyKJPfGnOWmBBTR+9b3jmAMDrcYF0wiFNjzZtJoh43fkQ5sJ6uEijriXKq1ZZbTOsYUhta
 pCZ08rMWyoUhq4ub/iPHbh6e/hCYmY2y3jVlQk+dt4cGLFp38VbdPQWjDJTy8npUp8UtBIJ
 I48QUhKw6xHYwNtgGVKJA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VyiPKugm00I=:Hw+Z9VudalNlNeuwvu7eX0
 55G+DTSmkObxkxu7u5HSI5DP87jzfEU6N1phoPq8GOKphy4VgLIqr4CKQ+7rHyvIRmbRKEkdJ
 /OcNC+SaLRM0faIinjrzw2tIAgpvwhJScuk5qTAedxkfGQzyueX0WiszRZIE/pN3fxHRkwyMR
 tTp4ywRioba0sXsn6U+BdnEtpfTV0DaVq6zTj2PaJYrhllrlpeoHozgMws+UYjSgbJX5Xe0dz
 WuRxQQwt21d5UwHVdHHhmt/l9BSHaY7DJvp2H1qx9V+/qRpbgytGQH9Y1chSe9GuGD+1HMx4L
 PZtk4ph1tMWirkyU3IAtY3rk3yhqEy6la9Ei36ggUwXN7kUcK41C6nhU59+uLl1PX7gKYw9k4
 baJT6IYGFLavldWLgFsHGgjRu3fzYbrhWncqJSrRd2Z3+Aq2iMc0No3JUInTYp14PNKaQruFh
 6tHxa7BUbvUp4XFvmH6xpAUG0lKm+VazTeNeATvA2KwiX1Cl/YND5MY6GeVVjlfs+faZgw410
 2j7hC6JJMfohIKrNi0FGhKJ2MYea1YM+DnjkMNzuU56N1e+kenHRqQRG+9cWCwM+33Ayfnt3o
 LbNLRKFZgP1v7wPGmW0dQ6gcmrzmGwvazaExbOk+zpUFcPxaGpmkSFgddyHHSF8h/J289kzBI
 BK4Z69jgGTZmATRdH8UfUZwO6nkyggZb5sBMAVwMki1PRe/ZAw1jCY5sz34fjFoZEbTFWeLfQ
 UxXdRDjXFAjCQmAco8LVQGfG2/xxnVinx0aR+4DlsR46I8vmKziN9OQKpyGpwSzgSiTTIM5gQ
 tRBEl/noYNGjVW+PJhHVrUu/F/jNeygNrSxc6f/R5c1o9up1ElgLV1BKp3ogJCm6QD+wPirsk
 NXmU6QM4pEKqnWH+dE3Q==
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2020-10-29 at 11:41 +0200, Mathias Nyman wrote:
> Can you check if this can be reproduced with 5.9 kernel?

Nope, 5.9.2 didn't reproduce.

	-Mike

