Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD0710D64A
	for <lists+linux-usb@lfdr.de>; Fri, 29 Nov 2019 14:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726889AbfK2Ntu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 29 Nov 2019 08:49:50 -0500
Received: from smtp.qindel.com ([89.140.90.34]:44512 "EHLO thor.qindel.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726853AbfK2Ntt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 29 Nov 2019 08:49:49 -0500
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 663226075E;
        Fri, 29 Nov 2019 14:49:47 +0100 (CET)
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id RUQ3ooiQwruf; Fri, 29 Nov 2019 14:49:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by thor.qindel.com (Postfix) with ESMTP id 3BF0260760;
        Fri, 29 Nov 2019 14:49:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at thor.qindel.com
Received: from thor.qindel.com ([127.0.0.1])
        by localhost (thor.qindel.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id UuPGYUMi6S_O; Fri, 29 Nov 2019 14:49:47 +0100 (CET)
Received: from gverdu.qindel.com (gverdu.qindel.com [172.26.8.99])
        by thor.qindel.com (Postfix) with ESMTPSA id 08EDC6075E;
        Fri, 29 Nov 2019 14:49:44 +0100 (CET)
From:   Vadim Troshchinskiy <vtroshchinskiy@qindel.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usbip tools from 5.4 fail to build due to unaligned pointer value warning
Date:   Fri, 29 Nov 2019 14:49:45 +0100
Message-ID: <2248932.DWrUWtNFSA@gverdu.qindel.com>
In-Reply-To: <20191129133327.GB3703941@kroah.com>
References: <6296180.lmSoKh01SJ@gverdu.qindel.com> <20191129133327.GB3703941@kroah.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

В письме от пятница, 29 ноября 2019 г. 14:33:27 CET пользователь Greg KH 
написал:
> On Fri, Nov 29, 2019 at 01:24:30PM +0100, Vadim Troshchinskiy wrote:
> > Hello,
> > 
> > Building the usbip tools from 4.15 is failing under Fedora 30, gcc version
> 
> > 9.2.1:
> When 4.15 was released, there was no such gcc version :)
> 
> 4.15 is long end-of-life, please use a more modern kernel release with
> newer versions of gcc.

Ah, my apologies, had a bit of a mix-up here. This compilation problem was on 
v5.4 as it says in the title, I'm working on porting something from 4.15 and 
accidentally put that there.






