Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D7E37FAA5
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 17:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhEMP0b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 11:26:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234839AbhEMP0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 11:26:25 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711DBC061574
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 08:25:15 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4AD80153;
        Thu, 13 May 2021 15:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4AD80153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620919509; bh=eU3irNX0Hto0HdXTq4Ht+geqf/k2ZBNvV/8YFySSPzM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CEYJJzICjOIpu/fPzv+LvDyImnCsKoQ77Y+Xo+A7HpBe0V982hr1t62LKay0e9VFt
         fIPziG9vdqi1qeMN5vTvhw0YAKwZFb2Tam1rhy5arLZb+/L2qHLNxOpAdARrRNibll
         0S5rchKCBcHZtOPub8DIZpj9Fg+4sOXZoyEQf7GoTK9nQicxeAO317Zjj+qLqB98Gf
         KNq5Z1jGcHEbDucCLQelEKlziOwxPcOIxJadoASWkIBVFCdYGc9aY/apYW/g9Eq4t+
         lmVK30Ax7mcb/790YOt7CmgzuZ9eNh7DM7I/3fwq7o0KOlIpMLH95XO8cnl8kJYy4R
         jp0v2w4HVuSuA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wei Ming Chen <jj251510319013@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        Wei Ming Chen <jj251510319013@gmail.com>
Subject: Re: [PATCH] docs: usb: function: Modify path name
In-Reply-To: <20210506122020.7117-1-jj251510319013@gmail.com>
References: <20210506122020.7117-1-jj251510319013@gmail.com>
Date:   Thu, 13 May 2021 09:25:08 -0600
Message-ID: <878s4i7j1n.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Wei Ming Chen <jj251510319013@gmail.com> writes:

> Original path does not exists, so changed to
> "Documentation/ABI/testing/configfs-usb-gadget"
>
> Signed-off-by: Wei Ming Chen <jj251510319013@gmail.com>
> ---
>  Documentation/usb/gadget_configfs.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/usb/gadget_configfs.rst b/Documentation/usb/gadget_configfs.rst
> index 158e48dab586..e4566ffb223f 100644
> --- a/Documentation/usb/gadget_configfs.rst
> +++ b/Documentation/usb/gadget_configfs.rst
> @@ -140,7 +140,7 @@ is an arbitrary string allowed in a filesystem, e.g.::
>  Each function provides its specific set of attributes, with either read-only
>  or read-write access. Where applicable they need to be written to as
>  appropriate.
> -Please refer to Documentation/ABI/*/configfs-usb-gadget* for more information.
> +Please refer to Documentation/ABI/testing/configfs-usb-gadget for more information.

Applied, thanks.

jon
