Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CB13743406
	for <lists+linux-usb@lfdr.de>; Fri, 30 Jun 2023 07:22:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjF3FWX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Jun 2023 01:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229720AbjF3FWW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Jun 2023 01:22:22 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 945312D69
        for <linux-usb@vger.kernel.org>; Thu, 29 Jun 2023 22:22:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 42E705C0437;
        Fri, 30 Jun 2023 01:22:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Fri, 30 Jun 2023 01:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1688102538; x=1688188938; bh=PA
        412AN5yKZVB2FXx0btcPi/C0oHpWISLCWH0N61l8U=; b=y9JJ610xE0IGTYGqZQ
        JzN12NCSe8LceJl/POj47TOduOBXnHSMZufK1e6y+p2XaUi88Pa+clI8hmsEnM77
        SJhWrVceUth2liYP8B71JTibad/VSAR6VQdjKBH9Wk9sQhC1wwSzKpW2VzaTu5V5
        2UQckJdMhlMVOgg33MBnvtLmb7jqR9PSyNMmV0tyUCuxq0F9zfuTub0gKtLFKFQg
        I8wushZDvHJMOl2X3AC7fs8NK8bP8v4fOeBUP2KuJp6HYpsyt5r4NHrs5gN/PaQb
        MVDkyiqEcqnoUvAAH8RxEb3C7KXcYTYxkVxjwILNMjX7mMmOavNzQhx6aiZUbIRk
        7tOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; t=1688102538; x=1688188938; bh=PA412AN5yKZVB
        2FXx0btcPi/C0oHpWISLCWH0N61l8U=; b=Gn/1MxAGE4TmWJLI7rSy8Z527Gzui
        Vp9WaybgV7LfZbr3osO1pcvAbOsIYwsHhqZzDM91qTtb+myy7bHWo/TkCDrhTMh6
        sixvj4Zo+KkYmrTGhTUtrmUdhfFzLPQzEQc81HiWA53AlSZm0r2xQ8DgUNZcdi7G
        udzS/w1CNDV8JsGqFMempYUOMH1suVJhuE1CKgszE/7gTgtp1niF+8ZWopki6t/v
        r1GyFCpOhehpSlRoECQykUhpYQiYiAZu+fTaPxjMiyrkDtUG2XV5qg6ljaY4eaVj
        r6jmvMwXANetVo28dXjyEY0cB57Am1mGRyQeMf6FxdWG/M3sRVNcXsRVg==
X-ME-Sender: <xms:imaeZAYn0B_9cN0QQ_lxKXKKs5wv172MiLzhA7JEReZ4cSDKxz76cw>
    <xme:imaeZLYdLgQyv0RQmFfggkXWxZSeKAsZz0CTK0DUqPeY7kK-CCplnZUL_r9OiLW6w
    kqkYfSWtrRveA>
X-ME-Received: <xmr:imaeZK-CfGWrQp9TKAjtKPHrjZJdVxxWuZ7H-vSD2vpzZUJIciXmiRdUUlvVTLW6cUJwQXB7Cv9OHT8_VuUB_wN8g0C444iALnkdlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdehgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepgeehueehgfdtledutdelkeefgeejteegieekheefudeiff
    dvudeffeelvedttddvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
    drtghomh
X-ME-Proxy: <xmx:imaeZKpKpJPJkfKC6Ek_fV0AgdQByjL2USMe2ILSO5zIkXlDQMLidw>
    <xmx:imaeZLpKBPVegtn7MZUVgiBqDD0bUhi6SIHc09xAe1Mj_sGF5wrzkg>
    <xmx:imaeZISJVd4H2Q5YNR86gG04eG3ZUL71CLNrpSXrqgHd0UGGP3-Dfg>
    <xmx:imaeZC01pE_iIfj1WWrKuJxr-E10YLKavtkVzqqGOVxBmq_67etQQw>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Jun 2023 01:22:17 -0400 (EDT)
Date:   Fri, 30 Jun 2023 07:22:14 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 217613] New: [BUG] [media] dvb-usb: possible
 data-inconsistency due to data races in dib0700_rc_query_old_firmware()
Message-ID: <2023063051-viewpoint-margin-45e5@gregkh>
References: <bug-217613-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-217613-208809@https.bugzilla.kernel.org/>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 30, 2023 at 01:35:28AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217613
> 
>             Bug ID: 217613
>            Summary: [BUG] [media] dvb-usb: possible data-inconsistency due
>                     to data races in dib0700_rc_query_old_firmware()
>            Product: Drivers
>            Version: 2.5
>           Hardware: All
>                 OS: Linux
>             Status: NEW
>           Severity: normal
>           Priority: P3
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: islituo@gmail.com
>         Regression: No
> 
> Our static analysis tool finds some possible data races in the
> DVB USB driver in Linux 6.4.0.

Please report this to the mailing lists for these drivers, not in
bugzilla.

thanks,

greg k-h
