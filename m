Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D536A25BCF4
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbgICIQv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:16:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:53800 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728304AbgICIQr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Sep 2020 04:16:47 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 31AE221532;
        Thu,  3 Sep 2020 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599121005;
        bh=zErTp0xwXpRxV+96w4fSklgZ3efn0Hvet/wGeSsR/O4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMJvv3U77E/a+leTiANbFnYhDTOqBooPVPybdm+g7gAB00SODix2x2lKJfQGjgIsp
         Y2Ja2h1tIK86FAwGDu/5BzsJolDS8n4hIXKtEea1MAbCmMvxs05qy/D96TzZfvu9vI
         4XlwOERWTENBKeG0WWgzDyjm43LmIlECYnJdMcak=
Date:   Thu, 3 Sep 2020 10:17:09 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Zhangzhansheng <zhang.zhansheng@h3c.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "ming.lei@canonical.com" <ming.lei@canonical.com>
Subject: Re: =?utf-8?Q?=E3=80=90consulting_for_func?=
 =?utf-8?Q?tion_tasklet_usb=5Fgiveback=5Furb=5Fbh=E3=80=91?=
Message-ID: <20200903081709.GA2166291@kroah.com>
References: <8eb88b33960e42f8a42827e20eb3b767@h3c.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8eb88b33960e42f8a42827e20eb3b767@h3c.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 03, 2020 at 08:02:35AM +0000, Zhangzhansheng wrote:
> -------------------------------------------------------------------------------------------------------------------------------------
> 本邮件及其附件含有新华三集团的保密信息，仅限于发送给上面地址中列出
> 的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制、
> 或散发）本邮件中的信息。如果您错收了本邮件，请您立即电话或邮件通知发件人并删除本
> 邮件！
> This e-mail and its attachments contain confidential information from New H3C, which is
> intended only for the person or entity whose address is listed above. Any use of the
> information contained herein in any way (including, but not limited to, total or partial
> disclosure, reproduction, or dissemination) by persons other than the intended
> recipient(s) is prohibited. If you receive this e-mail in error, please notify the sender
> by phone or email immediately and delete it!

This email footer is not compatible with public Linux mailing lists and
development, sorry, so I have now deleted it from my system.

Also note, html email is rejected by the mailing lists...

greg k-h
