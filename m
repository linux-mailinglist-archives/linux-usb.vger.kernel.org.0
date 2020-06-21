Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1F92027DF
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jun 2020 03:59:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgFUB7a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Jun 2020 21:59:30 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:50747 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728992AbgFUB73 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Jun 2020 21:59:29 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 911F95E5;
        Sat, 20 Jun 2020 21:59:28 -0400 (EDT)
Received: from imap21 ([10.202.2.71])
  by compute7.internal (MEProxy); Sat, 20 Jun 2020 21:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aeam.us; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=xPW/+l8tGBE9F2okDb1JT8U1DP4yxgC
        R2ePtBtRkAcc=; b=X6dIvcsY6LzNJn5R4Ql0POuIu1g8NznxOS2dezVnvx3RLlK
        FWPzK4fZWqT2hHX/9Eumg/wJQiKWf6NqHrx8NYMf6eBq1q94UivL6V7mLOxEFrlT
        Y5YS2lj2ho2NXF8fhIShozaHwHvDq5vGJBKT9YbMGNR0LbPOCPNiW6gQ7y2H9HK8
        RI+59lWfAkiI5CCrKy3eGCvGmdkGvB2633WhJHFBH+TLHen3hLE16GIHNsRFpyCK
        QVDCM8OtkvANUlg61INeQGnubquPpjvyO8nOor02uwk6nnx+mpuGtxy/gTsFH4k2
        WUh+iygAmQxpcXvKPtzCJdJ+hXAJL2kNcpL23sg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xPW/+l
        8tGBE9F2okDb1JT8U1DP4yxgCR2ePtBtRkAcc=; b=vBiQ1m3sgoeMzPn1DoEafT
        +WFCOT/LkOuDLieqkvEmBhdQXF4Tu+MpMQXkEgUDCBKYJcPdaViCqv7HbuqVOo7O
        dteE9u+ii6llkshXEfBOe3On1n5Zf8b/D0sS5XQCStLuUTg2jTaRDUaO2hp0qY5k
        AVuy7YbGeBShUnaJELdAfH3jMxSAZvK8/WO4AP1kHmpc9rwOznAzhIxUmpMACuL4
        GZT6T6Fz146TeaGWdXCajrHguNxuy1ij76l7tZvSJ04dEej7KUv0QfeM6CaP2RnT
        hp4ZZOnU78UxGgC98UC//yeZs+ezpJ4OGDdgxlpESIgjgP1mLc+GhLSp5ilVpyRw
        ==
X-ME-Sender: <xms:_77uXvItxArhufANGr2bDv9Fq_L1HtVD5Fif8Jlhw3LVKthXuuarhw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudejledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdfuihgu
    ucfuphhrhidfuceoshhiugesrggvrghmrdhusheqnecuggftrfgrthhtvghrnhepveeghf
    evveetteefteekjeejhedufffffffhuefflefhueffudefudeljeefuefgnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhiugesrggvrghmrd
    hush
X-ME-Proxy: <xmx:AL_uXjIY3VW-mad3GfS5VUNmnHxyBL64mLSWW8ZBrIfnHBZYMPMQiQ>
    <xmx:AL_uXnuRWNT62_WXqznReOP9HBnpE36rN90MmVcnyumYUQ9X1MAOnw>
    <xmx:AL_uXobfsQgb6uKMn1r7Xu2-2Eapc5PA5BE-j-OpnWcguU6FIcmUIg>
    <xmx:AL_uXvmkHboCDh_Pzo_TmjeiH6sx32khik6QgzBzJsY3lvE1qHmvaw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CCF8466007E; Sat, 20 Jun 2020 21:59:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-543-gda70334-fm-20200618.004-gda703345
Mime-Version: 1.0
Message-Id: <38998b51-9425-42ab-b0bf-1c54c7faddf3@www.fastmail.com>
In-Reply-To: <b65b3f72-b889-4eed-bfbb-4db027b8b5c4@www.fastmail.com>
References: <30d7899b-9723-4698-bec2-aabfeeedde1b@www.fastmail.com>
 <20200620142400.GA82155@rowland.harvard.edu>
 <b65b3f72-b889-4eed-bfbb-4db027b8b5c4@www.fastmail.com>
Date:   Sat, 20 Jun 2020 20:59:00 -0500
From:   "Sid Spry" <sid@aeam.us>
To:     "Alan Stern" <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Unable to use struct usb_endpoint_descriptor in FunctionFS
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

So, I solved this: all structures must be the same type. However I will
start a new thread about the issues I am experiencing. It looks like the
behavior of the endpoint isn't isochronous at all, no data is dropped.
