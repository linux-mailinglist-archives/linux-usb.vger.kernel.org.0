Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C033A422BCC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 17:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235022AbhJEPHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Oct 2021 11:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbhJEPHo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Oct 2021 11:07:44 -0400
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [IPv6:2001:67c:2050::465:103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DDCC061760
        for <linux-usb@vger.kernel.org>; Tue,  5 Oct 2021 08:05:53 -0700 (PDT)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:105:465:1:3:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4HP19r0KxMzQkSX;
        Tue,  5 Oct 2021 17:05:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=robgreener.com;
        s=MBO0001; t=1633446350;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=UrlSFl73LU3GYsTRe1Wyk9JPBgHgoiKKEHEVrdr0ulM=;
        b=DINDByDgO0iymtDkL64hqSZTnDlj83eW5WW4gO39MVL/Nqq9AKP3x/Ov6COTVNyWuFP3B/
        w16zpq2c7/NsiNFUiuoowHbBoioSsFnvfVIeLoJiB8u3HIxLHQIeJiBNBfYQI7+tmPa0GZ
        CSc3lIdHRSZnHazNwRtCHFIY5E3J80tU+MX8GoJLydArLnDxxy4fLASX8VfyifXeUdJF+T
        Xkl25uJOKcEGR84FTsSG/+WP+Wvv+iuYiHqZwtgjrrZdwqtQcUBxYyo3c+1f3WA8CR7ZGW
        0Uh+bXGtCm5VzhhZ2cwUH9gbPzWaL58xYFPFP+nJfd5YvzaedXrd7U30ClUdGw==
Date:   Tue, 5 Oct 2021 16:05:49 +0100
From:   Robert Greener <rob@robgreener.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 02/13] usb: core: config: fix block comment styles
Message-ID: <20211005150549.herdnlqaqshoilfn@shortbread>
References: <cover.1633442131.git.rob@robgreener.com>
 <da05f4a46e5183a0aa067673159fb70ae6621403.1633442131.git.rob@robgreener.com>
 <20211005142502.GB621017@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005142502.GB621017@rowland.harvard.edu>
X-Rspamd-Queue-Id: 539B2268
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Tue, Oct 05, 2021 at 10:25:02AM -0400, Alan Stern wrote:
> Replying to this message would be easier if you had included an 
> actual recipient list in the mail header.

Yes, sorry about this...

Thank you for your comments on my patchset. As it isn't going to be taken
forward as its not worth the churn, I won't respond to each comment. However,
they are useful for considering the output of checkpatch.pl in the future.

Robert
