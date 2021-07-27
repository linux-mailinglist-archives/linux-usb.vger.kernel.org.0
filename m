Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2A0E3D70F9
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 10:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235912AbhG0INe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 04:13:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:53932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235629AbhG0INd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 04:13:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4D2F60F59;
        Tue, 27 Jul 2021 08:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627373613;
        bh=mk07JVZASltCbgO3uwu3i4rtcnRvAK+drZiyBEF4OnY=;
        h=References:From:To:Cc:Subject:In-reply-to:Date:From;
        b=fMLQJajZ6Gj4KlLPr2lzsZn3QfkjDXgX/9tuv8to94Fa8KUwIPJ2LkNO5VySc9qMh
         2M1BTSd2TZGFW6huVn/J9cDje+MUt3XzsyN/7JZWl1xj3L1AryykJVy+7RVsHEhA6I
         8iDOdelx61H/+2QsMRywExa7erRP6EmEf4POLZ3NAt8pdg0KXBryXyghZeR1Gi9cFG
         /Eub147X8tI1vdRZCGPl1z/kRwtST8ADhmfYLxV85NR2oLcMNVXrv4p93Xo4uEyzYH
         0jO7CE2aee1+e/WQnUZzqkDpAs7cyj2rYJP5+Q/KcilllYUDrQOO4dl2aaFNqnbpwu
         kb1xE95MS7VCg==
References: <20210727073142.84666-1-zhangqilong3@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: gadget: remove leaked entry from udc
 driver list
In-reply-to: <20210727073142.84666-1-zhangqilong3@huawei.com>
Date:   Tue, 27 Jul 2021 11:13:06 +0300
Message-ID: <87v94wtbsd.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Zhang Qilong <zhangqilong3@huawei.com> writes:
> The usb_add_gadget_udc will add a new gadget to the udc class
> driver list. Not calling usb_del_gadget_udc in error branch
> will result in residual gadget entry in the udc driver list.
> We fix it by calling usb_del_gadget_udc to clean it when error
> return.
>
> Fixes:48ba02b2e2b1a ("usb: gadget: add udc driver for max3420")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>

Thank you,

Acked-by: Felipe Balbi <balbi@kernel.org>

-- 
balbi
