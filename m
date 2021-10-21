Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8114435A83
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 07:56:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230482AbhJUF62 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 01:58:28 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:48711 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229499AbhJUF60 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Oct 2021 01:58:26 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id 954415C015E;
        Thu, 21 Oct 2021 01:56:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 21 Oct 2021 01:56:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=fZ9ovnjCRiQ+45t/myUq3msr04V
        qVonSHAQwICG1p6Y=; b=bFloRPtoFWcJQgj5FJtrIv2SerB5ZrUcLrrjh7W1W4J
        ZPu7un47FHa/ZmtSYTTmxcY67FVAUBivYue6yXNhnkrKXH07yvtnoHJeB5xkSkUy
        MJHCgOlL01UwUysJ5JoclIwGqj6pEcQt72mV5CuosiWqnFDCNPg5EESUk3NpCDIh
        F4t5QOTOsJOQ/qGOFgsd3qI/JfdUyVoEoJTkh5pHT5hIOGPOQSTEkZqmmJwzaZqd
        xcrOgEaFRp0Xup1HzRMqx3sR3IN7zj3ZZWXa8crK5CzXG0DIUjLGT3WReV0mh/9s
        cc2QleUdjZr+fAsBl3u0tT/Ej/JCk0b1JqE2466dNXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=fZ9ovn
        jCRiQ+45t/myUq3msr04VqVonSHAQwICG1p6Y=; b=J8TL8U7z7snpEJcnlm3UP+
        I8VKXfTSQJOx9JzOiaIihjUCVdzvvCBjTc4eNNc8pdj+ZngmKFHbcVQWl7iIYVnK
        RsV4BQc8OYHkwNToAiqJ4gt4jPo7Plpzcw5rPvhhQU65ZThUwrgCG/npRu9V0EaC
        k6wQxXDr5X7QOVo0Tlo04OgZ5KMR3qCm6lfoWtaw7QbmV/BVvWUoZdYkEQ1eEYXF
        IFoOjsHHIXIYfKwoqKL4QpnPzG6ZiYsQvjUeSscE7asqo0n0tp+Bj4dfvmR46692
        2cI9WtL9u0ekPRYbhLlvf+hJA9C5ymSa/m7iL+sans0Tp4tycNR3n3Pg4tCdoOBg
        ==
X-ME-Sender: <xms:-gBxYaYpfBE-1548QnTCNuGiwkcGtCYWEaqW9lDe3jMLl_knGXjRrA>
    <xme:-gBxYdb7RqAcPBBA4hsoYHrPGt-sf0vz9i0ykGgsvsjer03j_te5hh3uaExPRODWf
    Nylwew7GRJLeg>
X-ME-Received: <xmr:-gBxYU_WI7lpZsXSnHeqV8iId8kbbrkLbCU7M8RkBGGAET9zqxhqbbKtphUR1FPugBpECoSOKB-e3F6iOU-pmB-8F6bQYvk9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvddvhedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesthdtre
    dttddtvdenucfhrhhomhepifhrvghgucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheq
    necuggftrfgrthhtvghrnhepveeuheejgfffgfeivddukedvkedtleelleeghfeljeeiue
    eggeevueduudekvdetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:-gBxYcqlhF4ox7qvLs5BCDX2qUljujbK7bOWDVBljOQaBWxK2DCN-w>
    <xmx:-gBxYVrX6am38oDKVn7wHos5paF1IMgR6DcZIP1c_yJhwi91EJDH6Q>
    <xmx:-gBxYaQp6oNIU6flCUzn5vjKjXuePu0ilzz2LLpSw_wYEeUQ7oORUA>
    <xmx:-gBxYc21subsk4jaCWNx9rGHtlLiQFD7gPnv40LCOrRjzB2vZBTQ3g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Oct 2021 01:56:09 -0400 (EDT)
Date:   Thu, 21 Oct 2021 07:56:07 +0200
From:   Greg KH <greg@kroah.com>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 214789] New: ehci-hcd.c ISR
Message-ID: <YXEA98J0NeSeCxlK@kroah.com>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 21, 2021 at 04:29:42AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> 
> Change in ehci_irq from spin_lock_irqsave/irqrestore to spin_lock/unlock broke
> shared IRQ's

What shared irq broke exactly?  For what hardware platform?  And what
kernel version worked for you and now does not work?

thanks,

greg k-h
