Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A3734C2C2
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 07:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhC2FG7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 01:06:59 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:34277 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229750AbhC2FGg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Mar 2021 01:06:36 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 1105F1104;
        Mon, 29 Mar 2021 01:06:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Mon, 29 Mar 2021 01:06:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm3; bh=PfNtzNX/D7cAGC/PeDXltamXzdj
        YRfolwnyZZ5qVrQQ=; b=lKkG5A/pGKCRpHOp7NJBO5PniTlpYy77wlKUHY/so41
        IVfB0TzPnrc2h96+z8HyJ5aaJb/CMChZdK/oKr2wPDw5Pl8lwxI/M15dX8jYh1ij
        ffnwbYJNkeQarm5wzbB10oz7qYrIST6ZQXaOUgl4qbnL4mRgZ+NN/sS1fMxO+epe
        UUPPCXW6ySTZxYoJP+Nipag6IHIDW+VMPZmFuFk1YOkdDvgtVptTSfObGCRv9I9f
        FBaDVB2CNbCt+mM82HFXipyEMiWJUQ+Bk38CbPkpvfnL2cmODyEwJJuFI7k9CsRN
        9X6gRlS9LAkJoLkGpXg0e0oGp3iR60jzZc1pbv0aprw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=PfNtzN
        X/D7cAGC/PeDXltamXzdjYRfolwnyZZ5qVrQQ=; b=OIQTZSXvUFORC48soTEY6I
        a9hOUJ2PpzN3tNkx0N01TAE0e44M0Ia2h1d7J4aKGwgXzfOiAvVsmvsbL3kOGqcl
        CbRkiTV9SVBDgvufaJYdeHTnhrLoBJyW8lWdWkTC1ZIa0oOcAYX0x1EQoF1c86f4
        PFLsTo/jRYuSnSStYCqWxDxYmKGCj6uNeklEdOx8wLddP1YHFNMsuFc2VTVaA0i6
        tGyWyZ/3qnsO46C3CJTD7mv+NDSHa5fjFemjMa9gKWkHiqWFNjci2n6804qgxs2w
        7M5SzbQxUZxlONqusbyZOk11qQimDya3bfuRBilJG9h1ySWC+tYknKWIKqszG8mA
        ==
X-ME-Sender: <xms:W2BhYEuZDzk_uHfh7-Z7ftTDlOEthDqQ1nYLfVqH2QSui-ocCeIMVg>
    <xme:W2BhYBfDd_LVtqIv9-kq-WNvMqp-1xPueHkRMtAp_20DETszpDbibr2rKQQaR4M_k
    PIY_AfvpT4PnQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehjedgledtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
    mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
    fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
    rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:W2BhYPwS2ZjkTB6CqFYbytUvEXipv4WFZcRF9YXRwmntXIaKYeP5zA>
    <xmx:W2BhYHPprmgqG2PrAGLvaTlVi5T_6aWSwHFuq-q2m8vlnSfaXKcpRw>
    <xmx:W2BhYE98fuRufc2t2frxdQHBhr5BqavYPp166qfnUGLpSioBdotGjg>
    <xmx:W2BhYJETf_HT01YX7lnaIAREGe87pDFQTVvrXu5w3r7vzSQX6GuQCw>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id 06B4124005C;
        Mon, 29 Mar 2021 01:06:34 -0400 (EDT)
Date:   Mon, 29 Mar 2021 07:06:32 +0200
From:   Greg KH <greg@kroah.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     hminas@synopsys.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: dwc2: add parenthess and space around *
Message-ID: <YGFgWBh4J7qwQzRi@kroah.com>
References: <1616988705-27062-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616988705-27062-1-git-send-email-tiantao6@hisilicon.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 29, 2021 at 11:31:45AM +0800, Tian Tao wrote:
> Just fix the following checkpatch error:
> ERROR: Macros with complex values should be enclosed in parentheses.`

Why the trailing ` character here?

thanks,

greg k-h
