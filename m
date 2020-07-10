Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2DD021BF57
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 23:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgGJVmJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 17:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726129AbgGJVmJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 17:42:09 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 040DCC08C5DC
        for <linux-usb@vger.kernel.org>; Fri, 10 Jul 2020 14:42:09 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 76EE71286ABA8;
        Fri, 10 Jul 2020 14:42:08 -0700 (PDT)
Date:   Fri, 10 Jul 2020 14:42:07 -0700 (PDT)
Message-Id: <20200710.144207.2013225986255730091.davem@davemloft.net>
To:     george.kennedy@oracle.com
Cc:     kuba@kernel.org, dan.carpenter@oracle.com, dhaval.giani@oracle.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] ax88172a: fix ax88172a_unbind() failures
From:   David Miller <davem@davemloft.net>
In-Reply-To: <1594409928-15763-1-git-send-email-george.kennedy@oracle.com>
References: <1594409928-15763-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 10 Jul 2020 14:42:08 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: George Kennedy <george.kennedy@oracle.com>
Date: Fri, 10 Jul 2020 15:38:48 -0400

> If ax88172a_unbind() fails, make sure that the return code is
> less than zero so that cleanup is done properly and avoid UAF.
> 
> Signed-off-by: George Kennedy <george.kennedy@oracle.com>
> Reported-by: syzbot+4cd84f527bf4a10fc9c1@syzkaller.appspotmail.com

Networking patches should be sent to netdev@vger.kernel.org

Do not attempt to fix this by adding that list to the CC: of this
discussion.  Make a fresh new patch posting instead.

Thank you.
