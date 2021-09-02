Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1FFE3FECA1
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 13:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242586AbhIBLGV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 07:06:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:46746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236589AbhIBLGT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Sep 2021 07:06:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E82B60F56;
        Thu,  2 Sep 2021 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630580720;
        bh=tWyJPKff6C4o2wirIEZRsOguC9uO4eCDjqTGqOvKE7s=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=skf3R3NJ+GGsnNpjWoWhXd4DVaKYWkTju6f/c6zkHaiPtQiIULoOiQ07HM3z+Jw4b
         loA6bwwMNsljLNGdg9mMPeN8kuxC2fIzO2OXFBT2x+6qcRxPvNy1CB1dZzqj6Z9YN/
         gvSNtgL/6Ezo75Lq8aysN8yBHSdiJYzh3ijZpfjjdI7/ZLCCSysGnbHThUb3vQqIyF
         yHpn2k75yK/7u11Ut63cSXyP+yg0iu1S5N6DKPEXyQyioIoPcgxnnZ2dl3yBt99VBr
         5yaVLjbwFabyP53MI7c6C5L1dIAZcFxaoKmrHHPvlc8Uw/E57thzsWHwEpFDoamhq4
         IvvAmKOIbBXEw==
References: <b558fccf-653a-878e-ef09-6f591fa1cf37@gamereactor.dk>
User-agent: mu4e 1.6.5; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Kim Bak <kim.bak@gamereactor.dk>
Cc:     linux-usb@vger.kernel.org
Subject: Re: g_mass_storage module with large drives?
Date:   Thu, 02 Sep 2021 14:02:14 +0300
In-reply-to: <b558fccf-653a-878e-ef09-6f591fa1cf37@gamereactor.dk>
Message-ID: <875yvjck5t.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Kim,

(please keep linux-usb@vger.kernel.org in Cc)

Kim Bak <kim.bak@gamereactor.dk> writes:

> Hi Felipe
>
> I'm not sure who or where to ask this question so i write directly to
> you.

we should include the mailing list ;-)

> I'm trying to get g_mass_storage to work with a large backing file or
> device, but it seems to be capped at 2Tb.
>
> This is probably limited by the 512 bytes block size.
>
> Is there any way to get the module to expose drives larger than 2Tb?

Should be possible, yes. Care to share any error messages you might get
in dmesg?

Also, which kernel version and USB Peripheral controller are you using?

> The module fails to work with Xbox Series X, i might be able to write
> up a real bug report on this, but I want to make sure that someone

Seems like you're dealing with two bugs:

1) Large backing stores don't work
2) Fails to work against Xbox Series X

> actually reads it first :)

Yeah, there's a ton of people reading the mailing list. If you want to
maximize your chances of getting a reply, it's always a great idead to
Cc the mailing list instead of sending an email only to the maintainer
;-)

Cheers

-- 
balbi
