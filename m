Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0792825A197
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 00:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgIAWkz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Sep 2020 18:40:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgIAWky (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Sep 2020 18:40:54 -0400
Received: from shards.monkeyblade.net (shards.monkeyblade.net [IPv6:2620:137:e000::1:9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B463AC061244;
        Tue,  1 Sep 2020 15:40:54 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:601:9f00:477::3d5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 88B3F1365947E;
        Tue,  1 Sep 2020 15:24:07 -0700 (PDT)
Date:   Tue, 01 Sep 2020 15:40:53 -0700 (PDT)
Message-Id: <20200901.154053.2048405039114618360.davem@davemloft.net>
To:     kamil@re-ws.pl
Cc:     jacmet@sunsite.dk, kuba@kernel.org, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: usb: dm9601: Add USB ID of Keenetic Plus DSL
From:   David Miller <davem@davemloft.net>
In-Reply-To: <GENERATED-WASMISSING-1kDBz9-0002Lq-5x@k17.unixstorm.org>
References: <GENERATED-WASMISSING-1kDBz9-0002Lq-5x@k17.unixstorm.org>
X-Mailer: Mew version 6.8 on Emacs 26.3
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [2620:137:e000::1:9]); Tue, 01 Sep 2020 15:24:07 -0700 (PDT)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Kamil Lorenc <kamil@re-ws.pl>
Date: 

> I received an error from Peter Korsgaard's mailserver informing that his
> email address does not exist. Should I do something with that fact?

Probably need a MAINTAINERS update.  Is there any other email address by
which Peter can be reached?
