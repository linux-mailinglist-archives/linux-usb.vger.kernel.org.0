Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF6370971
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2019 21:13:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbfGVTN1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Jul 2019 15:13:27 -0400
Received: from shards.monkeyblade.net ([23.128.96.9]:48016 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726897AbfGVTN0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Jul 2019 15:13:26 -0400
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5096B15258BBE;
        Mon, 22 Jul 2019 12:13:26 -0700 (PDT)
Date:   Mon, 22 Jul 2019 12:13:25 -0700 (PDT)
Message-Id: <20190722.121325.1405627302654065702.davem@davemloft.net>
To:     hslester96@gmail.com
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ax88179_178a: Merge memcpy + le32_to_cpus to
 get_unaligned_le32
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190719090714.19037-1-hslester96@gmail.com>
References: <20190719090714.19037-1-hslester96@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Mon, 22 Jul 2019 12:13:26 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chuhong Yuan <hslester96@gmail.com>
Date: Fri, 19 Jul 2019 17:07:15 +0800

> Merge the combo use of memcpy and le32_to_cpus.
> Use get_unaligned_le32 instead.
> This simplifies the code.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>

Applied.
