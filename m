Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2B7C70977
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 21:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731593AbfGVTNW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 15:13:22 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:48010 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730785AbfGVTNW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 15:13:22 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id AE6E515258BCA;
        Mon, 22 Jul 2019 12:13:21 -0700 (PDT)
Date:   Mon, 22 Jul 2019 12:13:21 -0700 (PDT)
Message-Id: <20190722.121321.777111498001639136.davem@davemloft.net>
To:     hslester96@gmail.com
Cc:     steve.glendinning@shawell.net, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usbnet: smsc75xx: Merge memcpy + le32_to_cpus to
 get_unaligned_le32
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190719082730.6378-1-hslester96@gmail.com>
References: <20190719082730.6378-1-hslester96@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 22 Jul 2019 12:13:21 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chuhong Yuan <hslester96@gmail.com>
Date: Fri, 19 Jul 2019 16:27:31 +0800

> Merge the combo use of memcpy and le32_to_cpus.
> Use get_unaligned_le32 instead.
> This simplifies the code.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Applied.
